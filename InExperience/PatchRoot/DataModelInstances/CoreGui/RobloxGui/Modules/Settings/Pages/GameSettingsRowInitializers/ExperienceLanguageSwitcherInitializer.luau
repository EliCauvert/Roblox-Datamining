local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UtilityModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Utility)
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local UgcLocaleFromGameJoinEnabledEngineFeature = game:GetEngineFeature("UgcLocaleFromGameJoinEnabled")
local config = {
	sq = "sq_al",
	ar = "ar_001",
	bn = "bn_bd",
	nb = "nb_no",
	bs = "bs_ba",
	bg = "bg_bg",
	my = "my_mm",
	["zh-hans"] = "zh_cn",
	["zh-hant"] = "zh_tw",
	hr = "hr_hr",
	cs = "cs_cz",
	da = "da_dk",
	nl = "nl_nl",
	en = "en_us",
	et = "et_ee",
	fil = "fil_ph",
	fi = "fi_fi",
	fr = "fr_fr",
	ka = "ka_ge",
	de = "de_de",
	el = "el_gr",
	hi = "hi_in",
	hu = "hu_hu",
	id = "id_id",
	it = "it_it",
	ja = "ja_jp",
	kk = "kk_kz",
	km = "km_kh",
	ko = "ko_kr",
	lv = "lv_lv",
	lt = "lt_lt",
	ms = "ms_my",
	pl = "pl_pl",
	pt = "pt_br",
	ro = "ro_ro",
	ru = "ru_ru",
	sr = "sr_rs",
	si = "si_lk",
	sk = "sk_sk",
	sl = "sl_sl",
	es = "es_es",
	sv = "sv_se",
	th = "th_th",
	tr = "tr_tr",
	uk = "uk_ua",
	vi = "vi_vn"
}

return function(p1, p2, Callback) --[[ Line: 76 ]]
	-- upvalues: Players (copy), Url (copy), HttpService (copy), UtilityModule (copy), RobloxTranslatorModule (copy), NewResult (copy), UgcLocaleFromGameJoinEnabledEngineFeature (copy), LocalPlayer (copy), RunService (copy), config (copy)
	local v1 = 1
	local v2 = 1
	local Flag = false
	local Locale = nil
	local v3 = Players.LocalPlayer.LocaleId:gsub("-", "_")
	local v4 = nil
	local Locales = {}
	local List = {}
	local t = {}
	local Locales1 = {}
	local Ids = {}
	local List1 = {}
	local Text = Url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", Players.LocalPlayer.LocaleId:gsub("-", "_"))
	local Text1 = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
	local RequestInternalResult = HttpService:RequestInternal({ Method = "GET", Url = Text1 })
	local Text2 = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
	local RequestInternalResult1 = HttpService:RequestInternal({ Method = "GET", Url = Text2 })
	local Text3 = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
	local RequestInternalResult2 = HttpService:RequestInternal({ Method = "GET", Url = Text3 })
	
	local function _(p3, p4) --[[ Line: 135 | Named "tryGetErrorMessage" ]]
		local StatusCode = nil
		
		if not p3 or not p4 or not p4.StatusCode then
			StatusCode = "Connection error"
			
			return StatusCode
		end
		if p4.StatusCode == 401 then
			StatusCode = "Unauthorized"
			
			return StatusCode
		end
		if p4.StatusCode < 200 or p4.StatusCode >= 400 then
			StatusCode = p4.StatusCode
		end
		return StatusCode
	end
	
	local function createSessionDormantLanguageSwitcherRow() --[[ Line: 148 ]]
		-- upvalues: p1 (copy), UtilityModule (upval), RobloxTranslatorModule (upval), p2 (copy)
		p1.LanguageSelectorFrame, p1.LanguageSelectorLabel, p1.LanguageSelectorMode = UtilityModule:AddNewRow(p1, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
			RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
		}, 1)
		p1.LanguageSelectorMode:SetInteractable(false)
		p1.LanguageSelectorFrame.LayoutOrder = p2.LanguageSelectorFrame
	end
	
	local function userExperienceLanguageSettingsCallback(p3, Text: string) --[[ Line: 164 ]]
		-- upvalues: NewResult (upval), createSessionDormantLanguageSwitcherRow (copy), List (copy), v4 (ref), Locale (ref), List1 (copy), t (copy), Locales (copy), v1 (ref), v2 (ref), p1 (copy), UtilityModule (upval), RobloxTranslatorModule (upval), p2 (copy), UgcLocaleFromGameJoinEnabledEngineFeature (upval), LocalPlayer (upval), Callback (copy), Url (upval), HttpService (upval), Flag (ref), RunService (upval)
		if p3 then
			local Enabled = false
			
			for _, value in List do
				if value == v4 then
					Enabled = true
				end
				if value ~= Locale then
					table.insert(List1, t[value].localeName)
				end
			end
			table.sort(List1)
			
			if Locale == nil or t[Locale].localeName == nil then
				createSessionDormantLanguageSwitcherRow()
				
				return
			end
			table.insert(List1, 1, t[Locale].localeName .. " (Original)")
			
			if Enabled == true then
				for i, value1 in List1 do
					if i ~= 1 and Locales[value1] == v4 then
						v1 = i
						v2 = i
					end
				end
			end
			p1.LanguageSelectorFrame, p1.LanguageSelectorLabel, p1.LanguageSelectorMode = UtilityModule:AddNewRow(p1, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", List1, v1)
			p1.LanguageSelectorFrame.LayoutOrder = p2.LanguageSelectorFrame
			
			if not UgcLocaleFromGameJoinEnabledEngineFeature then
				if v1 == 1 then
					LocalPlayer:SetExperienceSettingsLocaleId(Locale)
				else
					LocalPlayer:SetExperienceSettingsLocaleId(Locales[List1[v1]])
				end
			end
			p1.LanguageSelectorMode.CurrentLocale = p1.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
			p1.LanguageSelectorMode.IndexChanged:connect(function(p4) --[[ Line: 252 | Named "toggleTranslation" ]]
				-- upvalues: p1 (upval), t (upval), Locale (upval), Locales (upval), List1 (upval), Callback (upval), Url (upval), HttpService (upval), v2 (upval), LocalPlayer (upval), NewResult (upval), Flag (upval), RunService (upval)
				p1.LanguageSelectorMode:SetInteractable(false)
				local LocaleId = if p4 == 1 and t[Locale] ~= nil then t[Locale].localeId else t[Locales[List1[p4]]].localeId
				local CurrentLocale = p1.LanguageSelectorMode.CurrentLocale
				local Entry = List1[p4]
				
				if CurrentLocale ~= Entry then
					p1.LanguageSelectorMode.CurrentLocale = Entry
					Callback("experience_locale", CurrentLocale, Entry)
				end
				local Text = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
				local RequestInternalResult = HttpService:RequestInternal({
					Method = "POST",
					Url = Text,
					Headers = { ["Content-Type"] = "application/json" },
					Body = HttpService:JSONEncode({
						settingValue = {
							settingType = "SupportedLocale",
							settingTargetId = LocaleId
						}
					})
				})
				
				local function userExperienceLanguageSettingsUpdateCallback(p5, Unauthorized) --[[ Line: 301 ]]
					-- upvalues: v2 (upval), p4 (copy), LocalPlayer (upval), Locale (upval), Locales (upval), List1 (upval), NewResult (upval), Flag (upval), p1 (upval)
					if p5 then
						v2 = p4
						
						if p4 == 1 then
							LocalPlayer:SetExperienceSettingsLocaleId(Locale)
						else
							LocalPlayer:SetExperienceSettingsLocaleId(Locales[List1[p4]])
						end
					else
						NewResult:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. Unauthorized)
						Flag = true
						p1.LanguageSelectorMode:SetSelectionIndex(v2)
					end
					p1.LanguageSelectorMode:SetInteractable(true)
				end
				
				if RunService:IsStudio() then
					v2 = p4
					
					if p4 == 1 then
						LocalPlayer:SetExperienceSettingsLocaleId(Locale)
					else
						LocalPlayer:SetExperienceSettingsLocaleId(Locales[List1[p4]])
					end
					p1.LanguageSelectorMode:SetInteractable(true)
					
					return
				elseif Flag then
					Flag = false
					v2 = p4
					
					if p4 == 1 then
						LocalPlayer:SetExperienceSettingsLocaleId(Locale)
					else
						LocalPlayer:SetExperienceSettingsLocaleId(Locales[List1[p4]])
					end
					p1.LanguageSelectorMode:SetInteractable(true)
					
					return
				elseif LocaleId == nil then
					NewResult:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. nil)
					Flag = true
					p1.LanguageSelectorMode:SetSelectionIndex(v2)
					p1.LanguageSelectorMode:SetInteractable(true)
					
					return
				else
					RequestInternalResult:Start(function(p5, p6) --[[ Line: 345 ]]
						-- upvalues: NewResult (upval), Text (copy), userExperienceLanguageSettingsUpdateCallback (copy)
						local Flag = false
						local Unauthorized = if p5 and p6 and p6.StatusCode then if p6.StatusCode == 401 then "Unauthorized" elseif p6.StatusCode < 200 or p6.StatusCode >= 400 then p6.StatusCode else nil else "Connection error"
						
						if Unauthorized == nil then
							NewResult:info("User Experience Language Settings Update Request: " .. "Succeeded with code - " .. p6.StatusCode)
							Flag = true
						else
							Unauthorized = "User Experience Language Settings Update Request: " .. Unauthorized
							NewResult:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. Text .. " with error message: " .. Unauthorized)
						end
						userExperienceLanguageSettingsUpdateCallback(Flag, Unauthorized)
					end)
				end
			end)
			
			return
		else
			if Text == nil then
				Text = "Execution path did not set earliest error to non-nil value."
			end
			NewResult:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. Text)
			createSessionDormantLanguageSwitcherRow()
		end
	end
	
	local _ = function(p4, p5) --[[ Line: 374 | Named "experienceSourceLanguageCallback" ]]
		-- upvalues: RequestInternalResult2 (copy), HttpService (upval), v4 (ref), v3 (copy), Locale (ref), Ids (copy), Locales1 (copy), NewResult (upval), Text3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
		if p4 then
			RequestInternalResult2:Start(function(p6, p7) --[[ Line: 376 ]]
				-- upvalues: HttpService (upval), v4 (upval), v3 (upval), Locale (upval), Ids (upval), Locales1 (upval), NewResult (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval)
				local v5 = false
				local Unauthorized = if p6 and p7 and p7.StatusCode then if p7.StatusCode == 401 then "Unauthorized" elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then p7.StatusCode else nil else "Connection error"
				local Text = nil
				
				if Unauthorized == nil then
					v5, Text = pcall(function() --[[ Line: 385 ]]
						-- upvalues: HttpService (upval), p7 (copy), v4 (upval), v3 (upval), Locale (upval), Ids (upval), Locales1 (upval)
						local UserUniverseLocalizationSettingValue = HttpService:JSONDecode(p7.Body).userUniverseLocalizationSettingValue
						
						if UserUniverseLocalizationSettingValue == nil then
							v4 = v3
							
							return
						end
						local SettingTargetId = UserUniverseLocalizationSettingValue.settingTargetId
						local SettingType = UserUniverseLocalizationSettingValue.settingType
						
						if SettingTargetId == nil then
							v4 = v3
						end
						if SettingType == "SourceOrTranslation" then
							if SettingTargetId == 1 then
								v4 = Locale
								
								return
							else
								v4 = v3
								
								return
							end
						elseif SettingType == "LanguageFamily" then
							if Ids[SettingTargetId] == nil then
								v4 = v3
								
								return
							else
								v4 = Locales1[Ids[SettingTargetId]]
								
								return
							end
						elseif SettingType == "SupportedLocale" then
							if Locales1[SettingTargetId] == nil then
								v4 = v3
								
								return
							end
							v4 = Locales1[SettingTargetId]
						end
					end)
				else
					Text = "User Experience Language Setting Get Request: " .. Unauthorized
				end
				if not v5 then
					NewResult:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text3 .. " with error message: " .. Text)
				end
				userExperienceLanguageSettingsCallback(v5, Text)
			end)
			
			return
		end
		local v5: string = p5
		
		if v5 == nil then
			v5 = "Execution path did not set earliest error to non-nil value."
		end
		NewResult:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v5)
		createSessionDormantLanguageSwitcherRow()
	end
	
	local _ = function(p4, p5) --[[ Line: 451 | Named "experienceSupportedLanguagesCallback" ]]
		-- upvalues: RequestInternalResult (copy), HttpService (upval), Locale (ref), config (upval), NewResult (upval), Text1 (copy), RequestInternalResult2 (copy), v4 (ref), v3 (copy), Ids (copy), Locales1 (copy), Text3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
		if p4 then
			RequestInternalResult:Start(function(p6, p7) --[[ Line: 453 ]]
				-- upvalues: HttpService (upval), Locale (upval), config (upval), NewResult (upval), Text1 (upval), p5 (ref), p4 (copy), RequestInternalResult2 (upval), v4 (upval), v3 (upval), Ids (upval), Locales1 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval), createSessionDormantLanguageSwitcherRow (upval)
				local v5 = false
				local Unauthorized = if p6 and p7 and p7.StatusCode then if p7.StatusCode == 401 then "Unauthorized" elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then p7.StatusCode else nil else "Connection error"
				local Text = nil
				
				if Unauthorized == nil then
					v5, Text = pcall(function() --[[ Line: 462 ]]
						-- upvalues: HttpService (upval), p7 (copy), Locale (upval), config (upval)
						Locale = config[HttpService:JSONDecode(p7.Body).languageCode]
					end)
				else
					Text = "Experience Source Language Request: " .. Unauthorized
				end
				if not v5 then
					NewResult:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text1 .. " with error message: " .. Text)
				end
				if p5 == nil then
					p5 = Text
				end
				local v6: string = p5
				
				if v5 and p4 then
					RequestInternalResult2:Start(function(p8, p9) --[[ Line: 376 ]]
						-- upvalues: HttpService (upval), v4 (upval), v3 (upval), Locale (upval), Ids (upval), Locales1 (upval), NewResult (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval)
						local v7 = false
						local Unauthorized = if p8 and p9 and p9.StatusCode then if p9.StatusCode == 401 then "Unauthorized" elseif p9.StatusCode < 200 or p9.StatusCode >= 400 then p9.StatusCode else nil else "Connection error"
						local Text = nil
						
						if Unauthorized == nil then
							v7, Text = pcall(function() --[[ Line: 385 ]]
								-- upvalues: HttpService (upval), p9 (copy), v4 (upval), v3 (upval), Locale (upval), Ids (upval), Locales1 (upval)
								local UserUniverseLocalizationSettingValue = HttpService:JSONDecode(p9.Body).userUniverseLocalizationSettingValue
								
								if UserUniverseLocalizationSettingValue == nil then
									v4 = v3
									
									return
								end
								local SettingTargetId = UserUniverseLocalizationSettingValue.settingTargetId
								local SettingType = UserUniverseLocalizationSettingValue.settingType
								
								if SettingTargetId == nil then
									v4 = v3
								end
								if SettingType == "SourceOrTranslation" then
									if SettingTargetId == 1 then
										v4 = Locale
										
										return
									else
										v4 = v3
										
										return
									end
								elseif SettingType == "LanguageFamily" then
									if Ids[SettingTargetId] == nil then
										v4 = v3
										
										return
									else
										v4 = Locales1[Ids[SettingTargetId]]
										
										return
									end
								elseif SettingType == "SupportedLocale" then
									if Locales1[SettingTargetId] == nil then
										v4 = v3
										
										return
									end
									v4 = Locales1[SettingTargetId]
								end
							end)
						else
							Text = "User Experience Language Setting Get Request: " .. Unauthorized
						end
						if not v7 then
							NewResult:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text3 .. " with error message: " .. Text)
						end
						userExperienceLanguageSettingsCallback(v7, Text)
					end)
					
					return
				end
				local v7: string = v6
				
				if v7 == nil then
					v7 = "Execution path did not set earliest error to non-nil value."
				end
				NewResult:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v7)
				createSessionDormantLanguageSwitcherRow()
			end)
		else
			local v5: string = p5
			
			if v5 == nil then
				v5 = "Execution path did not set earliest error to non-nil value."
			end
			NewResult:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v5)
			createSessionDormantLanguageSwitcherRow()
		end
	end
	
	local _ = function(p4, p5) --[[ Line: 493 | Named "localeInformationCallback" ]]
		-- upvalues: RequestInternalResult1 (copy), HttpService (upval), t (copy), List (copy), NewResult (upval), Text2 (copy), RequestInternalResult (copy), Locale (ref), config (upval), Text1 (copy), RequestInternalResult2 (copy), v4 (ref), v3 (copy), Ids (copy), Locales1 (copy), Text3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
		if p4 then
			RequestInternalResult1:Start(function(p6, p7) --[[ Line: 495 ]]
				-- upvalues: HttpService (upval), t (upval), List (upval), NewResult (upval), Text2 (upval), p5 (ref), p4 (copy), RequestInternalResult (upval), Locale (upval), config (upval), Text1 (upval), RequestInternalResult2 (upval), v4 (upval), v3 (upval), Ids (upval), Locales1 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval), createSessionDormantLanguageSwitcherRow (upval)
				local v5 = false
				local Unauthorized = if p6 and p7 and p7.StatusCode then if p7.StatusCode == 401 then "Unauthorized" elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then p7.StatusCode else nil else "Connection error"
				local Text = nil
				
				if Unauthorized == nil then
					v5, Text = pcall(function() --[[ Line: 503 ]]
						-- upvalues: HttpService (upval), p7 (copy), t (upval), List (upval)
						local LanguageCodes = {}
						
						for i, entry in pairs(HttpService:JSONDecode(p7.Body).data) do
							LanguageCodes[i] = entry.languageCode
						end
						for _, languageCode in LanguageCodes do
							for i1, value in t do
								if value.languageCode == languageCode then
									table.insert(List, i1)
								end
							end
						end
					end)
				else
					Text = "Experience Supported Language Language Request: " .. Unauthorized
				end
				if not v5 then
					NewResult:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. Text2 .. " with error message: " .. Text)
				end
				if p5 == nil then
					p5 = Text
				end
				local v6 = v5 and p4
				local v7: string = p5
				
				if v6 then
					RequestInternalResult:Start(function(p8, p9) --[[ Line: 453 ]]
						-- upvalues: HttpService (upval), Locale (upval), config (upval), NewResult (upval), Text1 (upval), v7 (ref), v6 (copy), RequestInternalResult2 (upval), v4 (upval), v3 (upval), Ids (upval), Locales1 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval), createSessionDormantLanguageSwitcherRow (upval)
						local v8 = false
						local Unauthorized = if p8 and p9 and p9.StatusCode then if p9.StatusCode == 401 then "Unauthorized" elseif p9.StatusCode < 200 or p9.StatusCode >= 400 then p9.StatusCode else nil else "Connection error"
						local Text = nil
						
						if Unauthorized == nil then
							v8, Text = pcall(function() --[[ Line: 462 ]]
								-- upvalues: HttpService (upval), p9 (copy), Locale (upval), config (upval)
								Locale = config[HttpService:JSONDecode(p9.Body).languageCode]
							end)
						else
							Text = "Experience Source Language Request: " .. Unauthorized
						end
						if not v8 then
							NewResult:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text1 .. " with error message: " .. Text)
						end
						if v7 == nil then
							v7 = Text
						end
						local v9: string = v7
						
						if v8 and v6 then
							RequestInternalResult2:Start(function(p10, p11) --[[ Line: 376 ]]
								-- upvalues: HttpService (upval), v4 (upval), v3 (upval), Locale (upval), Ids (upval), Locales1 (upval), NewResult (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval)
								local v10 = false
								local Unauthorized = if p10 and p11 and p11.StatusCode then if p11.StatusCode == 401 then "Unauthorized" elseif p11.StatusCode < 200 or p11.StatusCode >= 400 then p11.StatusCode else nil else "Connection error"
								local Text = nil
								
								if Unauthorized == nil then
									v10, Text = pcall(function() --[[ Line: 385 ]]
										-- upvalues: HttpService (upval), p11 (copy), v4 (upval), v3 (upval), Locale (upval), Ids (upval), Locales1 (upval)
										local UserUniverseLocalizationSettingValue = HttpService:JSONDecode(p11.Body).userUniverseLocalizationSettingValue
										
										if UserUniverseLocalizationSettingValue == nil then
											v4 = v3
											
											return
										end
										local SettingTargetId = UserUniverseLocalizationSettingValue.settingTargetId
										local SettingType = UserUniverseLocalizationSettingValue.settingType
										
										if SettingTargetId == nil then
											v4 = v3
										end
										if SettingType == "SourceOrTranslation" then
											if SettingTargetId == 1 then
												v4 = Locale
												
												return
											else
												v4 = v3
												
												return
											end
										elseif SettingType == "LanguageFamily" then
											if Ids[SettingTargetId] == nil then
												v4 = v3
												
												return
											else
												v4 = Locales1[Ids[SettingTargetId]]
												
												return
											end
										elseif SettingType == "SupportedLocale" then
											if Locales1[SettingTargetId] == nil then
												v4 = v3
												
												return
											end
											v4 = Locales1[SettingTargetId]
										end
									end)
								else
									Text = "User Experience Language Setting Get Request: " .. Unauthorized
								end
								if not v10 then
									NewResult:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text3 .. " with error message: " .. Text)
								end
								userExperienceLanguageSettingsCallback(v10, Text)
							end)
							
							return
						end
						local v10: string = v9
						
						if v10 == nil then
							v10 = "Execution path did not set earliest error to non-nil value."
						end
						NewResult:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v10)
						createSessionDormantLanguageSwitcherRow()
					end)
				else
					local v8: string = v7
					
					if v8 == nil then
						v8 = "Execution path did not set earliest error to non-nil value."
					end
					NewResult:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v8)
					createSessionDormantLanguageSwitcherRow()
				end
			end)
		else
			local v9: string = p5
			
			if v9 == nil then
				v9 = "Execution path did not set earliest error to non-nil value."
			end
			NewResult:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v9)
			createSessionDormantLanguageSwitcherRow()
		end
	end
	
	HttpService:RequestInternal({ Method = "GET", Url = Text }):Start(function(p8, p9) --[[ Line: 542 ]]
		-- upvalues: HttpService (upval), config (upval), Ids (copy), t (copy), Locales1 (copy), Locales (copy), NewResult (upval), Text (copy), RequestInternalResult1 (copy), List (copy), Text2 (copy), RequestInternalResult (copy), Locale (ref), Text1 (copy), RequestInternalResult2 (copy), v4 (ref), v3 (copy), Text3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
		local v6 = false
		local Unauthorized = if p8 and p9 and p9.StatusCode then if p9.StatusCode == 401 then "Unauthorized" elseif p9.StatusCode < 200 or p9.StatusCode >= 400 then p9.StatusCode else nil else "Connection error"
		local Text4 = nil
		
		if Unauthorized == nil then
			v6, Text4 = pcall(function() --[[ Line: 551 ]]
				-- upvalues: HttpService (upval), p9 (copy), config (upval), Ids (upval), t (upval), Locales1 (upval), Locales (upval)
				for _, entry in pairs(HttpService:JSONDecode(p9.Body).data) do
					local LanguageCode = entry.locale.language.languageCode
					local Id = entry.locale.language.id
					local Name = entry.locale.language.name
					local Locale = entry.locale.locale
					local Id1 = entry.locale.id
					local Name1 = entry.locale.name
					
					if config[LanguageCode] == Locale then
						Ids[Id] = Id1
					end
					t[Locale] = {
						localeName = Name1,
						localeId = Id1,
						languageName = Name,
						languageId = Id,
						languageCode = LanguageCode
					}
					Locales1[Id1] = Locale
					Locales[Name1] = Locale
				end
			end)
		else
			Text4 = "Locale Information Request: " .. Unauthorized
		end
		if not v6 then
			NewResult:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. Text .. " with error message: " .. Text4)
		end
		local v7: boolean = v6
		local Text5: string = Text4
		
		if v7 then
			RequestInternalResult1:Start(function(p10, p11) --[[ Line: 495 ]]
				-- upvalues: HttpService (upval), t (upval), List (upval), NewResult (upval), Text2 (upval), Text5 (ref), v7 (copy), RequestInternalResult (upval), Locale (upval), config (upval), Text1 (upval), RequestInternalResult2 (upval), v4 (upval), v3 (upval), Ids (upval), Locales1 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval), createSessionDormantLanguageSwitcherRow (upval)
				local v8 = false
				local Unauthorized = if p10 and p11 and p11.StatusCode then if p11.StatusCode == 401 then "Unauthorized" elseif p11.StatusCode < 200 or p11.StatusCode >= 400 then p11.StatusCode else nil else "Connection error"
				local Text = nil
				
				if Unauthorized == nil then
					v8, Text = pcall(function() --[[ Line: 503 ]]
						-- upvalues: HttpService (upval), p11 (copy), t (upval), List (upval)
						local LanguageCodes = {}
						
						for i, entry in pairs(HttpService:JSONDecode(p11.Body).data) do
							LanguageCodes[i] = entry.languageCode
						end
						for _, languageCode in LanguageCodes do
							for i1, value in t do
								if value.languageCode == languageCode then
									table.insert(List, i1)
								end
							end
						end
					end)
				else
					Text = "Experience Supported Language Language Request: " .. Unauthorized
				end
				if not v8 then
					NewResult:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. Text2 .. " with error message: " .. Text)
				end
				if Text5 == nil then
					Text5 = Text
				end
				local v9 = v8 and v7
				local v10: string = Text5
				
				if v9 then
					RequestInternalResult:Start(function(p12, p13) --[[ Line: 453 ]]
						-- upvalues: HttpService (upval), Locale (upval), config (upval), NewResult (upval), Text1 (upval), v10 (ref), v9 (copy), RequestInternalResult2 (upval), v4 (upval), v3 (upval), Ids (upval), Locales1 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval), createSessionDormantLanguageSwitcherRow (upval)
						local v11 = false
						local Unauthorized = if p12 and p13 and p13.StatusCode then if p13.StatusCode == 401 then "Unauthorized" elseif p13.StatusCode < 200 or p13.StatusCode >= 400 then p13.StatusCode else nil else "Connection error"
						local Text = nil
						
						if Unauthorized == nil then
							v11, Text = pcall(function() --[[ Line: 462 ]]
								-- upvalues: HttpService (upval), p13 (copy), Locale (upval), config (upval)
								Locale = config[HttpService:JSONDecode(p13.Body).languageCode]
							end)
						else
							Text = "Experience Source Language Request: " .. Unauthorized
						end
						if not v11 then
							NewResult:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text1 .. " with error message: " .. Text)
						end
						if v10 == nil then
							v10 = Text
						end
						local v12: string = v10
						
						if v11 and v9 then
							RequestInternalResult2:Start(function(p14, p15) --[[ Line: 376 ]]
								-- upvalues: HttpService (upval), v4 (upval), v3 (upval), Locale (upval), Ids (upval), Locales1 (upval), NewResult (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval)
								local v13 = false
								local Unauthorized = if p14 and p15 and p15.StatusCode then if p15.StatusCode == 401 then "Unauthorized" elseif p15.StatusCode < 200 or p15.StatusCode >= 400 then p15.StatusCode else nil else "Connection error"
								local Text = nil
								
								if Unauthorized == nil then
									v13, Text = pcall(function() --[[ Line: 385 ]]
										-- upvalues: HttpService (upval), p15 (copy), v4 (upval), v3 (upval), Locale (upval), Ids (upval), Locales1 (upval)
										local UserUniverseLocalizationSettingValue = HttpService:JSONDecode(p15.Body).userUniverseLocalizationSettingValue
										
										if UserUniverseLocalizationSettingValue == nil then
											v4 = v3
											
											return
										end
										local SettingTargetId = UserUniverseLocalizationSettingValue.settingTargetId
										local SettingType = UserUniverseLocalizationSettingValue.settingType
										
										if SettingTargetId == nil then
											v4 = v3
										end
										if SettingType == "SourceOrTranslation" then
											if SettingTargetId == 1 then
												v4 = Locale
												
												return
											else
												v4 = v3
												
												return
											end
										elseif SettingType == "LanguageFamily" then
											if Ids[SettingTargetId] == nil then
												v4 = v3
												
												return
											else
												v4 = Locales1[Ids[SettingTargetId]]
												
												return
											end
										elseif SettingType == "SupportedLocale" then
											if Locales1[SettingTargetId] == nil then
												v4 = v3
												
												return
											end
											v4 = Locales1[SettingTargetId]
										end
									end)
								else
									Text = "User Experience Language Setting Get Request: " .. Unauthorized
								end
								if not v13 then
									NewResult:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text3 .. " with error message: " .. Text)
								end
								userExperienceLanguageSettingsCallback(v13, Text)
							end)
							
							return
						end
						local v13: string = v12
						
						if v13 == nil then
							v13 = "Execution path did not set earliest error to non-nil value."
						end
						NewResult:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v13)
						createSessionDormantLanguageSwitcherRow()
					end)
				else
					local v11: string = v10
					
					if v11 == nil then
						v11 = "Execution path did not set earliest error to non-nil value."
					end
					NewResult:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v11)
					createSessionDormantLanguageSwitcherRow()
				end
			end)
		else
			local Text6: string = Text5
			
			if Text6 == nil then
				Text6 = "Execution path did not set earliest error to non-nil value."
			end
			NewResult:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. Text6)
			createSessionDormantLanguageSwitcherRow()
		end
	end)
end