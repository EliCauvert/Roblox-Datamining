local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local ReactModule = require(MomentsCreation.Parent.React)
local CreationControllerContextModule = require(MomentsCreation.CreationController.CreationControllerContext)
local CreateCreationControllerModule = require(MomentsCreation.CreationController.createCreationController)
local GetCreationFlowStoreModule = require(MomentsCreation.Stores.GetCreationFlowStore)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return function(p1) --[[ Line: 24 | Named "CreationControllerProvider" ]]
	-- upvalues: ReactModule (copy), CreateCreationControllerModule (copy), GetCreationFlowStoreModule (copy), CreationControllerContextModule (copy)
	local Host = p1.host
	local ExcludeGallery = p1.excludeGallery
	
	return ReactModule.createElement(CreationControllerContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 28 ]]
			-- upvalues: CreateCreationControllerModule (upval), GetCreationFlowStoreModule (upval), Host (copy), ExcludeGallery (copy)
			return CreateCreationControllerModule({
				store = GetCreationFlowStoreModule(false),
				host = Host,
				excludeGallery = ExcludeGallery
			})
		end, { Host, ExcludeGallery })
	}, p1.children)
end