local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local reactModule = require(momentsCreation.Parent.React)
local creationControllerContextModule = require(momentsCreation.CreationController.CreationControllerContext)
local createCreationControllerModule = require(momentsCreation.CreationController.createCreationController)
local getCreationFlowStoreModule = require(momentsCreation.Stores.GetCreationFlowStore)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(startValue)
	-- upvalues: reactModule (ref), createCreationControllerModule (ref), getCreationFlowStoreModule (ref), creationControllerContextModule (ref)
	local host = startValue.host
	local excludeGallery = startValue.excludeGallery
	
	return reactModule.createElement(creationControllerContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: createCreationControllerModule (copy), getCreationFlowStoreModule (copy), host (ref), excludeGallery (ref)
			return createCreationControllerModule({
				store = getCreationFlowStoreModule(false),
				host = host,
				excludeGallery = excludeGallery
			})
		end, { host, excludeGallery })
	}, startValue.children)
end