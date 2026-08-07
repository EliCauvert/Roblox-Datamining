local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local appStorageService = game:GetService("AppStorageService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local textService = game:GetService("TextService")
local tweenService = game:GetService("TweenService")
local images = require(corePackagesService.Packages.InGameMenuDependencies).UIBlox.App.ImageSet.Images
local modules = coreGuiService.RobloxGui.Modules
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local default = require(modules.VoiceChat.VoiceChatServiceManager).default
local constantsModule = require(modules.VoiceChat.Constants)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local _ = builderIconsModule.Migration
local getFFlagVoiceUserAgencyEnableIXPModule = require(modules.Flags.GetFFlagVoiceUserAgencyEnableIXP)
local getFStringVoiceUserAgencyIXPLayerNameModule = require(modules.Flags.GetFStringVoiceUserAgencyIXPLayerName)
local fFlagManuallyMigrateDeprecatedIconUsage = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagManuallyMigrateDeprecatedIconUsage
local voiceUserAgencyAlertInitTimeOffset = game:DefineFastInt("VoiceUserAgencyAlertInitTimeOffset", 5)
local voiceUserAgencyAlertStartTimeOffset = game:DefineFastInt("VoiceUserAgencyAlertStartTimeOffset", 3)
local voiceUserAgencyAlertTimerDuration = game:DefineFastInt("VoiceUserAgencyAlertTimerDuration", 7)
local voiceUserAgencyAddMuteDecisionAnalytics = game:DefineFastFlag("VoiceUserAgencyAddMuteDecisionAnalytics", false)
local voiceUserAgencyAdjustDescriptionText = game:DefineFastFlag("VoiceUserAgencyAdjustDescriptionText", false)
local var19 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.Remember")
local var20 = tostring(game.PlaceId)
local userId = playersService.LocalPlayer.UserId

local function getAppStorageTable() --[[ line: 48 ]]
	-- upvalues: appStorageService (ref), httpService (ref)
	local ok, status = pcall(function() --[[ line: 49 ]]
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("VoiceUserAgencyPlaceIds")
	end)
	
	if ok then
		local ok_1, status_1 = pcall(function() --[[ line: 53 ]]
			-- upvalues: httpService (copy), status (ref)
			return httpService:JSONDecode(status)
		end)
		
		return if ok_1 then status_1 else {}
	end
end

local var22 = false

local function _() --[[ line: 64 | named "resetHistory" ]]
	-- upvalues: var22 (write), getAppStorageTable (ref), var20 (ref), appStorageService (ref), httpService (ref), name (ref)
	if var22 then return end
	local ok, status = pcall(function() --[[ line: 68 ]]
		-- upvalues: getAppStorageTable (copy), var20 (copy), appStorageService (copy), httpService (copy), var22 (copy)
		local var26 = getAppStorageTable()
		
		for i, v in var26 do
			if i == var20 then
				var26[i] = nil
				appStorageService:SetItem("VoiceUserAgencyPlaceIds", httpService:JSONEncode(var26))
				appStorageService:Flush()
				var22 = true
				
				return
			end
		end
	end)
	
	if not ok then
		name:trace(status)
	end
end

local function bindResetHistory() --[[ line: 85 ]]
	-- upvalues: default (ref), var22 (write), getAppStorageTable (ref), var20 (ref), appStorageService (ref), httpService (ref), name (ref)
	default.muteAllChanged.Event:Connect(function(_) --[[ line: 87 ]]
		-- upvalues: var22 (copy), getAppStorageTable (copy), var20 (copy), appStorageService (copy), httpService (copy), name (copy)
		if var22 then return end
		local ok, status = pcall(function() --[[ line: 68 ]]
			-- upvalues: getAppStorageTable (copy), var20 (copy), appStorageService (copy), httpService (copy), var22 (copy)
			local var26 = getAppStorageTable()
			
			for i, v in var26 do
				if i == var20 then
					var26[i] = nil
					appStorageService:SetItem("VoiceUserAgencyPlaceIds", httpService:JSONEncode(var26))
					appStorageService:Flush()
					var22 = true
					
					return
				end
			end
		end)
		
		if not ok then
			name:trace(status)
		end
	end)
	default.mutedNonFriends.Event:Connect(function() --[[ line: 90 ]]
		-- upvalues: var22 (copy), getAppStorageTable (copy), var20 (copy), appStorageService (copy), httpService (copy), name (copy)
		if var22 then return end
		local ok, status = pcall(function() --[[ line: 68 ]]
			-- upvalues: getAppStorageTable (copy), var20 (copy), appStorageService (copy), httpService (copy), var22 (copy)
			local var26 = getAppStorageTable()
			
			for i, v in var26 do
				if i == var20 then
					var26[i] = nil
					appStorageService:SetItem("VoiceUserAgencyPlaceIds", httpService:JSONEncode(var26))
					appStorageService:Flush()
					var22 = true
					
					return
				end
			end
		end)
		
		if not ok then
			name:trace(status)
		end
	end)
end

local function removeUserAgencyPrompt(p0, p1, p2) --[[ line: 95 ]]
	-- upvalues: getAppStorageTable (ref), var20 (ref), appStorageService (ref), httpService (ref), voiceUserAgencyAddMuteDecisionAnalytics (ref), rbxAnalyticsService (ref), userId (ref), default (ref), bindResetHistory (ref)
	p0:Destroy()
	
	if p1 then
		local var27 = getAppStorageTable()
		var27[var20] = p2
		appStorageService:SetItem("VoiceUserAgencyPlaceIds", httpService:JSONEncode(var27))
		appStorageService:Flush()
	end
	if voiceUserAgencyAddMuteDecisionAnalytics then
		rbxAnalyticsService:SendEventDeferred("client", "voiceChat", "SelectJoinWithVoice", {
			userId = userId,
			voiceSessionId = default:getService():GetSessionId(),
			voiceExperienceId = default:getService():GetVoiceExperienceId(),
			isMuteAll = p2,
			isRememberSetting = p1
		})
	end
	default:FireUserAgencySelectedEvent(p2)
	bindResetHistory()
end

local function showUserAgencyPrompt() --[[ line: 120 ]]
	-- upvalues: getFFlagVoiceUserAgencyEnableIXPModule (ref), IXPServiceWrapper (ref), getFStringVoiceUserAgencyIXPLayerNameModule (ref), getAppStorageTable (ref), var20 (ref), name (ref), default (ref), constantsModule (ref), bindResetHistory (ref), rbxAnalyticsService (ref), userId (ref), coreGuiService (ref), create (ref), appFonts (ref), robloxTranslatorModule (ref), removeUserAgencyPrompt (ref), voiceUserAgencyAlertTimerDuration (ref), tweenService (ref), fFlagManuallyMigrateDeprecatedIconUsage (ref), builderIconsModule (ref), images (ref), var19 (ref), textService (ref), voiceUserAgencyAdjustDescriptionText (ref), voiceUserAgencyAlertStartTimeOffset (ref)
	local var28 = false
	local var29 = false
	
	if getFFlagVoiceUserAgencyEnableIXPModule() then
		local ok, status = pcall(function() --[[ line: 126 ]]
			-- upvalues: IXPServiceWrapper (copy), getFStringVoiceUserAgencyIXPLayerNameModule (copy)
			return IXPServiceWrapper:GetLayerData(getFStringVoiceUserAgencyIXPLayerNameModule())
		end)
		
		if not ok then return end
		if not status then return end
		if not status.VoiceUserAgencyEnabled then return end
	end
	local ok, status = pcall(function() --[[ line: 145 ]]
		-- upvalues: getAppStorageTable (copy), var20 (copy)
		for i, v in pairs(getAppStorageTable()) do
			if i == var20 and v ~= nil then
				return v
			end
		end
	end)
	
	if not ok then
		name:trace(status)
		
		return
	elseif status == nil then
		local voiceUserAgency = Instance.new("ScreenGui")
		voiceUserAgency.Name = "VoiceUserAgency"
		voiceUserAgency.ResetOnSpawn = false
		voiceUserAgency.DisplayOrder = -1
		voiceUserAgency.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		voiceUserAgency.Parent = coreGuiService
		local var31 = create("TextButton")({
			Name = "MuteAllButton",
			BorderSizePixel = 0,
			Size = UDim2.new(0.5, -6, 0, 36),
			Font = appFonts.default:getDefault(),
			Text = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinMuted"),
			TextSize = 16,
			BackgroundColor3 = Color3.fromRGB(57, 59, 61),
			TextColor3 = Color3.fromRGB(178, 178, 178),
			LayoutOrder = 1,
			create("UICorner")({ CornerRadius = UDim.new(0, 8) }),
			create("UIStroke")({
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(178, 178, 178)
			})
		})
		var31.Activated:Connect(function() --[[ line: 200 ]]
			-- upvalues: var28 (write), default (copy), constantsModule (copy), removeUserAgencyPrompt (copy), voiceUserAgency (ref), var29 (write)
			var28 = true
			default:MuteAll(var28, constantsModule.VOICE_CONTEXT_TYPE.USER_AGENCY)
			removeUserAgencyPrompt(voiceUserAgency, var29, var28)
		end)
		local var32 = create("TextButton")({
			Name = "UnmuteAllButton",
			BorderSizePixel = 0,
			Size = UDim2.new(0.5, -6, 0, 36),
			Font = appFonts.default:getDefault(),
			Text = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted"),
			TextSize = 16,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextColor3 = Color3.fromRGB(57, 59, 61),
			LayoutOrder = 2,
			create("UICorner")({ CornerRadius = UDim.new(0, 8) })
		})
		var32.Activated:Connect(function() --[[ line: 221 ]]
			-- upvalues: var28 (write), default (copy), constantsModule (copy), removeUserAgencyPrompt (copy), voiceUserAgency (ref), var29 (write)
			var28 = false
			default:MuteAll(var28, constantsModule.VOICE_CONTEXT_TYPE.USER_AGENCY)
			removeUserAgencyPrompt(voiceUserAgency, var29, var28)
		end)
		local var33 = create("Frame")({
			Name = "TimerBar",
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			Size = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		})
		local var34 = tweenService:Create(var33, TweenInfo.new(voiceUserAgencyAlertTimerDuration, Enum.EasingStyle.Sine), { Size = UDim2.fromScale(1, 1) })
		var34.Completed:Connect(function(p3) --[[ line: 238 ]]
			-- upvalues: removeUserAgencyPrompt (copy), voiceUserAgency (ref), var29 (write), var28 (write)
			if p3 == Enum.PlaybackState.Completed then
				removeUserAgencyPrompt(voiceUserAgency, var29, var28)
			end
		end)
		local var35 = if fFlagManuallyMigrateDeprecatedIconUsage then create("TextLabel")({
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = builderIconsModule.Migration["icons/status/success_small"].name,
			FontFace = builderIconsModule.Font[builderIconsModule.Migration["icons/status/success_small"].variant]
		}) else create("ImageLabel")({
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Image = images["icons/status/success_small"].Image,
			ImageRectOffset = images["icons/status/success_small"].ImageRectOffset,
			ImageRectSize = images["icons/status/success_small"].ImageRectSize
		})
		local var36 = create("ImageButton")({
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 14, 0, 14),
			Image = images["squircles/hollow"].Image,
			ImageRectOffset = images["squircles/hollow"].ImageRectOffset,
			ImageRectSize = images["squircles/hollow"].ImageRectSize
		})
		var35.Visible = false
		var35.Parent = var36
		var36.Activated:Connect(function() --[[ line: 267 ]]
			-- upvalues: var35 (ref), var29 (write), var34 (ref), rbxAnalyticsService (copy), userId (copy), default (copy)
			var35.Visible = not var35.Visible
			var29 = var35.Visible
			var34:Pause()
			rbxAnalyticsService:SendEventDeferred("client", "voiceChat", "RememberJoinWithVoice", {
				userId = userId,
				voiceSessionId = default:getService():GetSessionId(),
				voiceExperienceId = default:getService():GetVoiceExperienceId(),
				shouldRememberStatus = var29
			})
		end)
		local var37 = create("TextLabel")({
			Name = "CheckboxTextLabel",
			TextSize = 16,
			TextWrapped = true,
			BackgroundTransparency = 1,
			TextTransparency = 0,
			LayoutOrder = 2,
			Font = appFonts.default:getDefault(),
			Text = var19,
			TextColor3 = Color3.fromRGB(190, 190, 190),
			Size = UDim2.new(0, 350, 0, 24)
		})
		var37.Size = UDim2.new(0, textService:GetTextSize(var19, 16, appFonts.default:getDefault(), Vector2.new(350, 24)).X + 10, 0, 24)
		create("Frame")({
			Name = "VoiceUserAgencyFrame",
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(0.9, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0, 4),
			BackgroundColor3 = Color3.fromRGB(57, 59, 61),
			BorderSizePixel = 0,
			create("UICorner")({ CornerRadius = UDim.new(0, 8) }),
			create("UISizeConstraint")({ MaxSize = Vector2.new(400, 216) }),
			create("UIPadding")({
				PaddingTop = UDim.new(0, 24),
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 24)
			}),
			create("UIListLayout")({
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			create("TextLabel")({
				Name = "Title",
				TextSize = 20,
				TextWrapped = true,
				BackgroundTransparency = 1,
				TextTransparency = 0,
				LayoutOrder = 1,
				Font = appFonts.default:getBold(),
				Text = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Title"),
				Size = UDim2.new(1, 0, 0, 22),
				TextColor3 = Color3.fromRGB(255, 255, 255)
			}),
			create("TextLabel")({
				Name = "Lower",
				TextSize = 16,
				TextWrapped = true,
				BackgroundTransparency = 1,
				TextTransparency = 0,
				LayoutOrder = 2,
				Font = appFonts.default:getDefault(),
				Text = voiceUserAgencyAdjustDescriptionText and robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Description") or robloxTranslatorModule:FormatByKey("Feature.SettingsHub.VoiceUserAgency.JoinUnmuted.Description"),
				TextColor3 = Color3.fromRGB(190, 190, 190),
				Size = UDim2.new(1, 0, 0, 60)
			}),
			create("Frame")({
				Name = "TimerFrame",
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				Size = UDim2.new(1, 48, 0, 3),
				BackgroundTransparency = 0,
				LayoutOrder = 3,
				var33
			}),
			create("Frame")({
				Name = "ButtonsContainer",
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 62),
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				create("UIListLayout")({
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 12)
				}),
				var32,
				var31
			}),
			create("Frame")({
				Name = "CheckboxContainer",
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 28),
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				create("UIListLayout")({
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 8)
				}),
				var36,
				var37
			})
		}).Parent = voiceUserAgency
		task.delay(voiceUserAgencyAlertStartTimeOffset, function() --[[ line: 408 ]]
			-- upvalues: rbxAnalyticsService (copy), userId (copy), default (copy), var34 (ref)
			rbxAnalyticsService:SendEventDeferred("client", "voiceChat", "ShowJoinWithVoice", {
				userId = userId,
				voiceSessionId = default:getService():GetSessionId(),
				voiceExperienceId = default:getService():GetVoiceExperienceId()
			})
			var34:Play()
		end)
		
		return
	end
	default:MuteAll(status, constantsModule.VOICE_CONTEXT_TYPE.USER_AGENCY)
	default:FireUserAgencySelectedEvent(status)
	bindResetHistory()
	rbxAnalyticsService:SendEventDeferred("client", "voiceChat", "JoinWithVoice", {
		userId = userId,
		voiceSessionId = default:getService():GetSessionId(),
		voiceExperienceId = default:getService():GetVoiceExperienceId(),
		isMutedAll = status
	})
end

task.delay(voiceUserAgencyAlertInitTimeOffset, function() --[[ line: 421 ]]
	-- upvalues: default (ref), showUserAgencyPrompt (ref), name (ref)
	default:asyncInit():andThen(function() --[[ line: 423 ]]
		-- upvalues: showUserAgencyPrompt (copy)
		showUserAgencyPrompt()
	end):catch(function() --[[ line: 426 ]]
		-- upvalues: name (copy)
		name:trace("VoiceChatServiceManager did not initialize for VoiceUserAgency")
	end)
end)