local config = {
	None = "None",
	Apple = "Apple",
	Google = "Google",
	Amazon = "Amazon",
	Xbox = "Xbox",
	UWP = "UWP",
	Web = "Web",
	Maquettes = "Maquettes",
	Palisades = "Palisades",
	Microsoft = "Microsoft",
	MilkyWay = "MilkyWay"
}
local v1 = require(game:GetService("CorePackages").Packages.enumerate)(script.Name, config)
require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(v1, config)

return v1