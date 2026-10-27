local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.MomentsCommon)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local MomentsGetPostAssetStoreModule = require(Parent.DataHydration.MomentsGetPostAssetStore)
local UserLibModule = require(Parent.UserLib)
local ReadSceneOutfitIdFromPostModule = require(script.Parent.readSceneOutfitIdFromPost)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local RbxthumbTypes = UserLibModule.Utils.Constants.RbxthumbTypes
local Signal = require(Parent.Signals).createSignal(nil)

return function(p1, Tbl)
	-- upvalues: SignalsReactModule (copy), MomentsGetPostAssetStoreModule (copy), Signal (copy), ReactModule (copy), ReadSceneOutfitIdFromPostModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), RbxthumbTypes (copy)
	local IsIsMomentScene = p1.metadata.isMomentScene == true
	local PostAssetId = if IsIsMomentScene and p1.postAsset ~= nil then p1.postAsset.postAssetId else 0
	local UseSignalStateResult = SignalsReactModule.useSignalState(if PostAssetId > 0 then MomentsGetPostAssetStoreModule(false).getAndFetchPostAsset(PostAssetId).data else Signal)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), ReadSceneOutfitIdFromPostModule (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), RbxthumbTypes (upval)
		local SceneOutfitIdFromPostModule = if UseSignalStateResult == nil then nil else ReadSceneOutfitIdFromPostModule(UseSignalStateResult)
		
		return if SceneOutfitIdFromPostModule == nil then nil else Content.fromUri(GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(SceneOutfitIdFromPostModule), RbxthumbTypes.Outfit, 420))
	end, { UseSignalStateResult })
	
	if IsIsMomentScene then
		local Copy = table.clone(Tbl)
		Copy.captureType = Enum.CaptureType.Screenshot
		Copy.posterContent = nil
		
		return { mediaItem = Copy, scenePoster = UseMemoResult }
	else
		return { scenePoster = nil, mediaItem = Tbl }
	end
end