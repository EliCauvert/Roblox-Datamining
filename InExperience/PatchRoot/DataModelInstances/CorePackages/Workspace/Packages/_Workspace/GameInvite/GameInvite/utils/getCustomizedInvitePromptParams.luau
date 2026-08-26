local getCustomizedInvitePromptUserIdModule = require(script.Parent.getCustomizedInvitePromptUserId)
local _ = require(script:FindFirstAncestor("GameInvite").gameInviteModalType)

return function(p1, p2, p3)
	-- upvalues: getCustomizedInvitePromptUserIdModule (ref)
	local var1 = getCustomizedInvitePromptUserIdModule(p1)
	local var2, var3 = p3(p2, var1)
	
	if not var2 then
		return nil
	end
	local t = { trigger = p2 }
	
	if var3 and p1 then
		if p1.InviteMessageId ~= "" then
			t.inviteMessageId = p1.InviteMessageId
		end
		if var1 then
			t.inviteUserId = var1
		end
		if p1.PromptMessage ~= "" then
			t.promptMessage = p1.PromptMessage
		end
		if p1.LaunchData ~= "" then
			t.launchData = p1.LaunchData
		end
	end
	return t
end