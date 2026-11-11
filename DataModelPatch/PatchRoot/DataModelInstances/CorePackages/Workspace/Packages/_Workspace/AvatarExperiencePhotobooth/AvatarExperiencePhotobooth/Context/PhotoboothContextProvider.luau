local ReactModule = require(script:FindFirstAncestor("AvatarExperiencePhotobooth").Parent.React)
local PhotoboothContextModule = require(script.Parent.PhotoboothContext)
local CreatePhotoboothStoreModule = require(script.Parent.Parent.Stores.createPhotoboothStore)
local PhotoboothStoreBridgeModule = require(script.Parent.Parent.PhotoboothStoreBridge)

return function(p1)
	-- upvalues: ReactModule (copy), CreatePhotoboothStoreModule (copy), PhotoboothStoreBridgeModule (copy), PhotoboothContextModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreatePhotoboothStoreModule (upval)
		return CreatePhotoboothStoreModule()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: PhotoboothStoreBridgeModule (upval), UseMemoResult (copy)
		PhotoboothStoreBridgeModule.setStore(UseMemoResult)
		
		return function()
			-- upvalues: PhotoboothStoreBridgeModule (upval)
			PhotoboothStoreBridgeModule.clearStore()
		end
	end, { UseMemoResult })
	
	return ReactModule.createElement(PhotoboothContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy)
			return { photoboothStore = UseMemoResult }
		end, { UseMemoResult })
	}, p1.children)
end