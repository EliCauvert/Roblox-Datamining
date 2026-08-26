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

local function _(p1, p2)
	-- upvalues: robloxTranslatorModule (ref)
	pcall(function()
		-- upvalues: p2 (write), robloxTranslatorModule (copy), p1 (ref)
		p2 = robloxTranslatorModule:FormatByKey(p1)
	end)
	
	return p2
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
local var1 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local var2 = true
local var3 = true
local socialUtilModule = require(robloxGui.Modules.SocialUtil)
local gameTranslatorModule = require(robloxGui.Modules.GameTranslator)
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local var4 = 0.6 * gameSettings.PreferredTransparency
local var5 = if var1 then 72 else 48
local var6 = if var1 then 145 else 64
local var7 = if var1 then 450 else 200
local var8 = var5 / 6
local var9 = if var1 then 42 else 18
local var10 = if var1 then 84 else 36
local var11 = -var9
local var12 = if var1 then Enum.FontSize.Size42 else Enum.FontSize.Size18
local var13 = if var1 then 72 else 28
local var14 = if var1 then 144 else 56
local var15 = if var1 then Enum.FontSize.Size36 else Enum.FontSize.Size14
local var16 = var6 / 2
local var17 = var8 / 2
local var18 = if var1 then Enum.FontSize.Size42 else Enum.FontSize.Size18
local var19 = if var1 then 42 else 18
local var20 = if var1 then 30 else 14
local inOut = Enum.EasingDirection.InOut
local sine = Enum.EasingStyle.Sine
local var21 = 5
local t_4 = {
	ACCEPTED = if fFlagConnectionsToFriendsRename then "InGame.NotificationScript2.Message.FriendRequestEvent.Accepted" else "InGame.NotificationScript2.Message.ConnectionRequestEvent.Accepted",
	SENT = if fFlagConnectionsToFriendsRename then "InGame.NotificationScript2.Message.FriendRequestEvent.Sent" else "InGame.NotificationScript2.Message.ConnectionRequestEvent.Sent"
}

local function translateString(p1, p2)
	-- upvalues: localizationService (ref), localization (ref), logging (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var22 = localization.new(robloxLocaleId)
	var22:SetLocale(robloxLocaleId)
	local ok, status = pcall(function()
		-- upvalues: var22 (ref), p1 (ref), p2 (ref)
		return var22:Format(p1, p2)
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
	var21 = status
end
starterGuiService:RegisterSetCore("PointsNotificationsActive", function(p1)
	-- upvalues: var2 (write)
	if type(p1) == "boolean" then
		var2 = p1
	end
end)
starterGuiService:RegisterSetCore("BadgesNotificationsActive", function(p1)
	-- upvalues: var3 (write)
	if type(p1) == "boolean" then
		var3 = p1
	end
end)
starterGuiService:RegisterGetCore("PointsNotificationsActive", function()
	-- upvalues: var2 (write)
	return var2
end)
starterGuiService:RegisterGetCore("BadgesNotificationsActive", function()
	-- upvalues: var3 (write)
	return var3
end)

local _ = function(p1, p2, p3, p4)
	local frame = Instance.new("Frame")
	frame.Name = p1
	frame.Size = p2
	frame.Position = p3
	frame.BackgroundTransparency = p4
	
	return frame
end

local function createTextButton(p1, p2)
	-- upvalues: var16 (ref), var4 (write), var18 (ref), var17 (ref), var19 (ref), var20 (ref)
	local textButton = Instance.new("TextButton")
	textButton.Name = p1
	textButton.Size = UDim2.new(0.5, -1, 0, var16)
	textButton.Position = p2
	textButton.BackgroundTransparency = var4
	textButton.BackgroundColor3 = Color3.new(0, 0, 0)
	textButton.BorderSizePixel = 0
	textButton.Font = Enum.Font.SourceSansBold
	textButton.FontSize = var18
	textButton.TextColor3 = Color3.new(1, 1, 1)
	textButton.TextTruncate = Enum.TextTruncate.AtEnd
	textButton.TextScaled = true
	local UIPadding = Instance.new("UIPadding")
	UIPadding.PaddingTop = UDim.new(0, var17 / 2)
	UIPadding.PaddingBottom = UDim.new(0, var17 / 2)
	UIPadding.PaddingLeft = UDim.new(0, var17)
	UIPadding.PaddingRight = UDim.new(0, var17)
	UIPadding.Parent = textButton
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	UITextSizeConstraint.MaxTextSize = var19
	UITextSizeConstraint.MinTextSize = var20
	UITextSizeConstraint.Parent = textButton
	
	return textButton
end

local uDim2 = UDim2.new(0, var7, 0.42, 0)
local uDim2_1 = UDim2.new(1, (-var7) - 4, 0.5, 0)
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
local var22 = (function()
	-- upvalues: var6 (ref), var4 (write)
	local uDim2 = UDim2.new(1, 0, 0, var6)
	local uDim2_1 = UDim2.new(0, 0, 0, 0)
	local notification = Instance.new("Frame")
	notification.Name = "Notification"
	notification.Size = uDim2
	notification.Position = uDim2_1
	notification.BackgroundTransparency = var4
	notification.BackgroundColor3 = Color3.new(0, 0, 0)
	notification.BorderSizePixel = 0
	
	return notification
end)()
local notificationTitle = Instance.new("TextLabel")
notificationTitle.Name = "NotificationTitle"
notificationTitle.Size = UDim2.new(1, -var8 * 2, 0, var9)
notificationTitle.Position = UDim2.new(0, var8, 0.5, var11)
notificationTitle.BackgroundTransparency = 1
notificationTitle.Font = Enum.Font.SourceSansBold
notificationTitle.FontSize = var12
notificationTitle.TextColor3 = Color3.new(0.97, 0.97, 0.97)
local notificationText = Instance.new("TextLabel")
notificationText.Name = "NotificationText"
notificationText.Size = UDim2.new(1, -var8 * 2, 0, var13)
notificationText.Position = UDim2.new(0, var8, 0.5, 1)
notificationText.BackgroundTransparency = 1
notificationText.Font = Enum.Font.SourceSans
notificationText.FontSize = var15
notificationText.TextColor3 = Color3.new(0.92, 0.92, 0.92)
notificationText.TextWrap = true
notificationText.TextYAlignment = Enum.TextYAlignment.Top
local notificationImage = Instance.new("ImageLabel")
notificationImage.Name = "NotificationImage"
notificationImage.Size = UDim2.new(0, var5, 0, var5)
notificationImage.Position = UDim2.new(0, var8, 0, 0.5 * (var6 - var5))
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
local var23 = nil

local _ = function(p1)
	-- upvalues: socialUtilModule (ref)
	return socialUtilModule.GetPlayerImage(p1, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
end

local function createNotification(p1, p2, p3)
	-- upvalues: var22 (ref), var6 (ref), notificationTitle (ref), notificationText (ref), textService (ref), var10 (ref), notificationFrame (ref), var14 (ref), var5 (ref), var8 (ref), notificationImage (ref), guiService (ref), httpService (ref)
	local var24 = var22:Clone()
	var24.Position = UDim2.new(1, 4, 1, (-var6) - 4)
	local var25 = notificationTitle:Clone()
	var25.Text = p1
	var25.Parent = var24
	local var26 = notificationText:Clone()
	var26.Text = p2
	var26.Parent = var24
	local var27 = false
	
	local function updateNotificationForMultiLineTitle()
		-- upvalues: var27 (write), var25 (ref), textService (copy), var10 (copy), var26 (ref), var24 (ref)
		var27 = true
		var25.TextWrapped = true
		var25.TextTruncate = Enum.TextTruncate.AtEnd
		local minValue = math.min(textService:GetTextSize(var25.Text, var25.TextSize, var25.Font, Vector2.new(var25.AbsoluteSize.X, 1000)).Y - var25.Size.Y.Offset, var10 - var25.Size.Y.Offset)
		var25.Size += UDim2.new(0, 0, 0, minValue)
		var25.Position -= UDim2.new(0, 0, 0, minValue / 2)
		var26.Position += UDim2.new(0, 0, 0, minValue / 2)
		var24.Size += UDim2.new(0, 0, 0, minValue)
	end
	
	var24.Parent = notificationFrame
	
	if p3 == nil or p3 == "" then
		if not var25.TextFits then
			var27 = true
			updateNotificationForMultiLineTitle()
		end
		if not var26.TextFits then
			local minValue = math.min(textService:GetTextSize(var26.Text, var26.TextSize, var26.Font, Vector2.new(var26.AbsoluteSize.X, 1000)).Y - var26.Size.Y.Offset, var14 - var26.Size.Y.Offset)
			var26.Size += UDim2.new(0, 0, 0, minValue)
			var25.Position -= UDim2.new(0, 0, 0, minValue / 2)
			var26.Position -= UDim2.new(0, 0, 0, minValue / 2)
			var24.Size += UDim2.new(0, 0, 0, minValue)
		end
	else
		local var28 = var5 + var8 * 2
		local var29 = var8
		local var30 = notificationImage:Clone()
		var30.Image = p3
		var30.Parent = var24
		var25.Size = UDim2.new(1, (-var28) - var29, 0, var25.Size.Y.Offset)
		var25.Position = UDim2.new(0, var28, var25.Position.Y.Scale, var25.Position.Y.Offset)
		var25.TextXAlignment = Enum.TextXAlignment.Left
		var26.Size = UDim2.new(1, (-var28) - var29, 0, var26.Size.Y.Offset)
		var26.Position = UDim2.new(0, var28, var26.Position.Y.Scale, var26.Position.Y.Offset)
		var26.TextXAlignment = Enum.TextXAlignment.Left
		
		if not var25.TextFits then
			updateNotificationForMultiLineTitle()
			local textSize = var26.TextSize
			var26.Size -= UDim2.new(0, 0, 0, textSize)
			var25.Position += UDim2.new(0, 0, 0, textSize / 2 - 2)
			var26.Position += UDim2.new(0, 0, 0, textSize / 2 - 2)
			var24.Size -= UDim2.new(0, 0, 0, textSize + 4)
		end
		if not var26.TextFits then
			local i
			local substring = nil
			local text = var26.Text
			
			for i = string.len(text) - 1, 2, -1 do
				if string.sub(text, i, i) == " " then
					var26.Text = string.sub(text, 1, i - 1)
					
					if not var26.TextFits then
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
				extraText.Parent = var24
				i = math.min(textService:GetTextSize(substring, extraText.TextSize, extraText.Font, Vector2.new(extraText.AbsoluteSize.X, 1000)).Y, var14 - var26.Size.Y.Offset)
				extraText.Size = UDim2.new(extraText.Size.X.Scale, extraText.Size.X.Offset, 0, i)
				var25.Position -= UDim2.new(0, 0, 0, i / 2)
				var26.Position -= UDim2.new(0, 0, 0, i / 2)
				var24.Size += UDim2.new(0, 0, 0, i)
				extraText.AnchorPoint = Vector2.new(0.5, 0)
				extraText.Position = UDim2.new(0.5, 0, var26.Position.Y.Scale, var26.Position.Y.Offset + var26.AbsoluteSize.Y)
			else
				var26.Text = text
			end
		end
	end
	if var27 and var26.TextFits then
		local textTextSize = textService:GetTextSize(var26.Text, var26.TextSize, var26.Font, Vector2.new(var26.AbsoluteSize.X, 1000))
		
		if textTextSize.Y < var26.Size.Y.Offset then
			local var31 = var26.Size.Y.Offset - textTextSize.Y
			var26.Size -= UDim2.new(0, 0, 0, var31)
			var25.Position += UDim2.new(0, 0, 0, var31 / 2)
			var26.Position += UDim2.new(0, 0, 0, var31 / 2)
			var24.Size -= UDim2.new(0, 0, 0, var31)
		end
	end
	var24.Parent = nil
	guiService:AddSelectionParent(httpService:GenerateGUID(false), var24)
	
	return var24
end

local _ = function(p4)
	-- upvalues: t (ref)
	for i = 1, #t do
		if t[i] ~= p4 then
			continue
		end
		return i
	end
end

local function updateNotifications()
	-- upvalues: t (ref), var6 (ref), inOut (ref), sine (ref)
	local var32 = 1
	local var33 = 0
	
	for i = #t, 1, -1 do
		local var34 = t[i]
		
		if var34 then
			local frame = var34.Frame
			
			if frame and frame.Parent then
				local _ = if var34.IsFriend then (var6 + 2) * 1.5 else var6
				var33 += if var34.IsFriend then frame.Size.Y.Offset + (var6 + 2) * 0.5 else frame.Size.Y.Offset
				frame:TweenPositionInternal(UDim2.new(0, 0, 1, (-var33) - var32 * 4), inOut, sine, 0.35, true, function()
					-- upvalues: var34 (ref)
					if var34.TweenOutCallback then
						var34.TweenOutCallback()
					end
				end)
				var32 += 1
			end
		end
	end
end

local var35 = 0

local var36 = function(p5)
	-- upvalues: t (ref), t_1 (ref), notificationFrame (ref), var23 (write), var35 (write), updateNotifications (ref)
	spawn(function()
		-- upvalues: p5 (ref), t (copy), t_1 (copy), notificationFrame (copy), var23 (copy), var35 (copy), updateNotifications (copy)
		p5.IsActive = true
		local tCount = #t
		
		if tCount == 3 then
			t[1].Duration = 0
			t_1[#t_1 + 1] = p5
			
			return
		end
		t[tCount + 1] = p5
		p5.Frame.Parent = notificationFrame
		spawn(function()
			-- upvalues: p5 (copy), var23 (copy)
			wait(0.7)
			while p5.Duration > 0 do
				wait(0.2)
				p5.Duration -= 0.2
			end
			var23(p5)
		end)
		while tick() - var35 < 0.35 do
			wait()
		end
		var35 = tick()
		updateNotifications()
	end)
end

var23 = function(p6)
	-- upvalues: t (ref), inOut (ref), sine (ref), t_1 (ref), var36 (write), updateNotifications (ref)
	if not p6 then return end
	local var37
	for i = 1, #t do
		if t[i] ~= p6 then
			continue
		end
		var37 = i
		table.remove(t, var37)
		local frame = p6.Frame
		
		if frame and frame.Parent then
			p6.IsActive = false
			spawn(function()
				-- upvalues: frame (ref), inOut (copy), sine (copy), p6 (write)
				local function doTweenOut()
					-- upvalues: frame (copy), inOut (copy), sine (copy), p6 (copy)
					return if frame:IsDescendantOf(game) then frame:TweenPositionInternal(UDim2.new(1, 0, 1, frame.Position.Y.Offset), inOut, sine, 0.35, false, function()
						-- upvalues: frame (copy), p6 (copy)
						frame:Destroy()
						p6 = nil
					end) else false
				end
				
				if not doTweenOut() then
					p6.TweenOutCallback = doTweenOut
				end
			end)
		end
		if #t_1 > 0 then
			local var38 = t_1[1]
			table.remove(t_1, 1)
			var36(var38)
			
			if #t_1 > 0 and t[1] then
				t[1].Duration = 0
			end
		else
			updateNotifications()
		end
		return
	end
	var37 = nil
end

local _ = function(p7)
	-- upvalues: sendNotificationInfo (ref)
	p7.Duration = p7.Duration or 5
	sendNotificationInfo:Fire(p7)
end

local _ = function(p7, p8, p9)
	return {
		Text = p7,
		ButtonType = p8,
		OnActivated = function()
			-- upvalues: p9 (ref), p7 (ref)
			if p9 and type(p9) ~= "function" then
				pcall(function()
					-- upvalues: p9 (copy), p7 (copy)
					p9:Invoke(p7)
				end)
				
				return
			elseif type(p9) == "function" then
				p9(p7)
			end
		end
	}
end

sendNotificationInfo.Event:connect(function(p7)
	-- upvalues: VRService (ref), clientToastNotificationsEnabledEngineFeature (ref), getFFlagClientToastNotificationsRedirectModule (ref), gameTranslatorModule (ref), coreGuiService (ref), guiService (ref), createNotification (ref), createTextButton (ref), var23 (write), var16 (ref), var36 (write)
	if VRService.VREnabled then return end
	local callback = p7.Callback
	local button1Text = p7.Button1Text
	local button2Text = p7.Button2Text
	
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
			Title = if p7.Autolocalize then gameTranslatorModule:TranslateGameText(coreGuiService, p7.Title) else p7.Title,
			Text = if p7.AutoLocalize then gameTranslatorModule:TranslateGameText(coreGuiService, p7.Text) else p7.Text,
			Icon = p7.Image,
			OnDisplay = p7.OnDisplay,
			OnDismiss = p7.OnDismiss,
			Buttons = t
		})
		
		return
	else
		local var39
		local t = {}
		local var40 = if p7.AutoLocalize then createNotification(gameTranslatorModule:TranslateGameText(coreGuiService, p7.Title), gameTranslatorModule:TranslateGameText(coreGuiService, p7.Text), p7.Image) else createNotification(p7.Title, p7.Text, p7.Image)
		local var41 = nil
		
		if button1Text and button1Text ~= "" then
			t.IsFriend = true
			var41 = createTextButton("Button1", UDim2.new(0, 0, 1, 2))
			
			if p7.AutoLocalize then
				gameTranslatorModule:TranslateAndRegister(var41, coreGuiService, button1Text)
			else
				var41.Text = button1Text
			end
			var41.Parent = var40
			var39 = nil
			var39 = var41.MouseButton1Click:connect(function()
				-- upvalues: var39 (write), var23 (copy), t (ref), callback (ref), button1Text (ref)
				if var39 then
					var39:disconnect()
					var39 = nil
					var23(t)
					
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
		var39 = nil
		
		if button2Text and button2Text ~= "" then
			t.IsFriend = true
			var39 = createTextButton("Button2", UDim2.new(0.5, 1, 1, 2))
			
			if p7.AutoLocalize then
				gameTranslatorModule:TranslateAndRegister(var39, coreGuiService, button2Text)
			else
				var39.Text = button2Text
			end
			var39.Parent = var40
			local mouseButton1ClickConnection = nil
			mouseButton1ClickConnection = var39.MouseButton1Click:connect(function()
				-- upvalues: mouseButton1ClickConnection (write), var23 (copy), t (ref), callback (ref), button2Text (ref), p7 (ref)
				if mouseButton1ClickConnection then
					mouseButton1ClickConnection:disconnect()
					mouseButton1ClickConnection = nil
					var23(t)
					
					if callback and type(callback) ~= "function" then
						pcall(function()
							-- upvalues: callback (copy), button2Text (copy)
							callback:Invoke(button2Text)
						end)
						
						return
					elseif type(callback) == "function" then
						callback(p7.Button2Text)
					end
				end
			end)
		elseif var41 then
			var41.Size = UDim2.new(1, 0, 0, var16)
		end
		t.Frame = var40
		t.Duration = p7.Duration
		var36(t)
	end
end)
starterGuiService:RegisterSetCore("SendNotification", function(p7)
	-- upvalues: clientToastNotificationsEnabledEngineFeature (ref), getFFlagClientToastNotificationsRedirectModule (ref), sendNotificationInfo (ref)
	if type(p7) == "table" and type(p7.Title) == "string" and type(p7.Text) == "string" then
		local var39, var40
		local var41 = if type(p7.Icon) == "string" then p7.Icon else ""
		local var42 = if type(p7.Duration) == "number" then p7.Duration else 5
		local callback = typeof(p7.Callback) == "Instance" and (p7.Callback:IsA("BindableFunction") and (p7.Callback or nil))
		local _ = nil
		local _ = nil
		
		if clientToastNotificationsEnabledEngineFeature and getFFlagClientToastNotificationsRedirectModule() then
			var39 = if type(p7.Button1) == "string" then p7.Button1 else nil
			var40 = if type(p7.Button2) == "string" then p7.Button2 else nil
		else
			var39 = if type(p7.Button1) == "string" then p7.Button1 else ""
			var40 = if type(p7.Button2) == "string" then p7.Button2 else ""
		end
		local t = {
			GroupName = "Developer",
			Title = p7.Title,
			Text = p7.Text,
			Image = var41,
			Duration = var42,
			Callback = callback,
			Button1Text = var39,
			Button2Text = var40,
			AutoLocalize = if p7.AutoLocalize ~= nil then p7.AutoLocalize == true else true
		}
		t.Duration = t.Duration or 5
		sendNotificationInfo:Fire(t)
	end
end)
local _ = nil
local t_5 = {}

local var39 = function(p7)
	-- upvalues: t_5 (ref), var21 (write)
	local var40 = t_5[p7]
	
	if var40 and tick() < var40 then
		return true
	end
	t_5[p7] = tick() + var21
	
	return false
end

local function sendFriendNotification(p7)
	-- upvalues: var39 (write), notificationsRenameFriendRequestToConnection (ref), universalAppPolicyModule (ref), translateString (ref), t_4 (ref), socialUtilModule (ref), rbxAnalyticsService (ref), localPlayer (write), t_2 (ref), sendNotificationInfo (ref)
	if var39(p7) then
		return
	end
	local t = {
		GroupName = "Friends",
		Duration = 8,
		Button1Text = "Accept",
		Button2Text = "Decline",
		Title = p7.DisplayName,
		Text = if notificationsRenameFriendRequestToConnection and universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then translateString(t_4.SENT) else "Sent you a friend request!",
		DetailText = p7.DisplayName,
		Image = socialUtilModule.GetPlayerImage(p7.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5),
		Callback = function(p8)
			-- upvalues: rbxAnalyticsService (copy), localPlayer (copy), p7 (ref), t_2 (copy)
			if p8 == "Accept" then
				rbxAnalyticsService:ReportCounter("NotificationScript-RequestFriendship")
				rbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "NotificationScript")
				rbxAnalyticsService:ReportCounter("NotificationScript-AcceptFriendship")
				rbxAnalyticsService:TrackEvent("Game", "AcceptFriendship", "NotificationScript")
				localPlayer:RequestFriendship(p7)
				
				return
			end
			rbxAnalyticsService:ReportCounter("NotificationScript-RevokeFriendship")
			rbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "NotificationScript")
			localPlayer:RevokeFriendship(p7)
			t_2[p7] = true
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

local function onFriendRequestEvent(p7, p8, p9)
	-- upvalues: localPlayer (write), notificationsRenameFriendRequestToConnection (ref), universalAppPolicyModule (ref), translateString (ref), t_4 (ref), friendingUtilityModule (ref), getFFlagFriendshipNotifsUseSendrModule (ref), robloxTranslatorModule (ref), socialUtilModule (ref), sendNotificationInfo (ref), t_2 (ref), sendFriendNotification (ref)
	if p7 ~= localPlayer and p8 ~= localPlayer then return end
	local var40 = if notificationsRenameFriendRequestToConnection and universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then translateString(t_4.ACCEPTED) else "New Friend"
	local requiresOSAFriendingEducation = universalAppPolicyModule.getAppFeaturePolicies().getRequiresOSAFriendingEducation()
	local userIdFriendCountAsync = friendingUtilityModule:GetFriendCountAsync(localPlayer.UserId)
	local var41 = if userIdFriendCountAsync ~= 0 then userIdFriendCountAsync == nil else true
	
	if p7 == localPlayer then
		if p9 == Enum.FriendRequestEvent.Accept and not getFFlagFriendshipNotifsUseSendrModule() then
			local t = {
				GroupName = "Friends",
				Duration = 5,
				Title = var40,
				Text = p8.Name,
				DetailText = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", { RBX_NAME = p8.Name }),
				Image = socialUtilModule.GetPlayerImage(p8.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
			
			return
		end
	elseif p8 == localPlayer then
		if p9 == Enum.FriendRequestEvent.Issue and not getFFlagFriendshipNotifsUseSendrModule() then
			if t_2[p7] then return end
			if requiresOSAFriendingEducation and var41 then
				return
			end
			sendFriendNotification(p7)
			
			return
		elseif p9 == Enum.FriendRequestEvent.Accept then
			local t = {
				GroupName = "Friends",
				Duration = 5,
				Title = var40,
				Text = p7.Name,
				DetailText = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", { RBX_NAME = p7.Name }),
				Image = socialUtilModule.GetPlayerImage(p7.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
		end
	end
end

local function onPointsAwarded(p7, p8, _, _)
	-- upvalues: var2 (write), localPlayer (write), robloxTranslatorModule (ref), sendNotificationInfo (ref)
	if var2 and p7 == localPlayer.UserId then
		local var40 = nil
		local var41 = nil
		local _ = nil
		
		if p8 == 1 then
			var40 = "Point Awarded"
			var41 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.single", { RBX_NUMBER = tostring(p8) })
		elseif p8 > 0 then
			var40 = "Points Awarded"
			var41 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.multiple", { RBX_NUMBER = tostring(p8) })
		elseif p8 < 0 then
			var40 = "Points Lost"
			var41 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.negative", { RBX_NUMBER = tostring(p8) })
		else
			return
		end
		local t = {
			GroupName = "PlayerPoints",
			Image = "https://www.roblox.com/asset?id=206410433",
			Duration = 5,
			Title = var40,
			Text = var41,
			DetailText = var41
		}
		t.Duration = t.Duration or 5
		sendNotificationInfo:Fire(t)
	end
end

local function onBadgeAwarded(p7, p8, p9)
	-- upvalues: t_3 (ref), var3 (write), localPlayer (write), groupService (ref), playersService (ref), badgeService (ref), fixOnBadgeAwardedError (ref), robloxTranslatorModule (ref), rbxAnalyticsService (ref), sendNotificationInfo (ref)
	if not t_3[p9] and var3 and p7 == localPlayer.UserId then
		t_3[p9] = true
		local var40 = ""
		
		if game.CreatorType == Enum.CreatorType.Group then
			local ok, status = pcall(function()
				-- upvalues: groupService (copy), p8 (ref)
				return groupService:GetGroupInfoAsync(p8)
			end)
			
			if not ok then
				var40 = ""
			end
			if status then
				var40 = status.Name
			end
		elseif game.CreatorType == Enum.CreatorType.User then
			local _ = nil
			local ok, status = pcall(function()
				-- upvalues: playersService (copy), p8 (ref)
				return playersService:GetNameFromUserIdAsync(p8)
			end)
			var40 = if not ok then "" else status
		end
		local ok, status = pcall(function()
			-- upvalues: badgeService (copy), p9 (ref)
			return badgeService:GetBadgeInfoAsync(p9)
		end)
		
		if not ok then return end
		if fixOnBadgeAwardedError and var40 == nil then
			var40 = ""
		end
		local var41 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onBadgeAwardedDetail", {
			RBX_NAME = localPlayer.Name,
			CREATOR_NAME = var40,
			BADGE_NAME = status.DisplayName
		})
		local t = nil
		local var42 = "InGame.NotificationScript2.onBadgeAwardedTitle"
		pcall(function()
			-- upvalues: t (write), robloxTranslatorModule (copy), var42 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var42)
		end)
		t = {
			GroupName = "BadgeAwards",
			Image = "https://www.roblox.com/asset?id=206410289",
			Duration = 5,
			Title = t,
			Text = var41,
			DetailText = var41,
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

function onGameSettingsChanged(value_1, p7)
	-- upvalues: gameSettings (ref), value (write), robloxTranslatorModule (ref), sendNotificationInfo (ref)
	if value_1 == "SavedQualityLevel" then
		local var40 = gameSettings.SavedQualityLevel.Value + p7
		
		if var40 > 10 then
			var40 = 10
		elseif var40 < 1 then
			var40 = 1
		end
		if var40 > 0 and var40 ~= value and gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
			local var41 = if value < var40 then robloxTranslatorModule:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Increased", { RBX_NUMBER = tostring(var40) }) else robloxTranslatorModule:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Decreased", { RBX_NUMBER = tostring(var40) })
			local t = {
				GroupName = "Graphics",
				Title = "Graphics Quality",
				Image = "",
				Duration = 2,
				Text = var41,
				DetailText = var41
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
			value = var40
		end
	end
end

if not cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
	badgeService.OnBadgeAwarded:connect(onBadgeAwarded)
end
if not var1 then
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
			local var40 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.ButtonText")
			local t = {
				Duration = 3,
				Title = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.Title"),
				Text = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.Description"),
				Button1Text = var40,
				Callback = function(p7)
					-- upvalues: var40 (ref)
					if p7 == var40 then
						game:OpenScreenshotsFolder()
					end
				end
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
		end)
	end
	settings():GetService("GameSettings").VideoRecordingChangeRequest:Connect(function(p7)
		-- upvalues: robloxTranslatorModule (ref), sendNotificationInfo (ref)
		if not p7 then
			local var40 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.ButtonText")
			local t = {
				Duration = 3,
				Title = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.Title"),
				Text = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.Description"),
				Button1Text = var40,
				Callback = function(p8)
					-- upvalues: var40 (ref)
					if p8 == var40 then
						game:OpenVideosFolder()
					end
				end
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
		end
	end)
end
function guiService.SendCoreUiNotification(p7, p8)
	-- upvalues: createNotification (ref), parent (ref), inOut (ref), sine (ref)
	local var40 = createNotification(p7, p8, "")
	var40.BackgroundTransparency = 0.5
	var40.Size = UDim2.new(0.5, 0, 0.1, 0)
	var40.Position = UDim2.new(0.25, 0, -0.1, 0)
	var40.NotificationTitle.FontSize = Enum.FontSize.Size36
	var40.NotificationText.FontSize = Enum.FontSize.Size24
	var40.Parent = parent
	var40:TweenPositionInternal(UDim2.new(0.25, 0, 0, 0), inOut, sine, 0.35, true)
	wait(5)
	
	if var40 then
		var40:Destroy()
	end
end

marketplaceService.ClientLuaDialogRequested:connect(function(p7, p8, p9)
	-- upvalues: popupText (ref), guiService (ref), popupFrame (ref), popupAcceptButton (ref), marketplaceService (ref), popupDeclineButton (ref), popupOKButton (ref)
	popupText.Text = p7
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
		-- upvalues: guiService (copy), popupFrame (copy), popupOKButton (copy), popupAcceptButton (copy), popupDeclineButton (copy), p8 (ref), p9 (ref)
		guiService:AddCenterDialog(popupFrame, Enum.CenterDialogType.QuitDialog, function()
			-- upvalues: popupOKButton (copy), popupAcceptButton (copy), popupDeclineButton (copy), p8 (copy), p9 (copy), popupFrame (copy)
			popupOKButton.Visible = false
			popupAcceptButton.Visible = true
			popupDeclineButton.Visible = true
			popupAcceptButton.Text = p8
			popupDeclineButton.Text = p9
			popupFrame.Visible = true
		end, function()
			-- upvalues: popupFrame (copy)
			popupFrame.Visible = false
		end)
	end) then
		popupFrame.Visible = true
		popupAcceptButton.Text = p8
		popupDeclineButton.Text = p9
	end
	return true
end)
gameSettings:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
	-- upvalues: var4 (write), gameSettings (ref), var22 (ref), t (ref)
	var4 = 0.6 * gameSettings.PreferredTransparency
	var22.BackgroundTransparency = var4
	
	for i = 1, #t do
		t[i].Frame.BackgroundTransparency = var4
	end
end)

if fFlagCoreScriptShowTeleportPromptModule then
	local function onMenuTeleportAttemptNotification()
		-- upvalues: robloxTranslatorModule (ref), var11 (ref), sendNotificationInfo (ref)
		local var40 = "Teleporting Paused"
		local var41 = "Feature.SettingsHub.Prompt.TeleportBlock.Title"
		pcall(function()
			-- upvalues: var40 (write), robloxTranslatorModule (copy), var41 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var41)
		end)
		local var42 = var40
		local var43 = "Teleporting will resume upon menu close."
		local var44 = "Feature.SettingsHub.Prompt.TeleportBlock.Subtitle"
		pcall(function()
			-- upvalues: var43 (write), robloxTranslatorModule (copy), var44 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var44)
		end)
		var43 = {
			GroupName = "Teleport",
			Image = "http://www.roblox.com/asset/?id=10961494062",
			Duration = 5,
			Title = var42,
			Text = var43,
			BottomPadding = var11
		}
		var43.Duration = var43.Duration or 5
		sendNotificationInfo:Fire(var43)
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