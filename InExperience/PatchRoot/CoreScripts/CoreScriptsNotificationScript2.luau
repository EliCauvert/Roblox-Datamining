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
local deprecateOldGuiObjectPropertiesEngineFeature = game:GetEngineFeature("DeprecateOldGuiObjectProperties")

local function _(p0, p1) --[[ line: 58 | named "LocalizedGetString" ]]
	-- upvalues: robloxTranslatorModule (ref)
	pcall(function() --[[ line: 59 ]]
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
local var31 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local var32 = true
local var33 = true
local socialUtilModule = require(robloxGui.Modules.SocialUtil)
local gameTranslatorModule = require(robloxGui.Modules.GameTranslator)
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local var37 = 0.6 * gameSettings.PreferredTransparency
local var38 = if var31 then 72 else 48
local var39 = if var31 then 145 else 64
local var40 = if var31 then 450 else 200
local var41 = var38 / 6
local var42 = if var31 then 42 else 18
local var43 = if var31 then 84 else 36
local var44 = -var42
local var45 = if var31 then Enum.FontSize.Size42 else Enum.FontSize.Size18
local var46 = if var31 then 72 else 28
local var47 = if var31 then 144 else 56
local var48 = if var31 then Enum.FontSize.Size36 else Enum.FontSize.Size14
local var49 = var39 / 2
local var50 = var41 / 2
local var51 = if var31 then Enum.FontSize.Size42 else Enum.FontSize.Size18
local var52 = if var31 then 42 else 18
local var53 = if var31 then 30 else 14
local inOut = Enum.EasingDirection.InOut
local sine = Enum.EasingStyle.Sine
local var54 = 5
local t_4 = {
	ACCEPTED = if fFlagConnectionsToFriendsRename then "InGame.NotificationScript2.Message.FriendRequestEvent.Accepted" else "InGame.NotificationScript2.Message.ConnectionRequestEvent.Accepted",
	SENT = if fFlagConnectionsToFriendsRename then "InGame.NotificationScript2.Message.FriendRequestEvent.Sent" else "InGame.NotificationScript2.Message.ConnectionRequestEvent.Sent"
}

local function translateString(p2, p3) --[[ line: 133 ]]
	-- upvalues: localizationService (ref), localization (ref), logging (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var84 = localization.new(robloxLocaleId)
	var84:SetLocale(robloxLocaleId)
	local ok, status = pcall(function() --[[ line: 138 ]]
		-- upvalues: var84 (ref), p2 (ref), p3 (ref)
		return var84:Format(p2, p3)
	end)
	
	if ok then
		return status
	end
	logging.warn("Failed to translate string with key: " .. p2)
	
	return ""
end

local ok, status = pcall(function() --[[ line: 148 ]]
	return tonumber(settings():GetFVariable("FriendRequestNotificationThrottle"))
end)

if ok and status ~= nil then
	var54 = status
end
starterGuiService:RegisterSetCore("PointsNotificationsActive", function(p4) --[[ line: 155 ]]
	-- upvalues: var32 (write)
	if type(p4) == "boolean" then
		var32 = p4
	end
end)
starterGuiService:RegisterSetCore("BadgesNotificationsActive", function(p5) --[[ line: 160 ]]
	-- upvalues: var33 (write)
	if type(p5) == "boolean" then
		var33 = p5
	end
end)
starterGuiService:RegisterGetCore("PointsNotificationsActive", function() --[[ line: 166 ]]
	-- upvalues: var32 (write)
	return var32
end)
starterGuiService:RegisterGetCore("BadgesNotificationsActive", function() --[[ line: 169 ]]
	-- upvalues: var33 (write)
	return var33
end)

local _ = function(p6, p7, p8, p9) --[[ line: 176 | named "createFrame" ]]
	local frame = Instance.new("Frame")
	frame.Name = p6
	frame.Size = p7
	frame.Position = p8
	frame.BackgroundTransparency = p9
	
	return frame
end

local function createTextButton(p10, p11) --[[ line: 186 ]]
	-- upvalues: var49 (ref), var37 (write), var51 (ref), var50 (ref), var52 (ref), var53 (ref)
	local textButton = Instance.new("TextButton")
	textButton.Name = p10
	textButton.Size = UDim2.new(0.5, -1, 0, var49)
	textButton.Position = p11
	textButton.BackgroundTransparency = var37
	textButton.BackgroundColor3 = Color3.new(0, 0, 0)
	textButton.BorderSizePixel = 0
	textButton.Font = Enum.Font.SourceSansBold
	textButton.FontSize = var51
	textButton.TextColor3 = Color3.new(1, 1, 1)
	textButton.TextTruncate = Enum.TextTruncate.AtEnd
	textButton.TextScaled = true
	local UIPadding = Instance.new("UIPadding")
	UIPadding.PaddingTop = UDim.new(0, var50 / 2)
	UIPadding.PaddingBottom = UDim.new(0, var50 / 2)
	UIPadding.PaddingLeft = UDim.new(0, var50)
	UIPadding.PaddingRight = UDim.new(0, var50)
	UIPadding.Parent = textButton
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	UITextSizeConstraint.MaxTextSize = var52
	UITextSizeConstraint.MinTextSize = var53
	UITextSizeConstraint.Parent = textButton
	
	return textButton
end

local uDim2 = UDim2.new(0, var40, 0.42, 0)
local uDim2_1 = UDim2.new(1, (-var40) - 4, 0.5, 0)
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
local var61 = (function() --[[ line: 228 | named "createDefaultNotification" ]]
	-- upvalues: var39 (ref), var37 (write)
	local uDim2 = UDim2.new(1, 0, 0, var39)
	local uDim2_1 = UDim2.new(0, 0, 0, 0)
	local notification = Instance.new("Frame")
	notification.Name = "Notification"
	notification.Size = uDim2
	notification.Position = uDim2_1
	notification.BackgroundTransparency = var37
	notification.BackgroundColor3 = Color3.new(0, 0, 0)
	notification.BorderSizePixel = 0
	
	return notification
end)()
local notificationTitle = Instance.new("TextLabel")
notificationTitle.Name = "NotificationTitle"
notificationTitle.Size = UDim2.new(1, -var41 * 2, 0, var42)
notificationTitle.Position = UDim2.new(0, var41, 0.5, var44)
notificationTitle.BackgroundTransparency = 1
notificationTitle.Font = Enum.Font.SourceSansBold
notificationTitle.FontSize = var45
notificationTitle.TextColor3 = Color3.new(0.97, 0.97, 0.97)
local notificationText = Instance.new("TextLabel")
notificationText.Name = "NotificationText"
notificationText.Size = UDim2.new(1, -var41 * 2, 0, var46)
notificationText.Position = UDim2.new(0, var41, 0.5, 1)
notificationText.BackgroundTransparency = 1
notificationText.Font = Enum.Font.SourceSans
notificationText.FontSize = var48
notificationText.TextColor3 = Color3.new(0.92, 0.92, 0.92)
notificationText.TextWrap = true
notificationText.TextYAlignment = Enum.TextYAlignment.Top
local notificationImage = Instance.new("ImageLabel")
notificationImage.Name = "NotificationImage"
notificationImage.Size = UDim2.new(0, var38, 0, var38)
notificationImage.Position = UDim2.new(0, var41, 0, 0.5 * (var39 - var38))
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
local var72 = nil

local _ = function(p12) --[[ line: 313 | named "getFriendImage" ]]
	-- upvalues: socialUtilModule (ref)
	return socialUtilModule.GetPlayerImage(p12, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
end

local function createNotification(p13, p14, p15) --[[ line: 324 ]]
	-- upvalues: var61 (ref), var39 (ref), notificationTitle (ref), notificationText (ref), textService (ref), var43 (ref), notificationFrame (ref), var47 (ref), var38 (ref), var41 (ref), notificationImage (ref), guiService (ref), httpService (ref)
	local var92 = var61:Clone()
	var92.Position = UDim2.new(1, 4, 1, (-var39) - 4)
	local var93 = notificationTitle:Clone()
	var93.Text = p13
	var93.Parent = var92
	local var94 = notificationText:Clone()
	var94.Text = p14
	var94.Parent = var92
	local var95 = false
	
	local function updateNotificationForMultiLineTitle() --[[ line: 337 ]]
		-- upvalues: var95 (write), var93 (ref), textService (copy), var43 (copy), var94 (ref), var92 (ref)
		var95 = true
		var93.TextWrapped = true
		var93.TextTruncate = Enum.TextTruncate.AtEnd
		local minValue = math.min(textService:GetTextSize(var93.Text, var93.TextSize, var93.Font, Vector2.new(var93.AbsoluteSize.X, 1000)).Y - var93.Size.Y.Offset, var43 - var93.Size.Y.Offset)
		var93.Size += UDim2.new(0, 0, 0, minValue)
		var93.Position -= UDim2.new(0, 0, 0, minValue / 2)
		var94.Position += UDim2.new(0, 0, 0, minValue / 2)
		var92.Size += UDim2.new(0, 0, 0, minValue)
	end
	
	var92.Parent = notificationFrame
	
	if p15 == nil or p15 == "" then
		if not var93.TextFits then
			var95 = true
			updateNotificationForMultiLineTitle()
		end
		if not var94.TextFits then
			local minValue = math.min(textService:GetTextSize(var94.Text, var94.TextSize, var94.Font, Vector2.new(var94.AbsoluteSize.X, 1000)).Y - var94.Size.Y.Offset, var47 - var94.Size.Y.Offset)
			var94.Size += UDim2.new(0, 0, 0, minValue)
			var93.Position -= UDim2.new(0, 0, 0, minValue / 2)
			var94.Position -= UDim2.new(0, 0, 0, minValue / 2)
			var92.Size += UDim2.new(0, 0, 0, minValue)
		end
	else
		local var97 = var38 + var41 * 2
		local var98 = var41
		local var99 = notificationImage:Clone()
		var99.Image = p15
		var99.Parent = var92
		var93.Size = UDim2.new(1, (-var97) - var98, 0, var93.Size.Y.Offset)
		var93.Position = UDim2.new(0, var97, var93.Position.Y.Scale, var93.Position.Y.Offset)
		var93.TextXAlignment = Enum.TextXAlignment.Left
		var94.Size = UDim2.new(1, (-var97) - var98, 0, var94.Size.Y.Offset)
		var94.Position = UDim2.new(0, var97, var94.Position.Y.Scale, var94.Position.Y.Offset)
		var94.TextXAlignment = Enum.TextXAlignment.Left
		
		if not var93.TextFits then
			updateNotificationForMultiLineTitle()
			local textSize = var94.TextSize
			var94.Size -= UDim2.new(0, 0, 0, textSize)
			var93.Position += UDim2.new(0, 0, 0, textSize / 2 - 2)
			var94.Position += UDim2.new(0, 0, 0, textSize / 2 - 2)
			var92.Size -= UDim2.new(0, 0, 0, textSize + 4)
		end
		if not var94.TextFits then
			local i
			local substring = nil
			local text = var94.Text
			
			for i = string.len(text) - 1, 2, -1 do
				if string.sub(text, i, i) == " " then
					var94.Text = string.sub(text, 1, i - 1)
					
					if not var94.TextFits then
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
				extraText.Parent = var92
				i = math.min(textService:GetTextSize(substring, extraText.TextSize, extraText.Font, Vector2.new(extraText.AbsoluteSize.X, 1000)).Y, var47 - var94.Size.Y.Offset)
				extraText.Size = UDim2.new(extraText.Size.X.Scale, extraText.Size.X.Offset, 0, i)
				var93.Position -= UDim2.new(0, 0, 0, i / 2)
				var94.Position -= UDim2.new(0, 0, 0, i / 2)
				var92.Size += UDim2.new(0, 0, 0, i)
				extraText.AnchorPoint = Vector2.new(0.5, 0)
				extraText.Position = UDim2.new(0.5, 0, var94.Position.Y.Scale, var94.Position.Y.Offset + var94.AbsoluteSize.Y)
			else
				var94.Text = text
			end
		end
	end
	if var95 and var94.TextFits then
		local textTextSize = textService:GetTextSize(var94.Text, var94.TextSize, var94.Font, Vector2.new(var94.AbsoluteSize.X, 1000))
		
		if textTextSize.Y < var94.Size.Y.Offset then
			local var104 = var94.Size.Y.Offset - textTextSize.Y
			var94.Size -= UDim2.new(0, 0, 0, var104)
			var93.Position += UDim2.new(0, 0, 0, var104 / 2)
			var94.Position += UDim2.new(0, 0, 0, var104 / 2)
			var92.Size -= UDim2.new(0, 0, 0, var104)
		end
	end
	var92.Parent = nil
	guiService:AddSelectionParent(httpService:GenerateGUID(false), var92)
	
	return var92
end

local _ = function(p16) --[[ line: 493 | named "findNotification" ]]
	-- upvalues: t (ref)
	for i = 1, #t do
		if t[i] ~= p16 then
			continue
		end
		return i
	end
end

local function updateNotifications() --[[ line: 502 ]]
	-- upvalues: t (ref), var39 (ref), deprecateOldGuiObjectPropertiesEngineFeature (ref), inOut (ref), sine (ref)
	local var106 = 1
	local var107 = 0
	
	for i = #t, 1, -1 do
		local var108 = t[i]
		
		if var108 then
			local frame = var108.Frame
			
			if frame and frame.Parent then
				local _ = if var108.IsFriend then (var39 + 2) * 1.5 else var39
				var107 += if var108.IsFriend then frame.Size.Y.Offset + (var39 + 2) * 0.5 else frame.Size.Y.Offset
				
				if deprecateOldGuiObjectPropertiesEngineFeature then
					frame:TweenPositionInternal(UDim2.new(0, 0, 1, (-var107) - var106 * 4), inOut, sine, 0.35, true, function() --[[ line: 523 ]]
						-- upvalues: var108 (ref)
						if var108.TweenOutCallback then
							var108.TweenOutCallback()
						end
					end)
				else
					frame:TweenPosition(UDim2.new(0, 0, 1, (-var107) - var106 * 4), inOut, sine, 0.35, true, function() --[[ line: 536 ]]
						-- upvalues: var108 (ref)
						if var108.TweenOutCallback then
							var108.TweenOutCallback()
						end
					end)
				end
				var106 += 1
			end
		end
	end
end

local var75 = 0

local var76 = function(p17) --[[ line: 550 ]]
	-- upvalues: t (ref), t_1 (ref), notificationFrame (ref), var72 (write), var75 (write), updateNotifications (ref)
	spawn(function() --[[ line: 551 ]]
		-- upvalues: p17 (ref), t (copy), t_1 (copy), notificationFrame (copy), var72 (copy), var75 (copy), updateNotifications (copy)
		p17.IsActive = true
		local tCount = #t
		
		if tCount == 3 then
			t[1].Duration = 0
			t_1[#t_1 + 1] = p17
			
			return
		end
		t[tCount + 1] = p17
		p17.Frame.Parent = notificationFrame
		spawn(function() --[[ line: 566 ]]
			-- upvalues: p17 (copy), var72 (copy)
			wait(0.7)
			while p17.Duration > 0 do
				wait(0.2)
				p17.Duration -= 0.2
			end
			var72(p17)
		end)
		while tick() - var75 < 0.35 do
			wait()
		end
		var75 = tick()
		updateNotifications()
	end)
end

var72 = function(p18) --[[ line: 589 ]]
	-- upvalues: t (ref), deprecateOldGuiObjectPropertiesEngineFeature (ref), inOut (ref), sine (ref), t_1 (ref), var76 (write), updateNotifications (ref)
	if not p18 then return end
	local var110
	for i = 1, #t do
		if t[i] ~= p18 then
			continue
		end
		var110 = i
		table.remove(t, var110)
		local frame = p18.Frame
		
		if frame and frame.Parent then
			p18.IsActive = false
			spawn(function() --[[ line: 599 ]]
				-- upvalues: frame (ref), deprecateOldGuiObjectPropertiesEngineFeature (copy), inOut (copy), sine (copy), p18 (write)
				local function doTweenOut() --[[ line: 605 ]]
					-- upvalues: frame (copy), deprecateOldGuiObjectPropertiesEngineFeature (copy), inOut (copy), sine (copy), p18 (copy)
					return if frame:IsDescendantOf(game) then if deprecateOldGuiObjectPropertiesEngineFeature then frame:TweenPositionInternal(UDim2.new(1, 0, 1, frame.Position.Y.Offset), inOut, sine, 0.35, false, function() --[[ line: 614 ]]
						-- upvalues: frame (copy), p18 (copy)
						frame:Destroy()
						p18 = nil
					end) else frame:TweenPosition(UDim2.new(1, 0, 1, frame.Position.Y.Offset), inOut, sine, 0.35, false, function() --[[ line: 626 ]]
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
			local var111 = t_1[1]
			table.remove(t_1, 1)
			var76(var111)
			
			if #t_1 > 0 and t[1] then
				t[1].Duration = 0
			end
		else
			updateNotifications()
		end
		return
	end
	var110 = nil
end

local _ = function(p19) --[[ line: 656 | named "sendNotificationInfo" ]]
	-- upvalues: sendNotificationInfo (ref)
	p19.Duration = p19.Duration or 5
	sendNotificationInfo:Fire(p19)
end

local _ = function(p20, p21, p22) --[[ line: 661 | named "createNotificationButtonDetails" ]]
	return {
		Text = p20,
		ButtonType = p21,
		OnActivated = function() --[[ line: 665 ]]
			-- upvalues: p22 (ref), p20 (ref)
			if p22 and type(p22) ~= "function" then
				pcall(function() --[[ line: 667 ]]
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

sendNotificationInfo.Event:connect(function(p23) --[[ line: 677 | named "onSendNotificationInfo" ]]
	-- upvalues: VRService (ref), clientToastNotificationsEnabledEngineFeature (ref), getFFlagClientToastNotificationsRedirectModule (ref), gameTranslatorModule (ref), coreGuiService (ref), guiService (ref), createNotification (ref), createTextButton (ref), var72 (write), var49 (ref), var76 (write)
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
				OnActivated = function() --[[ line: 665 ]]
					-- upvalues: callback (ref), button1Text (ref)
					if callback and type(callback) ~= "function" then
						pcall(function() --[[ line: 667 ]]
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
				OnActivated = function() --[[ line: 665 ]]
					-- upvalues: callback (ref), button2Text (ref)
					if callback and type(callback) ~= "function" then
						pcall(function() --[[ line: 667 ]]
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
		local var117
		local t = {}
		local var115 = if p23.AutoLocalize then createNotification(gameTranslatorModule:TranslateGameText(coreGuiService, p23.Title), gameTranslatorModule:TranslateGameText(coreGuiService, p23.Text), p23.Image) else createNotification(p23.Title, p23.Text, p23.Image)
		local var116 = nil
		
		if button1Text and button1Text ~= "" then
			t.IsFriend = true
			var116 = createTextButton("Button1", UDim2.new(0, 0, 1, 2))
			
			if p23.AutoLocalize then
				gameTranslatorModule:TranslateAndRegister(var116, coreGuiService, button1Text)
			else
				var116.Text = button1Text
			end
			var116.Parent = var115
			var117 = nil
			var117 = var116.MouseButton1Click:connect(function() --[[ line: 746 ]]
				-- upvalues: var117 (write), var72 (copy), t (ref), callback (ref), button1Text (ref)
				if var117 then
					var117:disconnect()
					var117 = nil
					var72(t)
					
					if callback and type(callback) ~= "function" then
						pcall(function() --[[ line: 752 ]]
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
		var117 = nil
		
		if button2Text and button2Text ~= "" then
			t.IsFriend = true
			var117 = createTextButton("Button2", UDim2.new(0.5, 1, 1, 2))
			
			if p23.AutoLocalize then
				gameTranslatorModule:TranslateAndRegister(var117, coreGuiService, button2Text)
			else
				var117.Text = button2Text
			end
			var117.Parent = var115
			local mouseButton1ClickConnection = nil
			mouseButton1ClickConnection = var117.MouseButton1Click:connect(function() --[[ line: 776 ]]
				-- upvalues: mouseButton1ClickConnection (write), var72 (copy), t (ref), callback (ref), button2Text (ref), p23 (ref)
				if mouseButton1ClickConnection then
					mouseButton1ClickConnection:disconnect()
					mouseButton1ClickConnection = nil
					var72(t)
					
					if callback and type(callback) ~= "function" then
						pcall(function() --[[ line: 782 ]]
							-- upvalues: callback (copy), button2Text (copy)
							callback:Invoke(button2Text)
						end)
						
						return
					elseif type(callback) == "function" then
						callback(p23.Button2Text)
					end
				end
			end)
		elseif var116 then
			var116.Size = UDim2.new(1, 0, 0, var49)
		end
		t.Frame = var115
		t.Duration = p23.Duration
		var76(t)
	end
end)
starterGuiService:RegisterSetCore("SendNotification", function(p24) --[[ line: 803 | named "createDeveloperNotification" ]]
	-- upvalues: clientToastNotificationsEnabledEngineFeature (ref), getFFlagClientToastNotificationsRedirectModule (ref), sendNotificationInfo (ref)
	if type(p24) == "table" and type(p24.Title) == "string" and type(p24.Text) == "string" then
		local var122, var123
		local var119 = if type(p24.Icon) == "string" then p24.Icon else ""
		local var120 = if type(p24.Duration) == "number" then p24.Duration else 5
		local callback = typeof(p24.Callback) == "Instance" and (p24.Callback:IsA("BindableFunction") and (p24.Callback or nil))
		local _ = nil
		local _ = nil
		
		if clientToastNotificationsEnabledEngineFeature and getFFlagClientToastNotificationsRedirectModule() then
			var122 = if type(p24.Button1) == "string" then p24.Button1 else nil
			var123 = if type(p24.Button2) == "string" then p24.Button2 else nil
		else
			var122 = if type(p24.Button1) == "string" then p24.Button1 else ""
			var123 = if type(p24.Button2) == "string" then p24.Button2 else ""
		end
		local t = {
			GroupName = "Developer",
			Title = p24.Title,
			Text = p24.Text,
			Image = var119,
			Duration = var120,
			Callback = callback,
			Button1Text = var122,
			Button2Text = var123,
			AutoLocalize = if p24.AutoLocalize ~= nil then p24.AutoLocalize == true else true
		}
		t.Duration = t.Duration or 5
		sendNotificationInfo:Fire(t)
	end
end)
local _ = nil
local t_5 = {}

local var78 = function(p25) --[[ line: 854 ]]
	-- upvalues: t_5 (ref), var54 (write)
	local var125 = t_5[p25]
	
	if var125 and tick() < var125 then
		return true
	end
	t_5[p25] = tick() + var54
	
	return false
end

local function sendFriendNotification(p26) --[[ line: 868 ]]
	-- upvalues: var78 (write), notificationsRenameFriendRequestToConnection (ref), universalAppPolicyModule (ref), translateString (ref), t_4 (ref), socialUtilModule (ref), rbxAnalyticsService (ref), localPlayer (write), t_2 (ref), sendNotificationInfo (ref)
	if var78(p26) then
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
		Callback = function(p27) --[[ line: 889 ]]
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
		OnDisplay = function() --[[ line: 908 ]]
			-- upvalues: rbxAnalyticsService (copy)
			rbxAnalyticsService:ReportCounter("NotificationScript-FriendshipNotificationDisplayed")
			rbxAnalyticsService:TrackEvent("Game", "FriendshipNotificationDisplayed", "NotificationScript")
		end,
		OnDismiss = function() --[[ line: 912 ]]
			-- upvalues: rbxAnalyticsService (copy)
			rbxAnalyticsService:ReportCounter("NotificationScript-FriendshipNotificationDismissed")
			rbxAnalyticsService:TrackEvent("Game", "FriendshipNotificationDismissed", "NotificationScript")
		end
	}
	t.Duration = t.Duration or 5
	sendNotificationInfo:Fire(t)
end

local function onFriendRequestEvent(p28, p29, p30) --[[ line: 919 ]]
	-- upvalues: localPlayer (write), notificationsRenameFriendRequestToConnection (ref), universalAppPolicyModule (ref), translateString (ref), t_4 (ref), friendingUtilityModule (ref), getFFlagFriendshipNotifsUseSendrModule (ref), robloxTranslatorModule (ref), socialUtilModule (ref), sendNotificationInfo (ref), t_2 (ref), sendFriendNotification (ref)
	if p28 ~= localPlayer and p29 ~= localPlayer then return end
	local var127 = if notificationsRenameFriendRequestToConnection and universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then translateString(t_4.ACCEPTED) else "New Friend"
	local requiresOSAFriendingEducation = universalAppPolicyModule.getAppFeaturePolicies().getRequiresOSAFriendingEducation()
	local userIdFriendCountAsync = friendingUtilityModule:GetFriendCountAsync(localPlayer.UserId)
	local var130 = if userIdFriendCountAsync ~= 0 then userIdFriendCountAsync == nil else true
	
	if p28 == localPlayer then
		if p30 == Enum.FriendRequestEvent.Accept and not getFFlagFriendshipNotifsUseSendrModule() then
			local t = {
				GroupName = "Friends",
				Duration = 5,
				Title = var127,
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
			if requiresOSAFriendingEducation and var130 then
				return
			end
			sendFriendNotification(p28)
			
			return
		elseif p30 == Enum.FriendRequestEvent.Accept then
			local t = {
				GroupName = "Friends",
				Duration = 5,
				Title = var127,
				Text = p28.Name,
				DetailText = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", { RBX_NAME = p28.Name }),
				Image = socialUtilModule.GetPlayerImage(p28.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
		end
	end
end

local function onPointsAwarded(p31, p32, _, _) --[[ line: 979 ]]
	-- upvalues: var32 (write), localPlayer (write), robloxTranslatorModule (ref), sendNotificationInfo (ref)
	if var32 and p31 == localPlayer.UserId then
		local var133 = nil
		local var134 = nil
		local _ = nil
		
		if p32 == 1 then
			var133 = "Point Awarded"
			var134 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.single", { RBX_NUMBER = tostring(p32) })
		elseif p32 > 0 then
			var133 = "Points Awarded"
			var134 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.multiple", { RBX_NUMBER = tostring(p32) })
		elseif p32 < 0 then
			var133 = "Points Lost"
			var134 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.negative", { RBX_NUMBER = tostring(p32) })
		else
			return
		end
		local t = {
			GroupName = "PlayerPoints",
			Image = "https://www.roblox.com/asset?id=206410433",
			Duration = 5,
			Title = var133,
			Text = var134,
			DetailText = var134
		}
		t.Duration = t.Duration or 5
		sendNotificationInfo:Fire(t)
	end
end

local function onBadgeAwarded(p33, p34, p35) --[[ line: 1017 ]]
	-- upvalues: t_3 (ref), var33 (write), localPlayer (write), groupService (ref), playersService (ref), badgeService (ref), fixOnBadgeAwardedError (ref), robloxTranslatorModule (ref), rbxAnalyticsService (ref), sendNotificationInfo (ref)
	if not t_3[p35] and var33 and p33 == localPlayer.UserId then
		t_3[p35] = true
		local var136 = ""
		
		if game.CreatorType == Enum.CreatorType.Group then
			local ok, status = pcall(function() --[[ line: 1022 ]]
				-- upvalues: groupService (copy), p34 (ref)
				return groupService:GetGroupInfoAsync(p34)
			end)
			
			if not ok then
				var136 = ""
			end
			if status then
				var136 = status.Name
			end
		elseif game.CreatorType == Enum.CreatorType.User then
			local _ = nil
			local ok, status = pcall(function() --[[ line: 1034 ]]
				-- upvalues: playersService (copy), p34 (ref)
				return playersService:GetNameFromUserIdAsync(p34)
			end)
			var136 = if not ok then "" else status
		end
		local ok, status = pcall(function() --[[ line: 1042 ]]
			-- upvalues: badgeService (copy), p35 (ref)
			return badgeService:GetBadgeInfoAsync(p35)
		end)
		
		if not ok then return end
		if fixOnBadgeAwardedError and var136 == nil then
			var136 = ""
		end
		local var137 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onBadgeAwardedDetail", {
			RBX_NAME = localPlayer.Name,
			CREATOR_NAME = var136,
			BADGE_NAME = status.DisplayName
		})
		local t = nil
		local var139 = "InGame.NotificationScript2.onBadgeAwardedTitle"
		pcall(function() --[[ line: 59 ]]
			-- upvalues: t (write), robloxTranslatorModule (copy), var139 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var139)
		end)
		t = {
			GroupName = "BadgeAwards",
			Image = "https://www.roblox.com/asset?id=206410289",
			Duration = 5,
			Title = t,
			Text = var137,
			DetailText = var137,
			OnDisplay = function() --[[ line: 1067 ]]
				-- upvalues: rbxAnalyticsService (copy)
				rbxAnalyticsService:ReportCounter("NotificationScript-BadgeAwardNotificationDisplayed")
				rbxAnalyticsService:TrackEvent("Game", "BadgeAwardNotificationDisplayed", "NotificationScript")
			end,
			OnDismiss = function() --[[ line: 1071 ]]
				-- upvalues: rbxAnalyticsService (copy)
				rbxAnalyticsService:ReportCounter("NotificationScript-BadgeAwardNotificationDismissed")
				rbxAnalyticsService:TrackEvent("Game", "BadgeAwardNotificationDismissed", "NotificationScript")
			end
		}
		t.Duration = t.Duration or 5
		sendNotificationInfo:Fire(t)
	end
end

function onGameSettingsChanged(value_1, p36) --[[ line: 1079 ]]
	-- upvalues: gameSettings (ref), value (write), robloxTranslatorModule (ref), sendNotificationInfo (ref)
	if value_1 == "SavedQualityLevel" then
		local var140 = gameSettings.SavedQualityLevel.Value + p36
		
		if var140 > 10 then
			var140 = 10
		elseif var140 < 1 then
			var140 = 1
		end
		if var140 > 0 and var140 ~= value and gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
			local var141 = if value < var140 then robloxTranslatorModule:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Increased", { RBX_NUMBER = tostring(var140) }) else robloxTranslatorModule:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Decreased", { RBX_NUMBER = tostring(var140) })
			local t = {
				GroupName = "Graphics",
				Title = "Graphics Quality",
				Image = "",
				Duration = 2,
				Text = var141,
				DetailText = var141
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
			value = var140
		end
	end
end

if not cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
	badgeService.OnBadgeAwarded:connect(onBadgeAwarded)
end
if not var31 then
	playersService.FriendRequestEvent:connect(onFriendRequestEvent)
	pointsService.PointsAwarded:connect(onPointsAwarded)
	game.GraphicsQualityChangeRequest:Connect(function(_) --[[ line: 1130 ]]
		onGameSettingsChanged("SavedQualityLevel", 0)
	end)
end
if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
	if not shouldSaveScreenshotToAlbumModule() then
		game.ScreenshotReady:Connect(function(_) --[[ line: 1140 ]]
			-- upvalues: robloxTranslatorModule (ref), sendNotificationInfo (ref)
			local var143 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.ButtonText")
			local t = {
				Duration = 3,
				Title = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.Title"),
				Text = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.Description"),
				Button1Text = var143,
				Callback = function(p37) --[[ line: 1150 ]]
					-- upvalues: var143 (ref)
					if p37 == var143 then
						game:OpenScreenshotsFolder()
					end
				end
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
		end)
	end
	settings():GetService("GameSettings").VideoRecordingChangeRequest:Connect(function(p38) --[[ line: 1160 ]]
		-- upvalues: robloxTranslatorModule (ref), sendNotificationInfo (ref)
		if not p38 then
			local var145 = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.ButtonText")
			local t = {
				Duration = 3,
				Title = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.Title"),
				Text = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.Description"),
				Button1Text = var145,
				Callback = function(p39) --[[ line: 1171 ]]
					-- upvalues: var145 (ref)
					if p39 == var145 then
						game:OpenVideosFolder()
					end
				end
			}
			t.Duration = t.Duration or 5
			sendNotificationInfo:Fire(t)
		end
	end)
end
function guiService.SendCoreUiNotification(p40, p41) --[[ line: 1181 ]]
	-- upvalues: createNotification (ref), parent (ref), deprecateOldGuiObjectPropertiesEngineFeature (ref), inOut (ref), sine (ref)
	local var147 = createNotification(p40, p41, "")
	var147.BackgroundTransparency = 0.5
	var147.Size = UDim2.new(0.5, 0, 0.1, 0)
	var147.Position = UDim2.new(0.25, 0, -0.1, 0)
	var147.NotificationTitle.FontSize = Enum.FontSize.Size36
	var147.NotificationText.FontSize = Enum.FontSize.Size24
	var147.Parent = parent
	
	if deprecateOldGuiObjectPropertiesEngineFeature then
		var147:TweenPositionInternal(UDim2.new(0.25, 0, 0, 0), inOut, sine, 0.35, true)
	else
		var147:TweenPosition(UDim2.new(0.25, 0, 0, 0), inOut, sine, 0.35, true)
	end
	wait(5)
	
	if var147 then
		var147:Destroy()
	end
end

marketplaceService.ClientLuaDialogRequested:connect(function(p42, p43, p44) --[[ line: 1201 | named "onClientLuaDialogRequested" ]]
	-- upvalues: popupText (ref), guiService (ref), popupFrame (ref), popupAcceptButton (ref), marketplaceService (ref), popupDeclineButton (ref), popupOKButton (ref)
	popupText.Text = p42
	local mouseButton1ClickConnection = nil
	local mouseButton1ClickConnection_1 = nil
	
	local function _() --[[ line: 1205 | named "disconnectCns" ]]
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
	
	mouseButton1ClickConnection = popupAcceptButton.MouseButton1Click:connect(function() --[[ line: 1217 ]]
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
	mouseButton1ClickConnection_1 = popupDeclineButton.MouseButton1Click:connect(function() --[[ line: 1221 ]]
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
	
	if not pcall(function() --[[ line: 1226 ]]
		-- upvalues: guiService (copy), popupFrame (copy), popupOKButton (copy), popupAcceptButton (copy), popupDeclineButton (copy), p43 (ref), p44 (ref)
		guiService:AddCenterDialog(popupFrame, Enum.CenterDialogType.QuitDialog, function() --[[ line: 1227 ]]
			-- upvalues: popupOKButton (copy), popupAcceptButton (copy), popupDeclineButton (copy), p43 (copy), p44 (copy), popupFrame (copy)
			popupOKButton.Visible = false
			popupAcceptButton.Visible = true
			popupDeclineButton.Visible = true
			popupAcceptButton.Text = p43
			popupDeclineButton.Text = p44
			popupFrame.Visible = true
		end, function() --[[ line: 1234 ]]
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
gameSettings:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ line: 1249 | named "onPreferredTransparencyChanged" ]]
	-- upvalues: var37 (write), gameSettings (ref), var61 (ref), t (ref)
	var37 = 0.6 * gameSettings.PreferredTransparency
	var61.BackgroundTransparency = var37
	
	for i = 1, #t do
		t[i].Frame.BackgroundTransparency = var37
	end
end)

if fFlagCoreScriptShowTeleportPromptModule then
	local function onMenuTeleportAttemptNotification() --[[ line: 1260 ]]
		-- upvalues: robloxTranslatorModule (ref), var44 (ref), sendNotificationInfo (ref)
		local var150 = "Teleporting Paused"
		local var151 = "Feature.SettingsHub.Prompt.TeleportBlock.Title"
		pcall(function() --[[ line: 59 ]]
			-- upvalues: var150 (write), robloxTranslatorModule (copy), var151 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var151)
		end)
		local var152 = var150
		local var153 = "Teleporting will resume upon menu close."
		local var154 = "Feature.SettingsHub.Prompt.TeleportBlock.Subtitle"
		pcall(function() --[[ line: 59 ]]
			-- upvalues: var153 (write), robloxTranslatorModule (copy), var154 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var154)
		end)
		var153 = {
			GroupName = "Teleport",
			Image = "http://www.roblox.com/asset/?id=10961494062",
			Duration = 5,
			Title = var152,
			Text = var153,
			BottomPadding = var44
		}
		var153.Duration = var153.Duration or 5
		sendNotificationInfo:Fire(var153)
	end
	
	local _ = function() --[[ line: 1277 | named "connectMenuTeleportAttemptEvent" ]]
		-- upvalues: teleportService (ref), onMenuTeleportAttemptNotification (ref)
		teleportService.MenuTeleportAttempt:Connect(function() --[[ line: 1278 ]]
			-- upvalues: onMenuTeleportAttemptNotification (copy)
			onMenuTeleportAttemptNotification()
		end)
	end
	
	teleportService.MenuTeleportAttempt:Connect(function() --[[ line: 1278 ]]
		-- upvalues: onMenuTeleportAttemptNotification (ref)
		onMenuTeleportAttemptNotification()
	end)
end