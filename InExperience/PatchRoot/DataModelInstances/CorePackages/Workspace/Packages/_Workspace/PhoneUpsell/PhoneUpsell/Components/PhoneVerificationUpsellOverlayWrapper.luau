local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local ReactModule = require(Parent.React)
local _ = require(PhoneUpsell.Components.PhoneVerificationUpsellOverlay)
local UpsellContainerModule = require(PhoneUpsell.Components.UpsellContainer)
local PhoneVerificationStatusOverlayModule = require(PhoneUpsell.Components.PhoneVerificationStatusOverlay)
local CryoModule = require(Parent.Cryo)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MergePropsModule = require(PhoneUpsell.Utils.mergeProps)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local FFlagFixUpsellVerificationToNavigateToOverlaysModule = require(PhoneUpsell.Flags.FFlagFixUpsellVerificationToNavigateToOverlays)
local config = {
	onSuccess = function() end,
	closeUpsell = function() end
}

return function(p1)
	-- upvalues: MergePropsModule (copy), config (copy), ReactModule (copy), ImageSetLabel (copy), Images (copy), FFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), UseLocalizationFunction (copy), UpsellContainerModule (copy), CryoModule (copy), PhoneVerificationStatusOverlayModule (copy)
	local MergePropsModuleResult = MergePropsModule(config, p1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Element = ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(40, 40),
		Image = Images["icons/status/success_large"]
	})
	
	local function OnSuccess()
		-- upvalues: UseStateResult2 (copy), FFlagFixUpsellVerificationToNavigateToOverlaysModule (upval), MergePropsModuleResult (copy)
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
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		verifySuccessKey = "Feature.VerificationUpsell.Heading.VerifiedSuccessfully.V2"
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		PhoneVerificationUpsellOverlay = ReactModule.createElement(UpsellContainerModule, CryoModule.Dictionary.join(MergePropsModuleResult, { onSuccess = OnSuccess })),
		SuccessOverlay = UseStateResult and ReactModule.createElement(PhoneVerificationStatusOverlayModule, {
			image = Element,
			text = UseLocalizationResult.verifySuccessKey
		})
	})
end