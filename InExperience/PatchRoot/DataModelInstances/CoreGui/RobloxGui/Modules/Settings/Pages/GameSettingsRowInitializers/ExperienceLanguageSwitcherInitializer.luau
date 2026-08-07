local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local ugcLocaleFromGameJoinEnabledEngineFeature = game:GetEngineFeature("UgcLocaleFromGameJoinEnabled")
local t = {
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

return function(p0, p1, p2) --[[ line: 76 ]]
	-- upvalues: playersService (ref), url (ref), httpService (ref), utilityModule (ref), robloxTranslatorModule (ref), name (ref), ugcLocaleFromGameJoinEnabledEngineFeature (ref), localPlayer (ref), runService (ref), t (ref)
	local var10 = 1
	local var11 = 1
	local var12 = false
	local var13 = nil
	local var14 = playersService.LocalPlayer.LocaleId:gsub("-", "_")
	local var15 = nil
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local text = url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", playersService.LocalPlayer.LocaleId:gsub("-", "_"))
	local var23 = httpService:RequestInternal({ Method = "GET", Url = text })
	local text_1 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
	local var25 = httpService:RequestInternal({ Method = "GET", Url = text_1 })
	local text_2 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
	local var27 = httpService:RequestInternal({ Method = "GET", Url = text_2 })
	local text_3 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
	local var29 = httpService:RequestInternal({ Method = "GET", Url = text_3 })
	
	local function _(p3, p4) --[[ line: 135 | named "tryGetErrorMessage" ]]
		local statusCode = nil
		
		if not p3 or not p4 or not p4.StatusCode then
			statusCode = "Connection error"
			
			return statusCode
		elseif p4.StatusCode == 401 then
			statusCode = "Unauthorized"
			
			return statusCode
		elseif p4.StatusCode < 200 or p4.StatusCode >= 400 then
			statusCode = p4.StatusCode
		end
		return statusCode
	end
	
	local function createSessionDormantLanguageSwitcherRow() --[[ line: 148 ]]
		-- upvalues: p0 (ref), utilityModule (copy), robloxTranslatorModule (copy), p1 (ref)
		local var32, var33, var34 = utilityModule:AddNewRow(p0, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
			robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
		}, 1)
		p0.LanguageSelectorFrame = var32
		p0.LanguageSelectorLabel = var33
		p0.LanguageSelectorMode = var34
		p0.LanguageSelectorMode:SetInteractable(false)
		p0.LanguageSelectorFrame.LayoutOrder = p1.LanguageSelectorFrame
	end
	
	local function userExperienceLanguageSettingsCallback(value, p5) --[[ line: 164 ]]
		-- upvalues: name (copy), createSessionDormantLanguageSwitcherRow (ref), t_2 (ref), var15 (write), var13 (write), t_6 (ref), t_3 (ref), t_1 (ref), var10 (write), var11 (write), p0 (ref), utilityModule (copy), robloxTranslatorModule (copy), p1 (ref), ugcLocaleFromGameJoinEnabledEngineFeature (copy), localPlayer (copy), p2 (ref), url (copy), httpService (copy), var12 (write), runService (copy)
		if value then
			local var35 = false
			
			for i, v in t_2 do
				if v == var15 then
					var35 = true
				end
				if v ~= var13 then
					table.insert(t_6, t_3[v].localeName)
				end
			end
			table.sort(t_6)
			
			if not (if var13 == nil or t_3[var13].localeName == nil then false else true) then
				createSessionDormantLanguageSwitcherRow()
				
				return
			end
			table.insert(t_6, 1, t_3[var13].localeName .. " (Original)")
			
			if var35 == true then
				for i_1, v_1 in t_6 do
					if i_1 ~= 1 and t_1[v_1] == var15 then
						var10 = i_1
						var11 = i_1
					end
				end
			end
			local var36, var37, var38 = utilityModule:AddNewRow(p0, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", t_6, var10)
			p0.LanguageSelectorFrame = var36
			p0.LanguageSelectorLabel = var37
			p0.LanguageSelectorMode = var38
			p0.LanguageSelectorFrame.LayoutOrder = p1.LanguageSelectorFrame
			
			if not ugcLocaleFromGameJoinEnabledEngineFeature then
				if var10 == 1 then
					localPlayer:SetExperienceSettingsLocaleId(var13)
				else
					localPlayer:SetExperienceSettingsLocaleId(t_1[t_6[var10]])
				end
			end
			p0.LanguageSelectorMode.CurrentLocale = p0.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
			p0.LanguageSelectorMode.IndexChanged:connect(function(p6) --[[ line: 252 | named "toggleTranslation" ]]
				-- upvalues: p0 (copy), t_3 (copy), var13 (copy), t_1 (copy), t_6 (copy), p2 (copy), url (copy), httpService (copy), var11 (copy), localPlayer (copy), name (copy), var12 (copy), runService (copy)
				p0.LanguageSelectorMode:SetInteractable(false)
				local _ = nil
				local var39 = if p6 == 1 and t_3[var13] ~= nil then t_3[var13].localeId else t_3[t_1[t_6[p6]]].localeId
				local currentLocale = p0.LanguageSelectorMode.CurrentLocale
				local var40 = t_6[p6]
				
				if currentLocale ~= var40 then
					p0.LanguageSelectorMode.CurrentLocale = var40
					p2("experience_locale", currentLocale, var40)
				end
				local text = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
				local var42 = httpService:RequestInternal({
					Method = "POST",
					Url = text,
					Headers = { ["Content-Type"] = "application/json" },
					Body = httpService:JSONEncode({
						settingValue = { settingType = "SupportedLocale", settingTargetId = var39 }
					})
				})
				
				local function userExperienceLanguageSettingsUpdateCallback(value, p7) --[[ line: 301 ]]
					-- upvalues: var11 (copy), p6 (ref), localPlayer (copy), var13 (copy), t_1 (copy), t_6 (copy), name (copy), var12 (copy), p0 (copy)
					if value then
						var11 = p6
						
						if p6 == 1 then
							localPlayer:SetExperienceSettingsLocaleId(var13)
						else
							localPlayer:SetExperienceSettingsLocaleId(t_1[t_6[p6]])
						end
					else
						name:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. p7)
						var12 = true
						p0.LanguageSelectorMode:SetSelectionIndex(var11)
					end
					p0.LanguageSelectorMode:SetInteractable(true)
				end
				
				if runService:IsStudio() then
					var11 = p6
					
					if p6 == 1 then
						localPlayer:SetExperienceSettingsLocaleId(var13)
					else
						localPlayer:SetExperienceSettingsLocaleId(t_1[t_6[p6]])
					end
					p0.LanguageSelectorMode:SetInteractable(true)
					
					return
				elseif var12 then
					var12 = false
					var11 = p6
					
					if p6 == 1 then
						localPlayer:SetExperienceSettingsLocaleId(var13)
					else
						localPlayer:SetExperienceSettingsLocaleId(t_1[t_6[p6]])
					end
					p0.LanguageSelectorMode:SetInteractable(true)
					
					return
				elseif var39 == nil then
					name:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. nil)
					var12 = true
					p0.LanguageSelectorMode:SetSelectionIndex(var11)
					p0.LanguageSelectorMode:SetInteractable(true)
					
					return
				end
				var42:Start(function(p8, p9) --[[ line: 345 ]]
					-- upvalues: name (copy), text (ref), userExperienceLanguageSettingsUpdateCallback (ref)
					local var44 = false
					local _ = nil
					local statusCode = nil
					
					if not p8 or not p9 or not p9.StatusCode then
						statusCode = "Connection error"
					elseif p9.StatusCode == 401 then
						statusCode = "Unauthorized"
					elseif p9.StatusCode < 200 or p9.StatusCode >= 400 then
						statusCode = p9.StatusCode
					end
					local var45 = statusCode
					
					if var45 == nil then
						name:info("User Experience Language Settings Update Request: " .. "Succeeded with code - " .. p9.StatusCode)
						var44 = true
					else
						var45 = "User Experience Language Settings Update Request: " .. var45
						name:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. text .. " with error message: " .. var45)
					end
					userExperienceLanguageSettingsUpdateCallback(var44, var45)
				end)
			end)
			
			return
		elseif p5 == nil then
			p5 = "Execution path did not set earliest error to non-nil value."
		end
		name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. p5)
		createSessionDormantLanguageSwitcherRow()
	end
	
	local _ = function(p10, p11) --[[ line: 374 | named "experienceSourceLanguageCallback" ]]
		-- upvalues: var29 (ref), httpService (copy), var15 (write), var14 (ref), var13 (write), t_5 (ref), t_4 (ref), name (copy), text_3 (ref), userExperienceLanguageSettingsCallback (ref), createSessionDormantLanguageSwitcherRow (ref)
		if p10 then
			var29:Start(function(p12, p13) --[[ line: 376 ]]
				-- upvalues: httpService (copy), var15 (copy), var14 (copy), var13 (copy), t_5 (copy), t_4 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
				local text
				local var47 = false
				local _ = nil
				local ok = nil
				
				if not p12 or not p13 or not p13.StatusCode then
					ok = "Connection error"
				elseif p13.StatusCode == 401 then
					ok = "Unauthorized"
				elseif p13.StatusCode < 200 or p13.StatusCode >= 400 then
					ok = p13.StatusCode
				end
				if ok == nil then
					ok, status = pcall(function() --[[ line: 385 ]]
						-- upvalues: httpService (copy), p13 (ref), var15 (copy), var14 (copy), var13 (copy), t_5 (copy), t_4 (copy)
						local userUniverseLocalizationSettingValue = httpService:JSONDecode(p13.Body).userUniverseLocalizationSettingValue
						
						if userUniverseLocalizationSettingValue == nil then
							var15 = var14
							
							return
						end
						local settingTargetId = userUniverseLocalizationSettingValue.settingTargetId
						local settingType = userUniverseLocalizationSettingValue.settingType
						
						if settingTargetId == nil then
							var15 = var14
						end
						if settingType == "SourceOrTranslation" then
							if settingTargetId == 1 then
								var15 = var13
								
								return
							end
							var15 = var14
							
							return
						elseif settingType == "LanguageFamily" then
							if t_5[settingTargetId] == nil then
								var15 = var14
								
								return
							end
							var15 = t_4[t_5[settingTargetId]]
							
							return
						elseif settingType == "SupportedLocale" then
							if t_4[settingTargetId] == nil then
								var15 = var14
								
								return
							end
							var15 = t_4[settingTargetId]
						end
					end)
					var47 = ok
					text = status
				else
					text = "User Experience Language Setting Get Request: " .. ok
				end
				if not var47 then
					name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. text)
				end
				userExperienceLanguageSettingsCallback(var47, text)
			end)
			
			return
		end
		local var46 = p11
		
		if var46 == nil then
			var46 = "Execution path did not set earliest error to non-nil value."
		end
		name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var46)
		createSessionDormantLanguageSwitcherRow()
	end
	
	local _ = function(p14, p15) --[[ line: 451 | named "experienceSupportedLanguagesCallback" ]]
		-- upvalues: var25 (ref), httpService (copy), var13 (write), t (copy), name (copy), text_1 (ref), var29 (ref), var15 (write), var14 (ref), t_5 (ref), t_4 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), createSessionDormantLanguageSwitcherRow (ref)
		if p14 then
			var25:Start(function(p16, p17) --[[ line: 453 ]]
				-- upvalues: httpService (copy), var13 (copy), t (copy), name (copy), text_1 (copy), p15 (write), p14 (ref), var29 (copy), var15 (copy), var14 (copy), t_5 (copy), t_4 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
				local text
				local var51 = false
				local _ = nil
				local ok = nil
				
				if not p16 or not p17 or not p17.StatusCode then
					ok = "Connection error"
				elseif p17.StatusCode == 401 then
					ok = "Unauthorized"
				elseif p17.StatusCode < 200 or p17.StatusCode >= 400 then
					ok = p17.StatusCode
				end
				if ok == nil then
					ok, status = pcall(function() --[[ line: 462 ]]
						-- upvalues: httpService (copy), p17 (ref), var13 (copy), t (copy)
						var13 = t[httpService:JSONDecode(p17.Body).languageCode]
					end)
					var51 = ok
					text = status
				else
					text = "Experience Source Language Request: " .. ok
				end
				if not var51 then
					name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. text)
				end
				if p15 == nil then
					p15 = text
				end
				local var54 = p15
				
				if var51 and p14 then
					var29:Start(function(p18, p19) --[[ line: 376 ]]
						-- upvalues: httpService (copy), var15 (copy), var14 (copy), var13 (copy), t_5 (copy), t_4 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
						local text
						local var47 = false
						local _ = nil
						local ok = nil
						
						if not p18 or not p19 or not p19.StatusCode then
							ok = "Connection error"
						elseif p19.StatusCode == 401 then
							ok = "Unauthorized"
						elseif p19.StatusCode < 200 or p19.StatusCode >= 400 then
							ok = p19.StatusCode
						end
						if ok == nil then
							ok, status = pcall(function() --[[ line: 385 ]]
								-- upvalues: httpService (copy), p19 (ref), var15 (copy), var14 (copy), var13 (copy), t_5 (copy), t_4 (copy)
								local userUniverseLocalizationSettingValue = httpService:JSONDecode(p19.Body).userUniverseLocalizationSettingValue
								
								if userUniverseLocalizationSettingValue == nil then
									var15 = var14
									
									return
								end
								local settingTargetId = userUniverseLocalizationSettingValue.settingTargetId
								local settingType = userUniverseLocalizationSettingValue.settingType
								
								if settingTargetId == nil then
									var15 = var14
								end
								if settingType == "SourceOrTranslation" then
									if settingTargetId == 1 then
										var15 = var13
										
										return
									end
									var15 = var14
									
									return
								elseif settingType == "LanguageFamily" then
									if t_5[settingTargetId] == nil then
										var15 = var14
										
										return
									end
									var15 = t_4[t_5[settingTargetId]]
									
									return
								elseif settingType == "SupportedLocale" then
									if t_4[settingTargetId] == nil then
										var15 = var14
										
										return
									end
									var15 = t_4[settingTargetId]
								end
							end)
							var47 = ok
							text = status
						else
							text = "User Experience Language Setting Get Request: " .. ok
						end
						if not var47 then
							name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. text)
						end
						userExperienceLanguageSettingsCallback(var47, text)
					end)
					
					return
				end
				local var55 = var54
				
				if var55 == nil then
					var55 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var55)
				createSessionDormantLanguageSwitcherRow()
			end)
		else
			local var50 = p15
			
			if var50 == nil then
				var50 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var50)
			createSessionDormantLanguageSwitcherRow()
		end
	end
	
	local _ = function(p20, p21) --[[ line: 493 | named "localeInformationCallback" ]]
		-- upvalues: var27 (ref), httpService (copy), t_3 (ref), t_2 (ref), name (copy), text_2 (ref), var25 (ref), var13 (write), t (copy), text_1 (ref), var29 (ref), var15 (write), var14 (ref), t_5 (ref), t_4 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), createSessionDormantLanguageSwitcherRow (ref)
		if p20 then
			var27:Start(function(p22, p23) --[[ line: 495 ]]
				-- upvalues: httpService (copy), t_3 (copy), t_2 (copy), name (copy), text_2 (copy), p21 (write), p20 (ref), var25 (copy), var13 (copy), t (copy), text_1 (copy), var29 (copy), var15 (copy), var14 (copy), t_5 (copy), t_4 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
				local text
				local var57 = false
				local _ = nil
				local ok = nil
				
				if not p22 or not p23 or not p23.StatusCode then
					ok = "Connection error"
				elseif p23.StatusCode == 401 then
					ok = "Unauthorized"
				elseif p23.StatusCode < 200 or p23.StatusCode >= 400 then
					ok = p23.StatusCode
				end
				if ok == nil then
					ok, status = pcall(function() --[[ line: 503 ]]
						-- upvalues: httpService (copy), p23 (ref), t_3 (copy), t_2 (copy)
						local t = {}
						
						for i, v in pairs(httpService:JSONDecode(p23.Body).data) do
							t[i] = v.languageCode
						end
						for i_1, v_1 in t do
							for i_2, v_2 in t_3 do
								if v_2.languageCode == v_1 then
									table.insert(t_2, i_2)
								end
							end
						end
					end)
					var57 = ok
					text = status
				else
					text = "Experience Supported Language Language Request: " .. ok
				end
				if not var57 then
					name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. text)
				end
				if p21 == nil then
					p21 = text
				end
				local p20_1 = var57 and p20
				local var61 = p21
				
				if p20_1 then
					var25:Start(function(p24, p25) --[[ line: 453 ]]
						-- upvalues: httpService (copy), var13 (copy), t (copy), name (copy), text_1 (copy), var61 (write), p20_1 (ref), var29 (copy), var15 (copy), var14 (copy), t_5 (copy), t_4 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
						local text
						local var51 = false
						local _ = nil
						local ok = nil
						
						if not p24 or not p25 or not p25.StatusCode then
							ok = "Connection error"
						elseif p25.StatusCode == 401 then
							ok = "Unauthorized"
						elseif p25.StatusCode < 200 or p25.StatusCode >= 400 then
							ok = p25.StatusCode
						end
						if ok == nil then
							ok, status = pcall(function() --[[ line: 462 ]]
								-- upvalues: httpService (copy), p25 (ref), var13 (copy), t (copy)
								var13 = t[httpService:JSONDecode(p25.Body).languageCode]
							end)
							var51 = ok
							text = status
						else
							text = "Experience Source Language Request: " .. ok
						end
						if not var51 then
							name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. text)
						end
						if p15 == nil then
							p15 = text
						end
						if var51 and p20_1 then
							var29:Start(function(p26, p27) --[[ line: 376 ]]
								-- upvalues: httpService (copy), var15 (copy), var14 (copy), var13 (copy), t_5 (copy), t_4 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
								local text
								local var47 = false
								local _ = nil
								local ok = nil
								
								if not p26 or not p27 or not p27.StatusCode then
									ok = "Connection error"
								elseif p27.StatusCode == 401 then
									ok = "Unauthorized"
								elseif p27.StatusCode < 200 or p27.StatusCode >= 400 then
									ok = p27.StatusCode
								end
								if ok == nil then
									ok, status = pcall(function() --[[ line: 385 ]]
										-- upvalues: httpService (copy), p27 (ref), var15 (copy), var14 (copy), var13 (copy), t_5 (copy), t_4 (copy)
										local userUniverseLocalizationSettingValue = httpService:JSONDecode(p27.Body).userUniverseLocalizationSettingValue
										
										if userUniverseLocalizationSettingValue == nil then
											var15 = var14
											
											return
										end
										local settingTargetId = userUniverseLocalizationSettingValue.settingTargetId
										local settingType = userUniverseLocalizationSettingValue.settingType
										
										if settingTargetId == nil then
											var15 = var14
										end
										if settingType == "SourceOrTranslation" then
											if settingTargetId == 1 then
												var15 = var13
												
												return
											end
											var15 = var14
											
											return
										elseif settingType == "LanguageFamily" then
											if t_5[settingTargetId] == nil then
												var15 = var14
												
												return
											end
											var15 = t_4[t_5[settingTargetId]]
											
											return
										elseif settingType == "SupportedLocale" then
											if t_4[settingTargetId] == nil then
												var15 = var14
												
												return
											end
											var15 = t_4[settingTargetId]
										end
									end)
									var47 = ok
									text = status
								else
									text = "User Experience Language Setting Get Request: " .. ok
								end
								if not var47 then
									name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. text)
								end
								userExperienceLanguageSettingsCallback(var47, text)
							end)
							
							return
						end
						local var55 = p15
						
						if var55 == nil then
							var55 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var55)
						createSessionDormantLanguageSwitcherRow()
					end)
				else
					local var62 = var61
					
					if var62 == nil then
						var62 = "Execution path did not set earliest error to non-nil value."
					end
					name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var62)
					createSessionDormantLanguageSwitcherRow()
				end
			end)
		else
			local var56 = p21
			
			if var56 == nil then
				var56 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var56)
			createSessionDormantLanguageSwitcherRow()
		end
	end
	
	var23:Start(function(p28, p29) --[[ line: 542 ]]
		-- upvalues: httpService (copy), t (copy), t_5 (ref), t_3 (ref), t_4 (ref), t_1 (ref), name (copy), text (ref), var27 (ref), t_2 (ref), text_2 (ref), var25 (ref), var13 (write), text_1 (ref), var29 (ref), var15 (write), var14 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), createSessionDormantLanguageSwitcherRow (ref)
		local text_4
		local var64 = false
		local _ = nil
		local ok = nil
		
		if not p28 or not p29 or not p29.StatusCode then
			ok = "Connection error"
		elseif p29.StatusCode == 401 then
			ok = "Unauthorized"
		elseif p29.StatusCode < 200 or p29.StatusCode >= 400 then
			ok = p29.StatusCode
		end
		if ok == nil then
			ok, status = pcall(function() --[[ line: 551 ]]
				-- upvalues: httpService (copy), p29 (ref), t (copy), t_5 (copy), t_3 (copy), t_4 (copy), t_1 (copy)
				for i, v in pairs(httpService:JSONDecode(p29.Body).data) do
					local languageCode = v.locale.language.languageCode
					local id = v.locale.language.id
					local name = v.locale.language.name
					local locale = v.locale.locale
					local id_1 = v.locale.id
					local name_1 = v.locale.name
					
					if t[languageCode] == locale then
						t_5[id] = id_1
					end
					t_3[locale] = {
						localeName = name_1,
						localeId = id_1,
						languageName = name,
						languageId = id,
						languageCode = languageCode
					}
					t_4[id_1] = locale
					t_1[name_1] = locale
				end
			end)
			var64 = ok
			text_4 = status
		else
			text_4 = "Locale Information Request: " .. ok
		end
		if not var64 then
			name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text .. " with error message: " .. text_4)
		end
		local var67 = text_4
		
		if var64 then
			var27:Start(function(p30, p31) --[[ line: 495 ]]
				-- upvalues: httpService (copy), t_3 (copy), t_2 (copy), name (copy), text_2 (copy), var67 (write), var64 (ref), var25 (copy), var13 (copy), t (copy), text_1 (copy), var29 (copy), var15 (copy), var14 (copy), t_5 (copy), t_4 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
				local text
				local var57 = false
				local _ = nil
				local ok = nil
				
				if not p30 or not p31 or not p31.StatusCode then
					ok = "Connection error"
				elseif p31.StatusCode == 401 then
					ok = "Unauthorized"
				elseif p31.StatusCode < 200 or p31.StatusCode >= 400 then
					ok = p31.StatusCode
				end
				if ok == nil then
					ok, status = pcall(function() --[[ line: 503 ]]
						-- upvalues: httpService (copy), p31 (ref), t_3 (copy), t_2 (copy)
						local t = {}
						
						for i, v in pairs(httpService:JSONDecode(p31.Body).data) do
							t[i] = v.languageCode
						end
						for i_1, v_1 in t do
							for i_2, v_2 in t_3 do
								if v_2.languageCode == v_1 then
									table.insert(t_2, i_2)
								end
							end
						end
					end)
					var57 = ok
					text = status
				else
					text = "Experience Supported Language Language Request: " .. ok
				end
				if not var57 then
					name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. text)
				end
				if p21 == nil then
					p21 = text
				end
				local p20_1 = var57 and var64
				
				if p20_1 then
					var25:Start(function(p32, p33) --[[ line: 453 ]]
						-- upvalues: httpService (copy), var13 (copy), t (copy), name (copy), text_1 (copy), p21 (write), p20_1 (ref), var29 (copy), var15 (copy), var14 (copy), t_5 (copy), t_4 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
						local text
						local var51 = false
						local _ = nil
						local ok = nil
						
						if not p32 or not p33 or not p33.StatusCode then
							ok = "Connection error"
						elseif p33.StatusCode == 401 then
							ok = "Unauthorized"
						elseif p33.StatusCode < 200 or p33.StatusCode >= 400 then
							ok = p33.StatusCode
						end
						if ok == nil then
							ok, status = pcall(function() --[[ line: 462 ]]
								-- upvalues: httpService (copy), p33 (ref), var13 (copy), t (copy)
								var13 = t[httpService:JSONDecode(p33.Body).languageCode]
							end)
							var51 = ok
							text = status
						else
							text = "Experience Source Language Request: " .. ok
						end
						if not var51 then
							name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. text)
						end
						if p15 == nil then
							p15 = text
						end
						if var51 and p20_1 then
							var29:Start(function(p34, p35) --[[ line: 376 ]]
								-- upvalues: httpService (copy), var15 (copy), var14 (copy), var13 (copy), t_5 (copy), t_4 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
								local text
								local var47 = false
								local _ = nil
								local ok = nil
								
								if not p34 or not p35 or not p35.StatusCode then
									ok = "Connection error"
								elseif p35.StatusCode == 401 then
									ok = "Unauthorized"
								elseif p35.StatusCode < 200 or p35.StatusCode >= 400 then
									ok = p35.StatusCode
								end
								if ok == nil then
									ok, status = pcall(function() --[[ line: 385 ]]
										-- upvalues: httpService (copy), p35 (ref), var15 (copy), var14 (copy), var13 (copy), t_5 (copy), t_4 (copy)
										local userUniverseLocalizationSettingValue = httpService:JSONDecode(p35.Body).userUniverseLocalizationSettingValue
										
										if userUniverseLocalizationSettingValue == nil then
											var15 = var14
											
											return
										end
										local settingTargetId = userUniverseLocalizationSettingValue.settingTargetId
										local settingType = userUniverseLocalizationSettingValue.settingType
										
										if settingTargetId == nil then
											var15 = var14
										end
										if settingType == "SourceOrTranslation" then
											if settingTargetId == 1 then
												var15 = var13
												
												return
											end
											var15 = var14
											
											return
										elseif settingType == "LanguageFamily" then
											if t_5[settingTargetId] == nil then
												var15 = var14
												
												return
											end
											var15 = t_4[t_5[settingTargetId]]
											
											return
										elseif settingType == "SupportedLocale" then
											if t_4[settingTargetId] == nil then
												var15 = var14
												
												return
											end
											var15 = t_4[settingTargetId]
										end
									end)
									var47 = ok
									text = status
								else
									text = "User Experience Language Setting Get Request: " .. ok
								end
								if not var47 then
									name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. text)
								end
								userExperienceLanguageSettingsCallback(var47, text)
							end)
							
							return
						end
						local var55 = p15
						
						if var55 == nil then
							var55 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var55)
						createSessionDormantLanguageSwitcherRow()
					end)
				else
					local var62 = p21
					
					if var62 == nil then
						var62 = "Execution path did not set earliest error to non-nil value."
					end
					name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var62)
					createSessionDormantLanguageSwitcherRow()
				end
			end)
		else
			local var68 = var67
			
			if var68 == nil then
				var68 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var68)
			createSessionDormantLanguageSwitcherRow()
		end
	end)
end