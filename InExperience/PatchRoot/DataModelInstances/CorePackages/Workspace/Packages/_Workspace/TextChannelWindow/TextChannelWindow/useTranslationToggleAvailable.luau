local TextChatService = game:GetService("TextChatService")
local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection

local function readAvailable() --[[ Line: 12 ]]
	-- upvalues: TextChatService (copy)
	return TextChatService.ChatTranslationEnabled and TextChatService.ChatTranslationToggleEnabled
end

return function() --[[ Line: 16 | Named "useTranslationToggleAvailable" ]]
	-- upvalues: ReactModule (copy), readAvailable (copy), UseEventConnectionFunction (copy), TextChatService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(readAvailable)
	UseEventConnectionFunction(TextChatService.Changed, function(p1) --[[ Line: 19 ]]
		-- upvalues: UseStateResult2 (copy), TextChatService (upval)
		if p1 == "ChatTranslationEnabled" or p1 == "ChatTranslationToggleEnabled" then
			UseStateResult2(TextChatService.ChatTranslationEnabled and TextChatService.ChatTranslationToggleEnabled)
		end
	end)
	
	return UseStateResult
end