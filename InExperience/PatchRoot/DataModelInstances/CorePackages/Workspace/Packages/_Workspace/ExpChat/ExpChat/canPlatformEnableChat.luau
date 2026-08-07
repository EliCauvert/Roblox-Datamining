local userInputService = game:GetService("UserInputService")
local avatarChatService = game:GetService("AvatarChatService")
local parent = script:FindFirstAncestor("ExpChat").Parent
local socialExperimentsModule = require(parent.SocialExperiments)
local fFlagTestDeviceForFAEUpsell = socialExperimentsModule.FFlagTestDeviceForFAEUpsell
local deviceMeetsRequirementsForFAE = socialExperimentsModule.deviceMeetsRequirementsForFAE
local fFlagAEGIS2UseGuacToShowFAEUpsell = require(parent.SharedFlags).FFlagAEGIS2UseGuacToShowFAEUpsell
local var3 = if fFlagAEGIS2UseGuacToShowFAEUpsell then require(parent.UniversalAppPolicy) else nil

return function() --[[ line: 21 ]]
	-- upvalues: fFlagAEGIS2UseGuacToShowFAEUpsell (ref), userInputService (ref), avatarChatService (ref), fFlagTestDeviceForFAEUpsell (ref), deviceMeetsRequirementsForFAE (ref), var3 (write)
	local platform
	if fFlagAEGIS2UseGuacToShowFAEUpsell then
		platform = var3.getAppFeaturePolicies().getShowInExpFAEUpsell()
		
		if platform then
			platform = avatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE)
			
			if platform then
				if fFlagTestDeviceForFAEUpsell then
					return deviceMeetsRequirementsForFAE()
				end
				platform = true
			end
		end
		return platform
	else
		local inExperienceFAE
		platform = userInputService:GetPlatform()
		
		if platform ~= Enum.Platform.IOS and platform ~= Enum.Platform.Android and platform ~= Enum.Platform.Windows then
			inExperienceFAE = false
			
			if platform == Enum.Platform.OSX then
				inExperienceFAE = avatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE)
				
				if inExperienceFAE then
					if fFlagTestDeviceForFAEUpsell then
						return deviceMeetsRequirementsForFAE()
					end
					inExperienceFAE = true
				end
			end
			return inExperienceFAE
		end
	end
end