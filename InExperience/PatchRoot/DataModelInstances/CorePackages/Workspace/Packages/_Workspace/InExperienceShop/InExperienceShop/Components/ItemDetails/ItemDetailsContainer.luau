local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local sharedFlagsModule = require(parent.SharedFlags)
local itemDetailsViewModule = require(script.Parent.ItemDetailsView)
local useItemDetailsViewModelModule = require(script.Parent.useItemDetailsViewModel)
local var5 = if sharedFlagsModule.FFlagEnableReportingFlowForExperienceShop then require(inExperienceShop.Components.ShopAbuseReportOverlay) else nil

return function(p0)
	-- upvalues: useItemDetailsViewModelModule (ref), reactModule (ref), view (ref), itemDetailsViewModule (ref), var5 (ref)
	local var6 = useItemDetailsViewModelModule(p0)
	local reportSession = var6.reportSession
	
	return reactModule.createElement(view, { tag = "size-full" }, {
		Details = reactModule.createElement(itemDetailsViewModule, var6),
		ReportOverlay = if reportSession and var6.onReportClose and var5 then reactModule.createElement(var5, {
			abuseVector = reportSession.abuseVector,
			targetId = reportSession.targetId,
			onClose = var6.onReportClose
		}) else nil
	})
end