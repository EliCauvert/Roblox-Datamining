local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local ReactModule = require(MomentsCreation.Parent.React)
local CreationControllerContextModule = require(MomentsCreation.CreationController.CreationControllerContext)
local CreateCreationControllerModule = require(MomentsCreation.CreationController.createCreationController)
local GetCreationFlowStoreModule = require(MomentsCreation.Stores.GetCreationFlowStore)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: ReactModule (copy), CreateCreationControllerModule (copy), GetCreationFlowStoreModule (copy), CreationControllerContextModule (copy)
	local Host = p1.host
	local ExcludeGallery = p1.excludeGallery
	local InitialAvatarMoment = p1.initialAvatarMoment
	
	return ReactModule.createElement(CreationControllerContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: CreateCreationControllerModule (upval), GetCreationFlowStoreModule (upval), Host (copy), ExcludeGallery (copy), InitialAvatarMoment (copy)
			return CreateCreationControllerModule({
				store = GetCreationFlowStoreModule(false),
				host = Host,
				excludeGallery = ExcludeGallery,
				initialAvatarMoment = InitialAvatarMoment
			})
		end, { Host, ExcludeGallery, InitialAvatarMoment })
	}, p1.children)
end