local TextChatService = game:GetService("TextChatService")
local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local GameSettings = if require(Parent.SharedFlags).FFlagChatTranslationReadsUserGameSettings then UserSettings().GameSettings else TextChatService

local function readAvailable()
	-- upvalues: GameSettings (copy)
	return GameSettings.ChatTranslationEnabled and GameSettings.ChatTranslationToggleEnabled
end

return function()
	-- upvalues: ReactModule (copy), readAvailable (copy), UseEventConnectionFunction (copy), GameSettings (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(readAvailable)
	UseEventConnectionFunction(GameSettings.Changed, function(p1)
		-- upvalues: UseStateResult2 (copy), GameSettings (upval)
		if p1 == "ChatTranslationEnabled" or p1 == "ChatTranslationToggleEnabled" then
			UseStateResult2(GameSettings.ChatTranslationEnabled and GameSettings.ChatTranslationToggleEnabled)
		end
	end)
	
	return UseStateResult
end