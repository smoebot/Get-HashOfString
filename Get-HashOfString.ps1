function Get-HashOfString{
    <#
    .SYNOPSIS
        Computes the hash of a given input string
    .DESCRIPTION
        Computes the hash of a given input string
        Uses default hashing algoritm (SHA256) without parameter.
        Can be specified to use SHA1, SHA256, SHA384, SHA512, or MD5
    .PARAMETER String
        [Mandatory] String Parameter
        The string that you want to hash
        Enclose this in quotes if it has a space
    .PARAMETER Algorithm
        String Parameter
        Hashing algorithm to use. Options are: SHA1, SHA256, SHA384, SHA512, or MD5
        If no value is specified, or if the parameter is omitted, the default value is SHA256
    .NOTES
        Author: Joel Ashman (Shamelessly taken from below url) 
        https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash?view=powershell-7.3
        v0.1 - (2023-12-29) Initial version
    .EXAMPLE
        Get-HashOfString -String "Boxing Day Test"
    #>

    #requires -version 5

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$String,
        [Parameter()]
        [string]$Algo
    )
    
    $StringAsStream = [System.IO.MemoryStream]::new()
    $Writer = [System.IO.StreamWriter]::new($StringAsStream)
    $Writer.write($String)
    $Writer.Flush()
    $StringAsStream.Position = 0
    if ($Algo){$Algo = $Algo}
    else{$Algo = "SHA256"}
    (Get-FileHash -InputStream $stringAsStream -Algorithm $Algo| Select-Object Hash).hash
}
