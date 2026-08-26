local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local reactModule = require(parent.React)
local socialUpsellModule = require(parent.SocialUpsell)
local customModalTypeModule = require(serverTriggeredModals.CustomModalType)
local reportModalImpressionModule = require(serverTriggeredModals.reportModalImpression)
local sendModalImpressionEvent = require(parent.ServerTriggeredModalImpressions).sendModalImpressionEvent
local socialUpsellType = socialUpsellModule.Enums.SocialUpsellType
local upsellEntrySurfaceType = socialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local upsellComponent = socialUpsellModule.Analytics.Enum.UpsellComponent
local useSocialUpsellOverlayController = socialUpsellModule.Hooks.useSocialUpsellOverlayController

return function(p1, p2)
	-- upvalues: useSocialUpsellOverlayController (ref), reactModule (ref), customModalTypeModule (ref), socialUpsellType (ref), upsellEntrySurfaceType (ref), upsellComponent (ref), reportModalImpressionModule (ref), sendModalImpressionEvent (ref)
	local var1 = useSocialUpsellOverlayController(false)
	
	return reactModule.useCallback(function(p3)
		-- upvalues: customModalTypeModule (copy), var1 (ref), socialUpsellType (copy), upsellEntrySurfaceType (copy), upsellComponent (copy), reportModalImpressionModule (copy), p2 (ref), sendModalImpressionEvent (copy)
		if p3.modalType == customModalTypeModule.SocialFaceAgeEstimationUpsell then
			var1.openSocialOverlay(socialUpsellType.FacialAgeEstimation, {
				upsellEntrySurface = upsellEntrySurfaceType.Homepage,
				upsellEntryComponent = upsellComponent.Modal,
				onMounted = function()
					-- upvalues: reportModalImpressionModule (copy), p2 (copy), p3 (ref), sendModalImpressionEvent (copy)
					reportModalImpressionModule(p2, p3.modalId, p3.modalType)
					sendModalImpressionEvent(p3.modalId, p3.modalType)
				end
			})
		end
	end, { p2, p1, var1.openSocialOverlay })
end