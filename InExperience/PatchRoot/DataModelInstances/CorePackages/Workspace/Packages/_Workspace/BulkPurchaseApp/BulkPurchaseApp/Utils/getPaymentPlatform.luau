local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local PaymentPlatformEnumModule = require(script:FindFirstAncestor("BulkPurchaseApp").Enums.PaymentPlatformEnum)

return function()
	-- upvalues: UserInputService (copy), PaymentPlatformEnumModule (copy), VRService (copy)
	local Platform = UserInputService:GetPlatform()
	
	return if Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX or Platform == Enum.Platform.Linux then PaymentPlatformEnumModule.Desktop elseif Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android or Platform == Enum.Platform.UWP then PaymentPlatformEnumModule.Mobile elseif Platform == Enum.Platform.XBoxOne or Platform == Enum.Platform.XBox360 or Platform == Enum.Platform.PS3 or Platform == Enum.Platform.PS4 or Platform == Enum.Platform.PS5 then PaymentPlatformEnumModule.Console elseif VRService:IsVRAppBuild() then PaymentPlatformEnumModule.VR else PaymentPlatformEnumModule.Unknown
end