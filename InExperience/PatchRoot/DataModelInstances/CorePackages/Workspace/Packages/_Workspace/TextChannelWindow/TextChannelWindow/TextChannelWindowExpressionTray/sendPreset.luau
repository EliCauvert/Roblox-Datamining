local TextChatService = game:GetService("TextChatService")
local TextChannelWindow = script:FindFirstAncestor("TextChannelWindow")
local FFlagExpChatUniverseChatPresetEnabledModule = require(TextChannelWindow.Flags.FFlagExpChatUniverseChatPresetEnabled)
local LoggerModule = require(TextChannelWindow.Logger)

local function _() --[[ Line: 20 | Named "getRBXGeneralChannel" ]]
	-- upvalues: TextChatService (copy)
	local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return function(PresetId, TextChannel): string --[[ Line: 28 | Named "sendPreset" ]]
	-- upvalues: TextChatService (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy), LoggerModule (copy)
	local TextChannel1 = TextChannel
	
	if TextChannel1 ~= nil and TextChannel1.Name ~= "RBXGeneral" then
		local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
		TextChannel1 = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
	end
	if TextChannel1 then
		local Success, Result = pcall(function() --[[ Line: 49 ]]
			-- upvalues: TextChannel1 (ref), PresetId (copy)
			TextChannel1:SendPresetAsync(PresetId)
		end)
		
		if Success then
			return "Sent"
		else
			LoggerModule:warning("SendPresetAsync failed: {}", (tostring(Result)))
			
			return "SendFailed"
		end
	elseif not FFlagExpChatUniverseChatPresetEnabledModule then
		return "NoChannel"
	else
		local Success1, Result1 = pcall(function() --[[ Line: 39 ]]
			-- upvalues: TextChatService (upval), PresetId (copy)
			TextChatService:SendUniverseChatPresetAsync(PresetId)
		end)
		
		if Success1 then
			return "Sent"
		else
			LoggerModule:warning("SendUniverseChatPresetAsync failed: {}", (tostring(Result1)))
			
			return "SendFailed"
		end
	end
end