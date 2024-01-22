# Get-HashOfString
PowerShell.  Function to compute the hash of a given input string

Can be specified to use SHA1, SHA256, SHA384, SHA512, or MD5

---

**Parameters**

_String_

[Mandatory]

The string that you want to hash

Enclose this in quotes if it has a space

_Algorithm_

The hashing algorithm to use. Options are: SHA1, SHA256, SHA384, SHA512, or MD5

If no value is specified, or if the parameter is omitted, the default value is SHA256

---

**Examples**

```powershell
Get-HashOfString -String "the very pants I was returning"
```
