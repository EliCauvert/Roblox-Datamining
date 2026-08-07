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
	onSuccess = function() --[[ line: 24 ]] end,
	closeUpsell = function() --[[ line: 25 ]] end
}

return function(p0) --[[ line: 30 | named "PhoneVerificationUpsellOverlayWrapper" ]]
	-- upvalues: mergePropsModule (ref), t (ref), reactModule (ref), imageSetLabel (ref), images (ref), fFlagFixUpsellVerificationToNavigateToOverlaysModule (ref), useLocalization (ref), upsellContainerModule (ref), cryoModule (ref), phoneVerificationStatusOverlayModule (ref)
	local var9 = mergePropsModule(t, p0)
	local var10, var11 = reactModule.useState(false)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		PhoneVerificationUpsellOverlay = reactModule.createElement(upsellContainerModule, cryoModule.Dictionary.join(var9, {
			onSuccess = function() --[[ line: 41 ]]
				-- upvalues: var11 (ref), fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var9 (ref)
				var11(true)
				task.delay(3, function() --[[ line: 43 ]]
					-- upvalues: fFlagFixUpsellVerificationToNavigateToOverlaysModule (copy), var9 (copy)
					if fFlagFixUpsellVerificationToNavigateToOverlaysModule then
						var9.closeUpsell()
						var9.onSuccess()
						
						return
					end
					var9.onSuccess()
					var9.closeUpsell()
				end)
			end
		})),
		SuccessOverlay = var10 and reactModule.createElement(phoneVerificationStatusOverlayModule, {
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