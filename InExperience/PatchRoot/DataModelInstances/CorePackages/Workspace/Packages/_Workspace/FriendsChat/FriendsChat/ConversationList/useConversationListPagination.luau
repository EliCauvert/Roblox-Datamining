local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local fetchConversationListPageToSignals = require(script.Parent.ExpChatConversationListAdapter).fetchConversationListPageToSignals
local name = require(parent.ExpChatShared).Logger:new(script.Name)

return function(p0, p1)
	-- upvalues: reactModule (ref), fetchConversationListPageToSignals (ref), name (ref)
	local var2 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), p1 (ref), fetchConversationListPageToSignals (copy), name (copy)
		if p0 and p1.isFetchingConversations ~= true then
			fetchConversationListPageToSignals():catch(function(p2)
				-- upvalues: name (copy)
				name:warning(`Failed to retry FriendsChat conversation list fetch: {tostring(p2)}`)
			end)
			
			return
		end
	end, { p0, p1.isFetchingConversations })
	local var3 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), p1 (ref), fetchConversationListPageToSignals (copy), name (copy)
		if not p0 then return end
		if p1.isFetchingConversations == true or p1.isExhausted == true then return end
		local nextCursor = p1.nextCursor
		
		if nextCursor == nil or nextCursor == "" then
			return
		end
		fetchConversationListPageToSignals({ cursor = nextCursor }):catch(function(p3)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch next FriendsChat conversation list page: {tostring(p3)}`)
		end)
	end, {
		p0,
		p1.isFetchingConversations,
		p1.isExhausted,
		p1.nextCursor
	})
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), p1 (ref), fetchConversationListPageToSignals (copy), name (copy)
		if not p0 then
			return nil
		elseif p1.isFetchingConversations == true then
			return nil
		elseif p1.hasFetchedInitialPage == true or p1.error ~= nil then
			return nil
		end
		fetchConversationListPageToSignals():catch(function(p4)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch initial FriendsChat conversation list page: {tostring(p4)}`)
		end)
		
		return nil
	end, {
		p0,
		p1.error,
		p1.hasFetchedInitialPage,
		p1.isFetchingConversations
	})
	
	return { loadNext = var3, retryInitialFetch = var2 }
end