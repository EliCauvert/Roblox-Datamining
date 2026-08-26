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
local var1 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")

return function(p1, p2, p3)
	-- upvalues: url (ref), playersService (ref), httpService (ref), name (ref), fixChatLanguageSwitcherLabel (ref), utilityModule (ref), robloxTranslatorModule (ref), var1 (ref), gameSettings (ref), localPlayer (ref), textChatService (ref), textChatServiceSettingsSavedEngineFeature (ref), getFStringChatTranslationEnabledLocalesModule (ref)
	local t = { [1] = "en_us" }
	local t_1 = { en_us = 1 }
	local list = { "English" }
	local text = url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", playersService.LocalPlayer.LocaleId:gsub("-", "_"))
	
	local function localeCodeToLanguageCodeMappingCallback(p4, p5)
		-- upvalues: name (copy), fixChatLanguageSwitcherLabel (copy), p1 (ref), utilityModule (copy), robloxTranslatorModule (copy), var1 (copy), p2 (ref), gameSettings (copy), t (ref), localPlayer (copy), textChatService (copy), list (ref), p3 (ref), textChatServiceSettingsSavedEngineFeature (copy)
		if not p4 then
			if p5 == nil then
				p5 = "Locales call did not set error message to non-nil value"
			end
			name:warning("GameSettings chat language selector initialization failed to get all required information; defaulting to unavailable for the remainder of this session. Error message: " .. p4)
			
			if fixChatLanguageSwitcherLabel then
				local var2 = p1
				local var3 = p1
				local var4 = p1
				local var5, var6, var7 = utilityModule:AddNewRow(p1, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Chat.ChatLanguageSelectionLabel"), "DropDown", { var1 }, 1)
				var2.ChatLanguageSelectorFrame = var5
				var3.ChatLanguageSelectorLabel = var6
				var4.ChatLanguageSelectorMode = var7
			else
				local var8 = p1
				local var9 = p1
				local var10 = p1
				local var11, var12, var13 = utilityModule:AddNewRow(p1, "Chat Language", "DropDown", { var1 }, 1)
				var8.ChatLanguageSelectorFrame = var11
				var9.ChatLanguageSelectorLabel = var12
				var10.ChatLanguageSelectorMode = var13
			end
			p1.ChatLanguageSelectorFrame.LayoutOrder = p2.ChatLanguageSelectorFrame
		end
		local var14 = nil
		local chatTranslationLocale = gameSettings.ChatTranslationLocale
		
		if chatTranslationLocale ~= "" then
			for i, v in t do
				if v == chatTranslationLocale then
					var14 = i
				end
			end
		end
		if chatTranslationLocale == "" or var14 == nil then
			for i, v in t do
				if v == localPlayer.LocaleId:gsub("-", "_") then
					var14 = i
					textChatService.ChatTranslationEnabled = true
				end
			end
		end
		if var14 == nil then
			textChatService.ChatTranslationEnabled = false
			var14 = 1
		else
			gameSettings.ChatTranslationLocale = t[var14]
		end
		localPlayer:SetChatTranslationSettingsLocaleId(t[var14])
		local var15 = t[var14]
		
		if fixChatLanguageSwitcherLabel then
			local var16 = p1
			local var17 = p1
			local var18 = p1
			local var19, var20, var21 = utilityModule:AddNewRow(p1, "Chat Translation Language", "DropDown", list, var14)
			var16.ChatLanguageSelectorFrame = var19
			var17.ChatLanguageSelectorLabel = var20
			var18.ChatLanguageSelectorMode = var21
		else
			local var22 = p1
			local var23 = p1
			local var24 = p1
			local var25, var26, var27 = utilityModule:AddNewRow(p1, "Chat Language", "DropDown", list, var14)
			var22.ChatLanguageSelectorFrame = var25
			var23.ChatLanguageSelectorLabel = var26
			var24.ChatLanguageSelectorMode = var27
		end
		p1.ChatLanguageSelectorFrame.LayoutOrder = p2.ChatLanguageSelectorFrame
		p1.ChatLanguageSelectorMode.IndexChanged:connect(function(p6)
			-- upvalues: gameSettings (copy), t (copy), localPlayer (copy), var15 (write), p3 (copy)
			local chatTranslationLocale = gameSettings.ChatTranslationLocale
			local var28 = t[p6]
			gameSettings.ChatTranslationLocale = var28
			localPlayer:SetChatTranslationSettingsLocaleId(var28)
			var15 = var28
			p3("chat_translation_locale", chatTranslationLocale, var28)
		end)
		local var28, var29, var30 = utilityModule:AddNewRow(p1, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Chat.TranslationToggleSetting"), "Selector", { "On", "Off" }, if textChatService.ChatTranslationToggleEnabled then 1 else 2)
		p1.ChatTranslationToggleFrame = var28
		p1.ChatTranslationToggleLabel = var29
		p1.ChatTranslationToggleEnabler = var30
		p1.ChatTranslationToggleFrame.LayoutOrder = p2.ChatTranslationToggleFrame
		p1.ChatTranslationToggleEnabler.IndexChanged:connect(function(p6)
			-- upvalues: textChatService (copy), textChatServiceSettingsSavedEngineFeature (copy), gameSettings (copy), p3 (copy), var15 (write)
			local var31 = p6 ~= 1
			local chatTranslationToggleEnabled = textChatService.ChatTranslationToggleEnabled
			
			if var31 ~= chatTranslationToggleEnabled then
				if textChatServiceSettingsSavedEngineFeature then
					gameSettings.ChatTranslationToggleEnabled = var31
				else
					textChatService.ChatTranslationToggleEnabled = var31
				end
				p3("chat_translation_toggle", chatTranslationToggleEnabled, var31, { locale_id = var15 })
			end
		end)
		local var31 = if textChatService.ChatTranslationEnabled then 1 else 2
		
		if var31 == 2 then
			p1.ChatLanguageSelectorFrame.Visible = false
			p1.ChatTranslationToggleFrame.Visible = false
		end
		local var32, var33, var34 = utilityModule:AddNewRow(p1, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Chat.TranslationSetting"), "Selector", { "On", "Off" }, var31)
		p1.ChatTranslationFrame = var32
		p1.ChatTranslationLabel = var33
		p1.ChatTranslationEnabler = var34
		p1.ChatTranslationFrame.LayoutOrder = p2.ChatTranslationFrame
		p1.ChatTranslationEnabler.IndexChanged:connect(function(p6)
			-- upvalues: textChatService (copy), textChatServiceSettingsSavedEngineFeature (copy), gameSettings (copy), p3 (copy), localPlayer (copy), p1 (copy)
			local var35 = p6 ~= 1
			local chatTranslationEnabled = textChatService.ChatTranslationEnabled
			
			if textChatServiceSettingsSavedEngineFeature then
				gameSettings.ChatTranslationEnabled = var35
			else
				textChatService.ChatTranslationEnabled = var35
			end
			p3("chat_translation", chatTranslationEnabled, var35, { locale_id = localPlayer.LocaleId })
			
			if p6 == 1 then
				p1.ChatLanguageSelectorFrame.Visible = true
				p1.ChatTranslationToggleFrame.Visible = true
				
				return
			end
			p1.ChatLanguageSelectorFrame.Visible = false
			p1.ChatTranslationToggleFrame.Visible = false
		end)
	end
	
	httpService:RequestInternal({ Method = "GET", Url = text }):Start(function(p6, p7)
		-- upvalues: httpService (copy), getFStringChatTranslationEnabledLocalesModule (copy), list (ref), t (ref), t_1 (ref), name (copy), text (ref), localeCodeToLanguageCodeMappingCallback (ref)
		local var35
		local var36 = false
		local _ = nil
		
		if not p6 then
			var35 = "Locale Code to Language Code Mapping Request: Connection error"
		elseif p7.StatusCode == 401 then
			var35 = "Locale Code to Language Code Mapping Request: Unauthorized"
		elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then
			var35 = "Locale Code to Language Code Mapping Request Status code: " .. p9.StatusCode
		else
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p7 (ref), getFStringChatTranslationEnabledLocalesModule (copy), list (copy), t (copy), t_1 (copy)
				local body = httpService:JSONDecode(p7.Body)
				local t_2 = {}
				
				for i in getFStringChatTranslationEnabledLocalesModule():gmatch("([^,]+)") do
					table.insert(t_2, i)
				end
				local name
				local function _(p8)
					-- upvalues: t_2 (ref)
					for i, v in t_2 do
						if v == p8 then
							return true
						end
					end
					return false
				end
				
				local var37 = 2
				
				for i_1, v in pairs(body.data) do
					local locale = v.locale.locale
					name = v.locale.language.name
					
					if locale == "en_us" then
						list[1] = name
						continue
					end
					local var38
					for i_2, v_1 in t_2 do
						if v_1 == locale then
							var38 = true
							if var38 then
								table.insert(list, name)
								t[var37] = locale
								t_1[locale] = var37
								var37 += 1
							end
						end
					end
					var38 = false
				end
			end)
			var36 = ok
			var35 = status
		end
		if not var36 then
			name:warning("GameSettings chat language selector initialization: Failed to get response from Localization API for " .. text .. " with error message: " .. var54)
		end
		localeCodeToLanguageCodeMappingCallback(var36, var35)
	end)
end