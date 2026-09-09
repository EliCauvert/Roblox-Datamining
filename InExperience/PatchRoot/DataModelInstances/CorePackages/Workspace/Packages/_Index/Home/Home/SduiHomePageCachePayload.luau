local parent = script:FindFirstAncestor("Home").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local homeOmniFeedCache = require(parent.DiscoveryUtils).HomeOmniFeedCache
local getSduiTemplateStore = require(parent.SduiSharedUtilities).getSduiTemplateStore
local fFlagSduiClientTemplateCache = require(parent.SharedFlags).FFlagSduiClientTemplateCache
local t = { universe = { "player_count" } }

local function _(p1)
	return table.clone(p1)
end

local _ = function(p1)
	local var1 = if p1 ~= nil then nil else p1.kind
	
	return if var1 == nil then nil else var1.value
end

local _ = function(p1, p2)
	local cloned = table.clone(p1)
	cloned.kind = { type = p1.kind.type, value = p2 }
	
	return cloned
end

local _ = function(p1)
	return type(p1) == "table" and type(p1.entry_map) == "table"
end

local function itemListFields(p1)
	local t = {}
	
	for i, v in p1 do
		if type(v) == "table" and #v > 0 and type(v[1]) == "table" then
			table.insert(t, i)
		end
	end
	table.sort(t)
	
	return t
end

local _ = function(p2)
	local poolId = p2.pool_id
	
	return if type(poolId) == "string" and poolId ~= "" then poolId else nil
end

local _ = function(p2, p3)
	local t = {}
	
	if p2 == nil then
		return t
	end
	for i = 1, math.min(#p2, p3) do
		t[i] = p2[i]
	end
	return t
end

local _ = function(p4, p5)
	local sortId = p5.sort_id
	
	if sortId == nil or sortId == "" then
		warn(`Home SDUI cache entry "{p9}" has no sort_id; using its identifier`)
		
		return p4
	end
	return tostring(sortId)
end

local function collectReferencedKeys(p4, p5)
	-- upvalues: collectReferencedKeys (ref)
	local var1 = type(p4)
	
	if var1 == "table" then
		for i, v in p4 do
			collectReferencedKeys(v, p5)
		end
		return
	elseif var1 == "string" or var1 == "number" then
		p5[tostring(p4)] = true
	end
end

local function filterOrder(p6, p7)
	local t = {}
	
	if p6 == nil then
		return t
	end
	for i, v in p6 do
		if p7[v] ~= nil then
			table.insert(t, v)
		end
	end
	return t
end

local function filterOrderMap(p8, p9)
	-- upvalues: filterOrder (ref)
	local t = {}
	
	if p8 == nil then
		return t
	end
	for i, v in p8 do
		local var2 = filterOrder(v.items, p9)
		
		if #var2 > 0 then
			local cloned = table.clone(v)
			cloned.items = var2
			t[i] = cloned
		end
	end
	return t
end

local function pruneFeed(p10, p11)
	-- upvalues: itemListFields (ref), filterOrder (ref), filterOrderMap (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	if p10.entry_order ~= nil then
		for i, v in p10.entry_order do
			if not t_3[v] then
				t_3[v] = true
				table.insert(t_2, v)
			end
		end
	end
	local t_4 = {}
	
	for i in p10.entry_map do
		if not t_3[i] then
			t_3[i] = true
			table.insert(t_4, i)
		end
	end
	table.sort(t_4)
	
	for i_1, v in t_4 do
		table.insert(t_2, v)
	end
	for i_2, v_1 in t_2 do
		local var3 = p10.entry_map[v_1]
		
		if var3 ~= nil then
			local inputData = var3.input_data
			local var4 = if inputData ~= nil then nil else inputData.kind
			local var5 = if var4 ~= nil then nil else var4.value
			
			if type(var5) == "table" then
				var4 = var5.pool_id
				inputData = if type(var4) == "string" and var4 ~= "" then var4 else nil
				var4 = itemListFields(var5)
				
				if inputData ~= nil or #var4 ~= 0 then
					local var6
					local sortId = var5.sort_id
					
					if sortId == nil or sortId == "" then
						warn(`Home SDUI cache entry "{v_1}" has no sort_id; using its identifier`)
						var6 = v_1
					else
						var6 = tostring(sortId)
					end
					local var7 = p11[var6]
					
					if var7 ~= nil then
						local items, maxValue, i_3
						local cloned = table.clone(var5)
						
						if inputData == nil then
							for items, maxValue in var4 do
								local var8
								local var9 = var5[maxValue]
								local maxValue_1 = math.max(var7.cap - var7.count, 0)
								i_3 = {}
								
								if var9 == nil then
									var8 = i_3
									var7.count += #var8
									cloned[maxValue] = var8
								end
								for i_5 = 1, math.min(#var9, maxValue_1) do
									i_3[i_5] = var9[i_5]
								end
								var8 = i_3
							end
							sortId = table.clone(var3)
							local inputData_1 = var3.input_data
							items = table.clone(inputData_1)
							items.kind = { type = inputData_1.kind.type, value = cloned }
							sortId.input_data = items
							t[v_1] = sortId
						else
							sortId = (p10.content_pools or {})[inputData]
							
							if sortId ~= nil then
								if t_1[inputData] == nil then
									local var10
									local cloned_1 = table.clone(sortId)
									items = sortId.items
									maxValue = math.max(var7.cap - var7.count, 0)
									local t_5 = {}
									
									if items == nil then
										var10 = t_5
									else
										for i_3 = 1, math.min(#items, maxValue) do
											t_5[i_3] = items[i_3]
										end
										var10 = t_5
									end
									cloned_1.items = var10
									var7.count += #cloned_1.items
									t_1[inputData] = cloned_1
								end
							end
						end
					end
				end
			end
		end
	end
	if next(t) == nil then
		return nil
	end
	local cloned = table.clone(p10)
	cloned.entry_map = t
	
	if p10.content_pools ~= nil then
		cloned.content_pools = t_1
	end
	if p10.entry_order ~= nil then
		cloned.entry_order = filterOrder(p10.entry_order, t)
	end
	if p10.entry_order_map ~= nil then
		cloned.entry_order_map = filterOrderMap(p10.entry_order_map, t)
	end
	return cloned
end

local function pruneHydration(p12, p13)
	-- upvalues: t (ref)
	if p12 == nil then
		return nil
	end
	local cloned = table.clone(p12)
	
	for i, v in p12 do
		if type(v) == "table" then
			local var11 = t[i]
			local t_1 = {}
			
			for i_1, v_1 in v do
				if type(v_1) == "table" and p13[tostring(i_1)] then
					local cloned_1 = table.clone(v_1)
					
					if var11 ~= nil then
						for i_2, v_2 in var11 do
							cloned_1[v_2] = nil
						end
					end
					t_1[i_1] = cloned_1
				end
			end
			cloned[i] = t_1
		end
	end
	return cloned
end

local function fillMissingTemplatesFromStore(p14)
	-- upvalues: fFlagSduiClientTemplateCache (ref), getSduiTemplateStore (ref), appPage (ref), parent (ref)
	if not fFlagSduiClientTemplateCache then return end
	local var12 = getSduiTemplateStore()
	local cachedRobloxComponentToTemplateId = var12.getCachedRobloxComponentToTemplateId(appPage.Home)
	
	if next(cachedRobloxComponentToTemplateId) == nil then return end
	local cloned = table.clone(p14.templates or {})
	local templateEntry = require(parent.ServiceContractsProto).apppageplatform.shared.template_entry.TemplateEntry
	
	for i, v in cachedRobloxComponentToTemplateId do
		if cloned[v] == nil then
			local template = var12.getTemplate(v)
			
			if template ~= nil then
				cloned[v] = templateEntry.new({ template = template, roblox_component = i })
			end
		end
	end
	p14.templates = cloned
end

return {
	buildSduiHomePageCachePayload = function(p15)
		-- upvalues: homeOmniFeedCache (ref), pruneFeed (ref), collectReferencedKeys (ref), pruneHydration (ref), fillMissingTemplatesFromStore (ref)
		local topicIdToNumCacheItems = homeOmniFeedCache.getTopicIdToNumCacheItems()
		local t = {}
		local t_1 = {}
		
		for i, v in p15.page_entries or {} do
			local inputData = v.input_data
			local var13 = if inputData ~= nil then nil else inputData.kind
			local var14 = if var13 ~= nil then nil else var13.value
			
			if type(var14) == "table" and type(var14.entry_map) == "table" then
				local var15 = pruneFeed(var14, topicIdToNumCacheItems)
				
				if var15 ~= nil then
					local cloned = table.clone(v)
					local inputData_1 = v.input_data
					local cloned_1 = table.clone(inputData_1)
					cloned_1.kind = { type = inputData_1.kind.type, value = var15 }
					cloned.input_data = cloned_1
					table.insert(t_1, cloned)
					collectReferencedKeys(cloned, t)
				end
			end
		end
		if #t_1 == 0 then
			return nil
		end
		local cloned = table.clone(p15)
		cloned.page_entries = t_1
		cloned.hydration_data = pruneHydration(p15.hydration_data, t)
		cloned.request_id = ""
		fillMissingTemplatesFromStore(cloned)
		
		return cloned
	end,
	serializeSduiHomePageCache = function(p16)
		-- upvalues: parent (ref)
		return require(parent.ServiceContractsProto).proto.json.serializeBuffer(p16:encode())
	end,
	deserializeSduiHomePageCache = function(p16)
		-- upvalues: parent (ref)
		if p16 == nil then
			return nil
		end
		local serviceContractsProtoModule = require(parent.ServiceContractsProto)
		
		return serviceContractsProtoModule.apppageplatform.home.home_page.HomePageResponse.decode(serviceContractsProtoModule.proto.json.deserializeBuffer(p16))
	end,
	getSduiHomePageItemsForSortId = function(p16)
		-- upvalues: homeOmniFeedCache (ref), parent (ref), itemListFields (ref)
		local var16
		local cachedSduiHomePageData = homeOmniFeedCache.getCachedSduiHomePageData()
		
		if cachedSduiHomePageData == nil then
			var16 = nil
		else
			local serviceContractsProtoModule = require(parent.ServiceContractsProto)
			var16 = serviceContractsProtoModule.apppageplatform.home.home_page.HomePageResponse.decode(serviceContractsProtoModule.proto.json.deserializeBuffer(cachedSduiHomePageData))
		end
		if var16 == nil then
			return nil
		end
		for i, v in var16.page_entries do
			local inputData = v.input_data
			local var17 = if inputData ~= nil then nil else inputData.kind
			local var18 = if var17 ~= nil then nil else var17.value
			
			if type(var18) == "table" and type(var18.entry_map) == "table" then
				for i_1, v_1 in var18.entry_map do
					local inputData_1 = v_1.input_data
					local var19 = if inputData_1 ~= nil then nil else inputData_1.kind
					local var20 = if var19 ~= nil then nil else var19.value
					
					if type(var20) == "table" then
						var19 = var20.pool_id
						inputData_1 = if type(var19) == "string" and var19 ~= "" then var19 else nil
						var19 = itemListFields(var20)
						
						if inputData_1 ~= nil or #var19 ~= 0 then
							local var21
							local sortId = var20.sort_id
							
							if sortId == nil or sortId == "" then
								warn(`Home SDUI cache entry "{i_1}" has no sort_id; using its identifier`)
								var21 = i_1
							else
								var21 = tostring(sortId)
							end
							if var21 == p16 then
								if inputData_1 == nil then
									return var20[var19[1]]
								end
								local t = {}
								
								for i_2, v_2 in ((var18.content_pools or {})[inputData_1] or {}).items or {} do
									local var22 = if v_2 ~= nil then nil else v_2.kind
									local var23 = if var22 ~= nil then nil else var22.value
									
									if var23 ~= nil then
										table.insert(t, var23)
									end
								end
								return t
							end
						end
					end
				end
			end
		end
		return nil
	end
}