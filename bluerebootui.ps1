### DEFINE THE TIMER ###
$seconds = 10

### CALCUTE REBOOT TIME ###

$currentDate = Get-Date
$rebootDate = $currentDate.AddSeconds($seconds)
$rebootTimeStr = $rebootDate.ToString("hh:mm:ss tt")

### DEFINE THE MESSAGE ###

$message = "This machine will reboot at $rebootTimeStr, please save your work!"


### CREATE THE UI ###

Function New-WPFDialog() {
    
    Param([Parameter(Mandatory = $True, HelpMessage = 'XaML Data defining a GUI', Position = 1)]
        [string]$XamlData)
	
    # Add WPF and Windows Forms assemblies
    try {
        Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase, system.windows.forms
    }
    catch {
        Throw 'Failed to load Windows Presentation Framework assemblies.'
    }
	
    # Create an XML Object with the XaML data in it
    [xml]$xmlWPF = $XamlData
	
    # Create the XAML reader using a new XML node reader, UI is the only hard-coded object name here
    Set-Variable -Name XaMLReader -Value @{ 'UI' = ([Windows.Markup.XamlReader]::Load((new-object -TypeName System.Xml.XmlNodeReader -ArgumentList $xmlWPF))) }

    # Create hooks to each named object in the XAML reader
    $Elements = $xmlWPF.SelectNodes('//*[@Name]')
    ForEach ( $Element in $Elements ) {
        $VarName = $Element.Name
        $VarValue = $XaMLReader.UI.FindName($Element.Name)
        $XaMLReader.Add($VarName, $VarValue)
    }

    return $XaMLReader
}

### DEFINE THE UI ###

Function New-PopUpWindow () {
    param(
        [string]
        $MessageText = "No Message Supplied")

    # This is the XaML that defines the GUI.
    $WPFXamL = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Reboot alert" Background="#FF0066CC" Foreground="#FFFFFFFF" ResizeMode="NoResize" WindowStartupLocation="CenterScreen" Topmost="True" SizeToContent="WidthAndHeight" WindowStyle="None" Padding="20" Margin="0">
    <Grid>
        <Button Name="OKButton" Content="OK" HorizontalAlignment="right" Margin="0,0,100,20" VerticalAlignment="Bottom" Width="100" Background="#FF0066CC" BorderBrush="White" Foreground="White" Padding="8,4" />
        <Button Name="RebootButton" Content="REBOOT NOW" HorizontalAlignment="Center" Margin="0,0,0,20" VerticalAlignment="Bottom" Width="100" Background="#FF0066CC" BorderBrush="White" Foreground="White" Padding="8,4"/>
        <Button Name="CancelButton" Content="NO I'M BUSY" HorizontalAlignment="left" Margin="100,0,0,20" VerticalAlignment="Bottom" Width="100" Background="#FF0066CC" BorderBrush="White" Foreground="White" Padding="8,4"/>
        <TextBlock Name="Message" Margin="100,60,100,80" TextWrapping="Wrap" Text="_CONTENT_" FontSize="32"/>

    </Grid>
</Window>
'@

    # Build Dialog
    $WPFGui = New-WPFDialog -XamlData $WPFXaml
    $WPFGui.Message.Text = $MessageText
   
    $WPFGui.OKButton.Add_Click( { 
        $WPFGui.UI.Close()
        Start-Sleep -Seconds $seconds; Restart-Computer -Force
        })
    $WPFGui.RebootButton.Add_Click( { 
        $WPFGui.UI.Close()
        Restart-Computer -Force
        })
    $WPFGui.CancelButton.Add_Click( { 
        $WPFGui.UI.Close() 
        #Exit 0
        })

    $null = $WPFGUI.UI.Dispatcher.InvokeAsync{ $WPFGui.UI.ShowDialog() }.Wait()
}

### CALL THE UI and start the countdown ###
New-PopUpWindow -MessageText "$message" ; Start-Sleep -Seconds $seconds ; Restart-Computer -Force
