local Parent = script:FindFirstAncestor("Home").Parent
local CollectionViewsModule = require(Parent.CollectionViews)
local BuildSduiCollectionInfoFunction = require(Parent.SduiSharedUtilities).buildSduiCollectionInfo
local FFlagSduiPreferredTextSizeLineBudgets = require(Parent.SharedFlags).FFlagSduiPreferredTextSizeLineBudgets
local _UDim = UDim.new(1, 72)

return function()
	-- upvalues: CollectionViewsModule (copy), BuildSduiCollectionInfoFunction (copy), _UDim (copy), FFlagSduiPreferredTextSizeLineBudgets (copy)
	return if CollectionViewsModule.getMainCollectionLayoutStore(false).getIsContainerMeasured(false) then BuildSduiCollectionInfoFunction("Small", _UDim, if FFlagSduiPreferredTextSizeLineBudgets then 3 else nil) else nil
end