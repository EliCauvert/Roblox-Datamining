local badgeService = game:GetService("BadgeService")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local pointsService = game:GetService("PointsService")
local marketplaceService = game:GetService("MarketplaceService")
local textService = game:GetService("TextService")
local httpService = game:GetService("HttpService")
local _ = game:GetService("UserInputService")
local starterGuiService = game:GetService("StarterGui")
local coreGuiService = game:GetService("CoreGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local VRService = game:GetService("VRService")
local groupService = game:GetService("GroupService")
local teleportService = game:GetService("TeleportService")
local localizationService = game:GetService("LocalizationService")
local corePackagesService = game:GetService("CorePackages")
local universalAppPolicyModule = require(corePackagesService.Workspace.Packages.UniversalAppPolicy)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local logging = require(corePackagesService.Workspace.Packages.AppCommonLib).Logging
local robloxGui = coreGuiService.RobloxGui
local gameSettings = UserSettings().GameSettings
local fFlagCoreScriptShowTeleportPromptModule = require(robloxGui.Modules.Flags.FFlagCoreScriptShowTeleportPrompt)
local friendingUtilityModule = require(robloxGui.Modules.FriendingUtility)
local clientToastNotificationsEnabledEngineFeature = game:GetEngineFeature("ClientToastNotificationsEnabled")
local getFFlagClientToastNotificationsRedirectModule = require(robloxGui.Modules.Flags.GetFFlagClientToastNotificationsRedirect)
local getFFlagFriendshipNotifsUseSendrModule = require(robloxGui.Modules.Flags.GetFFlagFriendshipNotifsUseSendr)
local notificationsRenameFriendRequestToConnection = game:DefineFastFlag("NotificationsRenameFriendRequestToConnection", false)
local shouldSaveScreenshotToAlbumModule = require(robloxGui.Modules.shouldSaveScreenshotToAlbum)
local fixOnBadgeAwardedError = game:DefineFastFlag("FixOnBadgeAwardedError", false)
local fFlagConnectionsToFriendsRename = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)

local function _(p0, p1)
	-- upvalues: robloxTranslatorModule (ref)
	pcall(function()
		-- upvalues: p1 (write), robloxTranslatorModule (copy), p0 (ref)
		p1 = robloxTranslatorModule:FormatByKey(p0)
	end)
	
	return p1
end

local _ = nil
while not playersService.LocalPlayer do
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
end
local localPlayer = playersService.LocalPlayer
local parent = script.Parent
local t = {}
local t_1 = {}
local t_2 = {}
local t_3 = {}
local value = gameSettings.SavedQualityLevel.Value
local sendNotificationInfo = Instance.new("BindableEvent")
sendNotificationInfo.Name = "SendNotificationInfo"
sendNotificationInfo.Parent = robloxGui
local var30 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local var31 = true
local var32 = true
local socialUtilModule = require(robloxGui.Modules.SocialUtil)
local gameTranslatorModule = require(robloxGui.Modules.GameTranslator)
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local var36 = 0.6 * gameSettings.PreferredTransparency
local var37 = if var30 then 72 else 48
local var38 = if var30 then 145 else 64
local var39 = if var30 then 450 else 200
local var40 = var37 / 6
local var41 = if var30 then 42 else 18
local var42 = if var30 then 84 else 36
local var43 = -var41
local var44 = if var30 then Enum.FontSize.Size42 else Enum.FontSize.Size18
local var45 = if var30 then 72 else 28
local var46 = if var30 then 144 else 56
local var47 = if var30 then Enum.FontSize.Size36 else Enum.FontSize.Size14
local var48 = var38 / 2
local var49 = var40 / 2
local var50 = if var30 then Enum.FontSize.Size42 else Enum.FontSize.Size18
local var51 = if var30 then 42 else 18
local var52 = if var30 then 30 else 14
local inOut = Enum.EasingDirection.InOut
local sine = Enum.EasingStyle.Sine
local var53 = 5
local t_4 = {
	ACCEPTED = if fFlagConnectionsToFriendsRename then "InGame.NotificationScript2.Message.FriendRequestEvent.Accepted" else "InGame.NotificationScript2.Message.ConnectionRequestEvent.Accepted",
	SENT = if fFlagConnectionsToFriendsRename then "InGame.NotificationScript2.Message.FriendRequestEvent.Sent" else "InGame.NotificationScript2.Message.ConnectionRequestEvent.Sent"
}

local function translateString(p2, p3)
	-- upvalues: localizationService (ref), localization (ref), logging (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var83 = localization.new(robloxLocaleId)
	var83:SetLocale(robloxLocaleId)
	local ok, status = pcall(function()
		-- upvalues: var83 (ref), p2 (ref), p3 (ref)
		return var83:Format(p2, p3)
	end)
	
	if ok then
		return status
	end
	logging.warn("Failed to translate string with key: " .. p2)
	
	return ""
end

local ok, status = pcall(function()
	return tonumber(settings():GetFVariable("FriendRequestNotificationThrottle"))
end)

if ok and status ~= nil then
	var53 = status
end
starterGuiService:RegisterSetCore("PointsNotificationsActive", function(p4)
	-- upvalues: var31 (write)
	if type(p4) == "boolean" then
		var31 = p4
	end
end)
starterGuiService:RegisterSetCore("BadgesNotificationsActive", function(p5)
	-- upvalues: var32 (write)
	if type(p5) == "boolean" then
		var32 = p5
	end
end)
starterGuiService:RegisterGetCore("PointsNotificationsActive", function()
	-- upvalues: var31 (write)
	return var31
end)
starterGuiService:RegisterGetCore("BadgesNotificationsActive", function()
	-- upvalues: var32 (write)
	return var32
end)

local _ = function(p6, p7, p8, p9)
	local frame = Instance.new("Frame")
	frame.Name = p6
	frame.Size = p7
	frame.Position = p8
	frame.BackgroundTransparency = p9
	
	return frame
end

local function createTextButton(p10, p11)
	-- upvalues: var48 (ref), var36 (write), var50 (ref), var49 (ref), var51 (ref), var52 (ref)
	local textButton = Instance.new("TextButton")
	textButton.Name = p10
	textButton.Size = UDim2.new(0.5, -1, 0, var48)
	textButton.Position = p11
	textButton.BackgroundTransparency = var36
	textButton.BackgroundColor3 = Color3.new(0, 0, 0)
	textButton.BorderSizePixel = 0
	textButton.Font = Enum.Font.SourceSansBold
	textButton.FontSize = var50
	textButton.TextColor3 = Color3.new(1, 1, 1)
	textButton.TextTruncate = Enum.TextTruncate.AtEnd
	textButton.TextScaled = true
	local UIPadding = Instance.new("UIPadding")
	UIPadding.PaddingTop = UDim.new(0, var49 / 2)
	UIPadding.PaddingBottom = UDim.new(0, var49 / 2)
	UIPadding.PaddingLeft = UDim.new(0, var49)
	UIPadding.PaddingRight = UDim.new(0, var49)
	UIPadding.Parent = textButton
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	UITextSizeConstraint.MaxTextSize = var51
	UITextSizeConstraint.MinTextSize = var52
	UITextSizeConstraint.Parent = textButton
	
	return textButton
end

local uDim2 = UDim2.new(0, var39, 0.42, 0)
local uDim2_1 = UDim2.new(1, (-var39) - 4, 0.5, 0)
local notificationFrame = Instance.new("Frame")
notificationFrame.Name = "NotificationFrame"
notificationFrame.Size = uDim2
notificationFrame.Position = uDim2_1
notificationFrame.BackgroundTransparency = 1

if fFlagCoreScriptShowTeleportPromptModule then
	notificationFrame.ZIndex = 3
else
	notificationFrame.ZIndex = 2
end
notificationFrame.Parent = parent
local var60 = (function()
	-- upvalues: var38 (ref), var36 (write)
	local uDim2 = UDim2.new(1, 0, 0, var38)
	local uDim2_1 = UDim2.new(0, 0, 0, 0)
	local notification = Instance.new("Frame")
	notification.Name = "Notification"
	notification.Size = uDim2
	notification.Position = uDim2_1
	notification.BackgroundTransparency = var36
	notification.BackgroundColor3 = Color3.new(0, 0, 0)
	notification.BorderSizePixel = 0
	
	return notification
end)()
local notificationTitle = Instance.new("TextLabel")
notificationTitle.Name = "NotificationTitle"
notificationTitle.Size = UDim2.new(1, -var40 * 2, 0, var41)
notificationTitle.Position = UDim2.new(0, var40, 0.5, var43)
notificationTitle.BackgroundTransparency = 1
notificationTitle.Font = Enum.Font.SourceSansBold
notificationTitle.FontSize = var44
notificationTitle.TextColor3 = Color3.new(0.97, 0.97, 0.97)
local notificationText = Instance.new("TextLabel")
notificationText.Name = "NotificationText"
notificationText.Size = UDim2.new(1, -var40 * 2, 0, var45)
notificationText.Position = UDim2.new(0, var40, 0.5, 1)
notificationText.BackgroundTransparency = 1
notificationText.Font = Enum.Font.SourceSans
notificationText.FontSize = var47
notificationText.TextColor3 = Color3.new(0.92, 0.92, 0.92)
notificationText.TextWrap = true
notificationText.TextYAlignment = Enum.TextYAlignment.Top
local notificationImage = Instance.new("ImageLabel")
notificationImage.Name = "NotificationImage"
notificationImage.Size = UDim2.new(0, var37, 0, var37)
notificationImage.Position = UDim2.new(0, var40, 0, 0.5 * (var38 - var37))
notificationImage.BackgroundTransparency = 1
notificationImage.Image = ""
local uDim2_2 = UDim2.new(0, 360, 0, 160)
local uDim2_3 = UDim2.new(0.5, -180, 0.5, -50)
local popupFrame = Instance.new("Frame")
popupFrame.Name = "PopupFrame"
popupFrame.Size = uDim2_2
popupFrame.Position = uDim2_3
popupFrame.BackgroundTransparency = 0
popupFrame.Style = Enum.FrameStyle.DropShadow
popupFrame.ZIndex = 4
popupFrame.Visible = false
popupFrame.Parent = parent
local popupAcceptButton = Instance.new("TextButton")
popupAcceptButton.Name = "PopupAcceptButton"
popupAcceptButton.Size = UDim2.new(0, 100, 0, 50)
popupAcceptButton.Position = UDim2.new(0.5, -102, 1, -58)
popupAcceptButton.Style = Enum.ButtonStyle.RobloxRoundButton
popupAcceptButton.Font = Enum.Font.SourceSansBold
popupAcceptButton.FontSize = Enum.FontSize.Size24
popupAcceptButton.TextColor3 = Color3.new(1, 1, 1)
popupAcceptButton.Text = "Accept"
popupAcceptButton.ZIndex = 5
popupAcceptButton.Parent = popupFrame
local popupDeclineButton = popupAcceptButton:Clone()
popupDeclineButton.Name = "PopupDeclineButton"
popupDeclineButton.Position = UDim2.new(0.5, 2, 1, -58)
popupDeclineButton.Text = "Decline"
popupDeclineButton.Parent = popupFrame
local popupOKButton = popupAcceptButton:Clone()
popupOKButton.Name = "PopupOKButton"
popupOKButton.Position = UDim2.new(0.5, -50, 1, -58)
popupOKButton.Text = "OK"
popupOKButton.Visible = false
popupOKButton.Parent = popupFrame
local popupText = Instance.new("TextLabel")
popupText.Name = "PopupText"
popupText.Size = UDim2.new(1, -16, 0.8, 0)
popupText.Position = UDim2.new(0, 8, 0, 8)
popupText.BackgroundTransparency = 1
popupText.Font = Enum.Font.SourceSansBold
popupText.FontSize = Enum.FontSize.Size36
popupText.TextColor3 = Color3.new(0.97, 0.97, 0.97)
popupText.TextWrap = true
popupText.ZIndex = 5
popupText.TextYAlignment = Enum.TextYAlignment.Top
popupText.Text = "This is a popup"
popupText.Parent = popupFrame
local _ = nil
local var71 = nil

local _ = function(p12)
	-- upvalues: socialUtilModule (ref)
	return socialUtilModule.GetPlayerImage(p12, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
end

local function createNotification(p13, p14, p15)
	-- upvalues: var60 (ref), var38 (ref), notificationTitle (ref), notificationText (ref), textService (ref), var42 (ref), notificationFrame (ref), var46 (ref), var37 (ref), var40 (ref), notificationImage (ref), guiService (ref), httpService (ref)
	local var91 = var60:Clone()
	var91.Position = UDim2.new(1, 4, 1, (-var38) - 4)
	local var92 = notificationTitle:Clone()
	var92.Text = p13
	var92.Parent = var91
	local var93 = notificationText:Clone()
	var93.Text = p14
	var93.Parent = var91
	local var94 = false
	
	local function updateNotificationForMultiLineTitle()
		-- upvalues: var94 (write), var92 (ref), textService (copy), var42 (copy), var93 (ref), var91 (ref)
		var94 = true
		var92.TextWrapped = true
		var92.TextTruncate = Enum.TextTruncate.AtEnd
		local minValue = math.min(textService:GetTextSize(var92.Text, var92.TextSize, var92.Font, Vector2.new(var92.AbsoluteSize.X, 1000)).Y - var92.Size.Y.Offset, var42 - var92.Size.Y.Offset)
		var92.Size += UDim2.new(0, 0, 0, minValue)
		var92.Position -= UDim2.new(0, 0, 0, minValue / 2)
		var93.Position += UDim2.new(0, 0, 0, minValue / 2)
		var91.Size += UDim2.new(0, 0, 0, minValue)
	end
	
	var91.Parent = notificationFrame
	
	if p15 == nil or p15 == "" then
		if not var92.TextFits then
			var94 = true
			updateNotificationForMultiLineTitle()
		end
		if not var93.TextFits then
			local minValue = math.min(textService:GetTextSize(var93.Text, var93.TextSize, var93.Font, Vector2.new(var93.AbsoluteSize.X, 1000)).Y - var93.Size.Y.Offset, var46 - var93.Size.Y.Offset)
			var93.Size += UDim2.new(0, 0, 0, minValue)
			var92.Position -= UDim2.new(0, 0, 0, minValue / 2)
			var93.Position -= UDim2.new(0, 0, 0, minValue / 2)
			var91.Size += UDim2.new(0, 0, 0, minValue)
		end
	else
		local var96 = var37 + var40 * 2
		local var97 = var40
		local var98 = notificationImage:Clone()
		var98.Image = p15
		var98.Parent = var91
		var92.Size = UDim2.new(1, (-var96) - var97, 0, var92.Size.Y.Offset)
		var92.Position = UDim2.new(0, var96, var92.Position.Y.Scale, var92.Position.Y.Offset)
		var92.TextXAlignment = Enum.TextXAlignment.Left
		var93.Size = UDim2.new(1, (-var96) - var97, 0, var93.Size.Y.Offset)
		var93.Position = UDim2.new(0, var96, var93.Position.Y.Scale, var93.Position.Y.Offset)
		var93.TextXAlignment = Enum.TextXAlignment.Left
		
		if not var92.TextFits then
			updateNotificationForMultiLineTitle()
			local textSize = var93.TextSize
			var93.Size -= UDim2.new(0, 0, 0, textSize)
			var92.Position += UDim2.new(0, 0, 0, textSize / 2 - 2)
			var93.Position += UDim2.new(0, 0, 0, textSize / 2 - 2)
			var91.Size -= UDim2.new(0, 0, 0, textSize + 4)
		end
		if not var93.TextFits then
			local i
			local substring = nil
			local text = var93.Text
			
			for i = string.len(text) - 1, 2, -1 do
				if string.sub(text, i, i) == " " then
					var93.Text = string.sub(text, 1, i - 1)
					
					if not var93.TextFits then
						continue
					end
					substring = string.sub(text, i + 1)
					break
				end
			end
			if substring then
				local extraText = notificationText:Clone()
				extraText.TextXAlignment = Enum.TextXAlignment.Left
				extraText.Text = substring
				extraText.Name = "ExtraText"
				extraText.TextTruncate = Enum.TextTruncate.AtEnd
				extraText.Parent = var91
				i = math.min(textService:GetTextSize(substring, extraText.TextSize, extraText.Font, Vector2.new(extraText.AbsoluteSize.X, 1000)).Y, var46 - var93.Size.Y.Offset)
				extraText.Size = UDim2.new(extraText.Size.X.Scale, extraText.Size.X.Offset, 0, i)
				var92.Position -= UDim2.new(0, 0, 0, i / 2)
				var93.Position -= UDim2.new(0, 0, 0, i / 2)
				var91.Size += UDim2.new(0, 0, 0, i)
				extraText.AnchorPoint = Vector2.new(0.5, 0)
				extraText.Position = UDim2.new(0.5, 0, var93.Position.Y.Scale, var93.Position.Y.Offset + var93.AbsoluteSize.Y)
			else
				var93.Text = text
			end
		end
	end
	if var94 and var93.TextFits then
		local textTextSize = textService:GetTextSize(var93.Text, var93.TextSize, var93.Font, Vector2.new(var93.AbsoluteSize.X, 1000))
		
		if textTextSize.Y < var93.Size.Y.Offset then
			local var103 = var93.Size.Y.Offset - textTextSize.Y
			var93.Size -= UDim2.new(0, 0, 0, var103)
			var92.Position += UDim2.new(0, 0, 0, var103 / 2)
			var93.Position += UDim2.new(0, 0, 0, var103 / 2)
			var91.Size -= UDim2.new(0, 0, 0, var103)
		end
	end
	var91.Parent = nil
	guiService:AddSelectionParent(httpService:GenerateGUID(false), var91)
	
	return var91
end

local _ = function(p16)
	-- upvalues: t (ref)
	for i = 1, #t do
		if t[i] ~= p16 then
			continue
		end
		return i
	end
end

local function updateNotifications()
	-- upvalues: t (ref), var38 (ref), inOut (ref), sine (ref)
	local var105 = 1
	local var106 = 0
	
	for i = #t, 1, -1 do
		local var107 = t[i]
		
		if var107 then
			local frame = var107.Frame
			
			if frame and frame.Parent then
				local _ = if var107.IsFriend then (var38 + 2) * 1.5 else var38
				var106 += if var107.IsFriend then frame.Size.Y.Offset + (var38 + 2) * 0.5 else frame.Size.Y.Offset
				frame:TweenPositionInternal(UDim2.new(0, 0, 1, (-var106) - var105 * 4), inOut, sine, 0.35, true, function()
					-- upvalues: var107 (ref)
					if var107.TweenOutCallback then
						var107.TweenOutCallback()
					end
				end)
				var105 += 1
			end
		end
	end
end

local var74 = 0

local var75 = function(p17)
	-- upvalues: t (ref), t_1 (ref), notificationFrame (ref), var71 (write), var74 (write), updateNotifications (ref)
	spawn(function()
		-- upvalues: p17 (ref), t (copy), t_1 (copy), notificationFrame (copy), var71 (copy), var74 (copy), updateNotifications (copy)
		p17.IsActive = true
		local tCount = #t
		
		if tCount == 3 then
			t[1].Duration = 0
			t_1[#t_1 + 1] = p17
			
			return
		end
		t[tCount + 1] = p17
		p17.Frame.Parent = notificationFrame
		spawn(function()
			-- upvalues: p17 (copy), var71 (copy)
			wait(0.7)
			while p17.Duration > 0 do
				wait(0.2)
				p17.Duration -= 0.2
			end
			var71(p17)
		end)
		while tick() - var74 < 0.35 do
			wait()
		end
		var74 = tick()
		updateNotifications()
	end)
end

var71 = function(p18)
	-- upvalues: t (ref), inOut (ref), sine (ref), t_1 (ref), var75 (write), updateNotifications (ref)
	if not p18 then return end
	local var109
	for i = 1, #t do
		if t[i] ~= p18 then
			continue
		end
		var109 = i
		table.remove(t, var109)
		local frame = p18.Frame
		
		if frame and frame.Parent then
			p18.IsActive = false
			spawn(function()
				-- upvalues: frame (ref), inOut (copy), sine (copy), p18 (write)
				local function doTweenOut()
					-- upvalues: frame (copy), inOut (copy), sine (copy), p18 (copy)
					return if frame:IsDescendantOf(game) then frame:TweenPositionInternal(UDim2.new(1, 0, 1, frame.Position.Y.Offset), inOut, sine, 0.35, false, function()
						-- upvalues: frame (copy), p18 (copy)
						frame:Destroy()
						p18 = nil
					end) else false
				end
				
				if not doTweenOut() then
					p18.TweenOutCallback = doTweenOut
				end
			end)
		end
		if #t_1 > 0 then
			local var110 = t_1[1]
			table.remove(t_1, 1)
			var75(var110)
			
			if #t_1 > 0 and t[1] then
				t[1].Duration = 0
			end
		else
			updateNotifications()
		end
		return
	end
	var109 = nil
end

local _ = function(p19)
	-- upvalues: sendNotificationInfo (ref)
	p19.Duration = p19.Duration or 5
	sendNotificationInfo:Fire(p19)
end

local _ = function(p20, p21, p22)
	return {
		Text = p20,
		ButtonType = p21,
		OnActivated = function()
			-- upvalues: p22 (ref), p20 (ref)
			if p22 and type(p22) ~= "function" then
				pcall(function()
					-- upvalues: p22 (copy), p20 (copy)
					p22:Invoke(p20)
				end)
				
				return
			elseif type(p22) == "function" then
				p22(p20)
			end
		end
	}
end

sendNotificationInfo.Event:connect(function(p23)
	-- upvalues: VRService (ref), clientToastNotificationsEnabledEngineFeature (ref), getFFlagClientToastNotificationsRedirectModule (ref), gameTranslatorModule (ref), coreGuiService (ref), guiService (ref), createNotification (ref), createTextButton (ref), var71 (write), var48 (ref), var75 (write)
	if VRService.VREnabled then return end
	local callback = p23.Callback
	local button1Text = p23.Button1Text
	local button2Text = p23.Button2Text
	
	if clientToastNotificationsEnabledEngineFeature and getFFlagClientToastNotificationsRedirectModule() then
		local t = {}
		
		if button1Text and button1Text ~= "" then
			table.insert(t, {
				Text = button1Text,
				ButtonType = Enum.NotificationButtonType.Primary,
				OnActivated = function()
					-- upvalues: callback (ref), button1Text (ref)
					if callback and type(callback) ~= "function" then
						pcall(function()
							-- upvalues: callback (copy), button1Text (copy)
							callback:Invoke(button1Text)
						end)
						
						return
					elseif type(callback) == "function" then
						callback(button1Text)
					end
				end
			})
		end
		if button2Text and button2Text ~= "" then
			table.insert(t, {
				Text = button2Text,
				ButtonType = Enum.NotificationButtonType.Secondary,
				OnActivated = function()
					-- upvalues: callback (ref), button2Text (ref)
					if callback and type(callback) ~= "function" then
						pcall(function()
							-- upvalues: callback (copy), button2Text (copy)
							callback:Invoke(button2Text)
						end)
						
						return
					elseif type(callback) == "function" then
						callback(button2Text)
					end
				end
			})
		end
		guiService:SendNotification({
			Title = if p23.Autolocalize then gameTranslatorModule:TranslateGameText(coreGuiService, p23.Title) else p23.Title,
			Text = if p23.AutoLocalize then gameTranslatorModule:TranslateGameText(coreGuiService, p23.Text) else p23.Text,
			Icon = p23.Image,
			OnDisplay = p23.OnDisplay,
			OnDismiss = p23.OnDismiss,
			Buttons = t
		})
		
		return
	else
		local var116
		local t = {}
		local var114 = if p23.AutoLocalize then createNotification(gameTranslatorModule:TranslateGameText(coreGuiService, p23.Title), gameTranslatorModule:TranslateGameText(coreGuiService, p23.Text), p23.Image) else createNotification(p23.Title, p23.Text, p23.Image)
		local var115 = nil
		
		if button1Text and button1Text ~= "" then
			t.IsFriend = true
			var115 = createTextButton("Button1", UDim2.new(0, 0, 1, 2))
			
			if p23.AutoLocalize then
				gameTranslatorModule:TranslateAndRegister(var115, coreGuiService, button1Text)
			else
				var115.Text = button1Text
			end
			var115.Parent = var114
			var116 = nil
			var116 = var115.MouseButton1Click:connect(function()
				-- upvalues: var116 (write), var71 (copy), t (ref), callback (ref), button1Text (ref)
				if var116 then
					var116:disconnect()
					var116 = nil
					var71(t)
					
					if callback and type(callback) ~= "function" then
						pcall(function()
							-- upvalues: callback (copy), button1Text (copy)
							callback:Invoke(button1Text)
						end)
						
						return
					elseif type(callback) == "function" then
						callback(button1Text)
					end
				end
			end)
		end
		var116 = nil
		
		if button2Text and button2Text ~= "" then
			t.IsFriend = true
			var116 = createTextButton("Button2", UDim2.new(0.5, 1, 1, 2))
			
			if p23.AutoLocalize then
				gameTranslatorModule:TranslateAndRegister(var116, coreGuiService, button2Text)
			else
				var116.Text = button2Text
			end
			var116.Parent = var114
			local mouseButton1ClickConnection = nil
			mouseButton1ClickConnection = var116.MouseButton1Click:connect(function()
				-- upvalues: mouseButton1ClickConnection (write), var71 (copy), t (ref), callback (ref), button2Text (ref), p23 (ref)
				if mouseButton1ClickConnection then
					mouseButton1ClickConnection:disconnect()
					mouseButton1ClickConnection = nil
					var71(t)
					
					if callback and type(callback) ~= "function" then
						pcall(function()
							-- upvalues: callback (copy), button2Text (copy)
							callback:Invoke(button2Text)
						end)
						
						return
					elseif type(callback) == "function" then
						callback(p23.Button2Text)
					end
				end
			end)
		elseif var115 then
			var115.Size = UDim2.new(1, 0, 0, var48)
		end
		t.Frame = var114
		t.Duration = p23.Duration
		var75(t)
	end
end)
starterGuiService:RegisterSetCore("SendNotification", function(p24)
	-- upvalues: clientToastNotificationsEnabledEngineFeature (ref), getFFlagClientToastNotificationsRedirectModule (ref), sendNotificationInfo (ref)
	if type(p24) == "table" and type(p24.Title) == "string" and type(p24.Text) == "string" then
		local var121, var122
		local var118 = if type(p24.Icon) == "string" then p24.Icon else ""
		local var119 = if type(p24.Duration) == "number" then p24.Duration else 5
		local callback = typeof(p24.Callback) == "Instance" and (p24.Callback:IsA("BindableFunction") and (p24.Callback or nil))
		local _ = nil
		local _ = nil
		
		if clientToastNotificationsEnabledEngineFeature and getFFlagClientToastNotificationsRedirectModule() then
			var121 = if type(p24.Button1) == "string" then p24.Button1 else nil
			var122 = if type(p24.Button2) == "string" then p24.Button2 else nil
		else
			var121 = if type(p24.Button1) == "string" then p24.Button1 else ""
			var122 = if type(p24.Button2) == "string" then p24.Button2 else ""
		end
		local t = {
			GroupName = "Developer",
			Title = p24.Title,
			Text = p24.Text,
			Image = var118,
			Duration = var119,
			Callback = callback,
			Button1Text = var121,
			Button2Text = var122,
			AutoLocalize = if p24.AutoLocalize ~= nil then p24.AutoLocalize == true else true
		}
		t.Duration = t.Duration or 5
		sendNotificationInfo:Fire(t)
	end
end)
local _ = nil
local t_5 = {}

local var77 = function(p25)
	-- upvalues: t_5 (ref), var53 (write)
	local var124 = t_5[p25]
	
	if var124 and tick() < var124 then
		return true
	end
	t_5[p25] = tick() + var53
	
	return false
end

local function sendFriendNotification(p26)
	-- upvalues: var77 (write), notificationsRenameFriendRequestToConnection (ref), universalAppPolicyModule (ref), translateString (ref), t_4 (ref), socialUtilModule (ref), rbxAnalyticsService (ref), localPlayer (write), t_2 (ref), sendNotificationInfo (ref)
	if var77(p26) then
		return
	end
	local t = {
		GroupName = "Friends",
		Duration = 8,
		Button1Text = "Accept",
		Button2Text = "Decline",
		Title = p26.DisplayName,
		Text = if notificationsRenameFriendRequestToConnection and universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then translateString(t_4.SENT) else "Sent you a friend request!",
		DetailText = p26.DisplayName,
		Image = socialUtilModule.GetPlayerImage(p26.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5),
		Callback = function(p27)
			-- upvalues: rbxAnalyticsService (copy), localPlayer (copy), p26 (ref), t_2 (copy)
			if p27 == "Accept" then
				rbxAnalyticsService:ReportCounter("NotificationScript-RequestFriendship")
				rbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "NotificationScript")
				rbxAnalyticsService:ReportCounter("NotificationScript-AcceptFriendship")
				rbxAnalyticsService:TrackEvent("Game", "AcceptFriendship", "NotificationScript")
				localPlayer:RequestFriendship(p26)
				
				return
			end
			rbxAnalyticsService:ReportCounter("NotificationScript-RevokeFriendship")
			rbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "NotificationScript")
			localPlayer:RevokeFriendship(p26)
			t_2[p26] = true
		end,
		OnDisplay = function()
			-- upvalues: rbxAnalyticsService (copy)
			rbxAnalyticsService:ReportCounter("NotificationScript-FriendshipNotificationDisplayed")
			rbxAnalyticsService:TrackEvent("Game", "FriendshipNotificationDisplayed", "NotificationScript")
		end,
		OnDismiss = function()
			-- upvalues: rbxAnalyticsService (copy)
			rbxAnalyticsService:ReportCounter("NotificationScript-FriendshipNotificationDismissed")
			rbxAnalyticsService:TrackEvent("Game", "FriendshipNotificationDismissed", "NotificationScript")
		end
	}
	t.Duration = t.Duration or 5
	sendNotificationInfo:Fire(t)
end

local function onFriendRequestEvent(p28, p29, p30)
	-- upvalues: localPlayer (write), notificationsRenameFriendRequestToConnection (ref), universalAppPolicyModule (ref), translateString (ref), t_4 (ref), friendingUtilityModule (ref), getFFlagFriendshipNotifsUseSendrModule (ref), robloxTranslatorModule (ref), socialUtilModule (ref), sendNotificationInfo (ref), t_2 (ref), sendFriendNotification (ref)
	if p28 ~= localPlayer and p29 ~= localPlayer then return end
	local var126 = if notificationsRenameFriendRequestToConnection and universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then translateString(t_4.ACCEPTED) else "New Friend"
	local requiresOSAFriendingEducation = universalAppPolicyModule.getAppFeaturePolicies().getRequiresOSAFriendingEducation()
	local userIdFriendCountAsync = friendingUtilityModule:GetFriendCountAsync(localPlayer.UserId)
	local var129 = if userIdFriendCountAsync ~= 0 then userIdFriendCountAsync == nil else true
	
	if p28 == localPlayer then
		if p30 == Enum.FriendRequestEvent.Accept and not getFFlagFriendshipNotifsUseSendrModule() then
			local t = {
				GroupName = "Friends",
				Duration = 5,
				Title = var126,
				Text = p29.Name,
				DetailText = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", { RBX_NAME = p29.Name }),
				Image = socialUtilModule.GetPlayerImage(p29.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
			
			return
		end
	elseif p29 == localPlayer then
		if p30 == Enum.FriendRequestEvent.Issue and not getFFlagFriendshipNotifsUseSendrModule() then
			if t_2[p28] then return end
			if requiresOSAFriendingEducation and var129 then
				return
			end
			sendFriendNotification(p28)
			
			return
		elseif p30 == Enum.FriendRequestEvent.Accept then
			local t = {
				GroupName = "Friends",
				Duration = 5,
				Title = var126,
				Text = p28.Name,
				DetailText = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", { RBX_NAME = p28.Name }),
				Image = socialUtilModule.GetPlayerImage(p28.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
		end
	end
end

local function onPointsAwarded(p31, p32, _, _)
	-- upvalues: var31 (write), localPlayer (write), robloxTranslatorModule (ref), sendNotificationInfo (ref)
	if var31 and p31 == localPlayer.UserId then
		local var132 = nil
		local var133 = nil
		local _ = nil
		
		if p32 == 1 then
			var132 = "Point Awarded"
			var133 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.single", { RBX_NUMBER = tostring(p32) })
		elseif p32 > 0 then
			var132 = "Points Awarded"
			var133 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.multiple", { RBX_NUMBER = tostring(p32) })
		elseif p32 < 0 then
			var132 = "Points Lost"
			var133 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.negative", { RBX_NUMBER = tostring(p32) })
		else
			return
		end
		local t = {
			GroupName = "PlayerPoints",
			Image = "https://www.roblox.com/asset?id=206410433",
			Duration = 5,
			Title = var132,
			Text = var133,
			DetailText = var133
		}
		t.Duration = t.Duration or 5
		sendNotificationInfo:Fire(t)
	end
end

local function onBadgeAwarded(p33, p34, p35)
	-- upvalues: t_3 (ref), var32 (write), localPlayer (write), groupService (ref), playersService (ref), badgeService (ref), fixOnBadgeAwardedError (ref), robloxTranslatorModule (ref), rbxAnalyticsService (ref), sendNotificationInfo (ref)
	if not t_3[p35] and var32 and p33 == localPlayer.UserId then
		t_3[p35] = true
		local var135 = ""
		
		if game.CreatorType == Enum.CreatorType.Group then
			local ok, status = pcall(function()
				-- upvalues: groupService (copy), p34 (ref)
				return groupService:GetGroupInfoAsync(p34)
			end)
			
			if not ok then
				var135 = ""
			end
			if status then
				var135 = status.Name
			end
		elseif game.CreatorType == Enum.CreatorType.User then
			local _ = nil
			local ok, status = pcall(function()
				-- upvalues: playersService (copy), p34 (ref)
				return playersService:GetNameFromUserIdAsync(p34)
			end)
			var135 = if not ok then "" else status
		end
		local ok, status = pcall(function()
			-- upvalues: badgeService (copy), p35 (ref)
			return badgeService:GetBadgeInfoAsync(p35)
		end)
		
		if not ok then return end
		if fixOnBadgeAwardedError and var135 == nil then
			var135 = ""
		end
		local var136 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onBadgeAwardedDetail", {
			RBX_NAME = localPlayer.Name,
			CREATOR_NAME = var135,
			BADGE_NAME = status.DisplayName
		})
		local t = nil
		local var138 = "InGame.NotificationScript2.onBadgeAwardedTitle"
		pcall(function()
			-- upvalues: t (write), robloxTranslatorModule (copy), var138 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var138)
		end)
		t = {
			GroupName = "BadgeAwards",
			Image = "https://www.roblox.com/asset?id=206410289",
			Duration = 5,
			Title = t,
			Text = var136,
			DetailText = var136,
			OnDisplay = function()
				-- upvalues: rbxAnalyticsService (copy)
				rbxAnalyticsService:ReportCounter("NotificationScript-BadgeAwardNotificationDisplayed")
				rbxAnalyticsService:TrackEvent("Game", "BadgeAwardNotificationDisplayed", "NotificationScript")
			end,
			OnDismiss = function()
				-- upvalues: rbxAnalyticsService (copy)
				rbxAnalyticsService:ReportCounter("NotificationScript-BadgeAwardNotificationDismissed")
				rbxAnalyticsService:TrackEvent("Game", "BadgeAwardNotificationDismissed", "NotificationScript")
			end
		}
		t.Duration = t.Duration or 5
		sendNotificationInfo:Fire(t)
	end
end

function onGameSettingsChanged(value_1, p36)
	-- upvalues: gameSettings (ref), value (write), robloxTranslatorModule (ref), sendNotificationInfo (ref)
	if value_1 == "SavedQualityLevel" then
		local var139 = gameSettings.SavedQualityLevel.Value + p36
		
		if var139 > 10 then
			var139 = 10
		elseif var139 < 1 then
			var139 = 1
		end
		if var139 > 0 and var139 ~= value and gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
			local var140 = if value < var139 then robloxTranslatorModule:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Increased", { RBX_NUMBER = tostring(var139) }) else robloxTranslatorModule:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Decreased", { RBX_NUMBER = tostring(var139) })
			local t = {
				GroupName = "Graphics",
				Title = "Graphics Quality",
				Image = "",
				Duration = 2,
				Text = var140,
				DetailText = var140
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
			value = var139
		end
	end
end

if not cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
	badgeService.OnBadgeAwarded:connect(onBadgeAwarded)
end
if not var30 then
	playersService.FriendRequestEvent:connect(onFriendRequestEvent)
	pointsService.PointsAwarded:connect(onPointsAwarded)
	game.GraphicsQualityChangeRequest:Connect(function(_)
		onGameSettingsChanged("SavedQualityLevel", 0)
	end)
end
if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
	if not shouldSaveScreenshotToAlbumModule() then
		game.ScreenshotReady:Connect(function(_)
			-- upvalues: robloxTranslatorModule (ref), sendNotificationInfo (ref)
			local var142 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.ButtonText")
			local t = {
				Duration = 3,
				Title = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.Title"),
				Text = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.Description"),
				Button1Text = var142,
				Callback = function(p37)
					-- upvalues: var142 (ref)
					if p37 == var142 then
						game:OpenScreenshotsFolder()
					end
				end
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
		end)
	end
	settings():GetService("GameSettings").VideoRecordingChangeRequest:Connect(function(p38)
		-- upvalues: robloxTranslatorModule (ref), sendNotificationInfo (ref)
		if not p38 then
			local var144 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.ButtonText")
			local t = {
				Duration = 3,
				Title = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.Title"),
				Text = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.Description"),
				Button1Text = var144,
				Callback = function(p39)
					-- upvalues: var144 (ref)
					if p39 == var144 then
						game:OpenVideosFolder()
					end
				end
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
		end
	end)
end
function guiService.SendCoreUiNotification(p40, p41)
	-- upvalues: createNotification (ref), parent (ref), inOut (ref), sine (ref)
	local var146 = createNotification(p40, p41, "")
	var146.BackgroundTransparency = 0.5
	var146.Size = UDim2.new(0.5, 0, 0.1, 0)
	var146.Position = UDim2.new(0.25, 0, -0.1, 0)
	var146.NotificationTitle.FontSize = Enum.FontSize.Size36
	var146.NotificationText.FontSize = Enum.FontSize.Size24
	var146.Parent = parent
	var146:TweenPositionInternal(UDim2.new(0.25, 0, 0, 0), inOut, sine, 0.35, true)
	wait(5)
	
	if var146 then
		var146:Destroy()
	end
end

marketplaceService.ClientLuaDialogRequested:connect(function(p42, p43, p44)
	-- upvalues: popupText (ref), guiService (ref), popupFrame (ref), popupAcceptButton (ref), marketplaceService (ref), popupDeclineButton (ref), popupOKButton (ref)
	popupText.Text = p42
	local mouseButton1ClickConnection = nil
	local mouseButton1ClickConnection_1 = nil
	
	local function _()
		-- upvalues: mouseButton1ClickConnection (write), mouseButton1ClickConnection_1 (write), guiService (copy), popupFrame (copy)
		if mouseButton1ClickConnection then
			mouseButton1ClickConnection:disconnect()
		end
		if mouseButton1ClickConnection_1 then
			mouseButton1ClickConnection_1:disconnect()
		end
		guiService:RemoveCenterDialog(popupFrame)
		popupFrame.Visible = false
	end
	
	mouseButton1ClickConnection = popupAcceptButton.MouseButton1Click:connect(function()
		-- upvalues: mouseButton1ClickConnection (write), mouseButton1ClickConnection_1 (write), guiService (copy), popupFrame (copy), marketplaceService (copy)
		if mouseButton1ClickConnection then
			mouseButton1ClickConnection:disconnect()
		end
		if mouseButton1ClickConnection_1 then
			mouseButton1ClickConnection_1:disconnect()
		end
		guiService:RemoveCenterDialog(popupFrame)
		popupFrame.Visible = false
		marketplaceService:SignalServerLuaDialogClosed(true)
	end)
	mouseButton1ClickConnection_1 = popupDeclineButton.MouseButton1Click:connect(function()
		-- upvalues: mouseButton1ClickConnection (write), mouseButton1ClickConnection_1 (write), guiService (copy), popupFrame (copy), marketplaceService (copy)
		if mouseButton1ClickConnection then
			mouseButton1ClickConnection:disconnect()
		end
		if mouseButton1ClickConnection_1 then
			mouseButton1ClickConnection_1:disconnect()
		end
		guiService:RemoveCenterDialog(popupFrame)
		popupFrame.Visible = false
		marketplaceService:SignalServerLuaDialogClosed(false)
	end)
	
	if not pcall(function()
		-- upvalues: guiService (copy), popupFrame (copy), popupOKButton (copy), popupAcceptButton (copy), popupDeclineButton (copy), p43 (ref), p44 (ref)
		guiService:AddCenterDialog(popupFrame, Enum.CenterDialogType.QuitDialog, function()
			-- upvalues: popupOKButton (copy), popupAcceptButton (copy), popupDeclineButton (copy), p43 (copy), p44 (copy), popupFrame (copy)
			popupOKButton.Visible = false
			popupAcceptButton.Visible = true
			popupDeclineButton.Visible = true
			popupAcceptButton.Text = p43
			popupDeclineButton.Text = p44
			popupFrame.Visible = true
		end, function()
			-- upvalues: popupFrame (copy)
			popupFrame.Visible = false
		end)
	end) then
		popupFrame.Visible = true
		popupAcceptButton.Text = p43
		popupDeclineButton.Text = p44
	end
	return true
end)
gameSettings:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
	-- upvalues: var36 (write), gameSettings (ref), var60 (ref), t (ref)
	var36 = 0.6 * gameSettings.PreferredTransparency
	var60.BackgroundTransparency = var36
	
	for i = 1, #t do
		t[i].Frame.BackgroundTransparency = var36
	end
end)

if fFlagCoreScriptShowTeleportPromptModule then
	local function onMenuTeleportAttemptNotification()
		-- upvalues: robloxTranslatorModule (ref), var43 (ref), sendNotificationInfo (ref)
		local var149 = "Teleporting Paused"
		local var150 = "Feature.SettingsHub.Prompt.TeleportBlock.Title"
		pcall(function()
			-- upvalues: var149 (write), robloxTranslatorModule (copy), var150 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var150)
		end)
		local var151 = var149
		local var152 = "Teleporting will resume upon menu close."
		local var153 = "Feature.SettingsHub.Prompt.TeleportBlock.Subtitle"
		pcall(function()
			-- upvalues: var152 (write), robloxTranslatorModule (copy), var153 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var153)
		end)
		var152 = {
			GroupName = "Teleport",
			Image = "http://www.roblox.com/asset/?id=10961494062",
			Duration = 5,
			Title = var151,
			Text = var152,
			BottomPadding = var43
		}
		var152.Duration = var152.Duration or 5
		sendNotificationInfo:Fire(var152)
	end
	
	local _ = function()
		-- upvalues: teleportService (ref), onMenuTeleportAttemptNotification (ref)
		teleportService.MenuTeleportAttempt:Connect(function()
			-- upvalues: onMenuTeleportAttemptNotification (copy)
			onMenuTeleportAttemptNotification()
		end)
	end
	
	teleportService.MenuTeleportAttempt:Connect(function()
		-- upvalues: onMenuTeleportAttemptNotification (ref)
		onMenuTeleportAttemptNotification()
	end)
end