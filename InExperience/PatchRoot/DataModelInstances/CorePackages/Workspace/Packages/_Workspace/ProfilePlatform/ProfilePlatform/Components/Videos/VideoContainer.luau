local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local userLibModule = require(parent.UserLib)
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useLazyFmod = require(parent.MediaPlayback).useLazyFmod
local videoTileModule = require(profilePlatform.Components.Videos.VideoTile)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local enumsModule = require(profilePlatform.Common.Enums)
local constantsModule = require(profilePlatform.Common.Constants)
local networkingAssetModule = require(profilePlatform.Networking.NetworkingAsset)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions

return function(p1)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), useDispatch (ref), useLazyFmod (ref), useSelector (ref), constantsModule (ref), reactModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), networkingAssetModule (ref), videoTileModule (ref)
	local var1 = useProfileJsonComponentModule(enumsModule.Components.Videos)
	local var2 = useDispatch()
	useLazyFmod()
	local var3 = if var1 and var1.assetIds and #var1.assetIds > 0 then var1.assetIds else {}
	local var4 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RODUX_KEY].AssetData or {}
	end)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var3 (write), var4 (ref), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy)
		local t = {}
		
		for i, v in var3 do
			local var6 = var4[tostring(v)]
			
			if var6 then
				table.insert(t, {
					videoId = "rbxassetid://" .. tostring(v),
					title = var6.displayName or "",
					thumbnailImage = getRbxthumbWithTypeSizeAndOptions(tostring(v), constants.RbxthumbTypes.Asset, 150)
				})
			end
		end
		return t
	end, { var3, var4 })
	reactModule.useEffect(function()
		-- upvalues: var3 (write), var4 (ref), var2 (ref), networkingAssetModule (copy)
		for i, v in var3 do
			if not var4[tostring(v)] then
				var2(networkingAssetModule.GetAssetDetails.API(tostring(v))):catch(function() end)
			end
		end
	end, { var3, var4 })
	
	return if #var5 == 0 then reactModule.None else reactModule.createElement(videoTileModule, { layoutOrder = p1.layoutOrder, videos = var5 })
end