local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local momentsTypesModule = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local getMomentDetailsStoreModule = require(appChat.Stores.GetMomentDetailsStore)
local momentDetailsStatusModule = require(script.Parent.MomentDetailsStatus)
local fFlagAppChatMomentShareCardEdgeCasesModule = require(appChat.Flags.FFlagAppChatMomentShareCardEdgeCases)
local momentStatus = momentsTypesModule.Enums.MomentStatus
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local t = { metadata = {} }

return function(p1, p2)
	-- upvalues: getMomentDetailsStoreModule (ref), reactModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), signalsReactModule (ref), t (ref), dataHydrationModule (ref), momentDetailsStatusModule (ref), fFlagAppChatMomentShareCardEdgeCasesModule (ref), momentStatus (ref)
	local var1 = getMomentDetailsStoreModule(false)
	local var2 = reactModule.useMemo(function()
		-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), var1 (ref), p1 (ref), p2 (ref)
		return if fFlagMomentsPassFeedItemIdToBackendApis then var1.getAndFetchMomentDetails(p1, p2) else var1.getAndFetchMomentDetails(p1)
	end, { var1, p1, p2 })
	local var3 = signalsReactModule.useSignalState(var2.data)
	local var4 = signalsReactModule.useSignalState(var2.status)
	local var5 = var3 or t
	local metadata = var5.metadata
	local creatorId = var5.creatorId
	local description = metadata.description
	local universeId = metadata.universeId
	local experienceName = metadata.experienceName
	local likeCount = metadata.likeCount
	local assetId = var5.assetId
	local captureType = metadata.captureType
	local assetAccessContext = metadata.assetAccessContext
	local isModerated = var5.isModerated
	local status = var5.status
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref), dataHydrationModule (copy), momentDetailsStatusModule (copy), fFlagAppChatMomentShareCardEdgeCasesModule (copy), isModerated (ref), status (ref), momentStatus (copy), creatorId (ref), description (ref), universeId (ref), experienceName (ref), likeCount (ref), assetId (ref), captureType (ref), assetAccessContext (ref)
		return if var3 == nil then if var4 == dataHydrationModule.DataStatus.Failed then { status = momentDetailsStatusModule.Error } else { status = momentDetailsStatusModule.Loading } elseif fFlagAppChatMomentShareCardEdgeCasesModule and (isModerated == true or status == momentStatus.Deleted) then { status = momentDetailsStatusModule.Unavailable } else {
			status = momentDetailsStatusModule.Ready,
			creatorId = creatorId,
			description = description,
			universeId = universeId,
			experienceName = experienceName,
			likeCount = likeCount,
			assetId = assetId,
			captureType = captureType,
			assetAccessContext = assetAccessContext
		}
	end, {
		var4, var3 ~= nil, creatorId, description, universeId, experienceName,
		likeCount, assetId, captureType, assetAccessContext, isModerated, status
	})
end