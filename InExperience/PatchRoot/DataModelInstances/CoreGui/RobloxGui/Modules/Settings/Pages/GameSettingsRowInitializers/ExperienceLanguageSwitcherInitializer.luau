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

return function(p1, p2, p3)
	-- upvalues: playersService (ref), url (ref), httpService (ref), utilityModule (ref), robloxTranslatorModule (ref), name (ref), ugcLocaleFromGameJoinEnabledEngineFeature (ref), localPlayer (ref), runService (ref), t (ref)
	local var1 = 1
	local var2 = 1
	local var3 = false
	local var4 = nil
	local var5 = playersService.LocalPlayer.LocaleId:gsub("-", "_")
	local var6 = nil
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local text = url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", playersService.LocalPlayer.LocaleId:gsub("-", "_"))
	local var7 = httpService:RequestInternal({ Method = "GET", Url = text })
	local text_1 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
	local var8 = httpService:RequestInternal({ Method = "GET", Url = text_1 })
	local text_2 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
	local var9 = httpService:RequestInternal({ Method = "GET", Url = text_2 })
	local text_3 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
	local var10 = httpService:RequestInternal({ Method = "GET", Url = text_3 })
	
	local function _(p4, p5)
		local statusCode = nil
		
		if not p4 or not p5 or not p5.StatusCode then
			statusCode = "Connection error"
			
			return statusCode
		elseif p5.StatusCode == 401 then
			statusCode = "Unauthorized"
			
			return statusCode
		elseif p5.StatusCode < 200 or p5.StatusCode >= 400 then
			statusCode = p5.StatusCode
		end
		return statusCode
	end
	
	local function createSessionDormantLanguageSwitcherRow()
		-- upvalues: p1 (ref), utilityModule (copy), robloxTranslatorModule (copy), p2 (ref)
		local var11, var12, var13 = utilityModule:AddNewRow(p1, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
			robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
		}, 1)
		p1.LanguageSelectorFrame = var11
		p1.LanguageSelectorLabel = var12
		p1.LanguageSelectorMode = var13
		p1.LanguageSelectorMode:SetInteractable(false)
		p1.LanguageSelectorFrame.LayoutOrder = p2.LanguageSelectorFrame
	end
	
	local function userExperienceLanguageSettingsCallback(value, p4)
		-- upvalues: name (copy), createSessionDormantLanguageSwitcherRow (ref), t_2 (ref), var6 (write), var4 (write), t_6 (ref), t_3 (ref), t_1 (ref), var1 (write), var2 (write), p1 (ref), utilityModule (copy), robloxTranslatorModule (copy), p2 (ref), ugcLocaleFromGameJoinEnabledEngineFeature (copy), localPlayer (copy), p3 (ref), url (copy), httpService (copy), var3 (write), runService (copy)
		if value then
			local var11 = false
			
			for i, v in t_2 do
				if v == var6 then
					var11 = true
				end
				if v ~= var4 then
					table.insert(t_6, t_3[v].localeName)
				end
			end
			table.sort(t_6)
			
			if not (if var4 == nil or t_3[var4].localeName == nil then false else true) then
				createSessionDormantLanguageSwitcherRow()
				
				return
			end
			table.insert(t_6, 1, t_3[var4].localeName .. " (Original)")
			
			if var11 == true then
				for i_1, v_1 in t_6 do
					if i_1 ~= 1 and t_1[v_1] == var6 then
						var1 = i_1
						var2 = i_1
					end
				end
			end
			local var12, var13, var14 = utilityModule:AddNewRow(p1, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", t_6, var1)
			p1.LanguageSelectorFrame = var12
			p1.LanguageSelectorLabel = var13
			p1.LanguageSelectorMode = var14
			p1.LanguageSelectorFrame.LayoutOrder = p2.LanguageSelectorFrame
			
			if not ugcLocaleFromGameJoinEnabledEngineFeature then
				if var1 == 1 then
					localPlayer:SetExperienceSettingsLocaleId(var4)
				else
					localPlayer:SetExperienceSettingsLocaleId(t_1[t_6[var1]])
				end
			end
			p1.LanguageSelectorMode.CurrentLocale = p1.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
			p1.LanguageSelectorMode.IndexChanged:connect(function(p5)
				-- upvalues: p1 (copy), t_3 (copy), var4 (copy), t_1 (copy), t_6 (copy), p3 (copy), url (copy), httpService (copy), var2 (copy), localPlayer (copy), name (copy), var3 (copy), runService (copy)
				p1.LanguageSelectorMode:SetInteractable(false)
				local _ = nil
				local var15 = if p5 == 1 and t_3[var4] ~= nil then t_3[var4].localeId else t_3[t_1[t_6[p5]]].localeId
				local currentLocale = p1.LanguageSelectorMode.CurrentLocale
				local var16 = t_6[p5]
				
				if currentLocale ~= var16 then
					p1.LanguageSelectorMode.CurrentLocale = var16
					p3("experience_locale", currentLocale, var16)
				end
				local text = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
				local var17 = httpService:RequestInternal({
					Method = "POST",
					Url = text,
					Headers = { ["Content-Type"] = "application/json" },
					Body = httpService:JSONEncode({
						settingValue = { settingType = "SupportedLocale", settingTargetId = var15 }
					})
				})
				
				local function userExperienceLanguageSettingsUpdateCallback(value, p6)
					-- upvalues: var2 (copy), p5 (ref), localPlayer (copy), var4 (copy), t_1 (copy), t_6 (copy), name (copy), var3 (copy), p1 (copy)
					if value then
						var2 = p5
						
						if p5 == 1 then
							localPlayer:SetExperienceSettingsLocaleId(var4)
						else
							localPlayer:SetExperienceSettingsLocaleId(t_1[t_6[p5]])
						end
					else
						name:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. p7)
						var3 = true
						p1.LanguageSelectorMode:SetSelectionIndex(var2)
					end
					p1.LanguageSelectorMode:SetInteractable(true)
				end
				
				if runService:IsStudio() then
					var2 = p5
					
					if p5 == 1 then
						localPlayer:SetExperienceSettingsLocaleId(var4)
					else
						localPlayer:SetExperienceSettingsLocaleId(t_1[t_6[p5]])
					end
					p1.LanguageSelectorMode:SetInteractable(true)
					
					return
				elseif var3 then
					var3 = false
					var2 = p5
					
					if p5 == 1 then
						localPlayer:SetExperienceSettingsLocaleId(var4)
					else
						localPlayer:SetExperienceSettingsLocaleId(t_1[t_6[p5]])
					end
					p1.LanguageSelectorMode:SetInteractable(true)
					
					return
				elseif var15 == nil then
					name:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. nil)
					var3 = true
					p1.LanguageSelectorMode:SetSelectionIndex(var2)
					p1.LanguageSelectorMode:SetInteractable(true)
					
					return
				end
				var17:Start(function(p6, p7)
					-- upvalues: name (copy), text (ref), userExperienceLanguageSettingsUpdateCallback (ref)
					local var18 = false
					local _ = nil
					local statusCode = nil
					
					if not p6 or not p7 or not p7.StatusCode then
						statusCode = "Connection error"
					elseif p7.StatusCode == 401 then
						statusCode = "Unauthorized"
					elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then
						statusCode = p7.StatusCode
					end
					local var19 = statusCode
					
					if var19 == nil then
						name:info("User Experience Language Settings Update Request: " .. "Succeeded with code - " .. p9.StatusCode)
						var18 = true
					else
						var19 = "User Experience Language Settings Update Request: " .. var45
						name:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. text .. " with error message: " .. var45)
					end
					userExperienceLanguageSettingsUpdateCallback(var18, var19)
				end)
			end)
			
			return
		elseif p4 == nil then
			p4 = "Execution path did not set earliest error to non-nil value."
		end
		name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. p5)
		createSessionDormantLanguageSwitcherRow()
	end
	
	local _ = function(p5, p6)
		-- upvalues: var10 (ref), httpService (copy), var6 (write), var5 (ref), var4 (write), t_5 (ref), t_4 (ref), name (copy), text_3 (ref), userExperienceLanguageSettingsCallback (ref), createSessionDormantLanguageSwitcherRow (ref)
		if p5 then
			var10:Start(function(p7, p8)
				-- upvalues: httpService (copy), var6 (copy), var5 (copy), var4 (copy), t_5 (copy), t_4 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
				local text
				local var15 = false
				local _ = nil
				local ok = nil
				
				if not p7 or not p8 or not p8.StatusCode then
					ok = "Connection error"
				elseif p8.StatusCode == 401 then
					ok = "Unauthorized"
				elseif p8.StatusCode < 200 or p8.StatusCode >= 400 then
					ok = p8.StatusCode
				end
				if ok == nil then
					ok, status = pcall(function()
						-- upvalues: httpService (copy), p8 (ref), var6 (copy), var5 (copy), var4 (copy), t_5 (copy), t_4 (copy)
						local userUniverseLocalizationSettingValue = httpService:JSONDecode(p8.Body).userUniverseLocalizationSettingValue
						
						if userUniverseLocalizationSettingValue == nil then
							var6 = var5
							
							return
						end
						local settingTargetId = userUniverseLocalizationSettingValue.settingTargetId
						local settingType = userUniverseLocalizationSettingValue.settingType
						
						if settingTargetId == nil then
							var6 = var5
						end
						if settingType == "SourceOrTranslation" then
							if settingTargetId == 1 then
								var6 = var4
								
								return
							end
							var6 = var5
							
							return
						elseif settingType == "LanguageFamily" then
							if t_5[settingTargetId] == nil then
								var6 = var5
								
								return
							end
							var6 = t_4[t_5[settingTargetId]]
							
							return
						elseif settingType == "SupportedLocale" then
							if t_4[settingTargetId] == nil then
								var6 = var5
								
								return
							end
							var6 = t_4[settingTargetId]
						end
					end)
					var15 = ok
					text = status
				else
					text = "User Experience Language Setting Get Request: " .. ok
				end
				if not var15 then
					name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. text)
				end
				userExperienceLanguageSettingsCallback(var15, text)
			end)
			
			return
		end
		local var15 = p6
		
		if var15 == nil then
			var15 = "Execution path did not set earliest error to non-nil value."
		end
		name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var46)
		createSessionDormantLanguageSwitcherRow()
	end
	
	local _ = function(p5, p6)
		-- upvalues: var8 (ref), httpService (copy), var4 (write), t (copy), name (copy), text_1 (ref), var10 (ref), var6 (write), var5 (ref), t_5 (ref), t_4 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), createSessionDormantLanguageSwitcherRow (ref)
		if p5 then
			var8:Start(function(p7, p8)
				-- upvalues: httpService (copy), var4 (copy), t (copy), name (copy), text_1 (copy), p6 (write), p5 (ref), var10 (copy), var6 (copy), var5 (copy), t_5 (copy), t_4 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
				local text
				local var15 = false
				local _ = nil
				local ok = nil
				
				if not p7 or not p8 or not p8.StatusCode then
					ok = "Connection error"
				elseif p8.StatusCode == 401 then
					ok = "Unauthorized"
				elseif p8.StatusCode < 200 or p8.StatusCode >= 400 then
					ok = p8.StatusCode
				end
				if ok == nil then
					ok, status = pcall(function()
						-- upvalues: httpService (copy), p8 (ref), var4 (copy), t (copy)
						var4 = t[httpService:JSONDecode(p8.Body).languageCode]
					end)
					var15 = ok
					text = status
				else
					text = "Experience Source Language Request: " .. ok
				end
				if not var15 then
					name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. text)
				end
				if p6 == nil then
					p6 = text
				end
				local var16 = p6
				
				if var15 and p5 then
					var10:Start(function(p9, p10)
						-- upvalues: httpService (copy), var6 (copy), var5 (copy), var4 (copy), t_5 (copy), t_4 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
						local text
						local var17 = false
						local _ = nil
						local ok = nil
						
						if not p9 or not p10 or not p10.StatusCode then
							ok = "Connection error"
						elseif p10.StatusCode == 401 then
							ok = "Unauthorized"
						elseif p10.StatusCode < 200 or p10.StatusCode >= 400 then
							ok = p10.StatusCode
						end
						if ok == nil then
							ok, status = pcall(function()
								-- upvalues: httpService (copy), p10 (ref), var6 (copy), var5 (copy), var4 (copy), t_5 (copy), t_4 (copy)
								local userUniverseLocalizationSettingValue = httpService:JSONDecode(p10.Body).userUniverseLocalizationSettingValue
								
								if userUniverseLocalizationSettingValue == nil then
									var6 = var5
									
									return
								end
								local settingTargetId = userUniverseLocalizationSettingValue.settingTargetId
								local settingType = userUniverseLocalizationSettingValue.settingType
								
								if settingTargetId == nil then
									var6 = var5
								end
								if settingType == "SourceOrTranslation" then
									if settingTargetId == 1 then
										var6 = var4
										
										return
									end
									var6 = var5
									
									return
								elseif settingType == "LanguageFamily" then
									if t_5[settingTargetId] == nil then
										var6 = var5
										
										return
									end
									var6 = t_4[t_5[settingTargetId]]
									
									return
								elseif settingType == "SupportedLocale" then
									if t_4[settingTargetId] == nil then
										var6 = var5
										
										return
									end
									var6 = t_4[settingTargetId]
								end
							end)
							var17 = ok
							text = status
						else
							text = "User Experience Language Setting Get Request: " .. ok
						end
						if not var17 then
							name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. text)
						end
						userExperienceLanguageSettingsCallback(var17, text)
					end)
					
					return
				end
				local var17 = var16
				
				if var17 == nil then
					var17 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var55)
				createSessionDormantLanguageSwitcherRow()
			end)
		else
			local var15 = p6
			
			if var15 == nil then
				var15 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var50)
			createSessionDormantLanguageSwitcherRow()
		end
	end
	
	local _ = function(p5, p6)
		-- upvalues: var9 (ref), httpService (copy), t_3 (ref), t_2 (ref), name (copy), text_2 (ref), var8 (ref), var4 (write), t (copy), text_1 (ref), var10 (ref), var6 (write), var5 (ref), t_5 (ref), t_4 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), createSessionDormantLanguageSwitcherRow (ref)
		if p5 then
			var9:Start(function(p7, p8)
				-- upvalues: httpService (copy), t_3 (copy), t_2 (copy), name (copy), text_2 (copy), p6 (write), p5 (ref), var8 (copy), var4 (copy), t (copy), text_1 (copy), var10 (copy), var6 (copy), var5 (copy), t_5 (copy), t_4 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
				local text
				local var15 = false
				local _ = nil
				local ok = nil
				
				if not p7 or not p8 or not p8.StatusCode then
					ok = "Connection error"
				elseif p8.StatusCode == 401 then
					ok = "Unauthorized"
				elseif p8.StatusCode < 200 or p8.StatusCode >= 400 then
					ok = p8.StatusCode
				end
				if ok == nil then
					ok, status = pcall(function()
						-- upvalues: httpService (copy), p8 (ref), t_3 (copy), t_2 (copy)
						local t = {}
						
						for i, v in pairs(httpService:JSONDecode(p8.Body).data) do
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
					var15 = ok
					text = status
				else
					text = "Experience Supported Language Language Request: " .. ok
				end
				if not var15 then
					name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. text)
				end
				if p6 == nil then
					p6 = text
				end
				local p9 = var15 and p5
				local var16 = p6
				
				if p9 then
					var8:Start(function(p10, p11)
						-- upvalues: httpService (copy), var4 (copy), t (copy), name (copy), text_1 (copy), var16 (write), p9 (ref), var10 (copy), var6 (copy), var5 (copy), t_5 (copy), t_4 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
						local text
						local var17 = false
						local _ = nil
						local ok = nil
						
						if not p10 or not p11 or not p11.StatusCode then
							ok = "Connection error"
						elseif p11.StatusCode == 401 then
							ok = "Unauthorized"
						elseif p11.StatusCode < 200 or p11.StatusCode >= 400 then
							ok = p11.StatusCode
						end
						if ok == nil then
							ok, status = pcall(function()
								-- upvalues: httpService (copy), p11 (ref), var4 (copy), t (copy)
								var4 = t[httpService:JSONDecode(p11.Body).languageCode]
							end)
							var17 = ok
							text = status
						else
							text = "Experience Source Language Request: " .. ok
						end
						if not var17 then
							name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. text)
						end
						if p15 == nil then
							p15 = text
						end
						if var17 and p9 then
							var10:Start(function(p12, p13)
								-- upvalues: httpService (copy), var6 (copy), var5 (copy), var4 (copy), t_5 (copy), t_4 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
								local text
								local var18 = false
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
									ok, status = pcall(function()
										-- upvalues: httpService (copy), p13 (ref), var6 (copy), var5 (copy), var4 (copy), t_5 (copy), t_4 (copy)
										local userUniverseLocalizationSettingValue = httpService:JSONDecode(p13.Body).userUniverseLocalizationSettingValue
										
										if userUniverseLocalizationSettingValue == nil then
											var6 = var5
											
											return
										end
										local settingTargetId = userUniverseLocalizationSettingValue.settingTargetId
										local settingType = userUniverseLocalizationSettingValue.settingType
										
										if settingTargetId == nil then
											var6 = var5
										end
										if settingType == "SourceOrTranslation" then
											if settingTargetId == 1 then
												var6 = var4
												
												return
											end
											var6 = var5
											
											return
										elseif settingType == "LanguageFamily" then
											if t_5[settingTargetId] == nil then
												var6 = var5
												
												return
											end
											var6 = t_4[t_5[settingTargetId]]
											
											return
										elseif settingType == "SupportedLocale" then
											if t_4[settingTargetId] == nil then
												var6 = var5
												
												return
											end
											var6 = t_4[settingTargetId]
										end
									end)
									var18 = ok
									text = status
								else
									text = "User Experience Language Setting Get Request: " .. ok
								end
								if not var18 then
									name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. text)
								end
								userExperienceLanguageSettingsCallback(var18, text)
							end)
							
							return
						end
						local var18 = p15
						
						if var18 == nil then
							var18 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var55)
						createSessionDormantLanguageSwitcherRow()
					end)
				else
					local var17 = var16
					
					if var17 == nil then
						var17 = "Execution path did not set earliest error to non-nil value."
					end
					name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var62)
					createSessionDormantLanguageSwitcherRow()
				end
			end)
		else
			local var18 = p6
			
			if var18 == nil then
				var18 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var56)
			createSessionDormantLanguageSwitcherRow()
		end
	end
	
	var7:Start(function(p9, p10)
		-- upvalues: httpService (copy), t (copy), t_5 (ref), t_3 (ref), t_4 (ref), t_1 (ref), name (copy), text (ref), var9 (ref), t_2 (ref), text_2 (ref), var8 (ref), var4 (write), text_1 (ref), var10 (ref), var6 (write), var5 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), createSessionDormantLanguageSwitcherRow (ref)
		local text_4
		local var16 = false
		local _ = nil
		local ok = nil
		
		if not p9 or not p10 or not p10.StatusCode then
			ok = "Connection error"
		elseif p10.StatusCode == 401 then
			ok = "Unauthorized"
		elseif p10.StatusCode < 200 or p10.StatusCode >= 400 then
			ok = p10.StatusCode
		end
		if ok == nil then
			ok, status = pcall(function()
				-- upvalues: httpService (copy), p10 (ref), t (copy), t_5 (copy), t_3 (copy), t_4 (copy), t_1 (copy)
				for i, v in pairs(httpService:JSONDecode(p10.Body).data) do
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
			var16 = ok
			text_4 = status
		else
			text_4 = "Locale Information Request: " .. ok
		end
		if not var16 then
			name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text .. " with error message: " .. text_4)
		end
		local var17 = text_4
		
		if var16 then
			var9:Start(function(p11, p12)
				-- upvalues: httpService (copy), t_3 (copy), t_2 (copy), name (copy), text_2 (copy), var17 (write), var16 (ref), var8 (copy), var4 (copy), t (copy), text_1 (copy), var10 (copy), var6 (copy), var5 (copy), t_5 (copy), t_4 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
				local text
				local var18 = false
				local _ = nil
				local ok = nil
				
				if not p11 or not p12 or not p12.StatusCode then
					ok = "Connection error"
				elseif p12.StatusCode == 401 then
					ok = "Unauthorized"
				elseif p12.StatusCode < 200 or p12.StatusCode >= 400 then
					ok = p12.StatusCode
				end
				if ok == nil then
					ok, status = pcall(function()
						-- upvalues: httpService (copy), p12 (ref), t_3 (copy), t_2 (copy)
						local t = {}
						
						for i, v in pairs(httpService:JSONDecode(p12.Body).data) do
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
					var18 = ok
					text = status
				else
					text = "Experience Supported Language Language Request: " .. ok
				end
				if not var18 then
					name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. text)
				end
				if p6 == nil then
					p6 = text
				end
				local p13 = var18 and var16
				
				if p13 then
					var8:Start(function(p14, p15)
						-- upvalues: httpService (copy), var4 (copy), t (copy), name (copy), text_1 (copy), p6 (write), p13 (ref), var10 (copy), var6 (copy), var5 (copy), t_5 (copy), t_4 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), createSessionDormantLanguageSwitcherRow (copy)
						local text
						local var19 = false
						local _ = nil
						local ok = nil
						
						if not p14 or not p15 or not p15.StatusCode then
							ok = "Connection error"
						elseif p15.StatusCode == 401 then
							ok = "Unauthorized"
						elseif p15.StatusCode < 200 or p15.StatusCode >= 400 then
							ok = p15.StatusCode
						end
						if ok == nil then
							ok, status = pcall(function()
								-- upvalues: httpService (copy), p15 (ref), var4 (copy), t (copy)
								var4 = t[httpService:JSONDecode(p15.Body).languageCode]
							end)
							var19 = ok
							text = status
						else
							text = "Experience Source Language Request: " .. ok
						end
						if not var19 then
							name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. text)
						end
						if p15 == nil then
							p15 = text
						end
						if var19 and p13 then
							var10:Start(function(p16, p17)
								-- upvalues: httpService (copy), var6 (copy), var5 (copy), var4 (copy), t_5 (copy), t_4 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
								local text
								local var20 = false
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
									ok, status = pcall(function()
										-- upvalues: httpService (copy), p17 (ref), var6 (copy), var5 (copy), var4 (copy), t_5 (copy), t_4 (copy)
										local userUniverseLocalizationSettingValue = httpService:JSONDecode(p17.Body).userUniverseLocalizationSettingValue
										
										if userUniverseLocalizationSettingValue == nil then
											var6 = var5
											
											return
										end
										local settingTargetId = userUniverseLocalizationSettingValue.settingTargetId
										local settingType = userUniverseLocalizationSettingValue.settingType
										
										if settingTargetId == nil then
											var6 = var5
										end
										if settingType == "SourceOrTranslation" then
											if settingTargetId == 1 then
												var6 = var4
												
												return
											end
											var6 = var5
											
											return
										elseif settingType == "LanguageFamily" then
											if t_5[settingTargetId] == nil then
												var6 = var5
												
												return
											end
											var6 = t_4[t_5[settingTargetId]]
											
											return
										elseif settingType == "SupportedLocale" then
											if t_4[settingTargetId] == nil then
												var6 = var5
												
												return
											end
											var6 = t_4[settingTargetId]
										end
									end)
									var20 = ok
									text = status
								else
									text = "User Experience Language Setting Get Request: " .. ok
								end
								if not var20 then
									name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. text)
								end
								userExperienceLanguageSettingsCallback(var20, text)
							end)
							
							return
						end
						local var20 = p15
						
						if var20 == nil then
							var20 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var55)
						createSessionDormantLanguageSwitcherRow()
					end)
				else
					local var19 = p6
					
					if var19 == nil then
						var19 = "Execution path did not set earliest error to non-nil value."
					end
					name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var62)
					createSessionDormantLanguageSwitcherRow()
				end
			end)
		else
			local var20 = var17
			
			if var20 == nil then
				var20 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var68)
			createSessionDormantLanguageSwitcherRow()
		end
	end)
end