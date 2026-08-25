local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local userInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local paymentPlatformEnumModule = require(bulkPurchaseApp.Enums.PaymentPlatformEnum)

return function()
	-- upvalues: userInputService (ref), paymentPlatformEnumModule (ref), VRService (ref)
	local platform = userInputService:GetPlatform()
	
	return if platform == Enum.Platform.Windows or platform == Enum.Platform.OSX or platform == Enum.Platform.Linux then paymentPlatformEnumModule.Desktop elseif platform == Enum.Platform.IOS or platform == Enum.Platform.Android or platform == Enum.Platform.UWP then paymentPlatformEnumModule.Mobile elseif platform == Enum.Platform.XBoxOne or platform == Enum.Platform.XBox360 or (platform == Enum.Platform.PS3 or platform == Enum.Platform.PS4) or platform == Enum.Platform.PS5 then paymentPlatformEnumModule.Console elseif VRService:IsVRAppBuild() then paymentPlatformEnumModule.VR else paymentPlatformEnumModule.Unknown
end