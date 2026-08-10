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

return function(p0, p1) --[[ line: 16 ]]
	-- upvalues: useSocialUpsellOverlayController (ref), reactModule (ref), customModalTypeModule (ref), socialUpsellType (ref), upsellEntrySurfaceType (ref), upsellComponent (ref), reportModalImpressionModule (ref), sendModalImpressionEvent (ref)
	local var5 = useSocialUpsellOverlayController(false)
	
	return reactModule.useCallback(function(p2) --[[ line: 19 ]]
		-- upvalues: customModalTypeModule (copy), var5 (ref), socialUpsellType (copy), upsellEntrySurfaceType (copy), upsellComponent (copy), reportModalImpressionModule (copy), p1 (ref), sendModalImpressionEvent (copy)
		if p2.modalType == customModalTypeModule.SocialFaceAgeEstimationUpsell then
			var5.openSocialOverlay(socialUpsellType.FacialAgeEstimation, {
				upsellEntrySurface = upsellEntrySurfaceType.Homepage,
				upsellEntryComponent = upsellComponent.Modal,
				onMounted = function() --[[ line: 24 ]]
					-- upvalues: reportModalImpressionModule (copy), p1 (copy), p2 (ref), sendModalImpressionEvent (copy)
					reportModalImpressionModule(p1, p2.modalId, p2.modalType)
					sendModalImpressionEvent(p2.modalId, p2.modalType)
				end
			})
		end
	end, { p1, p0, var5.openSocialOverlay })
end