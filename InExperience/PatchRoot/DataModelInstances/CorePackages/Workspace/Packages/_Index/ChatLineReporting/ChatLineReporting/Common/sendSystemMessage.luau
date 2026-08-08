local textChatService = game:GetService("TextChatService")
local constantsModule = require(script:FindFirstAncestor("ChatLineReporting").Common.Constants)

local function findTextChannel(p0) --[[ line: 8 ]]
	-- upvalues: textChatService (ref)
	local var3 = textChatService:FindFirstChild(p0, true)
	while not var3 do
		wait()
		var3 = textChatService:FindFirstChild(p0, true)
	end
	return var3
end

function sendSystemMessage(p1) --[[ line: 17 ]]
	-- upvalues: findTextChannel (ref), constantsModule (ref)
	if p1 then
		findTextChannel(constantsModule.ChannelTypes.System):DisplaySystemMessage(p1)
	end
end

return sendSystemMessage