local LocalizationService = game:GetService("LocalizationService")
local Chat = game:GetService("Chat")
local config = {
	System = "InGame.Chat.Label.SystemMessagePrefix",
	Team = "InGame.Chat.Label.TeamMessagePrefix"
}
local config1 = {
	["From(%s.+)"] = {
		English = "From",
		LocalizationKey = "InGame.Chat.Label.From"
	},
	["To(%s.+)"] = { English = "To", LocalizationKey = "InGame.Chat.Label.To" }
}

return {
	_hasFetchedLocalization = false,
	_getTranslator = function(p1)
		-- upvalues: Chat (copy), LocalizationService (copy)
		if not p1._translator and not p1._hasFetchedLocalization then
			p1._hasFetchedLocalization = true
			local ChatLocalization = Chat:WaitForChild("ChatLocalization", 4)
			
			if ChatLocalization then
				p1._translator = ChatLocalization:GetTranslator(LocalizationService.RobloxLocaleId)
				LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
					-- upvalues: p1 (copy)
					p1._hasFetchedLocalization = false
					p1._translator = nil
				end)
			else
				warn("Missing ChatLocalization. Chat interface will not be localized.")
			end
		end
		return p1._translator
	end,
	Get = function(p1, Segment, Segment1, p2)
		local FormatByKeyResult = Segment1
		pcall(function()
			-- upvalues: p1 (copy), FormatByKeyResult (ref), Segment (copy), p2 (copy)
			local Translator = p1:_getTranslator()
			
			if Translator then
				FormatByKeyResult = Translator:FormatByKey(Segment, p2)
				
				return
			else
				warn("Missing Translator. Used default for", Segment)
			end
		end)
		
		return FormatByKeyResult
	end,
	LocalizeFormattedMessage = function(p1, Text: string)
		local StartIndex, EndIndex = string.find(Text, "{RBX_LOCALIZATION_KEY}")
		
		if not StartIndex then
			return Text
		end
		local StartIndex1, EndIndex1 = string.find(Text, "{RBX_LOCALIZATION_DEFAULT}")
		
		if not StartIndex1 then
			return Text
		end
		local StartIndex2, EndIndex2 = string.find(Text, "{RBX_LOCALIZATION_PARAMS}")
		local Segment = string.sub(Text, EndIndex + 1, StartIndex1 - 1)
		
		if not StartIndex2 then
			return p1:Get(Segment, (string.sub(Text, EndIndex1 + 1)))
		end
		local Segment1 = string.sub(Text, EndIndex1 + 1, StartIndex2 - 1)
		local t = {}
		
		for i, value in string.gmatch(string.sub(Text, EndIndex2 + 1), "([^%s]+)=([^%s]+)") do
			t[i] = value
		end
		return p1:Get(Segment, Segment1, t)
	end,
	FormatMessageToSend = function(_, Text, Text1, Text2, Text3): string
		return if Text2 and Text3 then "{RBX_LOCALIZATION_KEY}" .. Text .. "{RBX_LOCALIZATION_DEFAULT}" .. Text1 .. "{RBX_LOCALIZATION_PARAMS}" .. Text2 .. "=" .. Text3 else "{RBX_LOCALIZATION_KEY}" .. Text .. "{RBX_LOCALIZATION_DEFAULT}" .. Text1
	end,
	tryLocalize = function(p2, Text: string)
		-- upvalues: config (copy), config1 (copy)
		if config[Text] then
			return p2:Get(config[Text], Text)
		end
		for Pattern, value in pairs(config) do
			if string.find(Text, Pattern) then
				return string.gsub(Text, Pattern, p2:Get(value, Pattern), 1)
			end
		end
		local FoundAt = nil
		local Match = nil
		for Pattern1, value1 in pairs(config1) do
			FoundAt = string.find(Text, Pattern1)
			Match = string.match(Text, Pattern1)
			
			if FoundAt and Match then
				return (if FoundAt > 1 then Text:sub(1, FoundAt - 1) else "") .. p2:Get(value1.LocalizationKey, value1.English) .. Match
			end
		end
		return Text
	end
}