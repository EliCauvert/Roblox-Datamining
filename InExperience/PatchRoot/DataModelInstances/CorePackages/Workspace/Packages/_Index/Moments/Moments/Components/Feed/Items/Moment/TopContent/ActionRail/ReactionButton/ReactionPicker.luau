local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local MomentContextModule = require(script.Parent.Parent.Parent.Parent.MomentContext)
local UseReactionCommitModule = require(script.Parent.Parent.Parent.Parent.Reactions.useReactionCommit)
local PickerItemModule = require(script.Parent.PickerItem)
local ReactionTypesFromEmojisModule = require(Moments.Utils.reactionTypesFromEmojis)
local FFlagMomentsEmojiSetsApiModule = require(Moments.Flags.FFlagMomentsEmojiSetsApi)
local View = require(Parent.Foundation).View
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local MomentsGetMomentsReactionsStoreModule = if FFlagMomentsEmojiSetsApiModule then require(Parent.DataHydration.MomentsGetMomentsReactionsStore) else nil
local PICKERREACTIONORDER = ReactionTypesFromEmojisModule.PICKER_REACTION_ORDER
local ReactionTypesFromEmojisFunction = ReactionTypesFromEmojisModule.reactionTypesFromEmojis
local v1 = if FFlagMomentsEmojiSetsApiModule then function(p1)
	-- upvalues: MomentsGetMomentsReactionsStoreModule (copy), ReactionTypesFromEmojisFunction (copy)
	assert(MomentsGetMomentsReactionsStoreModule ~= nil, "expected Moments reactions store when FFlagMomentsEmojiSetsApi is on")
	local GetEmojisFunction = MomentsGetMomentsReactionsStoreModule(false).getEmojis
	assert(GetEmojisFunction ~= nil, "expected getEmojis when FFlagMomentsEmojiSetsApi is on")
	
	return ReactionTypesFromEmojisFunction(GetEmojisFunction(p1))
end else nil

return ReactModule.memo(function()
	-- upvalues: MomentContextModule (copy), UseReactionCommitModule (copy), PICKERREACTIONORDER (copy), FFlagMomentsEmojiSetsApiModule (copy), UseSignalStateFunction (copy), v1 (copy), ReactModule (copy), PickerItemModule (copy), View (copy)
	local Store = MomentContextModule.useMoment().store
	local UseReactionCommitModuleResult = UseReactionCommitModule()
	local UseResult = ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseReactionCommitModuleResult (copy), Store (copy)
		UseReactionCommitModuleResult("pickerSelect", p2, p1)
		Store.setReactionPickerOpen(false)
	end, {
		Store.setReactionPickerOpen,
		UseReactionCommitModuleResult
	})
	local Elements = {}
	
	for Index, Reaction in if FFlagMomentsEmojiSetsApiModule then UseSignalStateFunction(v1) else PICKERREACTIONORDER do
		Elements[`reaction_{Reaction}`] = ReactModule.createElement(PickerItemModule, { reaction = Reaction, index = Index, onSelect = UseResult })
	end
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center gap-medium size-0-1400 auto-x padding-x-large"
	}, Elements)
end)