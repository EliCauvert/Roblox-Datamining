local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AppStorageService = game:GetService("AppStorageService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local TextService = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
local Images = require(CorePackages.Packages.InGameMenuDependencies).UIBlox.App.ImageSet.Images
local Modules = CoreGui.RobloxGui.Modules
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Default = require(Modules.VoiceChat.VoiceChatServiceManager).default
local ConstantsModule = require(Modules.VoiceChat.Constants)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local _ = BuilderIconsModule.Migration
local GetFFlagVoiceUserAgencyEnableIXPModule = require(Modules.Flags.GetFFlagVoiceUserAgencyEnableIXP)
local GetFStringVoiceUserAgencyIXPLayerNameModule = require(Modules.Flags.GetFStringVoiceUserAgencyIXPLayerName)
local VoiceUserAgencyAlertStartTimeOffset = game:DefineFastInt("VoiceUserAgencyAlertStartTimeOffset", 3)
local VoiceUserAgencyAlertTimerDuration = game:DefineFastInt("VoiceUserAgencyAlertTimerDuration", 7)
local VoiceUserAgencyAddMuteDecisionAnalytics = game:DefineFastFlag("VoiceUserAgencyAddMuteDecisionAnalytics", false)
local VoiceUserAgencyAdjustDescriptionText = game:DefineFastFlag("VoiceUserAgencyAdjustDescriptionText", false)
local FeatureSettingsHubPromptVoiceUserAgencyRemember = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.Remember")
local Text = tostring(game.PlaceId)
local UserId = game:GetService("Players").LocalPlayer.UserId

local function getAppStorageTable() --[[ Line: 46 ]]
	-- upvalues: AppStorageService (copy), HttpService (copy)
	local Success, Result = pcall(function() --[[ Line: 47 ]]
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("VoiceUserAgencyPlaceIds")
	end)
	
	if Success then
		local Success1, Result1 = pcall(function() --[[ Line: 51 ]]
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		if Success1 then
			return Result1
		end
	end
	return {}
end

local Flag = false

local function _() --[[ Line: 62 | Named "resetHistory" ]]
	-- upvalues: Flag (ref), getAppStorageTable (copy), Text (copy), AppStorageService (copy), HttpService (copy), NewResult (copy)
	if Flag then return end
	local Success, Result = pcall(function() --[[ Line: 66 ]]
		-- upvalues: getAppStorageTable (upval), Text (upval), AppStorageService (upval), HttpService (upval), Flag (upval)
		local Input = getAppStorageTable()
		
		for i, _ in Input do
			if i == Text then
				Input[i] = nil
				AppStorageService:SetItem("VoiceUserAgencyPlaceIds", HttpService:JSONEncode(Input))
				AppStorageService:Flush()
				Flag = true
				break
			end
		end
	end)
	
	if not Success then
		NewResult:trace(Result)
	end
end

local function bindResetHistory() --[[ Line: 83 ]]
	-- upvalues: Default (copy), Flag (ref), getAppStorageTable (copy), Text (copy), AppStorageService (copy), HttpService (copy), NewResult (copy)
	Default.muteAllChanged.Event:Connect(function(_) --[[ Line: 85 ]]
		-- upvalues: Flag (upval), getAppStorageTable (upval), Text (upval), AppStorageService (upval), HttpService (upval), NewResult (upval)
		if Flag then return end
		local Success, Result = pcall(function() --[[ Line: 66 ]]
			-- upvalues: getAppStorageTable (upval), Text (upval), AppStorageService (upval), HttpService (upval), Flag (upval)
			local Input = getAppStorageTable()
			
			for i, _ in Input do
				if i == Text then
					Input[i] = nil
					AppStorageService:SetItem("VoiceUserAgencyPlaceIds", HttpService:JSONEncode(Input))
					AppStorageService:Flush()
					Flag = true
					break
				end
			end
		end)
		
		if not Success then
			NewResult:trace(Result)
		end
	end)
	Default.mutedNonFriends.Event:Connect(function() --[[ Line: 88 ]]
		-- upvalues: Flag (upval), getAppStorageTable (upval), Text (upval), AppStorageService (upval), HttpService (upval), NewResult (upval)
		if Flag then return end
		local Success, Result = pcall(function() --[[ Line: 66 ]]
			-- upvalues: getAppStorageTable (upval), Text (upval), AppStorageService (upval), HttpService (upval), Flag (upval)
			local Input = getAppStorageTable()
			
			for i, _ in Input do
				if i == Text then
					Input[i] = nil
					AppStorageService:SetItem("VoiceUserAgencyPlaceIds", HttpService:JSONEncode(Input))
					AppStorageService:Flush()
					Flag = true
					break
				end
			end
		end)
		
		if not Success then
			NewResult:trace(Result)
		end
	end)
end

local function removeUserAgencyPrompt(ScreenGui, IsRememberSetting, IsMuteAll) --[[ Line: 93 ]]
	-- upvalues: getAppStorageTable (copy), Text (copy), AppStorageService (copy), HttpService (copy), VoiceUserAgencyAddMuteDecisionAnalytics (copy), RbxAnalyticsService (copy), UserId (copy), Default (copy), bindResetHistory (copy)
	ScreenGui:Destroy()
	
	if IsRememberSetting then
		local AppStorageTable = getAppStorageTable()
		AppStorageTable[Text] = IsMuteAll
		AppStorageService:SetItem("VoiceUserAgencyPlaceIds", HttpService:JSONEncode(AppStorageTable))
		AppStorageService:Flush()
	end
	if VoiceUserAgencyAddMuteDecisionAnalytics then
		RbxAnalyticsService:SendEventDeferred("client", "voiceChat", "SelectJoinWithVoice", {
			userId = UserId,
			voiceSessionId = Default:getService():GetSessionId(),
			voiceExperienceId = Default:getService():GetVoiceExperienceId(),
			isMuteAll = IsMuteAll,
			isRememberSetting = IsRememberSetting
		})
	end
	Default:FireUserAgencySelectedEvent(IsMuteAll)
	bindResetHistory()
end

local function showUserAgencyPrompt() --[[ Line: 118 ]]
	-- upvalues: GetFFlagVoiceUserAgencyEnableIXPModule (copy), IXPServiceWrapper (copy), GetFStringVoiceUserAgencyIXPLayerNameModule (copy), getAppStorageTable (copy), Text (copy), NewResult (copy), Default (copy), ConstantsModule (copy), bindResetHistory (copy), RbxAnalyticsService (copy), UserId (copy), CoreGui (copy), CreateFunction (copy), AppFonts (copy), RobloxTranslatorModule (copy), removeUserAgencyPrompt (copy), VoiceUserAgencyAlertTimerDuration (copy), TweenService (copy), BuilderIconsModule (copy), Images (copy), FeatureSettingsHubPromptVoiceUserAgencyRemember (copy), TextService (copy), VoiceUserAgencyAdjustDescriptionText (copy), VoiceUserAgencyAlertStartTimeOffset (copy)
	local IsMuteAll = false
	local Visible = false
	
	if GetFFlagVoiceUserAgencyEnableIXPModule() then
		local Success, Result = pcall(function() --[[ Line: 124 ]]
			-- upvalues: IXPServiceWrapper (upval), GetFStringVoiceUserAgencyIXPLayerNameModule (upval)
			return IXPServiceWrapper:GetLayerData(GetFStringVoiceUserAgencyIXPLayerNameModule())
		end)
		
		if not Success then return end
		if not Result then return end
		if not Result.VoiceUserAgencyEnabled then return end
	end
	local Success1, Result1 = pcall(function() --[[ Line: 143 ]]
		-- upvalues: getAppStorageTable (upval), Text (upval)
		for i, value in pairs((getAppStorageTable())) do
			if i == Text and value ~= nil then
				return value
			end
		end
	end)
	
	if not Success1 then
		NewResult:trace(Result1)
		
		return
	end
	if Result1 == nil then
		local VoiceUserAgency = Instance.new("ScreenGui")
		VoiceUserAgency.Name = "VoiceUserAgency"
		VoiceUserAgency.ResetOnSpawn = false
		VoiceUserAgency.DisplayOrder = -1
		VoiceUserAgency.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		VoiceUserAgency.Parent = CoreGui
		local v1 = CreateFunction("TextButton")({
			Name = "MuteAllButton",
			BorderSizePixel = 0,
			Size = UDim2.new(0.5, -6, 0, 36),
			Font = AppFonts.default:getDefault(),
			Text = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinMuted"),
			TextSize = 16,
			BackgroundColor3 = Color3.fromRGB(57, 59, 61),
			TextColor3 = Color3.fromRGB(178, 178, 178),
			LayoutOrder = 1,
			CreateFunction("UICorner")({ CornerRadius = UDim.new(0, 8) }),
			CreateFunction("UIStroke")({
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(178, 178, 178)
			})
		})
		v1.Activated:Connect(function() --[[ Line: 198 ]]
			-- upvalues: IsMuteAll (ref), Default (upval), ConstantsModule (upval), removeUserAgencyPrompt (upval), VoiceUserAgency (copy), Visible (ref)
			IsMuteAll = true
			Default:MuteAll(IsMuteAll, ConstantsModule.VOICE_CONTEXT_TYPE.USER_AGENCY)
			removeUserAgencyPrompt(VoiceUserAgency, Visible, IsMuteAll)
		end)
		local v2 = CreateFunction("TextButton")({
			Name = "UnmuteAllButton",
			BorderSizePixel = 0,
			Size = UDim2.new(0.5, -6, 0, 36),
			Font = AppFonts.default:getDefault(),
			Text = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted"),
			TextSize = 16,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextColor3 = Color3.fromRGB(57, 59, 61),
			LayoutOrder = 2,
			CreateFunction("UICorner")({ CornerRadius = UDim.new(0, 8) })
		})
		v2.Activated:Connect(function() --[[ Line: 219 ]]
			-- upvalues: IsMuteAll (ref), Default (upval), ConstantsModule (upval), removeUserAgencyPrompt (upval), VoiceUserAgency (copy), Visible (ref)
			IsMuteAll = false
			Default:MuteAll(IsMuteAll, ConstantsModule.VOICE_CONTEXT_TYPE.USER_AGENCY)
			removeUserAgencyPrompt(VoiceUserAgency, Visible, IsMuteAll)
		end)
		local Target = CreateFunction("Frame")({
			Name = "TimerBar",
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			Size = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		})
		local Tween = TweenService:Create(Target, TweenInfo.new(VoiceUserAgencyAlertTimerDuration, Enum.EasingStyle.Sine), { Size = UDim2.fromScale(1, 1) })
		Tween.Completed:Connect(function(PlaybackState) --[[ Line: 236 ]]
			-- upvalues: removeUserAgencyPrompt (upval), VoiceUserAgency (copy), Visible (ref), IsMuteAll (ref)
			if PlaybackState == Enum.PlaybackState.Completed then
				removeUserAgencyPrompt(VoiceUserAgency, Visible, IsMuteAll)
			end
		end)
		local v3 = CreateFunction("TextLabel")({
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = BuilderIconsModule.Migration["icons/status/success_small"].name,
			FontFace = BuilderIconsModule.Font[BuilderIconsModule.Migration["icons/status/success_small"].variant]
		})
		local Parent = CreateFunction("ImageButton")({
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 14, 0, 14),
			Image = Images["squircles/hollow"].Image,
			ImageRectOffset = Images["squircles/hollow"].ImageRectOffset,
			ImageRectSize = Images["squircles/hollow"].ImageRectSize
		})
		v3.Visible = false
		v3.Parent = Parent
		Parent.Activated:Connect(function() --[[ Line: 257 ]]
			-- upvalues: v3 (copy), Visible (ref), Tween (copy), RbxAnalyticsService (upval), UserId (upval), Default (upval)
			v3.Visible = not v3.Visible
			Visible = v3.Visible
			Tween:Pause()
			RbxAnalyticsService:SendEventDeferred("client", "voiceChat", "RememberJoinWithVoice", {
				userId = UserId,
				voiceSessionId = Default:getService():GetSessionId(),
				voiceExperienceId = Default:getService():GetVoiceExperienceId(),
				shouldRememberStatus = Visible
			})
		end)
		local v4 = CreateFunction("TextLabel")({
			Name = "CheckboxTextLabel",
			TextSize = 16,
			TextWrapped = true,
			BackgroundTransparency = 1,
			TextTransparency = 0,
			LayoutOrder = 2,
			Font = AppFonts.default:getDefault(),
			Text = FeatureSettingsHubPromptVoiceUserAgencyRemember,
			TextColor3 = Color3.fromRGB(190, 190, 190),
			Size = UDim2.new(0, 350, 0, 24)
		})
		v4.Size = UDim2.new(0, TextService:GetTextSize(FeatureSettingsHubPromptVoiceUserAgencyRemember, 16, AppFonts.default:getDefault(), Vector2.new(350, 24)).X + 10, 0, 24)
		CreateFunction("Frame")({
			Name = "VoiceUserAgencyFrame",
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(0.9, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0, 4),
			BackgroundColor3 = Color3.fromRGB(57, 59, 61),
			BorderSizePixel = 0,
			CreateFunction("UICorner")({ CornerRadius = UDim.new(0, 8) }),
			CreateFunction("UISizeConstraint")({ MaxSize = Vector2.new(400, 216) }),
			CreateFunction("UIPadding")({
				PaddingTop = UDim.new(0, 24),
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 24)
			}),
			CreateFunction("UIListLayout")({
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			CreateFunction("TextLabel")({
				Name = "Title",
				TextSize = 20,
				TextWrapped = true,
				BackgroundTransparency = 1,
				TextTransparency = 0,
				LayoutOrder = 1,
				Font = AppFonts.default:getBold(),
				Text = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Title"),
				Size = UDim2.new(1, 0, 0, 22),
				TextColor3 = Color3.fromRGB(255, 255, 255)
			}),
			CreateFunction("TextLabel")({
				Name = "Lower",
				TextSize = 16,
				TextWrapped = true,
				BackgroundTransparency = 1,
				TextTransparency = 0,
				LayoutOrder = 2,
				Font = AppFonts.default:getDefault(),
				Text = VoiceUserAgencyAdjustDescriptionText and RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Description") or RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.VoiceUserAgency.JoinUnmuted.Description"),
				TextColor3 = Color3.fromRGB(190, 190, 190),
				Size = UDim2.new(1, 0, 0, 60)
			}),
			CreateFunction("Frame")({
				Name = "TimerFrame",
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				Size = UDim2.new(1, 48, 0, 3),
				BackgroundTransparency = 0,
				LayoutOrder = 3,
				Target
			}),
			CreateFunction("Frame")({
				Name = "ButtonsContainer",
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 62),
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				CreateFunction("UIListLayout")({
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 12)
				}),
				v2,
				v1
			}),
			CreateFunction("Frame")({
				Name = "CheckboxContainer",
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 28),
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				CreateFunction("UIListLayout")({
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 8)
				}),
				Parent,
				v4
			})
		}).Parent = VoiceUserAgency
		task.delay(VoiceUserAgencyAlertStartTimeOffset, function() --[[ Line: 398 ]]
			-- upvalues: RbxAnalyticsService (upval), UserId (upval), Default (upval), Tween (copy)
			RbxAnalyticsService:SendEventDeferred("client", "voiceChat", "ShowJoinWithVoice", {
				userId = UserId,
				voiceSessionId = Default:getService():GetSessionId(),
				voiceExperienceId = Default:getService():GetVoiceExperienceId()
			})
			Tween:Play()
		end)
		
		return
	else
		Default:MuteAll(Result1, ConstantsModule.VOICE_CONTEXT_TYPE.USER_AGENCY)
		Default:FireUserAgencySelectedEvent(Result1)
		bindResetHistory()
		RbxAnalyticsService:SendEventDeferred("client", "voiceChat", "JoinWithVoice", {
			userId = UserId,
			voiceSessionId = Default:getService():GetSessionId(),
			voiceExperienceId = Default:getService():GetVoiceExperienceId(),
			isMutedAll = Result1
		})
	end
end

task.delay(game:DefineFastInt("VoiceUserAgencyAlertInitTimeOffset", 5), function() --[[ Line: 411 ]]
	-- upvalues: Default (copy), showUserAgencyPrompt (copy), NewResult (copy)
	Default:asyncInit():andThen(function() --[[ Line: 413 ]]
		-- upvalues: showUserAgencyPrompt (upval)
		showUserAgencyPrompt()
	end):catch(function() --[[ Line: 416 ]]
		-- upvalues: NewResult (upval)
		NewResult:trace("VoiceChatServiceManager did not initialize for VoiceUserAgency")
	end)
end)