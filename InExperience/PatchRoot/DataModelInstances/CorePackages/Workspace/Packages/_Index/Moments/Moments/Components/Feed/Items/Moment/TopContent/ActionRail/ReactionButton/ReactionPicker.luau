local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local momentContextModule = require(script.Parent.Parent.Parent.Parent.MomentContext)
local useReactionCommitModule = require(script.Parent.Parent.Parent.Parent.Reactions.useReactionCommit)
local pickerItemModule = require(script.Parent.PickerItem)
local view = foundationModule.View
local reactionType = momentsCommonModule.Enums.ReactionType
local list = {
	reactionType.ThumbsUp, reactionType.Heart, reactionType.LaughJoy,
	reactionType.Wow, reactionType.Cry, reactionType.Fire, reactionType.Skull
}

return reactModule.memo(function() --[[ line: 28 | named "ReactionPicker" ]]
	-- upvalues: momentContextModule (ref), useReactionCommitModule (ref), reactModule (ref), list (ref), pickerItemModule (ref), view (ref)
	local store = momentContextModule.useMoment().store
	local var7 = useReactionCommitModule()
	local var8 = reactModule.useCallback(function(p0, p1) --[[ line: 34 ]]
		-- upvalues: var7 (ref), store (ref)
		var7("pickerSelect", p1, p0)
		store.setReactionPickerOpen(false)
	end, { store.setReactionPickerOpen, var7 })
	local t = {}
	
	for i, v in list do
		t[`reaction_{v}`] = reactModule.createElement(pickerItemModule, { reaction = v, index = i, onSelect = var8 })
	end
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center gap-medium size-0-1400 auto-x padding-x-large"
	}, t)
end)