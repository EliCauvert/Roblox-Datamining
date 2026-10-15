local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local signalsReactModule = require(parent.SignalsReact)
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local fFlagMomentsEngagementMetricsFeature = momentsCommonModule.Flags.FFlagMomentsEngagementMetricsFeature
local fFlagMomentsServeEDPVideos = require(parent.SharedFlags).FFlagMomentsServeEDPVideos
local creatorAttributionModule = require(script.Parent.CreatorAttribution)
local debugInfoModule = require(script.Parent.DebugInfo)
local descriptionModule = require(script.Parent.Description)
local reactionsModule = require(script.Parent.Reactions)
local statusChipModule = require(script.Parent.StatusChip)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local view = foundationModule.View
local getMomentsCapabilities = momentsCommonModule.Stores.GetMomentsCapabilities
local useSignalState = signalsReactModule.useSignalState

return reactModule.memo(function(p1)
	-- upvalues: momentContextModule (ref), useSignalState (ref), fFlagMomentsServeEDPVideos (ref), fFlagMomentsEngagementMetricsFeature (ref), getMomentsCapabilities (ref), useMomentsSession (ref), reactModule (ref), debugInfoModule (ref), creatorAttributionModule (ref), descriptionModule (ref), reactionsModule (ref), statusChipModule (ref), view (ref)
	local var1
	local isExperience = useSignalState(momentContextModule.useMoment().store.getData).kind == "experience"
	
	if fFlagMomentsServeEDPVideos then
		var1 = false
		
		if p1.moment ~= nil then
			local _ = p1.moment.entityType == "edpVideo"
		end
	else
		var1 = nil
	end
	local var2 = if fFlagMomentsEngagementMetricsFeature then useSignalState(getMomentsCapabilities(false).getIsEngagementMetricsEnabled) else nil
	local t = {}
	
	if not useSignalState(useMomentsSession().getHideDetails) then
		t.DebugInfo = reactModule.createElement(debugInfoModule, { LayoutOrder = 0 })
		t.CreatorAttribution = if isExperience and (not fFlagMomentsServeEDPVideos or not var1) then reactModule.createElement(creatorAttributionModule, { LayoutOrder = 1 }) else nil
		t.Description = reactModule.createElement(descriptionModule, { LayoutOrder = 2 })
		t.Reactions = if isExperience and (not fFlagMomentsEngagementMetricsFeature or var2) then reactModule.createElement(reactionsModule, { LayoutOrder = 3 }) else nil
		t.StatusChip = reactModule.createElement(statusChipModule, { LayoutOrder = 4 })
	end
	return reactModule.createElement(view, {
		tag = "col align-x-left align-y-bottom grow gap-small auto-y",
		LayoutOrder = p1.LayoutOrder
	}, t)
end)