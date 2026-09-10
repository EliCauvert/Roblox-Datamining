local textChatService = game:GetService("TextChatService")
local textChannelWindow = script:FindFirstAncestor("TextChannelWindow")
local fFlagExpChatUniverseChatPresetEnabledModule = require(textChannelWindow.Flags.FFlagExpChatUniverseChatPresetEnabled)
local loggerModule = require(textChannelWindow.Logger)

local function _()
	-- upvalues: textChatService (ref)
	local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return function(value, p1)
	-- upvalues: textChatService (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), loggerModule (ref)
	local ok
	local var1 = p1
	
	if var1 ~= nil and var1.Name ~= "RBXGeneral" then
		ok = textChatService:FindFirstChild("RBXGeneral", true)
		var1 = if ok and ok:IsA("TextChannel") then ok else nil
	end
	if var1 then
		ok, status = pcall(function()
			-- upvalues: var1 (write), value (ref)
			var1:SendPresetAsync(value)
		end)
		
		if ok then
			return "Sent"
		end
		loggerModule:warning("SendPresetAsync failed: {}", tostring(status))
		
		return "SendFailed"
	elseif not fFlagExpChatUniverseChatPresetEnabledModule then
		return "NoChannel"
	end
	ok, status = pcall(function()
		-- upvalues: textChatService (copy), value (ref)
		textChatService:SendUniverseChatPresetAsync(value)
	end)
	
	if ok then
		return "Sent"
	end
	loggerModule:warning("SendUniverseChatPresetAsync failed: {}", tostring(status))
	
	return "SendFailed"
end