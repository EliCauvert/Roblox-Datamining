local TextChatService = game:GetService("TextChatService")
local FFlagExpChatUniverseChatPresetEnabledModule = require(script:FindFirstAncestor("ExpChat").Flags.FFlagExpChatUniverseChatPresetEnabled)

local function _()
	-- upvalues: TextChatService (copy)
	local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return function(PresetId, TextChannel): string
	-- upvalues: TextChatService (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy)
	local TextChannel1 = TextChannel
	
	if TextChannel1 ~= nil and TextChannel1.Name ~= "RBXGeneral" then
		local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
		TextChannel1 = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
	end
	return if TextChannel1 then if pcall(function()
		-- upvalues: TextChannel1 (ref), PresetId (copy)
		TextChannel1:SendPresetAsync(PresetId)
	end) then "Sent" else "SendFailed" elseif FFlagExpChatUniverseChatPresetEnabledModule then if pcall(function()
		-- upvalues: TextChatService (upval), PresetId (copy)
		TextChatService:SendUniverseChatPresetAsync(PresetId)
	end) then "Sent" else "SendFailed" else "NoChannel"
end