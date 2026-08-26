local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UIBloxModule = require(game:GetService("CorePackages").Packages.UIBlox)
local tokens = UIBloxModule.App.Style.Tokens
local constants = UIBloxModule.App.Style.Constants
local deviceType = constants.DeviceType
local tenFootInterfaceModule = require(robloxGui.Modules.TenFootInterface)

return function(p1, p2)
	-- upvalues: tenFootInterfaceModule (ref), deviceType (ref), tokens (ref), constants (ref)
	return tokens.getFoundationTokens(if tenFootInterfaceModule:IsEnabled() then deviceType.Console else p1 or deviceType.DefaultDeviceType, p2 or constants.DefaultThemeName)
end