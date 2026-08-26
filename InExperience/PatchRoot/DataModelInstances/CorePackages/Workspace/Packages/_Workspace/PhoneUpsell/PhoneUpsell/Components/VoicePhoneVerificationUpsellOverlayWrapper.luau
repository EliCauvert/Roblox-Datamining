local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local _ = require(parent.LuauPolyfill)
local postUserOptIn = require(parent.VoiceChat).PostUserOptIn
local _ = require(phoneUpsell.Components.PhoneVerificationUpsellOverlay)
local upsellContainerModule = require(phoneUpsell.Components.UpsellContainer)
local phoneVerificationStatusOverlayModule = require(phoneUpsell.Components.PhoneVerificationStatusOverlay)
local cryoModule = require(parent.Cryo)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local mergePropsModule = require(phoneUpsell.Utils.mergeProps)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local logging = require(parent.AppCommonLib).Logging
local fFlagFixUpsellVerificationToNavigateToOverlaysModule = require(phoneUpsell.Flags.FFlagFixUpsellVerificationToNavigateToOverlays)
local getFFlagDisablePVUpsellDataConsent = require(parent.SharedFlags).GetFFlagDisablePVUpsellDataConsent
local fFlagHomePhoneVerificationUpsellNewCopy = require(parent.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy
local t = {
	addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhoneVoice",
	addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.AddPhoneBodyVoice",
	onSuccess = function() end,
	closeUpsell = function() end
}

return function(p1)
	-- upvalues: mergePropsModule (ref), t (ref), useRoactService (ref), roactNetworking (ref), reactModule (ref), useAppPolicy (ref), imageSetLabel (ref), images (ref), postUserOptIn (ref), fFlagFixUpsellVerificationToNavigateToOverlaysModule (ref), logging (ref), useLocalization (ref), upsellContainerModule (ref), cryoModule (ref), fFlagHomePhoneVerificationUpsellNewCopy (ref), getFFlagDisablePVUpsellDataConsent (ref), phoneVerificationStatusOverlayModule (ref)
	local var1 = mergePropsModule(t, p1)
	local var2 = useRoactService(roactNetworking)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(false)
	local var7 = useAppPolicy(function(p2)
		return p2.RequireExplicitVoiceConsent()
	end)
	local var8 = reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(40, 40),
		Image = images["icons/status/success_large"]
	})
	local var9 = useLocalization({
		verifySuccessKey = "Feature.VerificationUpsell.Heading.VoiceChatEnabledMobile",
		voiceErrorKey = "Feature.VerificationUpsell.Heading.VoiceChatError"
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		PhoneVerificationUpsellOverlay = reactModule.createElement(upsellContainerModule, cryoModule.Dictionary.join(var1, {
			alwaysShowAddPhoneLegalText = true,
			onSuccess = function()
				-- upvalues: postUserOptIn (copy), var2 (ref), var4 (ref), fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var1 (ref), var6 (ref), logging (copy)
				postUserOptIn(var2, true, false):andThen(function(p2)
					-- upvalues: var4 (copy), fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var1 (copy), var6 (copy), logging (copy)
					if p2 then
						var4(true)
						task.delay(3, function()
							-- upvalues: fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var1 (copy)
							if fFlagFixUpsellVerificationToNavigateToOverlaysModule then
								var1.closeUpsell()
								var1.onSuccess()
								
								return
							end
							var1.onSuccess()
							var1.closeUpsell()
						end)
						
						return
					end
					var6(true)
					task.delay(5, function()
						-- upvalues: fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var1 (copy)
						if fFlagFixUpsellVerificationToNavigateToOverlaysModule then
							var1.closeUpsell()
							var1.onSuccess()
							
							return
						end
						var1.onSuccess()
						var1.closeUpsell()
					end)
					logging.warn("Error getting UserOptIn. " .. tostring(p2))
				end):catch(function()
					-- upvalues: var6 (copy), fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var1 (copy), logging (copy)
					var6(true)
					task.delay(5, function()
						-- upvalues: fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var1 (copy)
						if fFlagFixUpsellVerificationToNavigateToOverlaysModule then
							var1.closeUpsell()
							var1.onSuccess()
							
							return
						end
						var1.onSuccess()
						var1.closeUpsell()
					end)
					logging.warn("Exception posting PostUserOptIn")
				end)
			end,
			addPhoneTitleKey = var1.addPhoneTitleKey,
			addPhoneDescriptionKey = var1.addPhoneDescriptionKey,
			addPhoneButtonKey = if fFlagHomePhoneVerificationUpsellNewCopy then "Feature.AccountSettings.Action.Verify" else "Feature.VerificationUpsell.Action.EnableVoice",
			addPhoneLegalTextKey = if var7 then "Feature.VerificationUpsell.Description.VoiceLegalConsent" elseif fFlagHomePhoneVerificationUpsellNewCopy then "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer3" else "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer",
			requireAddPhoneLegalTextCheckbox = var7,
			disableLegalText = getFFlagDisablePVUpsellDataConsent(),
			shouldShowVerificationText = if fFlagHomePhoneVerificationUpsellNewCopy then true else nil
		})),
		SuccessOverlay = var3 and reactModule.createElement(phoneVerificationStatusOverlayModule, { image = var8, text = var9.verifySuccessKey }),
		ErrorOverlay = var5 and reactModule.createElement(phoneVerificationStatusOverlayModule, { image = var8, text = var9.voiceErrorKey })
	})
end