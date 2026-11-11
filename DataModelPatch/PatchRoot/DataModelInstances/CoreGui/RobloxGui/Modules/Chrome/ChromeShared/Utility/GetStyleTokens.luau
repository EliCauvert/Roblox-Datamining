local UIBloxModule = require(game:GetService("CorePackages").Packages.UIBlox)
local Tokens = UIBloxModule.App.Style.Tokens
local Constants = UIBloxModule.App.Style.Constants
local DeviceType = Constants.DeviceType
local TenFootInterfaceModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.TenFootInterface)

return function(p1, p2)
	-- upvalues: TenFootInterfaceModule (copy), DeviceType (copy), Tokens (copy), Constants (copy)
	return Tokens.getFoundationTokens(if TenFootInterfaceModule:IsEnabled() then DeviceType.Console else p1 or DeviceType.DefaultDeviceType, p2 or Constants.DefaultThemeName)
end