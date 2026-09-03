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
local voiceUserAgencyAlertInitTimeOffset = game:DefineFastInt("VoiceUserAgencyAlertInitTimeOffset", 5)
local voiceUserAgencyAlertStartTimeOffset = game:DefineFastInt("VoiceUserAgencyAlertStartTimeOffset", 3)
local voiceUserAgencyAlertTimerDuration = game:DefineFastInt("VoiceUserAgencyAlertTimerDuration", 7)
local voiceUserAgencyAddMuteDecisionAnalytics = game:DefineFastFlag("VoiceUserAgencyAddMuteDecisionAnalytics", false)
local voiceUserAgencyAdjustDescriptionText = game:DefineFastFlag("VoiceUserAgencyAdjustDescriptionText", false)
local var1 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.Remember")
local var2 = tostring(game.PlaceId)
local userId = playersService.LocalPlayer.UserId

local function getAppStorageTable()
	-- upvalues: appStorageService (ref), httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("VoiceUserAgencyPlaceIds")
	end)
	
	if ok then
		local ok_1, status_1 = pcall(function()
			-- upvalues: httpService (copy), status (ref)
			return httpService:JSONDecode(status)
		end)
		
		return if ok_1 then status_1 else {}
	end
end

local var3 = false

local function _()
	-- upvalues: var3 (write), getAppStorageTable (ref), var2 (ref), appStorageService (ref), httpService (ref), name (ref)
	if var3 then return end
	local ok, status = pcall(function()
		-- upvalues: getAppStorageTable (copy), var2 (copy), appStorageService (copy), httpService (copy), var3 (copy)
		local var4 = getAppStorageTable()
		
		for i, v in var4 do
			if i == var2 then
				var4[i] = nil
				appStorageService:SetItem("VoiceUserAgencyPlaceIds", httpService:JSONEncode(var4))
				appStorageService:Flush()
				var3 = true
				
				return
			end
		end
	end)
	
	if not ok then
		name:trace(status)
	end
end

local function bindResetHistory()
	-- upvalues: default (ref), var3 (write), getAppStorageTable (ref), var2 (ref), appStorageService (ref), httpService (ref), name (ref)
	default.muteAllChanged.Event:Connect(function(_)
		-- upvalues: var3 (copy), getAppStorageTable (copy), var2 (copy), appStorageService (copy), httpService (copy), name (copy)
		if var3 then return end
		local ok, status = pcall(function()
			-- upvalues: getAppStorageTable (copy), var2 (copy), appStorageService (copy), httpService (copy), var3 (copy)
			local var4 = getAppStorageTable()
			
			for i, v in var4 do
				if i == var2 then
					var4[i] = nil
					appStorageService:SetItem("VoiceUserAgencyPlaceIds", httpService:JSONEncode(var4))
					appStorageService:Flush()
					var3 = true
					
					return
				end
			end
		end)
		
		if not ok then
			name:trace(status)
		end
	end)
	default.mutedNonFriends.Event:Connect(function()
		-- upvalues: var3 (copy), getAppStorageTable (copy), var2 (copy), appStorageService (copy), httpService (copy), name (copy)
		if var3 then return end
		local ok, status = pcall(function()
			-- upvalues: getAppStorageTable (copy), var2 (copy), appStorageService (copy), httpService (copy), var3 (copy)
			local var4 = getAppStorageTable()
			
			for i, v in var4 do
				if i == var2 then
					var4[i] = nil
					appStorageService:SetItem("VoiceUserAgencyPlaceIds", httpService:JSONEncode(var4))
					appStorageService:Flush()
					var3 = true
					
					return
				end
			end
		end)
		
		if not ok then
			name:trace(status)
		end
	end)
end

local function removeUserAgencyPrompt(p1, p2, p3)
	-- upvalues: getAppStorageTable (ref), var2 (ref), appStorageService (ref), httpService (ref), voiceUserAgencyAddMuteDecisionAnalytics (ref), rbxAnalyticsService (ref), userId (ref), default (ref), bindResetHistory (ref)
	p1:Destroy()
	
	if p2 then
		local var4 = getAppStorageTable()
		var4[var2] = p3
		appStorageService:SetItem("VoiceUserAgencyPlaceIds", httpService:JSONEncode(var4))
		appStorageService:Flush()
	end
	if voiceUserAgencyAddMuteDecisionAnalytics then
		rbxAnalyticsService:SendEventDeferred("client", "voiceChat", "SelectJoinWithVoice", {
			userId = userId,
			voiceSessionId = default:getService():GetSessionId(),
			voiceExperienceId = default:getService():GetVoiceExperienceId(),
			isMuteAll = p3,
			isRememberSetting = p2
		})
	end
	default:FireUserAgencySelectedEvent(p3)
	bindResetHistory()
end

local function showUserAgencyPrompt()
	-- upvalues: getFFlagVoiceUserAgencyEnableIXPModule (ref), IXPServiceWrapper (ref), getFStringVoiceUserAgencyIXPLayerNameModule (ref), getAppStorageTable (ref), var2 (ref), name (ref), default (ref), constantsModule (ref), bindResetHistory (ref), rbxAnalyticsService (ref), userId (ref), coreGuiService (ref), create (ref), appFonts (ref), robloxTranslatorModule (ref), removeUserAgencyPrompt (ref), voiceUserAgencyAlertTimerDuration (ref), tweenService (ref), builderIconsModule (ref), images (ref), var1 (ref), textService (ref), voiceUserAgencyAdjustDescriptionText (ref), voiceUserAgencyAlertStartTimeOffset (ref)
	local var4 = false
	local var5 = false
	
	if getFFlagVoiceUserAgencyEnableIXPModule() then
		local ok, status = pcall(function()
			-- upvalues: IXPServiceWrapper (copy), getFStringVoiceUserAgencyIXPLayerNameModule (copy)
			return IXPServiceWrapper:GetLayerData(getFStringVoiceUserAgencyIXPLayerNameModule())
		end)
		
		if not ok then return end
		if not status then return end
		if not status.VoiceUserAgencyEnabled then return end
	end
	local ok, status = pcall(function()
		-- upvalues: getAppStorageTable (copy), var2 (copy)
		for i, v in pairs(getAppStorageTable()) do
			if i == var2 and v ~= nil then
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
		local var6 = create("TextButton")({
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
		var6.Activated:Connect(function()
			-- upvalues: var4 (write), default (copy), constantsModule (copy), removeUserAgencyPrompt (copy), voiceUserAgency (ref), var5 (write)
			var4 = true
			default:MuteAll(var4, constantsModule.VOICE_CONTEXT_TYPE.USER_AGENCY)
			removeUserAgencyPrompt(voiceUserAgency, var5, var4)
		end)
		local var7 = create("TextButton")({
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
		var7.Activated:Connect(function()
			-- upvalues: var4 (write), default (copy), constantsModule (copy), removeUserAgencyPrompt (copy), voiceUserAgency (ref), var5 (write)
			var4 = false
			default:MuteAll(var4, constantsModule.VOICE_CONTEXT_TYPE.USER_AGENCY)
			removeUserAgencyPrompt(voiceUserAgency, var5, var4)
		end)
		local var8 = create("Frame")({
			Name = "TimerBar",
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			Size = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		})
		local var9 = tweenService:Create(var8, TweenInfo.new(voiceUserAgencyAlertTimerDuration, Enum.EasingStyle.Sine), { Size = UDim2.fromScale(1, 1) })
		var9.Completed:Connect(function(p1)
			-- upvalues: removeUserAgencyPrompt (copy), voiceUserAgency (ref), var5 (write), var4 (write)
			if p1 == Enum.PlaybackState.Completed then
				removeUserAgencyPrompt(voiceUserAgency, var5, var4)
			end
		end)
		local var10 = create("TextLabel")({
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = builderIconsModule.Migration["icons/status/success_small"].name,
			FontFace = builderIconsModule.Font[builderIconsModule.Migration["icons/status/success_small"].variant]
		})
		local var11 = create("ImageButton")({
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 14, 0, 14),
			Image = images["squircles/hollow"].Image,
			ImageRectOffset = images["squircles/hollow"].ImageRectOffset,
			ImageRectSize = images["squircles/hollow"].ImageRectSize
		})
		var10.Visible = false
		var10.Parent = var11
		var11.Activated:Connect(function()
			-- upvalues: var10 (ref), var5 (write), var9 (ref), rbxAnalyticsService (copy), userId (copy), default (copy)
			var10.Visible = not var10.Visible
			var5 = var10.Visible
			var9:Pause()
			rbxAnalyticsService:SendEventDeferred("client", "voiceChat", "RememberJoinWithVoice", {
				userId = userId,
				voiceSessionId = default:getService():GetSessionId(),
				voiceExperienceId = default:getService():GetVoiceExperienceId(),
				shouldRememberStatus = var5
			})
		end)
		local var12 = create("TextLabel")({
			Name = "CheckboxTextLabel",
			TextSize = 16,
			TextWrapped = true,
			BackgroundTransparency = 1,
			TextTransparency = 0,
			LayoutOrder = 2,
			Font = appFonts.default:getDefault(),
			Text = var1,
			TextColor3 = Color3.fromRGB(190, 190, 190),
			Size = UDim2.new(0, 350, 0, 24)
		})
		var12.Size = UDim2.new(0, textService:GetTextSize(var1, 16, appFonts.default:getDefault(), Vector2.new(350, 24)).X + 10, 0, 24)
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
				var8
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
				var7,
				var6
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
				var11,
				var12
			})
		}).Parent = voiceUserAgency
		task.delay(voiceUserAgencyAlertStartTimeOffset, function()
			-- upvalues: rbxAnalyticsService (copy), userId (copy), default (copy), var9 (ref)
			rbxAnalyticsService:SendEventDeferred("client", "voiceChat", "ShowJoinWithVoice", {
				userId = userId,
				voiceSessionId = default:getService():GetSessionId(),
				voiceExperienceId = default:getService():GetVoiceExperienceId()
			})
			var9:Play()
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

task.delay(voiceUserAgencyAlertInitTimeOffset, function()
	-- upvalues: default (ref), showUserAgencyPrompt (ref), name (ref)
	default:asyncInit():andThen(function()
		-- upvalues: showUserAgencyPrompt (copy)
		showUserAgencyPrompt()
	end):catch(function()
		-- upvalues: name (copy)
		name:trace("VoiceChatServiceManager did not initialize for VoiceUserAgency")
	end)
end)