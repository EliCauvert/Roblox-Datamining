local LlamaModule = require(script:FindFirstAncestor("FriendsRodux").Parent.llama)
local RemoveUserModule = require(script.Parent.removeUser)

return function(p1, p2)
	-- upvalues: LlamaModule (copy), RemoveUserModule (copy)
	local Text = tostring(p2.additionalData.currentUserId)
	local Text1 = tostring(p2.namedIds.users)
	local JoinResult = LlamaModule.Dictionary.join(p1, {
		[Text] = RemoveUserModule(p1[Text], Text1),
		[Text1] = RemoveUserModule(p1[Text1], Text)
	})
	JoinResult[Text1] = nil
	
	return JoinResult
end