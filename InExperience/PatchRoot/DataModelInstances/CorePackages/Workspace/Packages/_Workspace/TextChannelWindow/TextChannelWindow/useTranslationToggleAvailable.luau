local textChatService = game:GetService("TextChatService")
local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

local function readAvailable()
	-- upvalues: textChatService (ref)
	return textChatService.ChatTranslationEnabled and textChatService.ChatTranslationToggleEnabled
end

return function()
	-- upvalues: reactModule (ref), readAvailable (ref), useEventConnection (ref), textChatService (ref)
	local var1, var2 = reactModule.useState(readAvailable)
	useEventConnection(textChatService.Changed, function(p1)
		-- upvalues: var2 (ref), textChatService (copy)
		if p1 == "ChatTranslationEnabled" or p1 == "ChatTranslationToggleEnabled" then
			var2(textChatService.ChatTranslationEnabled and textChatService.ChatTranslationToggleEnabled)
		end
	end)
	
	return var1
end