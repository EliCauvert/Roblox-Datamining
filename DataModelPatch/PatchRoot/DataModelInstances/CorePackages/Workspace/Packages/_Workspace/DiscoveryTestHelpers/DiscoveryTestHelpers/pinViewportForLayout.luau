local Parent = script.Parent.Parent
local DisplayModule = require(Parent.Display)
local GetMainCollectionLayoutStoreFunction = require(Parent.CollectionViews).getMainCollectionLayoutStore

return function(Vector)
	-- upvalues: GetMainCollectionLayoutStoreFunction (copy), DisplayModule (copy)
	if GetMainCollectionLayoutStoreFunction then
		GetMainCollectionLayoutStoreFunction(false).setDefaultContentRegionWidth(Vector.X)
	end
	local GetDesignSpaceViewportWidth = nil
	local DisplayStore = DisplayModule.GetDisplayStore(false)
	local GetViewportSize = DisplayStore.getViewportSize
	
	function DisplayStore:getViewportSize()
		-- upvalues: Vector (copy)
		return Vector
	end
	
	if DisplayStore.getDesignSpaceViewportWidth then
		GetDesignSpaceViewportWidth = DisplayStore.getDesignSpaceViewportWidth
		
		function DisplayStore:getDesignSpaceViewportWidth()
			-- upvalues: Vector (copy)
			return Vector.X
		end
	end
	return function()
		-- upvalues: GetMainCollectionLayoutStoreFunction (upval), DisplayStore (copy), GetViewportSize (copy), GetDesignSpaceViewportWidth (ref)
		if GetMainCollectionLayoutStoreFunction then
			GetMainCollectionLayoutStoreFunction(false).setDefaultContentRegionWidth(nil)
		end
		if DisplayStore then
			DisplayStore.getViewportSize = GetViewportSize
			
			if GetDesignSpaceViewportWidth then
				DisplayStore.getDesignSpaceViewportWidth = GetDesignSpaceViewportWidth
			end
		end
	end
end