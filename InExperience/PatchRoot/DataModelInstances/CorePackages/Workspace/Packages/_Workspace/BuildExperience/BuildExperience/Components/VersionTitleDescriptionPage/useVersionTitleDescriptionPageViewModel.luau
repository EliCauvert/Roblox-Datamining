local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local getVersionInformationStoreModule = require(buildExperience.Stores.GetVersionInformationStore)
local _ = require(script.Parent.VersionTitleDescriptionPageView)
local dataStatus = dataHydrationModule.DataStatus

return function(p1)
	-- upvalues: getVersionInformationStoreModule (ref), placeVersionHistoryModule (ref), reactModule (ref), signalsReactModule (ref), dataStatus (ref)
	local var1 = getVersionInformationStoreModule()
	local placeVersionHistoryStore = placeVersionHistoryModule.getPlaceVersionHistoryStore()
	local var2 = reactModule.useMemo(function()
		-- upvalues: placeVersionHistoryStore (ref), p1 (ref)
		return placeVersionHistoryStore.getAndFetchHistory(p1.placeId)
	end, { p1.placeId, placeVersionHistoryStore })
	local var3 = signalsReactModule.useSignalState(var2.data)
	local var4 = signalsReactModule.useSignalState(var2.status)
	local var5 = signalsReactModule.useSignalState(var1.getDraft)
	local var6 = if var5 == nil or var5.placeId ~= p1.placeId then nil else var5
	local var7 = if var3 ~= nil then nil else var3.placeVersions[1]
	local var8 = if var6 ~= nil then (if var7 ~= nil then nil else var7.title) or "" else var6.title
	local var9 = if var6 ~= nil then (if var7 ~= nil then nil else var7.description) or "" else var6.description
	local var10 = if var6 == nil then if var4 ~= dataStatus.Ready then var4 == dataStatus.Failed else true else true
	local var11, var12 = reactModule.useBinding("")
	local var13, var14 = reactModule.useBinding("")
	local var15 = reactModule.useRef("")
	local var16 = reactModule.useRef("")
	local var17, var18 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var17 (ref), p1 (ref), var15 (ref), var8 (ref), var16 (ref), var9 (ref), var12 (ref), var14 (ref), var18 (ref)
		if var10 and var17 ~= p1.placeId then
			var15.current = var8
			var16.current = var9
			var12(var8)
			var14(var9)
			var18(p1.placeId)
			
			return
		end
	end, {
		var9,
		var8,
		var17,
		var10,
		p1.placeId
	})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), p1 (ref), var11 (ref), var13 (ref), var15 (ref), var16 (ref), var1 (ref)
		if var17 ~= p1.placeId then return end
		local value = var11:getValue()
		local value_1 = var13:getValue()
		
		if value == var15.current and value_1 == var16.current then
			return
		end
		var1.setDraft(p1.placeId, value, value_1)
		var15.current = value
		var16.current = value_1
	end, {
		var13,
		var17,
		p1.placeId,
		var11,
		var1
	})
	reactModule.useEffect(function()
		-- upvalues: var19 (ref)
		return var19
	end, { var19 })
	
	return {
		isReady = var17 == p1.placeId,
		onBack = reactModule.useCallback(function()
			-- upvalues: var19 (ref), p1 (ref)
			var19()
			p1.onBack()
		end, { p1.onBack, var19 }),
		onDescriptionChanged = var14,
		onFocusLost = var19,
		onTitleChanged = var12,
		titleText = var11,
		descriptionText = var13,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end