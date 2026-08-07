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
	onSuccess = function() --[[ line: 41 ]] end,
	closeUpsell = function() --[[ line: 42 ]] end
}

return function(p0) --[[ line: 49 | named "VoicePhoneVerificationUpsellOverlayWrapper" ]]
	-- upvalues: mergePropsModule (ref), t (ref), useRoactService (ref), roactNetworking (ref), reactModule (ref), useAppPolicy (ref), imageSetLabel (ref), images (ref), postUserOptIn (ref), fFlagFixUpsellVerificationToNavigateToOverlaysModule (ref), logging (ref), useLocalization (ref), upsellContainerModule (ref), cryoModule (ref), fFlagHomePhoneVerificationUpsellNewCopy (ref), getFFlagDisablePVUpsellDataConsent (ref), phoneVerificationStatusOverlayModule (ref)
	local var9 = mergePropsModule(t, p0)
	local var10 = useRoactService(roactNetworking)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(false)
	local var15 = useAppPolicy(function(p1) --[[ line: 56 ]]
		return p1.RequireExplicitVoiceConsent()
	end)
	local var16 = reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(40, 40),
		Image = images["icons/status/success_large"]
	})
	local var17 = useLocalization({
		verifySuccessKey = "Feature.VerificationUpsell.Heading.VoiceChatEnabledMobile",
		voiceErrorKey = "Feature.VerificationUpsell.Heading.VoiceChatError"
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		PhoneVerificationUpsellOverlay = reactModule.createElement(upsellContainerModule, cryoModule.Dictionary.join(var9, {
			alwaysShowAddPhoneLegalText = true,
			onSuccess = function() --[[ line: 66 ]]
				-- upvalues: postUserOptIn (copy), var10 (ref), var12 (ref), fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var9 (ref), var14 (ref), logging (copy)
				postUserOptIn(var10, true, false):andThen(function(p2) --[[ line: 68 ]]
					-- upvalues: var12 (copy), fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var9 (copy), var14 (copy), logging (copy)
					if p2 then
						var12(true)
						task.delay(3, function() --[[ line: 71 ]]
							-- upvalues: fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var9 (copy)
							if fFlagFixUpsellVerificationToNavigateToOverlaysModule then
								var9.closeUpsell()
								var9.onSuccess()
								
								return
							end
							var9.onSuccess()
							var9.closeUpsell()
						end)
						
						return
					end
					var14(true)
					task.delay(5, function() --[[ line: 82 ]]
						-- upvalues: fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var9 (copy)
						if fFlagFixUpsellVerificationToNavigateToOverlaysModule then
							var9.closeUpsell()
							var9.onSuccess()
							
							return
						end
						var9.onSuccess()
						var9.closeUpsell()
					end)
					logging.warn("Error getting UserOptIn. " .. tostring(p2))
				end):catch(function() --[[ line: 94 ]]
					-- upvalues: var14 (copy), fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var9 (copy), logging (copy)
					var14(true)
					task.delay(5, function() --[[ line: 96 ]]
						-- upvalues: fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var9 (copy)
						if fFlagFixUpsellVerificationToNavigateToOverlaysModule then
							var9.closeUpsell()
							var9.onSuccess()
							
							return
						end
						var9.onSuccess()
						var9.closeUpsell()
					end)
					logging.warn("Exception posting PostUserOptIn")
				end)
			end,
			addPhoneTitleKey = var9.addPhoneTitleKey,
			addPhoneDescriptionKey = var9.addPhoneDescriptionKey,
			addPhoneButtonKey = if fFlagHomePhoneVerificationUpsellNewCopy then "Feature.AccountSettings.Action.Verify" else "Feature.VerificationUpsell.Action.EnableVoice",
			addPhoneLegalTextKey = if var15 then "Feature.VerificationUpsell.Description.VoiceLegalConsent" elseif fFlagHomePhoneVerificationUpsellNewCopy then "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer3" else "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer",
			requireAddPhoneLegalTextCheckbox = var15,
			disableLegalText = getFFlagDisablePVUpsellDataConsent(),
			shouldShowVerificationText = if fFlagHomePhoneVerificationUpsellNewCopy then true else nil
		})),
		SuccessOverlay = var11 and reactModule.createElement(phoneVerificationStatusOverlayModule, { image = var16, text = var17.verifySuccessKey }),
		ErrorOverlay = var13 and reactModule.createElement(phoneVerificationStatusOverlayModule, { image = var16, text = var17.voiceErrorKey })
	})
end