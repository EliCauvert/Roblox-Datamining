local appChat = script:FindFirstAncestor("AppChat")
local roactPaginator = require(appChat.SocialLibraries).RoactPaginator
local promiseModule = require(appChat.Parent.Promise)
local fetchConversationsByPageModule = require(appChat.Conversations.Thunks.fetchConversationsByPage)
local networkingChatModule = require(appChat.Http.NetworkingChat)
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)

return function(p0)
	-- upvalues: roactPaginator (ref), fetchConversationsByPageModule (ref), promiseModule (ref), networkingChatModule (ref), createConversationModule (ref)
	return {
		[roactPaginator.fetchInit] = function()
			-- upvalues: p0 (ref), fetchConversationsByPageModule (copy)
			return p0(fetchConversationsByPageModule())
		end,
		[roactPaginator.fetchWithCursor] = function(p1)
			-- upvalues: promiseModule (copy), p0 (ref), fetchConversationsByPageModule (copy)
			return promiseModule.new(function(p2)
				-- upvalues: p0 (copy), fetchConversationsByPageModule (copy), p1 (ref)
				coroutine.wrap(function()
					-- upvalues: p0 (copy), fetchConversationsByPageModule (copy), p1 (copy), p2 (ref)
					local var5, var6, var7 = p0(fetchConversationsByPageModule(p1)):await()
					
					if var5 then
						p2(var6, var7)
						
						return
					end
					p2(nil, p1)
				end)()
			end)
		end,
		startOneToOneConversation = function(p3)
			-- upvalues: p0 (ref), networkingChatModule (copy)
			return p0(networkingChatModule.StartOneToOneConversation.API(p3))
		end,
		createOneToOneConversation = function(p4)
			-- upvalues: p0 (ref), createConversationModule (copy)
			return p0(createConversationModule("one_to_one", { p4 }))
		end
	}
end