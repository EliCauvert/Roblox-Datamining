local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local signalsModule = require(parent.Signals)
local momentsGetMomentsCommentsStoreModule = require(parent.DataHydration.MomentsGetMomentsCommentsStore)
local getCommentCollectionStoreModule = require(moments.Components.Comments.GetCommentCollectionStore)
local createCommentsSheetStoreModule = require(script.Parent.createCommentsSheetStore)
local var1 = momentsGetMomentsCommentsStoreModule(false)
local var2 = getCommentCollectionStoreModule(false)
local ownerGeneration = var1.getOwnerGeneration(false)
local t = {
	stopObservingOwner = nil,
	store = createCommentsSheetStoreModule()
}
t.stopObservingOwner = signalsModule.createEffect(function(p1)
	-- upvalues: var1 (ref), ownerGeneration (write), t (ref), var2 (ref)
	local ownerGeneration_1 = var1.getOwnerGeneration(p1)
	
	if ownerGeneration_1 == ownerGeneration then
		return
	end
	ownerGeneration = ownerGeneration_1
	t.store.reset()
	var2.clear()
end)

return signalsModule.createComputed(function(_)
	-- upvalues: t (ref)
	return t.store
end)