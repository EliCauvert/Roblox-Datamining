local AppChat = script:FindFirstAncestor("AppChat")
local RoactPaginator = require(AppChat.SocialLibraries).RoactPaginator
local PromiseModule = require(AppChat.Parent.Promise)
local FetchConversationsByPageModule = require(AppChat.Conversations.Thunks.fetchConversationsByPage)
local NetworkingChatModule = require(AppChat.Http.NetworkingChat)
local CreateConversationModule = require(AppChat.Conversations.Thunks.createConversation)

return function(Callback) --[[ Line: 11 ]]
	-- upvalues: RoactPaginator (copy), FetchConversationsByPageModule (copy), PromiseModule (copy), NetworkingChatModule (copy), CreateConversationModule (copy)
	return {
		[RoactPaginator.fetchInit] = function() --[[ Line: 13 ]]
			-- upvalues: Callback (copy), FetchConversationsByPageModule (upval)
			return Callback(FetchConversationsByPageModule())
		end,
		[RoactPaginator.fetchWithCursor] = function(p1) --[[ Line: 17 ]]
			-- upvalues: PromiseModule (upval), Callback (copy), FetchConversationsByPageModule (upval)
			return PromiseModule.new(function(Callback1) --[[ Line: 18 ]]
				-- upvalues: Callback (upval), FetchConversationsByPageModule (upval), p1 (copy)
				coroutine.wrap(function() --[[ Line: 19 ]]
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
		end,
		startOneToOneConversation = function(p1) --[[ Line: 30 ]]
			-- upvalues: Callback (copy), NetworkingChatModule (upval)
			return Callback(NetworkingChatModule.StartOneToOneConversation.API(p1))
		end,
		createOneToOneConversation = function(p1) --[[ Line: 34 ]]
			-- upvalues: Callback (copy), CreateConversationModule (upval)
			return Callback(CreateConversationModule("one_to_one", { p1 }))
		end
	}
end