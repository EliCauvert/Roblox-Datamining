local TextChatService = game:GetService("TextChatService")
local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local GameSettings = UserSettings().GameSettings
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local FixChatLanguageSwitcherLabel = game:DefineFastFlag("FixChatLanguageSwitcherLabel", false)
local GetFStringChatTranslationEnabledLocalesModule = require(RobloxGui.Modules.Flags.GetFStringChatTranslationEnabledLocales)
local TextChatServiceSettingsSavedEngineFeature = game:GetEngineFeature("TextChatServiceSettingsSaved")
local FeatureSettingsHubLanguageSelectionUnavailable = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")

return function(p1, p2, Callback) --[[ Line: 29 ]]
	-- upvalues: Url (copy), Players (copy), HttpService (copy), NewResult (copy), FixChatLanguageSwitcherLabel (copy), UtilityModule (copy), RobloxTranslatorModule (copy), FeatureSettingsHubLanguageSelectionUnavailable (copy), GameSettings (copy), LocalPlayer (copy), TextChatService (copy), TextChatServiceSettingsSavedEngineFeature (copy), GetFStringChatTranslationEnabledLocalesModule (copy)
	local config = { [1] = "en_us" }
	local config1 = { en_us = 1 }
	local Names = { "English" }
	local Text = Url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", Players.LocalPlayer.LocaleId:gsub("-", "_"))
	
	local function localeCodeToLanguageCodeMappingCallback(p3, Text: string) --[[ Line: 53 ]]
		-- upvalues: NewResult (upval), FixChatLanguageSwitcherLabel (upval), p1 (copy), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), p2 (copy), GameSettings (upval), config (copy), LocalPlayer (upval), TextChatService (upval), Names (copy), Callback (copy), TextChatServiceSettingsSavedEngineFeature (upval)
		if not p3 then
			if Text == nil then
				Text = "Locales call did not set error message to non-nil value"
			end
			NewResult:warning("GameSettings chat language selector initialization failed to get all required information; defaulting to unavailable for the remainder of this session. Error message: " .. Text)
			
			if FixChatLanguageSwitcherLabel then
				p1.ChatLanguageSelectorFrame, p1.ChatLanguageSelectorLabel, p1.ChatLanguageSelectorMode = UtilityModule:AddNewRow(p1, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Chat.ChatLanguageSelectionLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
			else
				p1.ChatLanguageSelectorFrame, p1.ChatLanguageSelectorLabel, p1.ChatLanguageSelectorMode = UtilityModule:AddNewRow(p1, "Chat Language", "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
			end
			p1.ChatLanguageSelectorFrame.LayoutOrder = p2.ChatLanguageSelectorFrame
		end
		local v1: number? = nil
		local ChatTranslationLocale = GameSettings.ChatTranslationLocale
		
		if ChatTranslationLocale ~= "" then
			for i, value in config do
				if value == ChatTranslationLocale then
					v1 = i
				end
			end
		end
		if ChatTranslationLocale == "" or v1 == nil then
			for i1, value1 in config do
				if value1 == LocalPlayer.LocaleId:gsub("-", "_") then
					v1 = i1
					TextChatService.ChatTranslationEnabled = true
				end
			end
		end
		if v1 == nil then
			TextChatService.ChatTranslationEnabled = false
			v1 = 1
		else
			GameSettings.ChatTranslationLocale = config[v1]
		end
		LocalPlayer:SetChatTranslationSettingsLocaleId(config[v1])
		local Entry = config[v1]
		
		if FixChatLanguageSwitcherLabel then
			p1.ChatLanguageSelectorFrame, p1.ChatLanguageSelectorLabel, p1.ChatLanguageSelectorMode = UtilityModule:AddNewRow(p1, "Chat Translation Language", "DropDown", Names, v1)
		else
			p1.ChatLanguageSelectorFrame, p1.ChatLanguageSelectorLabel, p1.ChatLanguageSelectorMode = UtilityModule:AddNewRow(p1, "Chat Language", "DropDown", Names, v1)
		end
		p1.ChatLanguageSelectorFrame.LayoutOrder = p2.ChatLanguageSelectorFrame
		p1.ChatLanguageSelectorMode.IndexChanged:connect(function(p4) --[[ Line: 134 | Named "onChatSelectionIndexUpdated" ]]
			-- upvalues: GameSettings (upval), config (upval), LocalPlayer (upval), Entry (ref), Callback (upval)
			local ChatTranslationLocale = GameSettings.ChatTranslationLocale
			local Entry1 = config[p4]
			GameSettings.ChatTranslationLocale = Entry1
			LocalPlayer:SetChatTranslationSettingsLocaleId(Entry1)
			Entry = Entry1
			Callback("chat_translation_locale", ChatTranslationLocale, Entry1)
		end)
		p1.ChatTranslationToggleFrame, p1.ChatTranslationToggleLabel, p1.ChatTranslationToggleEnabler = UtilityModule:AddNewRow(p1, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Chat.TranslationToggleSetting"), "Selector", { "On", "Off" }, if TextChatService.ChatTranslationToggleEnabled then 1 else 2)
		p1.ChatTranslationToggleFrame.LayoutOrder = p2.ChatTranslationToggleFrame
		p1.ChatTranslationToggleEnabler.IndexChanged:connect(function(p4) --[[ Line: 161 ]]
			-- upvalues: TextChatService (upval), TextChatServiceSettingsSavedEngineFeature (upval), GameSettings (upval), Callback (upval), Entry (ref)
			local ChatTranslationToggleEnabled = p4 == 1
			local ChatTranslationToggleEnabled1 = TextChatService.ChatTranslationToggleEnabled
			
			if ChatTranslationToggleEnabled ~= ChatTranslationToggleEnabled1 then
				if TextChatServiceSettingsSavedEngineFeature then
					GameSettings.ChatTranslationToggleEnabled = ChatTranslationToggleEnabled
				else
					TextChatService.ChatTranslationToggleEnabled = ChatTranslationToggleEnabled
				end
				Callback("chat_translation_toggle", ChatTranslationToggleEnabled1, ChatTranslationToggleEnabled, { locale_id = Entry })
			end
		end)
		local v2: number = if TextChatService.ChatTranslationEnabled then 1 else 2
		
		if v2 == 2 then
			p1.ChatLanguageSelectorFrame.Visible = false
			p1.ChatTranslationToggleFrame.Visible = false
		end
		p1.ChatTranslationFrame, p1.ChatTranslationLabel, p1.ChatTranslationEnabler = UtilityModule:AddNewRow(p1, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Chat.TranslationSetting"), "Selector", { "On", "Off" }, v2)
		p1.ChatTranslationFrame.LayoutOrder = p2.ChatTranslationFrame
		p1.ChatTranslationEnabler.IndexChanged:connect(function(p4) --[[ Line: 198 ]]
			-- upvalues: TextChatService (upval), TextChatServiceSettingsSavedEngineFeature (upval), GameSettings (upval), Callback (upval), LocalPlayer (upval), p1 (upval)
			local ChatTranslationEnabled = p4 == 1
			local ChatTranslationEnabled1 = TextChatService.ChatTranslationEnabled
			
			if TextChatServiceSettingsSavedEngineFeature then
				GameSettings.ChatTranslationEnabled = ChatTranslationEnabled
			else
				TextChatService.ChatTranslationEnabled = ChatTranslationEnabled
			end
			Callback("chat_translation", ChatTranslationEnabled1, ChatTranslationEnabled, { locale_id = LocalPlayer.LocaleId })
			
			if p4 == 1 then
				p1.ChatLanguageSelectorFrame.Visible = true
				p1.ChatTranslationToggleFrame.Visible = true
				
				return
			else
				p1.ChatLanguageSelectorFrame.Visible = false
				p1.ChatTranslationToggleFrame.Visible = false
			end
		end)
	end
	
	HttpService:RequestInternal({ Method = "GET", Url = Text }):Start(function(p4, p5) --[[ Line: 223 ]]
		-- upvalues: HttpService (upval), GetFStringChatTranslationEnabledLocalesModule (upval), Names (copy), config (copy), config1 (copy), NewResult (upval), Text (copy), localeCodeToLanguageCodeMappingCallback (copy)
		local v3 = false
		local v4 = nil
		
		if p4 then
			if p5.StatusCode == 401 then
				v4 = "Locale Code to Language Code Mapping Request: Unauthorized"
			elseif p5.StatusCode < 200 or p5.StatusCode >= 400 then
				v4 = "Locale Code to Language Code Mapping Request Status code: " .. p5.StatusCode
			else
				v3, v31 = pcall(function() --[[ Line: 234 ]]
					-- upvalues: HttpService (upval), p5 (copy), GetFStringChatTranslationEnabledLocalesModule (upval), Names (upval), config (upval), config1 (upval)
					local Data = HttpService:JSONDecode(p5.Body)
					local List = {}
					
					for i in GetFStringChatTranslationEnabledLocalesModule():gmatch("([^,]+)") do
						table.insert(List, i)
					end
					local function _(p6): boolean --[[ Line: 244 | Named "shouldAddLocaleAsChatTranslationOption" ]]
						-- upvalues: List (copy)
						for _, value in List do
							if value == p6 then
								return true
							end
						end
						return false
					end
					
					local Count = 2
					local Flag = nil
					
					for _, entry in pairs(Data.data) do
						local Locale = entry.locale.locale
						local Name = entry.locale.language.name
						
						if Locale == "en_us" then
							Names[1] = Name
							continue
						end
						Flag = false
						
						for _, value in List do
							if value == Locale then
								Flag = true
								break
							end
						end
						if Flag then
							table.insert(Names, Name)
							config[Count] = Locale
							config1[Locale] = Count
							Count += 1
						end
					end
				end)
			end
		else
			v4 = "Locale Code to Language Code Mapping Request: Connection error"
		end
		if not v3 then
			NewResult:warning("GameSettings chat language selector initialization: Failed to get response from Localization API for " .. Text .. " with error message: " .. v4)
		end
		localeCodeToLanguageCodeMappingCallback(v3, v4)
	end)
end