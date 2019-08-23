$Date = get-date
$Name = (Get-WmiObject Win32_Computersystem).name
$From = "From@EMAIL.com"
$To = "TO@EMAIL.com"
$Subject = "Subject - $Date" // date is optional
$Body =  "Body Description"

$FileAttach = "Attachment Location"
$FileAttach2 = "Attachment Location"// second attachment is optional 

$SMTPServer = "smtp.gmail.com"
$SMTPClient = new-object Net.Mail.SmtpClient($SMTPServer,587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("Sender_Email_Address","Sender_Email_Password");
$Attachment = new-object Net.Mail.Attachment($FileAttach)
$Attachment2 = new-object Net.Mail.Attachment($FileAttach2)

$MSG = new-object Net.Mail.MailMessage($From, $To, $Subject, $Body)
$MSG.attachments.add($Attachment)
$MSG.attachments.add($Attachment2)// second attachment is optional
$SMTPClient.send($msg)
