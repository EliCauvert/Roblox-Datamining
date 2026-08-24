local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local getMomentDetailsStoreModule = require(appChat.Stores.GetMomentDetailsStore)
local _ = { Loading = "loading", Ready = "ready", Error = "error" }
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis

return function(p0, p1)
	-- upvalues: getMomentDetailsStoreModule (ref), reactModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), signalsReactModule (ref), dataHydrationModule (ref)
	local var6 = getMomentDetailsStoreModule(false)
	local var7 = reactModule.useMemo(function()
		-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), var6 (ref), p0 (ref), p1 (ref)
		return if fFlagMomentsPassFeedItemIdToBackendApis then var6.getAndFetchMomentDetails(p0, p1) else var6.getAndFetchMomentDetails(p0)
	end, { var6, p0, p1 })
	local var8 = signalsReactModule.useSignalState(var7.data)
	local var9 = signalsReactModule.useSignalState(var7.status)
	local var10 = if var8 ~= nil then nil else var8.creatorId
	local var11 = if var8 ~= nil then nil else var8.metadata.description
	local var12 = if var8 ~= nil then nil else var8.metadata.universeId
	local var13 = if var8 ~= nil then nil else var8.metadata.experienceName
	local var14 = if var8 ~= nil then nil else var8.metadata.likeCount
	local var15 = if var8 ~= nil then nil else var8.assetId
	local var16 = if var8 ~= nil then nil else var8.metadata.captureType
	local var17 = if var8 ~= nil then nil else var8.metadata.assetAccessContext
	
	return reactModule.useMemo(function()
		-- upvalues: var8 (ref), var9 (ref), dataHydrationModule (copy), var10 (ref), var11 (ref), var12 (ref), var13 (ref), var14 (ref), var15 (ref), var16 (ref), var17 (ref)
		return if var8 == nil then if var9 == dataHydrationModule.DataStatus.Failed then { status = "error" } else { status = "loading" } else {
			status = "ready",
			creatorId = var10,
			description = var11,
			universeId = var12,
			experienceName = var13,
			likeCount = var14,
			assetId = var15,
			captureType = var16,
			assetAccessContext = var17
		}
	end, {
		var9, var8 ~= nil, var10, var11, var12, var13, var14, var15, var16, var17
	})
end