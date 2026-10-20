local AppChat = script:FindFirstAncestor("AppChat")
local RoactPaginator = require(AppChat.SocialLibraries).RoactPaginator
local PromiseModule = require(AppChat.Parent.Promise)
local FetchConversationsByPageModule = require(AppChat.Conversations.Thunks.fetchConversationsByPage)

return function(Callback)
	-- upvalues: RoactPaginator (copy), FetchConversationsByPageModule (copy), PromiseModule (copy)
	return {
		[RoactPaginator.fetchInit] = function()
			-- upvalues: Callback (copy), FetchConversationsByPageModule (upval)
			return Callback(FetchConversationsByPageModule())
		end,
		[RoactPaginator.fetchWithCursor] = function(p1)
			-- upvalues: PromiseModule (upval), Callback (copy), FetchConversationsByPageModule (upval)
			return PromiseModule.new(function(Callback1)
				-- upvalues: Callback (upval), FetchConversationsByPageModule (upval), p1 (copy)
				coroutine.wrap(function()
					-- upvalues: Callback (upval), FetchConversationsByPageModule (upval), p1 (upval), Callback1 (copy)
					local v1, v2, v3 = Callback(FetchConversationsByPageModule(p1)):await()
					
					if v1 then
						Callback1(v2, v3)
						
						return
					else
						Callback1(nil, p1)
					end
				end)()
			end)
		end
	}
end