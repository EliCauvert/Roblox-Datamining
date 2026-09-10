local home = script:FindFirstAncestor("Home")
local sduiSharedUtilitiesModule = require(home.Parent.SduiSharedUtilities)
local homeConstantsModule = require(home.HomeConstants)
local homeSortDetailConstantsModule = require(home.HomeSortDetailPage.HomeSortDetailConstants)
local isHomeSortDetailSortIncludedModule = require(home.HomeSortDetailPage.isHomeSortDetailSortIncluded)

local function _(p1)
	if typeof(p1) ~= "table" then
		return nil
	end
	local inputData = p1.input_data
	local var1 = if typeof(inputData) == "table" then inputData.kind else nil
	
	return if typeof(var1) == "table" and typeof(var1.value) == "table" then var1.value else nil
end

local _ = function(p1)
	local var1 = if typeof(p1) == "table" then p1.input_data else nil
	local var2 = if typeof(var1) == "table" then var1.kind else nil
	
	return if typeof(var2) == "table" and typeof(var2.type) == "string" then var2.type else nil
end

local _ = function(p1, p2)
	-- upvalues: isHomeSortDetailSortIncludedModule (ref)
	local var1, var2
	if typeof(p1) == "table" then
		local inputData = p1.input_data
		var2 = if typeof(inputData) == "table" then inputData.kind else nil
		var1 = if typeof(var2) == "table" and typeof(var2.value) == "table" then var2.value else nil
	else
		var1 = nil
	end
	local var3 = if var1 then tostring(var1.sort_id) else nil
	var2 = false
	
	if var3 ~= nil then
		var2 = false
		
		if var3 ~= "" then
			local var4 = var3
			local var5 = if typeof(p1) == "table" then p1.input_data else nil
			local var6 = if typeof(var5) == "table" then var5.kind else nil
			var2 = isHomeSortDetailSortIncludedModule(var4, if typeof(var6) == "table" and typeof(var6.type) == "string" then var6.type else nil) and var3 == p2
		end
	end
	return var2
end

local function findFeedEntry(p1, p2, p3, p4)
	-- upvalues: isHomeSortDetailSortIncludedModule (ref)
	local var1, var2
	if p4 ~= nil and p4 >= 1 and p4 % 1 == 0 then
		local var3
		local var4 = p1[p4]
		local var5 = if var4 ~= nil then nil else p2[var4]
		
		if typeof(var5) == "table" then
			local inputData = var5.input_data
			var1 = if typeof(inputData) == "table" then inputData.kind else nil
			var3 = if typeof(var1) == "table" and typeof(var1.value) == "table" then var1.value else nil
		else
			var3 = nil
		end
		local var6 = if var3 then tostring(var3.sort_id) else nil
		local var7 = false
		
		if var6 ~= nil then
			var7 = false
			
			if var6 ~= "" then
				local var8 = var6
				local var9 = if typeof(var5) == "table" then var5.input_data else nil
				var2 = if typeof(var9) == "table" then var9.kind else nil
				var7 = isHomeSortDetailSortIncludedModule(var8, if typeof(var2) == "table" and typeof(var2.type) == "string" then var2.type else nil) and var6 == p3
			end
		end
		if var7 then
			return var4, var5
		end
	end
	for i, v in p1 do
		local var10
		var1 = p2[v]
		
		if typeof(var1) == "table" then
			local inputData = var1.input_data
			var2 = if typeof(inputData) == "table" then inputData.kind else nil
			var10 = if typeof(var2) == "table" and typeof(var2.value) == "table" then var2.value else nil
		else
			var10 = nil
		end
		local var11 = if var10 then tostring(var10.sort_id) else nil
		local var12 = false
		
		if var11 ~= nil then
			var12 = false
			
			if var11 ~= "" then
				local var13 = var11
				local var14 = if typeof(var1) == "table" then var1.input_data else nil
				local var15 = if typeof(var14) == "table" then var14.kind else nil
				var12 = isHomeSortDetailSortIncludedModule(var13, if typeof(var15) == "table" and typeof(var15.type) == "string" then var15.type else nil) and var11 == p3
			end
		end
		if var12 then
			return v, var1
		end
	end
	return nil
end

local function selectHomeSortDetailFeedEntry(p5, p6, p7)
	-- upvalues: findFeedEntry (ref)
	if typeof(p5) ~= "table" then
		return nil
	end
	local entryOrder = p5.entry_order
	local entryMap = p5.entry_map
	
	if typeof(entryOrder) ~= "table" or typeof(entryMap) ~= "table" then
		return nil
	end
	local var16, var17 = findFeedEntry(entryOrder, entryMap, p6, p7)
	
	if var16 == nil or var17 == nil then
		return nil
	end
	local var18
	local robloxComponent = var17.roblox_component
	
	if typeof(robloxComponent) ~= "string" or robloxComponent == "" then
		return nil
	elseif typeof(var17) == "table" then
		local inputData = var17.input_data
		local var19 = if typeof(inputData) == "table" then inputData.kind else nil
		var18 = if typeof(var19) == "table" and typeof(var19.value) == "table" then var19.value else nil
	else
		var18 = nil
	end
	return if var18 == nil then nil else {
		identifier = var16,
		feedEntry = var17,
		inputData = var18,
		contentPools = p5.content_pools or {}
	}
end

local function buildVerticalFeedInputData(p5)
	-- upvalues: homeSortDetailConstantsModule (ref)
	local cloned = table.clone(p5.inputData)
	cloned.entry_order = {
		homeSortDetailConstantsModule.DropDownIdentifier,
		p5.identifier
	}
	cloned.entry_map = {
		[homeSortDetailConstantsModule.DropDownIdentifier] = {
			roblox_component = homeSortDetailConstantsModule.DropDownRobloxComponent
		},
		[p5.identifier] = p5.feedEntry
	}
	cloned.content_pools = p5.contentPools
	
	return cloned
end

local _ = function(p5, p6)
	-- upvalues: homeConstantsModule (ref)
	local inputData = p5.getInputData(homeConstantsModule.ConfigKey, homeConstantsModule.ContentIdentifier, p6)
	
	return if inputData == nil then p5.getInputData(homeConstantsModule.ConfigKey, nil, p6) else inputData
end

return function(p5, p6)
	-- upvalues: sduiSharedUtilitiesModule (ref), selectHomeSortDetailFeedEntry (ref), homeConstantsModule (ref), homeSortDetailConstantsModule (ref), buildVerticalFeedInputData (ref)
	if p5 == "" then
		return nil
	end
	local sduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore()
	local inputData = sduiApiStore.getInputData(homeConstantsModule.ConfigKey, homeConstantsModule.ContentIdentifier, nil)
	
	return if selectHomeSortDetailFeedEntry(if inputData ~= nil then sduiApiStore.getInputData(homeConstantsModule.ConfigKey, nil, nil) else inputData, p5, p6) == nil then nil else {
		robloxComponentType = homeSortDetailConstantsModule.RobloxComponent,
		identifier = homeSortDetailConstantsModule.Identifier,
		componentInputDataGetter = function(p7)
			-- upvalues: selectHomeSortDetailFeedEntry (copy), sduiApiStore (ref), homeConstantsModule (copy), p5 (ref), p6 (ref), buildVerticalFeedInputData (copy)
			local inputData = sduiApiStore.getInputData(homeConstantsModule.ConfigKey, homeConstantsModule.ContentIdentifier, p7)
			local var16 = selectHomeSortDetailFeedEntry(if inputData ~= nil then sduiApiStore.getInputData(homeConstantsModule.ConfigKey, nil, p7) else inputData, p5, p6)
			
			return if var16 then buildVerticalFeedInputData(var16) else {}
		end
	}
end