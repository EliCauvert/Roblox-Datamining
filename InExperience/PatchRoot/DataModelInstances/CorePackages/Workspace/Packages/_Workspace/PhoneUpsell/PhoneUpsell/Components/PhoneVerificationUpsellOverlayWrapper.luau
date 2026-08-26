local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local reactModule = require(parent.React)
local _ = require(phoneUpsell.Components.PhoneVerificationUpsellOverlay)
local upsellContainerModule = require(phoneUpsell.Components.UpsellContainer)
local phoneVerificationStatusOverlayModule = require(phoneUpsell.Components.PhoneVerificationStatusOverlay)
local cryoModule = require(parent.Cryo)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local mergePropsModule = require(phoneUpsell.Utils.mergeProps)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local fFlagFixUpsellVerificationToNavigateToOverlaysModule = require(phoneUpsell.Flags.FFlagFixUpsellVerificationToNavigateToOverlays)
local t = {
	onSuccess = function() end,
	closeUpsell = function() end
}

return function(p1)
	-- upvalues: mergePropsModule (ref), t (ref), reactModule (ref), imageSetLabel (ref), images (ref), fFlagFixUpsellVerificationToNavigateToOverlaysModule (ref), useLocalization (ref), upsellContainerModule (ref), cryoModule (ref), phoneVerificationStatusOverlayModule (ref)
	local var1 = mergePropsModule(t, p1)
	local var2, var3 = reactModule.useState(false)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		PhoneVerificationUpsellOverlay = reactModule.createElement(upsellContainerModule, cryoModule.Dictionary.join(var1, {
			onSuccess = function()
				-- upvalues: var3 (ref), fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var1 (ref)
				var3(true)
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
			end
		})),
		SuccessOverlay = var2 and reactModule.createElement(phoneVerificationStatusOverlayModule, {
			image = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(40, 40),
				Image = images["icons/status/success_large"]
			}),
			text = useLocalization({
				verifySuccessKey = "Feature.VerificationUpsell.Heading.VerifiedSuccessfully.V2"
			}).verifySuccessKey
		})
	})
end