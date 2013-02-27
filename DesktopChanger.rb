require 'Win32API'
#require 'win32ole'
#
#ie = WIN32OLE.new('InternetExplorer.Application')
#ie.visible = true
#ie.gohome

SPI_SETDESKWALLPAPER = 20
SPIF_SENDCHANGE = 0x2
SOURCE_FOLDER = "D:\\Stuart_Hunt\\Pictures\\desktops\\"

i = 0
while true
  files = Dir.entries(SOURCE_FOLDER) - [".", ".."]
  file = files[rand(files.length)]
   
  systemParametersInfo = Win32API.new("user32","SystemParametersInfo",["I", "I", "P", "I"],"I")
  i = systemParametersInfo.call(SPI_SETDESKWALLPAPER, 1, SOURCE_FOLDER + file, SPIF_SENDCHANGE)
  puts i
  sleep 1
end