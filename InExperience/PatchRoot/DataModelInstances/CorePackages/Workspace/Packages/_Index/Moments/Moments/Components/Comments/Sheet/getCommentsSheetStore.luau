local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local SignalsModule = require(Parent.Signals)
local v1 = require(Parent.DataHydration.MomentsGetMomentsCommentsStore)(false)
local v2 = require(Moments.Components.Comments.GetCommentCollectionStore)(false)
local OwnerGeneration = v1.getOwnerGeneration(false)
local config = {
	stopObservingOwner = nil,
	store = require(script.Parent.createCommentsSheetStore)()
}
config.stopObservingOwner = SignalsModule.createEffect(function(p1) --[[ Line: 22 ]]
	-- upvalues: v1 (copy), OwnerGeneration (ref), config (copy), v2 (copy)
	local OwnerGeneration1 = v1.getOwnerGeneration(p1)
	
	if OwnerGeneration1 ~= OwnerGeneration then
		OwnerGeneration = OwnerGeneration1
		config.store.reset()
		v2.clear()
		
		return
	end
end)

return SignalsModule.createComputed(function(_) --[[ Line: 32 ]]
	-- upvalues: config (copy)
	return config.store
end)