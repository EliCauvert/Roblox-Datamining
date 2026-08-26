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

return function(p1, p2)
	-- upvalues: getMomentDetailsStoreModule (ref), reactModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), signalsReactModule (ref), dataHydrationModule (ref), momentDetailsStatusModule (ref)
	local var1 = getMomentDetailsStoreModule(false)
	local var2 = reactModule.useMemo(function()
		-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), var1 (ref), p1 (ref), p2 (ref)
		return if fFlagMomentsPassFeedItemIdToBackendApis then var1.getAndFetchMomentDetails(p1, p2) else var1.getAndFetchMomentDetails(p1)
	end, { var1, p1, p2 })
	local var3 = signalsReactModule.useSignalState(var2.data)
	local var4 = signalsReactModule.useSignalState(var2.status)
	local var5 = if var3 ~= nil then nil else var3.creatorId
	local var6 = if var3 ~= nil then nil else var3.metadata.description
	local var7 = if var3 ~= nil then nil else var3.metadata.universeId
	local var8 = if var3 ~= nil then nil else var3.metadata.experienceName
	local var9 = if var3 ~= nil then nil else var3.metadata.likeCount
	local var10 = if var3 ~= nil then nil else var3.assetId
	local var11 = if var3 ~= nil then nil else var3.metadata.captureType
	local var12 = if var3 ~= nil then nil else var3.metadata.assetAccessContext
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref), dataHydrationModule (copy), momentDetailsStatusModule (copy), var5 (ref), var6 (ref), var7 (ref), var8 (ref), var9 (ref), var10 (ref), var11 (ref), var12 (ref)
		return if var3 == nil then if var4 == dataHydrationModule.DataStatus.Failed then { status = momentDetailsStatusModule.Error } else { status = momentDetailsStatusModule.Loading } else {
			status = momentDetailsStatusModule.Ready,
			creatorId = var5,
			description = var6,
			universeId = var7,
			experienceName = var8,
			likeCount = var9,
			assetId = var10,
			captureType = var11,
			assetAccessContext = var12
		}
	end, {
		var4, var3 ~= nil, var5, var6, var7, var8, var9, var10, var11, var12
	})
end