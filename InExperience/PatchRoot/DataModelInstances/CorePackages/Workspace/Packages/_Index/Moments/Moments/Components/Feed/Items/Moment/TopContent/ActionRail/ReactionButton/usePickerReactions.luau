local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.MomentsCommon)
local ReactionTypesFromEmojisModule = require(Moments.Utils.reactionTypesFromEmojis)
local FFlagMomentsEmojiSetsApiModule = require(Moments.Flags.FFlagMomentsEmojiSetsApi)
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

return function()
	-- upvalues: PICKERREACTIONORDER (copy), FFlagMomentsEmojiSetsApiModule (copy), UseSignalStateFunction (copy), v1 (copy)
	return if FFlagMomentsEmojiSetsApiModule then UseSignalStateFunction(v1) else PICKERREACTIONORDER
end