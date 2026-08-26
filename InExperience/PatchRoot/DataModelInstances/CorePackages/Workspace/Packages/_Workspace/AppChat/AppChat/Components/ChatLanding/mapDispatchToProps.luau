local appChat = script:FindFirstAncestor("AppChat")
local roactPaginator = require(appChat.SocialLibraries).RoactPaginator
local promiseModule = require(appChat.Parent.Promise)
local fetchConversationsByPageModule = require(appChat.Conversations.Thunks.fetchConversationsByPage)
local networkingChatModule = require(appChat.Http.NetworkingChat)
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)

return function(p1)
	-- upvalues: roactPaginator (ref), fetchConversationsByPageModule (ref), promiseModule (ref), networkingChatModule (ref), createConversationModule (ref)
	return {
		[roactPaginator.fetchInit] = function()
			-- upvalues: p1 (ref), fetchConversationsByPageModule (copy)
			return p1(fetchConversationsByPageModule())
		end,
		[roactPaginator.fetchWithCursor] = function(p2)
			-- upvalues: promiseModule (copy), p1 (ref), fetchConversationsByPageModule (copy)
			return promiseModule.new(function(p3)
				-- upvalues: p1 (copy), fetchConversationsByPageModule (copy), p2 (ref)
				coroutine.wrap(function()
					-- upvalues: p1 (copy), fetchConversationsByPageModule (copy), p2 (copy), p3 (ref)
					local var1, var2, var3 = p1(fetchConversationsByPageModule(p2)):await()
					
					if var1 then
						p3(var2, var3)
						
						return
					end
					p3(nil, p2)
				end)()
			end)
		end,
		startOneToOneConversation = function(p2)
			-- upvalues: p1 (ref), networkingChatModule (copy)
			return p1(networkingChatModule.StartOneToOneConversation.API(p2))
		end,
		createOneToOneConversation = function(p2)
			-- upvalues: p1 (ref), createConversationModule (copy)
			return p1(createConversationModule("one_to_one", { p2 }))
		end
	}
end