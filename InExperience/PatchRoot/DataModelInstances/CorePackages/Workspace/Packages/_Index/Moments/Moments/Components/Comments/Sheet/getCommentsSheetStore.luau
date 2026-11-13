local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local SignalsModule = require(Parent.Signals)
local MomentsGetMomentsCommentsStoreModule = require(Parent.DataHydration.MomentsGetMomentsCommentsStore)
local GetCommentCollectionStoreModule = require(Moments.Components.Comments.GetCommentCollectionStore)
local MomentsGetMomentsCommentsStoreModuleResult = MomentsGetMomentsCommentsStoreModule(false)
local CommentCollectionStoreModule = GetCommentCollectionStoreModule(false)
local OwnerGeneration = MomentsGetMomentsCommentsStoreModuleResult.getOwnerGeneration(false)
local config = {
	stopObservingOwner = nil,
	store = require(script.Parent.createCommentsSheetStore)()
}
config.stopObservingOwner = SignalsModule.createEffect(function(p1)
	-- upvalues: MomentsGetMomentsCommentsStoreModuleResult (copy), OwnerGeneration (ref), config (copy), CommentCollectionStoreModule (copy)
	local OwnerGeneration1 = MomentsGetMomentsCommentsStoreModuleResult.getOwnerGeneration(p1)
	
	if OwnerGeneration1 ~= OwnerGeneration then
		OwnerGeneration = OwnerGeneration1
		config.store.reset()
		CommentCollectionStoreModule.clear()
		
		return
	end
end)

return SignalsModule.createComputed(function(_)
	-- upvalues: config (copy)
	return config.store
end)