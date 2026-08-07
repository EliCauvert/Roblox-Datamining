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

return function(p0) --[[ line: 27 ]]
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), useDispatch (ref), useLazyFmod (ref), useSelector (ref), constantsModule (ref), reactModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), networkingAssetModule (ref), videoTileModule (ref)
	local var9 = useProfileJsonComponentModule(enumsModule.Components.Videos)
	local var10 = useDispatch()
	useLazyFmod()
	local var11 = if var9 and var9.assetIds and #var9.assetIds > 0 then var9.assetIds else {}
	local var12 = useSelector(function(p1) --[[ line: 45 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RODUX_KEY].AssetData or {}
	end)
	local var13 = reactModule.useMemo(function() --[[ line: 49 ]]
		-- upvalues: var11 (write), var12 (ref), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy)
		local t = {}
		
		for i, v in var11 do
			local var15 = var12[tostring(v)]
			
			if var15 then
				table.insert(t, {
					videoId = "rbxassetid://" .. tostring(v),
					title = var15.displayName or "",
					thumbnailImage = getRbxthumbWithTypeSizeAndOptions(tostring(v), constants.RbxthumbTypes.Asset, 150)
				})
			end
		end
		return t
	end, { var11, var12 })
	reactModule.useEffect(function() --[[ line: 69 ]]
		-- upvalues: var11 (write), var12 (ref), var10 (ref), networkingAssetModule (copy)
		for i, v in var11 do
			if not var12[tostring(v)] then
				var10(networkingAssetModule.GetAssetDetails.API(tostring(v))):catch(function() --[[ line: 72 ]] end)
			end
		end
	end, { var11, var12 })
	
	return if #var13 == 0 then reactModule.None else reactModule.createElement(videoTileModule, { layoutOrder = p0.layoutOrder, videos = var13 })
end