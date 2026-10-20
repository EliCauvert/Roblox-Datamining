local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetConversationSearchDataHydrationModule = require(AppChat.Stores.GetConversationSearchDataHydration)
local config = {
	query = "",
	status = "Idle",
	nextCursor = nil,
	items = {}
}
local config1 = { query = "", pages = {} }

local function normalizeQuery(Text: string, p1): string
	if not p1 or Text == nil then
		return ""
	end
	local Match: string = string.match(Text, "^%s*(.-)%s*$") or ""
	local Length: number = utf8.len(Match) or #Match
	
	if Length < 1 then
		return ""
	end
	if Length > 200 then
		local OffsetResult = utf8.offset(Match, 201)
		
		if OffsetResult ~= nil then
			return (string.sub(Match, 1, OffsetResult - 1))
		end
	end
	return Match
end

return function(p1, Enabled)
	-- upvalues: GetConversationSearchDataHydrationModule (copy), GetConversationStoreModule (copy), normalizeQuery (copy), ReactModule (copy), config1 (copy), SignalsReactModule (copy), SignalsModule (copy), config (copy)
	local IsEnabled = Enabled ~= false
	local ConversationSearchDataHydrationModule = GetConversationSearchDataHydrationModule(false)
	local ConversationStoreModule = GetConversationStoreModule(false)
	local NormalizeQueryResult = normalizeQuery(p1, IsEnabled)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	ReactModule.useEffect(function()
		-- upvalues: NormalizeQueryResult (copy), UseStateResult2 (copy)
		if NormalizeQueryResult == "" then
			UseStateResult2("")
			
			return
		end
		local DelayedThread = task.delay(0.15, function()
			-- upvalues: UseStateResult2 (upval), NormalizeQueryResult (upval)
			UseStateResult2(NormalizeQueryResult)
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { NormalizeQueryResult })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(config1)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ConversationSearchDataHydrationModule.getInvalidationGeneration)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult2_1 (copy), config1 (upval), ConversationSearchDataHydrationModule (copy)
		if UseStateResult == "" then
			UseStateResult2_1(config1)
			
			return
		end
		local Page = ConversationSearchDataHydrationModule.fetchPage(UseStateResult)
		
		if Page == nil then
			UseStateResult2_1({ query = UseStateResult, pages = {} })
			
			return
		else
			UseStateResult2_1({ query = UseStateResult, pages = { { result = Page } } })
		end
	end, { UseStateResult, ConversationSearchDataHydrationModule })
	local UseRefResult = ReactModule.useRef(UseSignalStateResult)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseSignalStateResult (copy), UseStateResult1 (copy), ConversationSearchDataHydrationModule (copy)
		if UseRefResult.current == UseSignalStateResult then return end
		UseRefResult.current = UseSignalStateResult
		
		for _, page in UseStateResult1.pages do
			ConversationSearchDataHydrationModule.fetchPage(UseStateResult1.query, page.cursor)
		end
	end, {
		UseStateResult1,
		ConversationSearchDataHydrationModule,
		UseSignalStateResult
	})
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), ConversationStoreModule (copy), UseStateResult1 (copy), config (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: ConversationStoreModule (upval), UseStateResult1 (upval), config (upval)
			local function collectItems(Pages)
				-- upvalues: p2 (copy), ConversationStoreModule (upval)
				local List = {}
				local t = {}
				
				for _, page in Pages do
					local DataResult = page.result.data(p2)
					
					if DataResult ~= nil and DataResult.matchedConversationIds ~= nil then
						for _, matchedConversationId in DataResult.matchedConversationIds do
							if not t[matchedConversationId] then
								t[matchedConversationId] = true
								table.insert(List, matchedConversationId)
							end
						end
					end
				end
				local Conversations = {}
				
				for _, value in List do
					local Conversation = ConversationStoreModule.getConversation(value, p2)
					
					if Conversation ~= nil then
						table.insert(Conversations, Conversation)
					end
				end
				return Conversations
			end
			
			local Pages = UseStateResult1.pages
			
			if UseStateResult1.query == "" or #Pages == 0 then
				return config
			else
				local Page = Pages[#Pages]
				local DataResult = Page.result.data(p2)
				
				return {
					query = UseStateResult1.query,
					items = collectItems(Pages),
					status = Page.result.status(p2),
					nextCursor = if DataResult == nil then nil else DataResult.nextCursor
				}
			end
		end)
	end, { UseStateResult1, ConversationStoreModule })))
	
	return {
		items = UseSignalStateResult1.items,
		status = UseSignalStateResult1.status,
		isActive = NormalizeQueryResult ~= "",
		debouncedQuery = UseStateResult,
		isFetching = UseSignalStateResult1.status == "NotReady",
		isAwaitingResults = NormalizeQueryResult ~= "" and (UseSignalStateResult1.query ~= NormalizeQueryResult or (UseSignalStateResult1.status == "NotReady" or UseSignalStateResult1.status == "Idle")),
		hasError = UseSignalStateResult1.status == "Failed",
		hasSearched = UseSignalStateResult1.query ~= "",
		nextCursor = UseSignalStateResult1.nextCursor,
		loadNext = ReactModule.useCallback(function()
			-- upvalues: UseStateResult1 (copy), ConversationSearchDataHydrationModule (copy), UseStateResult2_1 (copy)
			local Pages = UseStateResult1.pages
			local Page = Pages[#Pages]
			
			if Page == nil then return end
			if Page.result.status(false) ~= "Ready" then return end
			local DataResult = Page.result.data(false)
			local NextCursor = if DataResult == nil then nil else DataResult.nextCursor
			
			if NextCursor == nil then return end
			local Page1 = ConversationSearchDataHydrationModule.fetchPage(UseStateResult1.query, NextCursor)
			
			if Page1 ~= nil then
				UseStateResult2_1(function(p3)
					-- upvalues: UseStateResult1 (upval), Page1 (copy), NextCursor (copy)
					if p3.query == UseStateResult1.query then
						local Copy = table.clone(p3.pages)
						table.insert(Copy, { result = Page1, cursor = NextCursor })
						
						return { query = p3.query, pages = Copy }
					else
						return p3
					end
				end)
				
				return
			end
		end, { UseStateResult1, ConversationSearchDataHydrationModule })
	}
end