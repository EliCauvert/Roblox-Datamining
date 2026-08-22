local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local getMomentDetailsStoreModule = require(appChat.Stores.GetMomentDetailsStore)
local momentDetailsStatusModule = require(script.Parent.MomentDetailsStatus)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis

return function(p0, p1) --[[ line: 29 | named "useMomentDetails" ]]
	-- upvalues: getMomentDetailsStoreModule (ref), reactModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), signalsReactModule (ref), dataHydrationModule (ref), momentDetailsStatusModule (ref)
	local var7 = getMomentDetailsStoreModule(false)
	local var8 = reactModule.useMemo(function() --[[ line: 31 ]]
		-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), var7 (ref), p0 (ref), p1 (ref)
		return if fFlagMomentsPassFeedItemIdToBackendApis then var7.getAndFetchMomentDetails(p0, p1) else var7.getAndFetchMomentDetails(p0)
	end, { var7, p0, p1 })
	local var9 = signalsReactModule.useSignalState(var8.data)
	local var10 = signalsReactModule.useSignalState(var8.status)
	local var11 = if var9 ~= nil then nil else var9.creatorId
	local var12 = if var9 ~= nil then nil else var9.metadata.description
	local var13 = if var9 ~= nil then nil else var9.metadata.universeId
	local var14 = if var9 ~= nil then nil else var9.metadata.experienceName
	local var15 = if var9 ~= nil then nil else var9.metadata.likeCount
	local var16 = if var9 ~= nil then nil else var9.assetId
	local var17 = if var9 ~= nil then nil else var9.metadata.captureType
	local var18 = if var9 ~= nil then nil else var9.metadata.assetAccessContext
	
	return reactModule.useMemo(function() --[[ line: 49 ]]
		-- upvalues: var9 (ref), var10 (ref), dataHydrationModule (copy), momentDetailsStatusModule (copy), var11 (ref), var12 (ref), var13 (ref), var14 (ref), var15 (ref), var16 (ref), var17 (ref), var18 (ref)
		return if var9 == nil then if var10 == dataHydrationModule.DataStatus.Failed then { status = momentDetailsStatusModule.Error } else { status = momentDetailsStatusModule.Loading } else {
			status = momentDetailsStatusModule.Ready,
			creatorId = var11,
			description = var12,
			universeId = var13,
			experienceName = var14,
			likeCount = var15,
			assetId = var16,
			captureType = var17,
			assetAccessContext = var18
		}
	end, {
		var10, var9 ~= nil, var11, var12, var13, var14, var15, var16, var17, var18
	})
end