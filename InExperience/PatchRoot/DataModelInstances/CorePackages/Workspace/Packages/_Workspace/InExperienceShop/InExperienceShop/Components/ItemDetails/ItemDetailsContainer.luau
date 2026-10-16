local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local ItemDetailsViewModule = require(script.Parent.ItemDetailsView)
local UseItemDetailsViewModelModule = require(script.Parent.useItemDetailsViewModel)
local ShopAbuseReportOverlayModule = if require(Parent.SharedFlags).FFlagEnableReportingFlowForExperienceShop then require(InExperienceShop.Components.ShopAbuseReportOverlay) else nil

return function(p1) --[[ Line: 16 | Named "ItemDetailsContainer" ]]
	-- upvalues: UseItemDetailsViewModelModule (copy), ReactModule (copy), View (copy), ItemDetailsViewModule (copy), ShopAbuseReportOverlayModule (copy)
	local UseItemDetailsViewModelModuleResult = UseItemDetailsViewModelModule(p1)
	local ReportSession = UseItemDetailsViewModelModuleResult.reportSession
	
	return ReactModule.createElement(View, { tag = "size-full" }, {
		Details = ReactModule.createElement(ItemDetailsViewModule, UseItemDetailsViewModelModuleResult),
		ReportOverlay = if ReportSession and UseItemDetailsViewModelModuleResult.onReportClose and ShopAbuseReportOverlayModule then ReactModule.createElement(ShopAbuseReportOverlayModule, {
			abuseVector = ReportSession.abuseVector,
			targetId = ReportSession.targetId,
			onClose = UseItemDetailsViewModelModuleResult.onReportClose
		}) else nil
	})
end