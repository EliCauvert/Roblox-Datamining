local TextChatService = game:GetService("TextChatService")
local ConstantsModule = require(script:FindFirstAncestor("ChatLineReporting").Common.Constants)

local function findTextChannel(ChildName)
	-- upvalues: TextChatService (copy)
	local ChildName1 = TextChatService:FindFirstChild(ChildName, true)
	while not ChildName1 do
		wait()
		ChildName1 = TextChatService:FindFirstChild(ChildName, true)
	end
	return ChildName1
end

function sendSystemMessage(SystemMessage)
	-- upvalues: findTextChannel (copy), ConstantsModule (copy)
	if SystemMessage then
		findTextChannel(ConstantsModule.ChannelTypes.System):DisplaySystemMessage(SystemMessage)
	end
end

return sendSystemMessage