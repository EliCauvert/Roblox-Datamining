local textChatService = game:GetService("TextChatService")
local constantsModule = require(script:FindFirstAncestor("ChatLineReporting").Common.Constants)

local function findTextChannel(p1)
	-- upvalues: textChatService (ref)
	local var1 = textChatService:FindFirstChild(p1, true)
	while not var1 do
		wait()
		var1 = textChatService:FindFirstChild(p1, true)
	end
	return var1
end

function sendSystemMessage(p2)
	-- upvalues: findTextChannel (ref), constantsModule (ref)
	if p2 then
		findTextChannel(constantsModule.ChannelTypes.System):DisplaySystemMessage(p2)
	end
end

return sendSystemMessage