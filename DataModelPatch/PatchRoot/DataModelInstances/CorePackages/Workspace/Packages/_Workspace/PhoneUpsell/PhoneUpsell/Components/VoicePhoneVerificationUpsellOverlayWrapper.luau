local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local _ = require(Parent.LuauPolyfill)
local PostUserOptInFunction = require(Parent.VoiceChat).PostUserOptIn
local _ = require(PhoneUpsell.Components.PhoneVerificationUpsellOverlay)
local UpsellContainerModule = require(PhoneUpsell.Components.UpsellContainer)
local PhoneVerificationStatusOverlayModule = require(PhoneUpsell.Components.PhoneVerificationStatusOverlay)
local CryoModule = require(Parent.Cryo)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local MergePropsModule = require(PhoneUpsell.Utils.mergeProps)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Logging = require(Parent.AppCommonLib).Logging
local FFlagFixUpsellVerificationToNavigateToOverlaysModule = require(PhoneUpsell.Flags.FFlagFixUpsellVerificationToNavigateToOverlays)
local GetFFlagDisablePVUpsellDataConsentFunction = require(Parent.SharedFlags).GetFFlagDisablePVUpsellDataConsent
local FFlagHomePhoneVerificationUpsellNewCopy = require(Parent.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy
local config = {
	addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhoneVoice",
	addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.AddPhoneBodyVoice",
	onSuccess = function() end,
	closeUpsell = function() end
}

return function(p1)
	-- upvalues: MergePropsModule (copy), config (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), UseAppPolicyFunction (copy), ImageSetLabel (copy), Images (copy), PostUserOptInFunction (copy), FFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), Logging (copy), UseLocalizationFunction (copy), UpsellContainerModule (copy), CryoModule (copy), FFlagHomePhoneVerificationUpsellNewCopy (copy), GetFFlagDisablePVUpsellDataConsentFunction (copy), PhoneVerificationStatusOverlayModule (copy)
	local MergePropsModuleResult = MergePropsModule(config, p1)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.RequireExplicitVoiceConsent()
	end)
	local Element = ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(40, 40),
		Image = Images["icons/status/success_large"]
	})
	
	local function OnSuccess()
		-- upvalues: PostUserOptInFunction (upval), UseRoactServiceResult (copy), UseStateResult2 (copy), FFlagFixUpsellVerificationToNavigateToOverlaysModule (upval), MergePropsModuleResult (copy), UseStateResult2_1 (copy), Logging (upval)
		PostUserOptInFunction(UseRoactServiceResult, true, false):andThen(function(Result)
			-- upvalues: UseStateResult2 (upval), FFlagFixUpsellVerificationToNavigateToOverlaysModule (upval), MergePropsModuleResult (upval), UseStateResult2_1 (upval), Logging (upval)
			if Result then
				UseStateResult2(true)
				task.delay(3, function()
					-- upvalues: FFlagFixUpsellVerificationToNavigateToOverlaysModule (upval), MergePropsModuleResult (upval)
					if FFlagFixUpsellVerificationToNavigateToOverlaysModule then
						MergePropsModuleResult.closeUpsell()
						MergePropsModuleResult.onSuccess()
						
						return
					else
						MergePropsModuleResult.onSuccess()
						MergePropsModuleResult.closeUpsell()
					end
				end)
				
				return
			else
				UseStateResult2_1(true)
				task.delay(5, function()
					-- upvalues: FFlagFixUpsellVerificationToNavigateToOverlaysModule (upval), MergePropsModuleResult (upval)
					if FFlagFixUpsellVerificationToNavigateToOverlaysModule then
						MergePropsModuleResult.closeUpsell()
						MergePropsModuleResult.onSuccess()
						
						return
					else
						MergePropsModuleResult.onSuccess()
						MergePropsModuleResult.closeUpsell()
					end
				end)
				Logging.warn("Error getting UserOptIn. " .. tostring(Result))
			end
		end):catch(function()
			-- upvalues: UseStateResult2_1 (upval), FFlagFixUpsellVerificationToNavigateToOverlaysModule (upval), MergePropsModuleResult (upval), Logging (upval)
			UseStateResult2_1(true)
			task.delay(5, function()
				-- upvalues: FFlagFixUpsellVerificationToNavigateToOverlaysModule (upval), MergePropsModuleResult (upval)
				if FFlagFixUpsellVerificationToNavigateToOverlaysModule then
					MergePropsModuleResult.closeUpsell()
					MergePropsModuleResult.onSuccess()
					
					return
				else
					MergePropsModuleResult.onSuccess()
					MergePropsModuleResult.closeUpsell()
				end
			end)
			Logging.warn("Exception posting PostUserOptIn")
		end)
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		verifySuccessKey = "Feature.VerificationUpsell.Heading.VoiceChatEnabledMobile",
		voiceErrorKey = "Feature.VerificationUpsell.Heading.VoiceChatError"
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		PhoneVerificationUpsellOverlay = ReactModule.createElement(UpsellContainerModule, CryoModule.Dictionary.join(MergePropsModuleResult, {
			alwaysShowAddPhoneLegalText = true,
			onSuccess = OnSuccess,
			addPhoneTitleKey = MergePropsModuleResult.addPhoneTitleKey,
			addPhoneDescriptionKey = MergePropsModuleResult.addPhoneDescriptionKey,
			addPhoneButtonKey = if FFlagHomePhoneVerificationUpsellNewCopy then "Feature.AccountSettings.Action.Verify" else "Feature.VerificationUpsell.Action.EnableVoice",
			addPhoneLegalTextKey = if UseAppPolicyResult then "Feature.VerificationUpsell.Description.VoiceLegalConsent" elseif FFlagHomePhoneVerificationUpsellNewCopy then "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer3" else "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer",
			requireAddPhoneLegalTextCheckbox = UseAppPolicyResult,
			disableLegalText = GetFFlagDisablePVUpsellDataConsentFunction(),
			shouldShowVerificationText = if FFlagHomePhoneVerificationUpsellNewCopy then true else nil
		})),
		SuccessOverlay = UseStateResult and ReactModule.createElement(PhoneVerificationStatusOverlayModule, {
			image = Element,
			text = UseLocalizationResult.verifySuccessKey
		}),
		ErrorOverlay = UseStateResult1 and ReactModule.createElement(PhoneVerificationStatusOverlayModule, {
			image = Element,
			text = UseLocalizationResult.voiceErrorKey
		})
	})
end