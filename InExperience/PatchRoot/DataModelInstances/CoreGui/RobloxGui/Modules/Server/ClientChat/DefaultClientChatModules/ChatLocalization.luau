local localizationService = game:GetService("LocalizationService")
local chatService = game:GetService("Chat")
local t = {
	System = "InGame.Chat.Label.SystemMessagePrefix",
	Team = "InGame.Chat.Label.TeamMessagePrefix"
}
local t_1 = {
	["From(%s.+)"] = {
		English = "From",
		LocalizationKey = "InGame.Chat.Label.From"
	},
	["To(%s.+)"] = { English = "To", LocalizationKey = "InGame.Chat.Label.To" }
}

return {
	_hasFetchedLocalization = false,
	_getTranslator = function(p1)
		-- upvalues: chatService (ref), localizationService (ref)
		if not p1._translator and not p1._hasFetchedLocalization then
			p1._hasFetchedLocalization = true
			local chatLocalization = chatService:WaitForChild("ChatLocalization", 4)
			
			if chatLocalization then
				p1._translator = chatLocalization:GetTranslator(localizationService.RobloxLocaleId)
				localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
					-- upvalues: p1 (ref)
					p1._hasFetchedLocalization = false
					p1._translator = nil
				end)
			else
				warn("Missing ChatLocalization. Chat interface will not be localized.")
			end
		end
		return p1._translator
	end,
	Get = function(p1, p2, p3, p4)
		local var1 = p3
		pcall(function()
			-- upvalues: p1 (ref), var1 (write), p2 (ref), p4 (ref)
			local translator = p1:_getTranslator()
			
			if translator then
				var1 = translator:FormatByKey(p2, p4)
				
				return
			end
			warn("Missing Translator. Used default for", p2)
		end)
		
		return var1
	end,
	LocalizeFormattedMessage = function(p1, p2)
		local matchIndex, matchIndex_1 = string.find(p2, "{RBX_LOCALIZATION_KEY}")
		
		if not matchIndex then
			return p2
		end
		local matchIndex_2, matchIndex_3 = string.find(p2, "{RBX_LOCALIZATION_DEFAULT}")
		
		if not matchIndex_2 then
			return p2
		end
		local matchIndex_4, matchIndex_5 = string.find(p2, "{RBX_LOCALIZATION_PARAMS}")
		local substring = string.sub(p2, matchIndex_1 + 1, matchIndex_2 - 1)
		local _ = nil
		
		if not matchIndex_4 then
			return p1:Get(substring, string.sub(p2, matchIndex_3 + 1))
		end
		local substring_1 = string.sub(p2, matchIndex_3 + 1, matchIndex_4 - 1)
		local t = {}
		
		for i, v in string.gmatch(string.sub(p2, matchIndex_5 + 1), "([^%s]+)=([^%s]+)") do
			t[i] = v
		end
		return p1:Get(substring, substring_1, t)
	end,
	FormatMessageToSend = function(_, p3, p4, p5, p6)
		return if p5 and p6 then "{RBX_LOCALIZATION_KEY}" .. p7 .. "{RBX_LOCALIZATION_DEFAULT}" .. p8 .. "{RBX_LOCALIZATION_PARAMS}" .. p9 .. "=" .. p10 else "{RBX_LOCALIZATION_KEY}" .. p7 .. "{RBX_LOCALIZATION_DEFAULT}" .. p8
	end,
	tryLocalize = function(p3, p4)
		-- upvalues: t (ref), t_1 (ref)
		if t[p4] then
			return p3:Get(t[p4], p4)
		end
		for i, v in pairs(t) do
			if string.find(p4, i) then
				return string.gsub(p4, i, p3:Get(v, i), 1)
			end
		end
		for i, v_1 in pairs(t_1) do
			local matchIndex = string.find(p4, i)
			local match = string.match(p4, i)
			
			if matchIndex and match then
				return (if matchIndex > 1 then p4:sub(1, matchIndex - 1) else "") .. p11:Get(v_1.LocalizationKey, v_1.English) .. match
			end
		end
		return p4
	end
}