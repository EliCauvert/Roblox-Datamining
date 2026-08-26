local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local sharedFlagsModule = require(parent.SharedFlags)
local itemDetailsViewModule = require(script.Parent.ItemDetailsView)
local useItemDetailsViewModelModule = require(script.Parent.useItemDetailsViewModel)
local var1 = if sharedFlagsModule.FFlagEnableReportingFlowForExperienceShop then require(inExperienceShop.Components.ShopAbuseReportOverlay) else nil

return function(p1)
	-- upvalues: useItemDetailsViewModelModule (ref), reactModule (ref), view (ref), itemDetailsViewModule (ref), var1 (ref)
	local var2 = useItemDetailsViewModelModule(p1)
	local reportSession = var2.reportSession
	
	return reactModule.createElement(view, { tag = "size-full" }, {
		Details = reactModule.createElement(itemDetailsViewModule, var2),
		ReportOverlay = if reportSession and var2.onReportClose and var1 then reactModule.createElement(var1, {
			abuseVector = reportSession.abuseVector,
			targetId = reportSession.targetId,
			onClose = var2.onReportClose
		}) else nil
	})
end