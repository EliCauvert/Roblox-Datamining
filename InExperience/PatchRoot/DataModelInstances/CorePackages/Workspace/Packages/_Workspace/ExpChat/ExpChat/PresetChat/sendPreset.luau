local textChatService = game:GetService("TextChatService")
local fFlagExpChatUniverseChatPresetEnabledModule = require(script:FindFirstAncestor("ExpChat").Flags.FFlagExpChatUniverseChatPresetEnabled)

local function _()
	-- upvalues: textChatService (ref)
	local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return function(value, p1)
	-- upvalues: textChatService (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref)
	local var1 = p1
	
	if var1 ~= nil and var1.Name ~= "RBXGeneral" then
		local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
		var1 = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
	end
	return if var1 then if pcall(function()
		-- upvalues: var1 (write), value (ref)
		var1:SendPresetAsync(value)
	end) then "Sent" else "SendFailed" elseif fFlagExpChatUniverseChatPresetEnabledModule then if pcall(function()
		-- upvalues: textChatService (copy), value (ref)
		textChatService:SendUniverseChatPresetAsync(value)
	end) then "Sent" else "SendFailed" else "NoChannel"
end