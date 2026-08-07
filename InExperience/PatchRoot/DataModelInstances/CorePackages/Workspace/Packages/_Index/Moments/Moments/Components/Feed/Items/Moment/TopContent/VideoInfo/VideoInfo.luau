local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local creatorAttributionModule = require(script.Parent.CreatorAttribution)
local debugInfoModule = require(script.Parent.DebugInfo)
local descriptionModule = require(script.Parent.Description)
local reactionsModule = require(script.Parent.Reactions)
local statusChipModule = require(script.Parent.StatusChip)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local view = foundationModule.View
local useSignalState = signalsReactModule.useSignalState

return reactModule.memo(function(p0) --[[ line: 38 | named "VideoInfo" ]]
	-- upvalues: momentContextModule (ref), useSignalState (ref), useMomentsSession (ref), reactModule (ref), debugInfoModule (ref), creatorAttributionModule (ref), descriptionModule (ref), reactionsModule (ref), statusChipModule (ref), view (ref)
	local isExperience = useSignalState(momentContextModule.useMoment().store.getData).kind == "experience"
	local t = {}
	
	if not useSignalState(useMomentsSession().getHideDetails) then
		t.DebugInfo = reactModule.createElement(debugInfoModule, { LayoutOrder = 0 })
		t.CreatorAttribution = if isExperience then reactModule.createElement(creatorAttributionModule, { LayoutOrder = 1 }) else nil
		t.Description = reactModule.createElement(descriptionModule, { LayoutOrder = 2 })
		t.Reactions = if isExperience then reactModule.createElement(reactionsModule, { LayoutOrder = 3 }) else nil
		t.StatusChip = reactModule.createElement(statusChipModule, { LayoutOrder = 4 })
	end
	return reactModule.createElement(view, {
		tag = "col align-x-left align-y-bottom grow gap-small auto-y",
		LayoutOrder = p0.LayoutOrder
	}, t)
end)