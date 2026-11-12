local TextChatService = game:GetService("TextChatService")
local TextChannelWindow = script:FindFirstAncestor("TextChannelWindow")
local IsDirectChatChannelModule = require(TextChannelWindow.isDirectChatChannel)
local FFlagExpChatUniverseChatPresetEnabledModule = require(TextChannelWindow.Flags.FFlagExpChatUniverseChatPresetEnabled)
local FFlagExpChatTextChannelWindowQuickWordsNonDirectModule = require(TextChannelWindow.Flags.FFlagExpChatTextChannelWindowQuickWordsNonDirect)
local LoggerModule = require(TextChannelWindow.Logger)

local function _()
	-- upvalues: TextChatService (copy)
	local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return function(PresetId, TextChannel): string
	-- upvalues: FFlagExpChatTextChannelWindowQuickWordsNonDirectModule (copy), IsDirectChatChannelModule (copy), TextChatService (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy), LoggerModule (copy)
	local TextChannel1 = TextChannel
	
	if not FFlagExpChatTextChannelWindowQuickWordsNonDirectModule then
		if TextChannel1 ~= nil and TextChannel1.Name ~= "RBXGeneral" then
			local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
			TextChannel1 = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
		end
	elseif TextChannel1 ~= nil and IsDirectChatChannelModule(TextChannel1) then
		return "DirectChat"
	end
	if TextChannel1 then
		local Success, Result = pcall(function()
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
		local Success1, Result1 = pcall(function()
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