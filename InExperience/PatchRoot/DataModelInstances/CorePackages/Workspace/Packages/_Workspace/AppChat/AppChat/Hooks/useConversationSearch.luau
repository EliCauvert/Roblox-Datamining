local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local getConversationSearchDataHydrationModule = require(appChat.Stores.GetConversationSearchDataHydration)
local t = {}
local t_1 = { query = "", pages = {} }

local function _(p1)
	for i, v in p1 do
		if v.result.data(false) ~= nil then
			return true
		end
	end
	return false
end

local function hasResolvedMatches(p2)
	for i, v in p2 do
		local var1 = v.result.data(false)
		
		if var1 ~= nil and var1.matchedConversationIds ~= nil and #var1.matchedConversationIds > 0 then
			return true
		end
	end
	return false
end

local function normalizeQuery(p3, p4)
	if not p4 or p3 == nil then
		return ""
	end
	local var2 = string.match(p3, "^%s*(.-)%s*$") or ""
	local var3 = utf8.len(var2) or #var2
	
	if var3 < 1 then
		return ""
	elseif var3 > 200 then
		local byteOffset = utf8.offset(var2, 201)
		
		return if byteOffset == nil then var2 else string.sub(var2, 1, byteOffset - 1)
	end
end

return function(p3, p4)
	-- upvalues: getConversationSearchDataHydrationModule (ref), getConversationStoreModule (ref), normalizeQuery (ref), reactModule (ref), t_1 (ref), hasResolvedMatches (ref), signalsModule (ref), t (ref), signalsReactModule (ref)
	local var2 = p4 ~= false
	local var3 = getConversationSearchDataHydrationModule(false)
	local var4 = getConversationStoreModule(false)
	local var5 = normalizeQuery(p3, var2)
	local var6, var7 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var7 (ref)
		if var5 == "" then
			var7("")
			
			return
		end
		local delayedThread = task.delay(0.15, function()
			-- upvalues: var7 (copy), var5 (copy)
			var7(var5)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var5 })
	local var8, var9 = reactModule.useState(t_1)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var9 (ref), t_1 (copy), var3 (ref), hasResolvedMatches (copy)
		if var6 == "" then
			var9(t_1)
			
			return
		end
		local var10 = var3.fetchPage(var6)
		
		if var10 == nil then
			var9({ query = var6, pages = {} })
			
			return
		end
		var9(function(p5)
			-- upvalues: var6 (copy), var10 (ref), hasResolvedMatches (copy)
			local pages
			local t = { query = var6, pages = { { result = var10 } } }
			
			if hasResolvedMatches(p5.pages) then
				pages = p5.pages
			else
				local var11
				for i, v in p5.pages do
					if v.result.data(false) ~= nil then
						var11 = true
						pages = if var11 then nil else p5.stalePages
					end
				end
				var11 = false
			end
			t.stalePages = pages
			
			return t
		end)
	end, { var6, var3 })
	local var11 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var8 (ref)
		return signalsModule.createComputed(function(p5)
			-- upvalues: var8 (copy)
			local pages = var8.pages
			
			if var8.query == "" or #pages == 0 then
				return { status = "Idle", nextCursor = nil }
			end
			local var12 = pages[#pages]
			local var13 = var12.result.data(p5)
			
			return {
				status = var12.result.status(p5),
				nextCursor = if var13 ~= nil then nil else var13.nextCursor
			}
		end)
	end, { var8 }))
	
	return {
		items = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var4 (ref), var8 (ref), t (copy)
			return signalsModule.createComputed(function(p5)
				-- upvalues: var4 (copy), var8 (copy), t (copy)
				local function collectItems(p6)
					-- upvalues: p5 (ref), var4 (copy)
					local t = {}
					local t_1 = {}
					
					for i, v in p6 do
						local var12 = v.result.data(p5)
						
						if var12 ~= nil and var12.matchedConversationIds ~= nil then
							for i_1, v_1 in var12.matchedConversationIds do
								if not t_1[v_1] then
									t_1[v_1] = true
									table.insert(t, v_1)
								end
							end
						end
					end
					local t_2 = {}
					
					for i_1, v_1 in t do
						local conversation = var4.getConversation(v_1, p5)
						
						if conversation ~= nil then
							table.insert(t_2, conversation)
						end
					end
					return t_2
				end
				
				local pages = var8.pages
				
				if #pages == 0 then
					return t
				end
				local var13 = collectItems(pages)
				
				if #var13 > 0 then
					return var13
				end
				local stalePages = var8.stalePages
				
				return if stalePages == nil or pages[#pages].result.status(p5) ~= "NotReady" then var13 else collectItems(stalePages)
			end)
		end, { var8, var4 })),
		status = var11.status,
		isActive = var5 ~= "",
		isFetching = var11.status == "NotReady",
		hasError = var11.status == "Failed",
		hasSearched = var8.query ~= "",
		nextCursor = var11.nextCursor,
		loadNext = reactModule.useCallback(function()
			-- upvalues: var8 (ref), var3 (ref), var9 (ref)
			local pages = var8.pages
			local var14 = pages[#pages]
			
			if var14 == nil then return end
			if var14.result.status(false) ~= "Ready" then return end
			local var15 = var14.result.data(false)
			local var16 = if var15 ~= nil then nil else var15.nextCursor
			
			if var16 == nil then return end
			local var17 = var3.fetchPage(var8.query, var16)
			
			if var17 == nil then
				return
			end
			var9(function(p7)
				-- upvalues: var8 (copy), var17 (ref)
				if p7.query == var8.query then
					local cloned = table.clone(p7.pages)
					table.insert(cloned, { result = var17 })
					
					return {
						query = p7.query,
						pages = cloned,
						stalePages = p7.stalePages
					}
				end
				return p7
			end)
		end, { var8, var3 })
	}
end