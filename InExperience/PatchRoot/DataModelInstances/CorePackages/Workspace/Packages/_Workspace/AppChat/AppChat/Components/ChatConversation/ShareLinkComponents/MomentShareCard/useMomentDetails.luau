local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetMomentDetailsStoreModule = require(AppChat.Stores.GetMomentDetailsStore)
local MomentDetailsStatusModule = require(script.Parent.MomentDetailsStatus)
local FFlagAppChatMomentShareCardEdgeCasesModule = require(AppChat.Flags.FFlagAppChatMomentShareCardEdgeCases)
local MomentStatus = require(Parent.MomentsTypes).Enums.MomentStatus
local FFlagMomentsPassFeedItemIdToBackendApis = require(Parent.SharedFlags).FFlagMomentsPassFeedItemIdToBackendApis
local config = { metadata = {} }

return function(p1, p2) --[[ Line: 37 | Named "useMomentDetails" ]]
	-- upvalues: GetMomentDetailsStoreModule (copy), ReactModule (copy), FFlagMomentsPassFeedItemIdToBackendApis (copy), SignalsReactModule (copy), config (copy), DataHydrationModule (copy), MomentDetailsStatusModule (copy), FFlagAppChatMomentShareCardEdgeCasesModule (copy), MomentStatus (copy)
	local MomentDetailsStoreModule = GetMomentDetailsStoreModule(false)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 39 ]]
		-- upvalues: FFlagMomentsPassFeedItemIdToBackendApis (upval), MomentDetailsStoreModule (copy), p1 (copy), p2 (copy)
		return if FFlagMomentsPassFeedItemIdToBackendApis then MomentDetailsStoreModule.getAndFetchMomentDetails(p1, p2) else MomentDetailsStoreModule.getAndFetchMomentDetails(p1)
	end, { MomentDetailsStoreModule, p1, p2 })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.status)
	local UseSignalStateResult2 = UseSignalStateResult or config
	local Metadata = UseSignalStateResult2.metadata
	local CreatorId = UseSignalStateResult2.creatorId
	local Description = Metadata.description
	local UniverseId = Metadata.universeId
	local ExperienceName = Metadata.experienceName
	local LikeCount = Metadata.likeCount
	local AssetId = UseSignalStateResult2.assetId
	local CaptureType = Metadata.captureType
	local AssetAccessContext = Metadata.assetAccessContext
	local IsModerated = UseSignalStateResult2.isModerated
	local Status = UseSignalStateResult2.status
	
	return ReactModule.useMemo(function() --[[ Line: 61 ]]
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult1 (copy), DataHydrationModule (upval), MomentDetailsStatusModule (upval), FFlagAppChatMomentShareCardEdgeCasesModule (upval), IsModerated (copy), Status (copy), MomentStatus (upval), CreatorId (copy), Description (copy), UniverseId (copy), ExperienceName (copy), LikeCount (copy), AssetId (copy), CaptureType (copy), AssetAccessContext (copy)
		return if UseSignalStateResult == nil then if UseSignalStateResult1 == DataHydrationModule.DataStatus.Failed then { status = MomentDetailsStatusModule.Error } else { status = MomentDetailsStatusModule.Loading } elseif FFlagAppChatMomentShareCardEdgeCasesModule and (IsModerated == true or Status == MomentStatus.Deleted) then { status = MomentDetailsStatusModule.Unavailable } else {
			status = MomentDetailsStatusModule.Ready,
			creatorId = CreatorId,
			description = Description,
			universeId = UniverseId,
			experienceName = ExperienceName,
			likeCount = LikeCount,
			assetId = AssetId,
			captureType = CaptureType,
			assetAccessContext = AssetAccessContext
		}
	end, {
		UseSignalStateResult1, UseSignalStateResult ~= nil, CreatorId, Description,
		UniverseId, ExperienceName, LikeCount, AssetId, CaptureType,
		AssetAccessContext, IsModerated, Status
	})
end