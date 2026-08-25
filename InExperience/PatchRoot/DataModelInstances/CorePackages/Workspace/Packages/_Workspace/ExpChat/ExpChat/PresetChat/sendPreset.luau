local textChatService = game:GetService("TextChatService")
local fFlagExpChatUniverseChatPresetEnabledModule = require(script:FindFirstAncestor("ExpChat").Flags.FFlagExpChatUniverseChatPresetEnabled)

local function _()
	-- upvalues: textChatService (ref)
	local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return function(value, p0)
	-- upvalues: textChatService (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref)
	local var3 = p0
	
	if var3 ~= nil and var3.Name ~= "RBXGeneral" then
		local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
		var3 = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
	end
	return if var3 then if pcall(function()
		-- upvalues: var3 (write), value (ref)
		var3:SendPresetAsync(value)
	end) then "Sent" else "SendFailed" elseif fFlagExpChatUniverseChatPresetEnabledModule then if pcall(function()
		-- upvalues: textChatService (copy), value (ref)
		textChatService:SendUniverseChatPresetAsync(value)
	end) then "Sent" else "SendFailed" else "NoChannel"
end