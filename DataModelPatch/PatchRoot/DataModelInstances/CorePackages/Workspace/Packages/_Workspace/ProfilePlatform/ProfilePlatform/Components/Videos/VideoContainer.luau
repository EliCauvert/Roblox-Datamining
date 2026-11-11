local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UserLibModule = require(Parent.UserLib)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseLazyFmodFunction = require(Parent.MediaPlayback).useLazyFmod
local VideoTileModule = require(ProfilePlatform.Components.Videos.VideoTile)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local NetworkingAssetModule = require(ProfilePlatform.Networking.NetworkingAsset)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions

return function(p1)
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), UseDispatchFunction (copy), UseLazyFmodFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), ReactModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), NetworkingAssetModule (copy), VideoTileModule (copy)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.Videos)
	local UseDispatchResult = UseDispatchFunction()
	UseLazyFmodFunction()
	local AssetIds = if UseProfileJsonComponentModuleResult and UseProfileJsonComponentModuleResult.assetIds and #UseProfileJsonComponentModuleResult.assetIds > 0 then UseProfileJsonComponentModuleResult.assetIds else {}
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RODUX_KEY].AssetData or {}
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AssetIds (ref), UseSelectorResult (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), Constants (upval)
		local List = {}
		
		for _, assetId in AssetIds do
			local UseSelectorResultEntry = UseSelectorResult[tostring(assetId)]
			
			if UseSelectorResultEntry then
				table.insert(List, {
					videoId = "rbxassetid://" .. tostring(assetId),
					title = UseSelectorResultEntry.displayName or "",
					thumbnailImage = GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(assetId), Constants.RbxthumbTypes.Asset, 150)
				})
			end
		end
		return List
	end, { AssetIds, UseSelectorResult })
	ReactModule.useEffect(function()
		-- upvalues: AssetIds (ref), UseSelectorResult (copy), UseDispatchResult (copy), NetworkingAssetModule (upval)
		for _, assetId in AssetIds do
			if not UseSelectorResult[tostring(assetId)] then
				UseDispatchResult(NetworkingAssetModule.GetAssetDetails.API((tostring(assetId)))):catch(function() end)
			end
		end
	end, { AssetIds, UseSelectorResult })
	
	return if #UseMemoResult == 0 then ReactModule.None else ReactModule.createElement(VideoTileModule, { layoutOrder = p1.layoutOrder, videos = UseMemoResult })
end