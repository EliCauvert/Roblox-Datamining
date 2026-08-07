local parent = script:FindFirstAncestor("AppChat").Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local promiseModule = require(parent.Promise)
local processConversationsModule = require(script.Parent.processConversations)

return function(p0) --[[ line: 15 ]]
	-- upvalues: promiseModule (ref), appChatNetworkingModule (ref), cryoModule (ref), processConversationsModule (ref)
	return function(p1) --[[ line: 16 ]]
		-- upvalues: p0 (ref), promiseModule (copy), appChatNetworkingModule (copy), cryoModule (copy), processConversationsModule (copy)
		if not p0 or #p0 == 0 then
			return promiseModule.resolve({})
		end
		local t = {}
		local GET_CONVERSATIONS = appChatNetworkingModule.Constants.PageSize.GET_CONVERSATIONS
		
		for i = 1, #p0, GET_CONVERSATIONS do
			table.insert(t, p1:dispatch(appChatNetworkingModule.rodux.MultiGetConversationDetails.API(cryoModule.List.getRange(p0, i, i + GET_CONVERSATIONS - 1))))
		end
		return promiseModule.all(t):andThen(function(p3) --[[ line: 26 ]]
			-- upvalues: cryoModule (copy)
			return cryoModule.List.foldLeft(p3, function(p4, p5) --[[ line: 27 ]]
				-- upvalues: cryoModule (copy)
				local conversations = p5 and (p5.responseBody and p5.responseBody.conversations)
				
				return if conversations then cryoModule.List.join(p4, conversations) else p4
			end, {})
		end):tap(function(p2) --[[ line: 35 ]]
			-- upvalues: p1 (ref), processConversationsModule (copy)
			p1:dispatch(processConversationsModule(p2))
		end)
	end
end