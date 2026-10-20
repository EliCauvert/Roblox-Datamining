local Parent = script:FindFirstAncestor("AppChat").Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local ProcessConversationsModule = require(script.Parent.processConversations)

return function(p1)
	-- upvalues: PromiseModule (copy), AppChatNetworkingModule (copy), CryoModule (copy), ProcessConversationsModule (copy)
	return function(p2)
		-- upvalues: p1 (copy), PromiseModule (upval), AppChatNetworkingModule (upval), CryoModule (upval), ProcessConversationsModule (upval)
		if not p1 or #p1 == 0 then
			return PromiseModule.resolve({})
		end
		local DispatchResults = {}
		local GETCONVERSATIONS: number = AppChatNetworkingModule.Constants.PageSize.GET_CONVERSATIONS
		
		for i = 1, #p1, GETCONVERSATIONS do
			table.insert(DispatchResults, p2:dispatch(AppChatNetworkingModule.rodux.MultiGetConversationDetails.API((CryoModule.List.getRange(p1, i, i + GETCONVERSATIONS - 1)))))
		end
		return PromiseModule.all(DispatchResults):andThen(function(Result)
			-- upvalues: CryoModule (upval)
			return CryoModule.List.foldLeft(Result, function(p3, p4)
				-- upvalues: CryoModule (upval)
				local Conversations = p4 and (p4.responseBody and p4.responseBody.conversations)
				
				return if Conversations then CryoModule.List.join(p3, Conversations) else p3
			end, {})
		end):tap(function(p3)
			-- upvalues: p2 (copy), ProcessConversationsModule (upval)
			p2:dispatch(ProcessConversationsModule(p3))
		end)
	end
end