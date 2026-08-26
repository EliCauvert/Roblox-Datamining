local parent = script:FindFirstAncestor("Home").Parent
local collectionViewsModule = require(parent.CollectionViews)
local buildSduiCollectionInfo = require(parent.SduiSharedUtilities).buildSduiCollectionInfo
local uDim = UDim.new(1, 72)

return function()
	-- upvalues: collectionViewsModule (ref), buildSduiCollectionInfo (ref), uDim (ref)
	return if collectionViewsModule.getMainCollectionLayoutStore(false).getIsContainerMeasured(false) then buildSduiCollectionInfo("Small", uDim) else nil
end