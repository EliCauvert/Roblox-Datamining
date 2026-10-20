local FFlagPPVEnabledOnConsoleModule = require(script.Parent.FFlagPPVEnabledOnConsole)
local EnableConsoleGameJoinCardV4 = game:DefineFastFlag("EnableConsoleGameJoinCard_v4", false)

return require(script.Parent.FFlagEnableDesktopGameJoinCard) and (FFlagPPVEnabledOnConsoleModule and EnableConsoleGameJoinCardV4)