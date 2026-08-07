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
	_getTranslator = function(p0) --[[ line: 27 ]]
		-- upvalues: chatService (ref), localizationService (ref)
		if not p0._translator and not p0._hasFetchedLocalization then
			p0._hasFetchedLocalization = true
			local chatLocalization = chatService:WaitForChild("ChatLocalization", 4)
			
			if chatLocalization then
				p0._translator = chatLocalization:GetTranslator(localizationService.RobloxLocaleId)
				localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ line: 35 ]]
					-- upvalues: p0 (ref)
					p0._hasFetchedLocalization = false
					p0._translator = nil
				end)
			else
				warn("Missing ChatLocalization. Chat interface will not be localized.")
			end
		end
		return p0._translator
	end,
	Get = function(p1, p2, p3, p4) --[[ line: 47 ]]
		local var5 = p3
		pcall(function() --[[ line: 49 ]]
			-- upvalues: p1 (ref), var5 (write), p2 (ref), p4 (ref)
			local translator = p1:_getTranslator()
			
			if translator then
				var5 = translator:FormatByKey(p2, p4)
				
				return
			end
			warn("Missing Translator. Used default for", p2)
		end)
		
		return var5
	end,
	LocalizeFormattedMessage = function(p5, p6) --[[ line: 60 ]]
		local matchIndex, matchIndex_1 = string.find(p6, "{RBX_LOCALIZATION_KEY}")
		
		if not matchIndex then
			return p6
		end
		local matchIndex_2, matchIndex_3 = string.find(p6, "{RBX_LOCALIZATION_DEFAULT}")
		
		if not matchIndex_2 then
			return p6
		end
		local matchIndex_4, matchIndex_5 = string.find(p6, "{RBX_LOCALIZATION_PARAMS}")
		local substring = string.sub(p6, matchIndex_1 + 1, matchIndex_2 - 1)
		local _ = nil
		
		if not matchIndex_4 then
			return p5:Get(substring, string.sub(p6, matchIndex_3 + 1))
		end
		local substring_1 = string.sub(p6, matchIndex_3 + 1, matchIndex_4 - 1)
		local t = {}
		
		for i, v in string.gmatch(string.sub(p6, matchIndex_5 + 1), "([^%s]+)=([^%s]+)") do
			t[i] = v
		end
		return p5:Get(substring, substring_1, t)
	end,
	FormatMessageToSend = function(_, p7, p8, p9, p10) --[[ line: 89 ]]
		return if p9 and p10 then "{RBX_LOCALIZATION_KEY}" .. p7 .. "{RBX_LOCALIZATION_DEFAULT}" .. p8 .. "{RBX_LOCALIZATION_PARAMS}" .. p9 .. "=" .. p10 else "{RBX_LOCALIZATION_KEY}" .. p7 .. "{RBX_LOCALIZATION_DEFAULT}" .. p8
	end,
	tryLocalize = function(p11, p12) --[[ line: 100 ]]
		-- upvalues: t (ref), t_1 (ref)
		if t[p12] then
			return p11:Get(t[p12], p12)
		end
		for i, v in pairs(t) do
			if string.find(p12, i) then
				return string.gsub(p12, i, p11:Get(v, i), 1)
			end
		end
		for i, v_1 in pairs(t_1) do
			local matchIndex = string.find(p12, i)
			local match = string.match(p12, i)
			
			if matchIndex and match then
				return (if matchIndex > 1 then p12:sub(1, matchIndex - 1) else "") .. p11:Get(v_1.LocalizationKey, v_1.English) .. match
			end
		end
		return p12
	end
}