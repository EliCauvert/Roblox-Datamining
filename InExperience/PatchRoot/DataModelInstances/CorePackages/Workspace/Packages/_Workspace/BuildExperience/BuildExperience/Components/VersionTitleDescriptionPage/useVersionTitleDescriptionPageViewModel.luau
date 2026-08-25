local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local getVersionInformationStoreModule = require(buildExperience.Stores.GetVersionInformationStore)
local _ = require(script.Parent.VersionTitleDescriptionPageView)
local dataStatus = dataHydrationModule.DataStatus

return function(p0)
	-- upvalues: getVersionInformationStoreModule (ref), placeVersionHistoryModule (ref), reactModule (ref), signalsReactModule (ref), dataStatus (ref)
	local var6 = getVersionInformationStoreModule()
	local placeVersionHistoryStore = placeVersionHistoryModule.getPlaceVersionHistoryStore()
	local var8 = reactModule.useMemo(function()
		-- upvalues: placeVersionHistoryStore (ref), p0 (ref)
		return placeVersionHistoryStore.getAndFetchHistory(p0.placeId)
	end, { p0.placeId, placeVersionHistoryStore })
	local var9 = signalsReactModule.useSignalState(var8.data)
	local var10 = signalsReactModule.useSignalState(var8.status)
	local var11 = signalsReactModule.useSignalState(var6.getDraft)
	local var12 = if var11 == nil or var11.placeId ~= p0.placeId then nil else var11
	local var13 = if var9 ~= nil then nil else var9.placeVersions[1]
	local var14 = if var12 ~= nil then (if var13 ~= nil then nil else var13.title) or "" else var12.title
	local var15 = if var12 ~= nil then (if var13 ~= nil then nil else var13.description) or "" else var12.description
	local var16 = if var12 == nil then if var10 ~= dataStatus.Ready then var10 == dataStatus.Failed else true else true
	local var17, var18 = reactModule.useBinding("")
	local var19, var20 = reactModule.useBinding("")
	local var21 = reactModule.useRef("")
	local var22 = reactModule.useRef("")
	local var23, var24 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), var23 (ref), p0 (ref), var21 (ref), var14 (ref), var22 (ref), var15 (ref), var18 (ref), var20 (ref), var24 (ref)
		if var16 and var23 ~= p0.placeId then
			var21.current = var14
			var22.current = var15
			var18(var14)
			var20(var15)
			var24(p0.placeId)
			
			return
		end
	end, {
		var15,
		var14,
		var23,
		var16,
		p0.placeId
	})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), p0 (ref), var17 (ref), var19 (ref), var21 (ref), var22 (ref), var6 (ref)
		if var23 ~= p0.placeId then return end
		local value = var17:getValue()
		local value_1 = var19:getValue()
		
		if value == var21.current and value_1 == var22.current then
			return
		end
		var6.setDraft(p0.placeId, value, value_1)
		var21.current = value
		var22.current = value_1
	end, {
		var19,
		var23,
		p0.placeId,
		var17,
		var6
	})
	reactModule.useEffect(function()
		-- upvalues: var25 (ref)
		return var25
	end, { var25 })
	
	return {
		isReady = var23 == p0.placeId,
		onBack = reactModule.useCallback(function()
			-- upvalues: var25 (ref), p0 (ref)
			var25()
			p0.onBack()
		end, { p0.onBack, var25 }),
		onDescriptionChanged = var20,
		onFocusLost = var25,
		onTitleChanged = var18,
		titleText = var17,
		descriptionText = var19,
		layoutOrder = p0.layoutOrder,
		testId = p0.testId
	}
end