local UserInputService = game:GetService("UserInputService")
local AvatarChatService = game:GetService("AvatarChatService")
local Parent = script:FindFirstAncestor("ExpChat").Parent
local SocialExperimentsModule = require(Parent.SocialExperiments)
local FFlagTestDeviceForFAEUpsell = SocialExperimentsModule.FFlagTestDeviceForFAEUpsell
local DeviceMeetsRequirementsForFAEFunction = SocialExperimentsModule.deviceMeetsRequirementsForFAE
local FFlagAEGIS2UseGuacToShowFAEUpsell = require(Parent.SharedFlags).FFlagAEGIS2UseGuacToShowFAEUpsell
local UniversalAppPolicyModule = if FFlagAEGIS2UseGuacToShowFAEUpsell then require(Parent.UniversalAppPolicy) else nil

return function() --[[ Line: 21 ]]
	-- upvalues: FFlagAEGIS2UseGuacToShowFAEUpsell (copy), UserInputService (copy), AvatarChatService (copy), FFlagTestDeviceForFAEUpsell (copy), DeviceMeetsRequirementsForFAEFunction (copy), UniversalAppPolicyModule (ref)
	if FFlagAEGIS2UseGuacToShowFAEUpsell then
		local ShowInExpFAEUpsell = UniversalAppPolicyModule.getAppFeaturePolicies().getShowInExpFAEUpsell()
		
		if ShowInExpFAEUpsell then
			ShowInExpFAEUpsell = AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE)
			
			if ShowInExpFAEUpsell then
				if FFlagTestDeviceForFAEUpsell then
					return (DeviceMeetsRequirementsForFAEFunction())
				end
				ShowInExpFAEUpsell = true
			end
		end
		return ShowInExpFAEUpsell
	else
		local Platform = UserInputService:GetPlatform()
		local IsPlatformMatch: boolean = Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android or Platform == Enum.Platform.Windows
		local DeviceMeetsRequirementsForFeatureResult = nil
		
		if not IsPlatformMatch then
			DeviceMeetsRequirementsForFeatureResult = false
			IsPlatformMatch = Platform == Enum.Platform.OSX
		end
		if IsPlatformMatch then
			DeviceMeetsRequirementsForFeatureResult = AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE)
			
			if DeviceMeetsRequirementsForFeatureResult then
				if FFlagTestDeviceForFAEUpsell then
					return (DeviceMeetsRequirementsForFAEFunction())
				end
				DeviceMeetsRequirementsForFeatureResult = true
			end
		end
		return DeviceMeetsRequirementsForFeatureResult
	end
end