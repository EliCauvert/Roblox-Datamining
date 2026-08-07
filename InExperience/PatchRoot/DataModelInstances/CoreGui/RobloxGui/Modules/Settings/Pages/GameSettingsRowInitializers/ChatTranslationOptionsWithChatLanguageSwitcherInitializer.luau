local textChatService = game:GetService("TextChatService")
local httpService = game:GetService("HttpService")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local gameSettings = UserSettings().GameSettings
local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local fixChatLanguageSwitcherLabel = game:DefineFastFlag("FixChatLanguageSwitcherLabel", false)
local getFStringChatTranslationEnabledLocalesModule = require(robloxGui.Modules.Flags.GetFStringChatTranslationEnabledLocales)
local textChatServiceSettingsSavedEngineFeature = game:GetEngineFeature("TextChatServiceSettingsSaved")
local var11 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")

return function(p0, p1, p2) --[[ line: 29 ]]
	-- upvalues: url (ref), playersService (ref), httpService (ref), name (ref), fixChatLanguageSwitcherLabel (ref), utilityModule (ref), robloxTranslatorModule (ref), var11 (ref), gameSettings (ref), localPlayer (ref), textChatService (ref), textChatServiceSettingsSavedEngineFeature (ref), getFStringChatTranslationEnabledLocalesModule (ref)
	local t = { [1] = "en_us" }
	local t_1 = { en_us = 1 }
	local list = { "English" }
	local text = url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", playersService.LocalPlayer.LocaleId:gsub("-", "_"))
	
	local function localeCodeToLanguageCodeMappingCallback(p3, p4) --[[ line: 53 ]]
		-- upvalues: name (copy), fixChatLanguageSwitcherLabel (copy), p0 (ref), utilityModule (copy), robloxTranslatorModule (copy), var11 (copy), p1 (ref), gameSettings (copy), t (ref), localPlayer (copy), textChatService (copy), list (ref), p2 (ref), textChatServiceSettingsSavedEngineFeature (copy)
		if not p3 then
			if p4 == nil then
				p4 = "Locales call did not set error message to non-nil value"
			end
			name:warning("GameSettings chat language selector initialization failed to get all required information; defaulting to unavailable for the remainder of this session. Error message: " .. p4)
			
			if fixChatLanguageSwitcherLabel then
				local var17 = p0
				local var18 = p0
				local var19 = p0
				local var20, var21, var22 = utilityModule:AddNewRow(p0, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Chat.ChatLanguageSelectionLabel"), "DropDown", { var11 }, 1)
				var17.ChatLanguageSelectorFrame = var20
				var18.ChatLanguageSelectorLabel = var21
				var19.ChatLanguageSelectorMode = var22
			else
				local var23 = p0
				local var24 = p0
				local var25 = p0
				local var26, var27, var28 = utilityModule:AddNewRow(p0, "Chat Language", "DropDown", { var11 }, 1)
				var23.ChatLanguageSelectorFrame = var26
				var24.ChatLanguageSelectorLabel = var27
				var25.ChatLanguageSelectorMode = var28
			end
			p0.ChatLanguageSelectorFrame.LayoutOrder = p1.ChatLanguageSelectorFrame
		end
		local var29 = nil
		local chatTranslationLocale = gameSettings.ChatTranslationLocale
		
		if chatTranslationLocale ~= "" then
			for i, v in t do
				if v == chatTranslationLocale then
					var29 = i
				end
			end
		end
		if chatTranslationLocale == "" or var29 == nil then
			for i, v in t do
				if v == localPlayer.LocaleId:gsub("-", "_") then
					var29 = i
					textChatService.ChatTranslationEnabled = true
				end
			end
		end
		if var29 == nil then
			textChatService.ChatTranslationEnabled = false
			var29 = 1
		else
			gameSettings.ChatTranslationLocale = t[var29]
		end
		localPlayer:SetChatTranslationSettingsLocaleId(t[var29])
		local var30 = t[var29]
		
		if fixChatLanguageSwitcherLabel then
			local var31 = p0
			local var32 = p0
			local var33 = p0
			local var34, var35, var36 = utilityModule:AddNewRow(p0, "Chat Translation Language", "DropDown", list, var29)
			var31.ChatLanguageSelectorFrame = var34
			var32.ChatLanguageSelectorLabel = var35
			var33.ChatLanguageSelectorMode = var36
		else
			local var37 = p0
			local var38 = p0
			local var39 = p0
			local var40, var41, var42 = utilityModule:AddNewRow(p0, "Chat Language", "DropDown", list, var29)
			var37.ChatLanguageSelectorFrame = var40
			var38.ChatLanguageSelectorLabel = var41
			var39.ChatLanguageSelectorMode = var42
		end
		p0.ChatLanguageSelectorFrame.LayoutOrder = p1.ChatLanguageSelectorFrame
		p0.ChatLanguageSelectorMode.IndexChanged:connect(function(p5) --[[ line: 134 | named "onChatSelectionIndexUpdated" ]]
			-- upvalues: gameSettings (copy), t (copy), localPlayer (copy), var30 (write), p2 (copy)
			local chatTranslationLocale = gameSettings.ChatTranslationLocale
			local var50 = t[p5]
			gameSettings.ChatTranslationLocale = var50
			localPlayer:SetChatTranslationSettingsLocaleId(var50)
			var30 = var50
			p2("chat_translation_locale", chatTranslationLocale, var50)
		end)
		local var43, var44, var45 = utilityModule:AddNewRow(p0, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Chat.TranslationToggleSetting"), "Selector", { "On", "Off" }, if textChatService.ChatTranslationToggleEnabled then 1 else 2)
		p0.ChatTranslationToggleFrame = var43
		p0.ChatTranslationToggleLabel = var44
		p0.ChatTranslationToggleEnabler = var45
		p0.ChatTranslationToggleFrame.LayoutOrder = p1.ChatTranslationToggleFrame
		p0.ChatTranslationToggleEnabler.IndexChanged:connect(function(p6) --[[ line: 161 ]]
			-- upvalues: textChatService (copy), textChatServiceSettingsSavedEngineFeature (copy), gameSettings (copy), p2 (copy), var30 (write)
			local var51 = p6 ~= 1
			local chatTranslationToggleEnabled = textChatService.ChatTranslationToggleEnabled
			
			if var51 ~= chatTranslationToggleEnabled then
				if textChatServiceSettingsSavedEngineFeature then
					gameSettings.ChatTranslationToggleEnabled = var51
				else
					textChatService.ChatTranslationToggleEnabled = var51
				end
				p2("chat_translation_toggle", chatTranslationToggleEnabled, var51, { locale_id = var30 })
			end
		end)
		local var46 = if textChatService.ChatTranslationEnabled then 1 else 2
		
		if var46 == 2 then
			p0.ChatLanguageSelectorFrame.Visible = false
			p0.ChatTranslationToggleFrame.Visible = false
		end
		local var47, var48, var49 = utilityModule:AddNewRow(p0, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Chat.TranslationSetting"), "Selector", { "On", "Off" }, var46)
		p0.ChatTranslationFrame = var47
		p0.ChatTranslationLabel = var48
		p0.ChatTranslationEnabler = var49
		p0.ChatTranslationFrame.LayoutOrder = p1.ChatTranslationFrame
		p0.ChatTranslationEnabler.IndexChanged:connect(function(p7) --[[ line: 198 ]]
			-- upvalues: textChatService (copy), textChatServiceSettingsSavedEngineFeature (copy), gameSettings (copy), p2 (copy), localPlayer (copy), p0 (copy)
			local var52 = p7 ~= 1
			local chatTranslationEnabled = textChatService.ChatTranslationEnabled
			
			if textChatServiceSettingsSavedEngineFeature then
				gameSettings.ChatTranslationEnabled = var52
			else
				textChatService.ChatTranslationEnabled = var52
			end
			p2("chat_translation", chatTranslationEnabled, var52, { locale_id = localPlayer.LocaleId })
			
			if p7 == 1 then
				p0.ChatLanguageSelectorFrame.Visible = true
				p0.ChatTranslationToggleFrame.Visible = true
				
				return
			end
			p0.ChatLanguageSelectorFrame.Visible = false
			p0.ChatTranslationToggleFrame.Visible = false
		end)
	end
	
	httpService:RequestInternal({ Method = "GET", Url = text }):Start(function(p8, p9) --[[ line: 223 ]]
		-- upvalues: httpService (copy), getFStringChatTranslationEnabledLocalesModule (copy), list (ref), t (ref), t_1 (ref), name (copy), text (ref), localeCodeToLanguageCodeMappingCallback (ref)
		local var54
		local var53 = false
		local _ = nil
		
		if not p8 then
			var54 = "Locale Code to Language Code Mapping Request: Connection error"
		elseif p9.StatusCode == 401 then
			var54 = "Locale Code to Language Code Mapping Request: Unauthorized"
		elseif p9.StatusCode < 200 or p9.StatusCode >= 400 then
			var54 = "Locale Code to Language Code Mapping Request Status code: " .. p9.StatusCode
		else
			local ok, status = pcall(function() --[[ line: 234 ]]
				-- upvalues: httpService (copy), p9 (ref), getFStringChatTranslationEnabledLocalesModule (copy), list (copy), t (copy), t_1 (copy)
				local body = httpService:JSONDecode(p9.Body)
				local t_2 = {}
				
				for i in getFStringChatTranslationEnabledLocalesModule():gmatch("([^,]+)") do
					table.insert(t_2, i)
				end
				local name
				local function _(p10) --[[ line: 244 | named "shouldAddLocaleAsChatTranslationOption" ]]
					-- upvalues: t_2 (ref)
					for i, v in t_2 do
						if v == p10 then
							return true
						end
					end
					return false
				end
				
				local var57 = 2
				
				for i_1, v in pairs(body.data) do
					local locale = v.locale.locale
					name = v.locale.language.name
					
					if locale == "en_us" then
						list[1] = name
						continue
					end
					local var58
					for i_2, v_1 in t_2 do
						if v_1 == locale then
							var58 = true
							if var58 then
								table.insert(list, name)
								t[var57] = locale
								t_1[locale] = var57
								var57 += 1
							end
						end
					end
					var58 = false
				end
			end)
			var53 = ok
			var54 = status
		end
		if not var53 then
			name:warning("GameSettings chat language selector initialization: Failed to get response from Localization API for " .. text .. " with error message: " .. var54)
		end
		localeCodeToLanguageCodeMappingCallback(var53, var54)
	end)
end