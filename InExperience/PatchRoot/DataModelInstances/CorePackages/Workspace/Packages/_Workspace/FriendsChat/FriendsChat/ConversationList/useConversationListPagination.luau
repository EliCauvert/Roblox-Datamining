local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local fetchConversationListPageToSignals = require(script.Parent.ExpChatConversationListAdapter).fetchConversationListPageToSignals
local name = require(parent.ExpChatShared).Logger:new(script.Name)

return function(p1, p2)
	-- upvalues: reactModule (ref), fetchConversationListPageToSignals (ref), name (ref)
	local var1 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), p2 (ref), fetchConversationListPageToSignals (copy), name (copy)
		if p1 and p2.isFetchingConversations ~= true then
			fetchConversationListPageToSignals():catch(function(p3)
				-- upvalues: name (copy)
				name:warning(`Failed to retry FriendsChat conversation list fetch: {tostring(p3)}`)
			end)
			
			return
		end
	end, { p1, p2.isFetchingConversations })
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), p2 (ref), fetchConversationListPageToSignals (copy), name (copy)
		if not p1 then return end
		if p2.isFetchingConversations == true or p2.isExhausted == true then return end
		local nextCursor = p2.nextCursor
		
		if nextCursor == nil or nextCursor == "" then
			return
		end
		fetchConversationListPageToSignals({ cursor = nextCursor }):catch(function(p3)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch next FriendsChat conversation list page: {tostring(p3)}`)
		end)
	end, {
		p1,
		p2.isFetchingConversations,
		p2.isExhausted,
		p2.nextCursor
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), fetchConversationListPageToSignals (copy), name (copy)
		if not p1 then
			return nil
		elseif p2.isFetchingConversations == true then
			return nil
		elseif p2.hasFetchedInitialPage == true or p2.error ~= nil then
			return nil
		end
		fetchConversationListPageToSignals():catch(function(p3)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch initial FriendsChat conversation list page: {tostring(p3)}`)
		end)
		
		return nil
	end, {
		p1,
		p2.error,
		p2.hasFetchedInitialPage,
		p2.isFetchingConversations
	})
	
	return { loadNext = var2, retryInitialFetch = var1 }
end