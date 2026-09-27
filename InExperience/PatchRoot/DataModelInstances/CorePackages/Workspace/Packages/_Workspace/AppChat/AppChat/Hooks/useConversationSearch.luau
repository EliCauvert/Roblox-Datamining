local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local getConversationSearchDataHydrationModule = require(appChat.Stores.GetConversationSearchDataHydration)
local t = {
	query = "",
	status = "Idle",
	nextCursor = nil,
	items = {}
}
local t_1 = { query = "", pages = {} }

local function normalizeQuery(p1, p2)
	if not p2 or p1 == nil then
		return ""
	end
	local var1 = string.match(p1, "^%s*(.-)%s*$") or ""
	local var2 = utf8.len(var1) or #var1
	
	if var2 < 1 then
		return ""
	elseif var2 > 200 then
		local byteOffset = utf8.offset(var1, 201)
		
		return if byteOffset == nil then var1 else string.sub(var1, 1, byteOffset - 1)
	end
end

return function(p1, p2)
	-- upvalues: getConversationSearchDataHydrationModule (ref), getConversationStoreModule (ref), normalizeQuery (ref), reactModule (ref), t_1 (ref), signalsModule (ref), t (ref), signalsReactModule (ref)
	local var1 = p2 ~= false
	local var2 = getConversationSearchDataHydrationModule(false)
	local var3 = getConversationStoreModule(false)
	local var4 = normalizeQuery(p1, var1)
	local var5, var6 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var6 (ref)
		if var4 == "" then
			var6("")
			
			return
		end
		local delayedThread = task.delay(0.15, function()
			-- upvalues: var6 (copy), var4 (copy)
			var6(var4)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var4 })
	local var7, var8 = reactModule.useState(t_1)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var8 (ref), t_1 (copy), var2 (ref)
		if var5 == "" then
			var8(t_1)
			
			return
		end
		local var9 = var2.fetchPage(var5)
		
		if var9 == nil then
			var8({ query = var5, pages = {} })
			
			return
		end
		var8({ query = var5, pages = { { result = var9 } } })
	end, { var5, var2 })
	local var9 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var3 (ref), var7 (ref), t (copy)
		return signalsModule.createComputed(function(p3)
			-- upvalues: var3 (copy), var7 (copy), t (copy)
			local function collectItems(p4)
				-- upvalues: p3 (ref), var3 (copy)
				local t = {}
				local t_1 = {}
				
				for i, v in p4 do
					local var10 = v.result.data(p3)
					
					if var10 ~= nil and var10.matchedConversationIds ~= nil then
						for i_1, v_1 in var10.matchedConversationIds do
							if not t_1[v_1] then
								t_1[v_1] = true
								table.insert(t, v_1)
							end
						end
					end
				end
				local t_2 = {}
				
				for i_1, v_1 in t do
					local conversation = var3.getConversation(v_1, p3)
					
					if conversation ~= nil then
						table.insert(t_2, conversation)
					end
				end
				return t_2
			end
			
			local pages = var7.pages
			
			if var7.query == "" or #pages == 0 then
				return t
			end
			local var11 = pages[#pages]
			local var12 = var11.result.data(p3)
			
			return {
				query = var7.query,
				items = collectItems(pages),
				status = var11.result.status(p3),
				nextCursor = if var12 ~= nil then nil else var12.nextCursor
			}
		end)
	end, { var7, var3 }))
	
	return {
		items = var9.items,
		status = var9.status,
		isActive = var4 ~= "",
		debouncedQuery = var5,
		isFetching = var9.status == "NotReady",
		isAwaitingResults = var4 ~= "" and (if var9.query == var4 then if var9.status ~= "NotReady" then var9.status == "Idle" else true else true),
		hasError = var9.status == "Failed",
		hasSearched = var9.query ~= "",
		nextCursor = var9.nextCursor,
		loadNext = reactModule.useCallback(function()
			-- upvalues: var7 (ref), var2 (ref), var8 (ref)
			local pages = var7.pages
			local var13 = pages[#pages]
			
			if var13 == nil then return end
			if var13.result.status(false) ~= "Ready" then return end
			local var14 = var13.result.data(false)
			local var15 = if var14 ~= nil then nil else var14.nextCursor
			
			if var15 == nil then return end
			local var16 = var2.fetchPage(var7.query, var15)
			
			if var16 == nil then
				return
			end
			var8(function(p5)
				-- upvalues: var7 (copy), var16 (ref)
				if p5.query == var7.query then
					local cloned = table.clone(p5.pages)
					table.insert(cloned, { result = var16 })
					
					return { query = p5.query, pages = cloned }
				end
				return p5
			end)
		end, { var7, var2 })
	}
end