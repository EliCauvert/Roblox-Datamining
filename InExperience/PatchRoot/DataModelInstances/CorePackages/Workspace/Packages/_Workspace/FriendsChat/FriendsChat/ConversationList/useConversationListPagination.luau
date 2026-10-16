local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local FetchConversationListPageToSignalsFunction = require(script.Parent.ExpChatConversationListAdapter).fetchConversationListPageToSignals
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)

return function(p1, p2) --[[ Line: 22 | Named "useConversationListPagination" ]]
	-- upvalues: ReactModule (copy), FetchConversationListPageToSignalsFunction (copy), NewResult (copy)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 24 ]]
		-- upvalues: p1 (copy), p2 (copy), FetchConversationListPageToSignalsFunction (upval), NewResult (upval)
		if p1 and p2.isFetchingConversations ~= true then
			FetchConversationListPageToSignalsFunction():catch(function(Err) --[[ Line: 29 ]]
				-- upvalues: NewResult (upval)
				NewResult:warning(`Failed to retry FriendsChat conversation list fetch: {tostring(Err)}`)
			end)
			
			return
		end
	end, { p1, p2.isFetchingConversations })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 40 ]]
		-- upvalues: p1 (copy), p2 (copy), FetchConversationListPageToSignalsFunction (upval), NewResult (upval)
		if not p1 then return end
		if p2.isFetchingConversations == true or p2.isExhausted == true then return end
		local NextCursor = p2.nextCursor
		
		if NextCursor ~= nil and NextCursor ~= "" then
			FetchConversationListPageToSignalsFunction({ cursor = NextCursor }):catch(function(Err) --[[ Line: 54 ]]
				-- upvalues: NewResult (upval)
				NewResult:warning(`Failed to fetch next FriendsChat conversation list page: {tostring(Err)}`)
			end)
			
			return
		end
	end, {
		p1,
		p2.isFetchingConversations,
		p2.isExhausted,
		p2.nextCursor
	})
	ReactModule.useEffect(function() --[[ Line: 67 ]]
		-- upvalues: p1 (copy), p2 (copy), FetchConversationListPageToSignalsFunction (upval), NewResult (upval)
		if not p1 then
			return nil
		elseif p2.isFetchingConversations == true then
			return nil
		elseif p2.hasFetchedInitialPage == true or p2.error ~= nil then
			return nil
		else
			FetchConversationListPageToSignalsFunction():catch(function(Err) --[[ Line: 78 ]]
				-- upvalues: NewResult (upval)
				NewResult:warning(`Failed to fetch initial FriendsChat conversation list page: {tostring(Err)}`)
			end)
			
			return nil
		end
	end, {
		p1,
		p2.error,
		p2.hasFetchedInitialPage,
		p2.isFetchingConversations
	})
	
	return { loadNext = UseResult1, retryInitialFetch = UseResult }
end