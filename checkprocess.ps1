Write-Host @"
:::::::::: :::::::::      :::     :::::::::  :::::::::: ::::    :::   :::         ::::::::   ::::::::  
:+:        :+:    :+:   :+: :+:   :+:    :+: :+:        :+:+:   :+: :+:+:        :+:    :+: :+:    :+: 
+:+        +:+    +:+  +:+   +:+  +:+    +:+ +:+        :+:+:+  +:+   +:+        +:+        +:+        
:#::+::#   +#++:++#:  +#++:++#++: +#+    +:+ +#++:++#   +#+ +:+ +#+   +#+        +#++:++#++ +#++:++#++ 
+#+        +#+    +#+ +#+     +#+ +#+    +#+ +#+        +#+  +#+#+#   +#+               +#+        +#+ 
#+#        #+#    #+# #+#     #+# #+#    #+# #+#        #+#   #+#+#   #+#        #+#    #+# #+#    #+# 
###        ###    ### ###     ### #########  ########## ###    #### #######       ########   ########


Check Process Service Only One!                                                  
"@

$services = @("sysmain", "dps", "pcasvc", "diagtrack", "bam")

foreach ($service in $services) {
    $status = sc.exe query $service
    Write-Output "
    Service status: $service"
    Write-Output $status
    Write-Output "-------------------------
    "
}

Write-Host "Press 1 to refresh the command, or 2 to close the program."
$choice = Read-Host "Enter your choice"

if ($choice -eq "1") {
    Write-Host "Refreshing..."
    Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -File `"$PSCommandPath`""
} elseif ($choice -eq "2") {
    Write-Host "Closing the program..."
    exit
} else {
    Write-Host "Invalid choice. Please try again."
}
