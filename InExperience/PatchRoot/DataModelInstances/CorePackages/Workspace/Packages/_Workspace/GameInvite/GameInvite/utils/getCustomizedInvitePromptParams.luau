local getCustomizedInvitePromptUserIdModule = require(script.Parent.getCustomizedInvitePromptUserId)
local _ = require(script:FindFirstAncestor("GameInvite").gameInviteModalType)

return function(p0, p1, p2) --[[ line: 8 ]]
	-- upvalues: getCustomizedInvitePromptUserIdModule (ref)
	local var1 = getCustomizedInvitePromptUserIdModule(p0)
	local var2, var3 = p2(p1, var1)
	
	if not var2 then
		return nil
	end
	local t = { trigger = p1 }
	
	if var3 and p0 then
		if p0.InviteMessageId ~= "" then
			t.inviteMessageId = p0.InviteMessageId
		end
		if var1 then
			t.inviteUserId = var1
		end
		if p0.PromptMessage ~= "" then
			t.promptMessage = p0.PromptMessage
		end
		if p0.LaunchData ~= "" then
			t.launchData = p0.LaunchData
		end
	end
	return t
end