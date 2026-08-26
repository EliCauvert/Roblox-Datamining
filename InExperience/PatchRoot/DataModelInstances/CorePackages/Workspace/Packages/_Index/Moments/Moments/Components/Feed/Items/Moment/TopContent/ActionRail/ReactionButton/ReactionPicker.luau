local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local momentContextModule = require(script.Parent.Parent.Parent.Parent.MomentContext)
local useReactionCommitModule = require(script.Parent.Parent.Parent.Parent.Reactions.useReactionCommit)
local pickerItemModule = require(script.Parent.PickerItem)
local reactionTypesFromEmojisModule = require(moments.Utils.reactionTypesFromEmojis)
local fFlagMomentsEmojiSetsApiModule = require(moments.Flags.FFlagMomentsEmojiSetsApi)
local view = foundationModule.View
local useSignalState = signalsReactModule.useSignalState
local var1 = if fFlagMomentsEmojiSetsApiModule then require(parent.DataHydration.MomentsGetMomentsReactionsStore) else nil
local FALLBACK_PICKER_REACTIONS = reactionTypesFromEmojisModule.FALLBACK_PICKER_REACTIONS
local reactionTypesFromEmojis = reactionTypesFromEmojisModule.reactionTypesFromEmojis
local var2 = if fFlagMomentsEmojiSetsApiModule then function(p1)
	-- upvalues: var1 (ref), reactionTypesFromEmojis (ref)
	assert(var1 ~= nil, "expected Moments reactions store when FFlagMomentsEmojiSetsApi is on")
	local getEmojis = var1(false).getEmojis
	assert(getEmojis ~= nil, "expected getEmojis when FFlagMomentsEmojiSetsApi is on")
	
	return reactionTypesFromEmojis(getEmojis(p1))
end else nil

return reactModule.memo(function()
	-- upvalues: momentContextModule (ref), useReactionCommitModule (ref), FALLBACK_PICKER_REACTIONS (ref), fFlagMomentsEmojiSetsApiModule (ref), useSignalState (ref), var2 (ref), reactModule (ref), pickerItemModule (ref), view (ref)
	local store = momentContextModule.useMoment().store
	local var3 = useReactionCommitModule()
	local var4 = if fFlagMomentsEmojiSetsApiModule then useSignalState(var2) else FALLBACK_PICKER_REACTIONS
	local var5 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var3 (ref), store (ref)
		var3("pickerSelect", p2, p1)
		store.setReactionPickerOpen(false)
	end, { store.setReactionPickerOpen, var3 })
	local t = {}
	
	for i, v in var4 do
		t[`reaction_{v}`] = reactModule.createElement(pickerItemModule, { reaction = v, index = i, onSelect = var5 })
	end
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center gap-medium size-0-1400 auto-x padding-x-large"
	}, t)
end)