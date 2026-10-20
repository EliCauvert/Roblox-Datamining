local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local SocialUpsellModule = require(Parent.SocialUpsell)
local CustomModalTypeModule = require(ServerTriggeredModals.CustomModalType)
local ReportModalImpressionModule = require(ServerTriggeredModals.reportModalImpression)
local SendModalImpressionEventFunction = require(Parent.ServerTriggeredModalImpressions).sendModalImpressionEvent
local SocialUpsellType = SocialUpsellModule.Enums.SocialUpsellType
local UpsellEntrySurfaceType = SocialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local UpsellComponent = SocialUpsellModule.Analytics.Enum.UpsellComponent
local UseSocialUpsellOverlayControllerFunction = SocialUpsellModule.Hooks.useSocialUpsellOverlayController

return function(p1, p2)
	-- upvalues: UseSocialUpsellOverlayControllerFunction (copy), ReactModule (copy), CustomModalTypeModule (copy), SocialUpsellType (copy), UpsellEntrySurfaceType (copy), UpsellComponent (copy), ReportModalImpressionModule (copy), SendModalImpressionEventFunction (copy)
	local UseSocialUpsellOverlayControllerResult = UseSocialUpsellOverlayControllerFunction(false)
	
	return ReactModule.useCallback(function(p3)
		-- upvalues: CustomModalTypeModule (upval), UseSocialUpsellOverlayControllerResult (copy), SocialUpsellType (upval), UpsellEntrySurfaceType (upval), UpsellComponent (upval), ReportModalImpressionModule (upval), p2 (copy), SendModalImpressionEventFunction (upval)
		if p3.modalType == CustomModalTypeModule.SocialFaceAgeEstimationUpsell then
			UseSocialUpsellOverlayControllerResult.openSocialOverlay(SocialUpsellType.FacialAgeEstimation, {
				upsellEntrySurface = UpsellEntrySurfaceType.Homepage,
				upsellEntryComponent = UpsellComponent.Modal,
				onMounted = function()
					-- upvalues: ReportModalImpressionModule (upval), p2 (upval), p3 (copy), SendModalImpressionEventFunction (upval)
					ReportModalImpressionModule(p2, p3.modalId, p3.modalType)
					SendModalImpressionEventFunction(p3.modalId, p3.modalType)
				end
			})
		end
	end, {
		p2,
		p1,
		UseSocialUpsellOverlayControllerResult.openSocialOverlay
	})
end