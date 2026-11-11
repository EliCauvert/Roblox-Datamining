local BadgeService = game:GetService("BadgeService")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local PointsService = game:GetService("PointsService")
local MarketplaceService = game:GetService("MarketplaceService")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")
local _ = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local VRService = game:GetService("VRService")
local GroupService = game:GetService("GroupService")
local TeleportService = game:GetService("TeleportService")
local LocalizationService = game:GetService("LocalizationService")
local CorePackages = game:GetService("CorePackages")
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local RobloxGui = CoreGui.RobloxGui
local GameSettings = UserSettings().GameSettings
local FFlagCoreScriptShowTeleportPromptModule = require(RobloxGui.Modules.Flags.FFlagCoreScriptShowTeleportPrompt)
local FriendingUtilityModule = require(RobloxGui.Modules.FriendingUtility)
local ClientToastNotificationsEnabledEngineFeature = game:GetEngineFeature("ClientToastNotificationsEnabled")
local GetFFlagClientToastNotificationsRedirectModule = require(RobloxGui.Modules.Flags.GetFFlagClientToastNotificationsRedirect)
local GetFFlagFriendshipNotifsUseSendrModule = require(RobloxGui.Modules.Flags.GetFFlagFriendshipNotifsUseSendr)
local NotificationsRenameFriendRequestToConnection = game:DefineFastFlag("NotificationsRenameFriendRequestToConnection", false)
local ShouldSaveScreenshotToAlbumModule = require(RobloxGui.Modules.shouldSaveScreenshotToAlbum)
local FixOnBadgeAwardedError = game:DefineFastFlag("FixOnBadgeAwardedError", false)
local FFlagConnectionsToFriendsRename = require(CorePackages.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)

local function _(p1, Text)
	-- upvalues: RobloxTranslatorModule (copy)
	pcall(function()
		-- upvalues: Text (ref), RobloxTranslatorModule (upval), p1 (copy)
		Text = RobloxTranslatorModule:FormatByKey(p1)
	end)
	
	return Text
end

local LocalPlayer = nil
while not Players.LocalPlayer do
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
end
LocalPlayer = Players.LocalPlayer
local Parent = script.Parent
local List = {}
local List1 = {}
local t = {}
local t1 = {}
local Value = GameSettings.SavedQualityLevel.Value
local SendNotificationInfo = Instance.new("BindableEvent")
SendNotificationInfo.Name = "SendNotificationInfo"
SendNotificationInfo.Parent = RobloxGui
local IsEnabled = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local v1 = true
local v2 = true
local SocialUtilModule = require(RobloxGui.Modules.SocialUtil)
local GameTranslatorModule = require(RobloxGui.Modules.GameTranslator)
local CachedPolicyServiceModule = require(CorePackages.Workspace.Packages.CachedPolicyService)
local ScaledPreferredTransparency = 0.6 * GameSettings.PreferredTransparency
local XOffset2: number = if IsEnabled then 72 else 48
local YOffset: number = if IsEnabled then 145 else 64
local XOffset: number = if IsEnabled then 450 else 200
local XOffset1 = XOffset2 / 6
local YOffset1: number = if IsEnabled then 42 else 18
local v3: number = if IsEnabled then 84 else 36
local Negated = -YOffset1
local Size42 = IsEnabled and Enum.FontSize.Size42 or Enum.FontSize.Size18
local YOffset2: number = if IsEnabled then 72 else 28
local v4: number = if IsEnabled then 144 else 56
local Size36 = IsEnabled and Enum.FontSize.Size36 or Enum.FontSize.Size14
local YOffsetRatio = YOffset / 2
local Offset = XOffset1 / 2
local Size42_1 = IsEnabled and Enum.FontSize.Size42 or Enum.FontSize.Size18
local MaxTextSize: number = if IsEnabled then 42 else 18
local MinTextSize: number = if IsEnabled then 30 else 14
local InOut = Enum.EasingDirection.InOut
local Sine = Enum.EasingStyle.Sine
local v5 = 5
local config = {
	ACCEPTED = if FFlagConnectionsToFriendsRename then "InGame.NotificationScript2.Message.FriendRequestEvent.Accepted" else "InGame.NotificationScript2.Message.ConnectionRequestEvent.Accepted",
	SENT = if FFlagConnectionsToFriendsRename then "InGame.NotificationScript2.Message.FriendRequestEvent.Sent" else "InGame.NotificationScript2.Message.ConnectionRequestEvent.Sent"
}

local function translateString(ACCEPTED, p1)
	-- upvalues: LocalizationService (copy), Localization (copy), Logging (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local NewLocalization = Localization.new(RobloxLocaleId)
	NewLocalization:SetLocale(RobloxLocaleId)
	local Success, Result = pcall(function()
		-- upvalues: NewLocalization (copy), ACCEPTED (copy), p1 (copy)
		return NewLocalization:Format(ACCEPTED, p1)
	end)
	
	if Success then
		return Result
	else
		Logging.warn("Failed to translate string with key: " .. ACCEPTED)
		
		return ""
	end
end

local Success, Result = pcall(function(): number
	return (tonumber(settings():GetFVariable("FriendRequestNotificationThrottle")))
end)

if Success and Result ~= nil then
	v5 = Result
end
StarterGui:RegisterSetCore("PointsNotificationsActive", function(p1)
	-- upvalues: v1 (ref)
	if type(p1) == "boolean" then
		v1 = p1
	end
end)
StarterGui:RegisterSetCore("BadgesNotificationsActive", function(p1)
	-- upvalues: v2 (ref)
	if type(p1) == "boolean" then
		v2 = p1
	end
end)
StarterGui:RegisterGetCore("PointsNotificationsActive", function()
	-- upvalues: v1 (ref)
	return v1
end)
StarterGui:RegisterGetCore("BadgesNotificationsActive", function()
	-- upvalues: v2 (ref)
	return v2
end)

local _ = function(Name, Size, Position, BackgroundTransparency)
	local Frame = Instance.new("Frame")
	Frame.Name = Name
	Frame.Size = Size
	Frame.Position = Position
	Frame.BackgroundTransparency = BackgroundTransparency
	
	return Frame
end

local function createTextButton(Name, Position)
	-- upvalues: YOffsetRatio (copy), ScaledPreferredTransparency (ref), Size42_1 (copy), Offset (copy), MaxTextSize (copy), MinTextSize (copy)
	local Button = Instance.new("TextButton")
	Button.Name = Name
	Button.Size = UDim2.new(0.5, -1, 0, YOffsetRatio)
	Button.Position = Position
	Button.BackgroundTransparency = ScaledPreferredTransparency
	Button.BackgroundColor3 = Color3.new(0, 0, 0)
	Button.BorderSizePixel = 0
	Button.Font = Enum.Font.SourceSansBold
	Button.FontSize = Size42_1
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.TextTruncate = Enum.TextTruncate.AtEnd
	Button.TextScaled = true
	local Padding = Instance.new("UIPadding")
	Padding.PaddingTop = UDim.new(0, Offset / 2)
	Padding.PaddingBottom = UDim.new(0, Offset / 2)
	Padding.PaddingLeft = UDim.new(0, Offset)
	Padding.PaddingRight = UDim.new(0, Offset)
	Padding.Parent = Button
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	UITextSizeConstraint.MaxTextSize = MaxTextSize
	UITextSizeConstraint.MinTextSize = MinTextSize
	UITextSizeConstraint.Parent = Button
	
	return Button
end

local _UDim2 = UDim2.new(1, -XOffset - 4, 0.5, 0)
local NotificationFrame = Instance.new("Frame")
NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Size = UDim2.new(0, XOffset, 0.42, 0)
NotificationFrame.Position = _UDim2
NotificationFrame.BackgroundTransparency = 1

if FFlagCoreScriptShowTeleportPromptModule then
	NotificationFrame.ZIndex = 3
else
	NotificationFrame.ZIndex = 2
end
NotificationFrame.Parent = Parent
local Object = (function()
	-- upvalues: YOffset (copy), ScaledPreferredTransparency (ref)
	local _UDim2 = UDim2.new(0, 0, 0, 0)
	local BackgroundTransparency = ScaledPreferredTransparency
	local Notification = Instance.new("Frame")
	Notification.Name = "Notification"
	Notification.Size = UDim2.new(1, 0, 0, YOffset)
	Notification.Position = _UDim2
	Notification.BackgroundTransparency = BackgroundTransparency
	Notification.BackgroundColor3 = Color3.new(0, 0, 0)
	Notification.BorderSizePixel = 0
	
	return Notification
end)()
local NotificationTitle = Instance.new("TextLabel")
NotificationTitle.Name = "NotificationTitle"
NotificationTitle.Size = UDim2.new(1, -XOffset1 * 2, 0, YOffset1)
NotificationTitle.Position = UDim2.new(0, XOffset1, 0.5, Negated)
NotificationTitle.BackgroundTransparency = 1
NotificationTitle.Font = Enum.Font.SourceSansBold
NotificationTitle.FontSize = Size42
NotificationTitle.TextColor3 = Color3.new(0.97, 0.97, 0.97)
local NotificationText = Instance.new("TextLabel")
NotificationText.Name = "NotificationText"
NotificationText.Size = UDim2.new(1, -XOffset1 * 2, 0, YOffset2)
NotificationText.Position = UDim2.new(0, XOffset1, 0.5, 1)
NotificationText.BackgroundTransparency = 1
NotificationText.Font = Enum.Font.SourceSans
NotificationText.FontSize = Size36
NotificationText.TextColor3 = Color3.new(0.92, 0.92, 0.92)
NotificationText.TextWrap = true
NotificationText.TextYAlignment = Enum.TextYAlignment.Top
local NotificationImage = Instance.new("ImageLabel")
NotificationImage.Name = "NotificationImage"
NotificationImage.Size = UDim2.new(0, XOffset2, 0, XOffset2)
NotificationImage.Position = UDim2.new(0, XOffset1, 0, 0.5 * (YOffset - XOffset2))
NotificationImage.BackgroundTransparency = 1
NotificationImage.Image = ""
local _UDim21 = UDim2.new(0.5, -180, 0.5, -50)
local PopupFrame = Instance.new("Frame")
PopupFrame.Name = "PopupFrame"
PopupFrame.Size = UDim2.new(0, 360, 0, 160)
PopupFrame.Position = _UDim21
PopupFrame.BackgroundTransparency = 0
PopupFrame.Style = Enum.FrameStyle.DropShadow
PopupFrame.ZIndex = 4
PopupFrame.Visible = false
PopupFrame.Parent = Parent
local PopupAcceptButton = Instance.new("TextButton")
PopupAcceptButton.Name = "PopupAcceptButton"
PopupAcceptButton.Size = UDim2.new(0, 100, 0, 50)
PopupAcceptButton.Position = UDim2.new(0.5, -102, 1, -58)
PopupAcceptButton.Style = Enum.ButtonStyle.RobloxRoundButton
PopupAcceptButton.Font = Enum.Font.SourceSansBold
PopupAcceptButton.FontSize = Enum.FontSize.Size24
PopupAcceptButton.TextColor3 = Color3.new(1, 1, 1)
PopupAcceptButton.Text = "Accept"
PopupAcceptButton.ZIndex = 5
PopupAcceptButton.Parent = PopupFrame
local PopupDeclineButton = PopupAcceptButton:Clone()
PopupDeclineButton.Name = "PopupDeclineButton"
PopupDeclineButton.Position = UDim2.new(0.5, 2, 1, -58)
PopupDeclineButton.Text = "Decline"
PopupDeclineButton.Parent = PopupFrame
local PopupOKButton = PopupAcceptButton:Clone()
PopupOKButton.Name = "PopupOKButton"
PopupOKButton.Position = UDim2.new(0.5, -50, 1, -58)
PopupOKButton.Text = "OK"
PopupOKButton.Visible = false
PopupOKButton.Parent = PopupFrame
local PopupText = Instance.new("TextLabel")
PopupText.Name = "PopupText"
PopupText.Size = UDim2.new(1, -16, 0.8, 0)
PopupText.Position = UDim2.new(0, 8, 0, 8)
PopupText.BackgroundTransparency = 1
PopupText.Font = Enum.Font.SourceSansBold
PopupText.FontSize = Enum.FontSize.Size36
PopupText.TextColor3 = Color3.new(0.97, 0.97, 0.97)
PopupText.TextWrap = true
PopupText.ZIndex = 5
PopupText.TextYAlignment = Enum.TextYAlignment.Top
PopupText.Text = "This is a popup"
PopupText.Parent = PopupFrame
local v6 = nil
local Callback = nil

local _ = function(p1)
	-- upvalues: SocialUtilModule (copy)
	return SocialUtilModule.GetPlayerImage(p1, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
end

local function createNotification(Text, Text1, Image)
	-- upvalues: Object (copy), YOffset (copy), NotificationTitle (copy), NotificationText (copy), TextService (copy), v3 (copy), NotificationFrame (copy), v4 (copy), XOffset2 (copy), XOffset1 (copy), NotificationImage (copy), GuiService (copy), HttpService (copy)
	local ObjectClone = Object:Clone()
	ObjectClone.Position = UDim2.new(1, 4, 1, -YOffset - 4)
	local NotificationTitleClone = NotificationTitle:Clone()
	NotificationTitleClone.Text = Text
	NotificationTitleClone.Parent = ObjectClone
	local NotificationTextClone = NotificationText:Clone()
	NotificationTextClone.Text = Text1
	NotificationTextClone.Parent = ObjectClone
	local Flag = false
	
	local function updateNotificationForMultiLineTitle()
		-- upvalues: Flag (ref), NotificationTitleClone (copy), TextService (upval), v3 (upval), NotificationTextClone (copy), ObjectClone (copy)
		Flag = true
		NotificationTitleClone.TextWrapped = true
		NotificationTitleClone.TextTruncate = Enum.TextTruncate.AtEnd
		local Smallest = math.min(TextService:GetTextSize(NotificationTitleClone.Text, NotificationTitleClone.TextSize, NotificationTitleClone.Font, Vector2.new(NotificationTitleClone.AbsoluteSize.X, 1000)).Y - NotificationTitleClone.Size.Y.Offset, v3 - NotificationTitleClone.Size.Y.Offset)
		NotificationTitleClone.Size += UDim2.new(0, 0, 0, Smallest)
		NotificationTitleClone.Position -= UDim2.new(0, 0, 0, Smallest / 2)
		NotificationTextClone.Position += UDim2.new(0, 0, 0, Smallest / 2)
		ObjectClone.Size += UDim2.new(0, 0, 0, Smallest)
	end
	
	ObjectClone.Parent = NotificationFrame
	repeat
		if Image == nil or Image == "" then
			if not NotificationTitleClone.TextFits then
				Flag = true
				updateNotificationForMultiLineTitle()
			end
			if NotificationTextClone.TextFits then break end
			local Smallest = math.min(TextService:GetTextSize(NotificationTextClone.Text, NotificationTextClone.TextSize, NotificationTextClone.Font, Vector2.new(NotificationTextClone.AbsoluteSize.X, 1000)).Y - NotificationTextClone.Size.Y.Offset, v4 - NotificationTextClone.Size.Y.Offset)
			NotificationTextClone.Size += UDim2.new(0, 0, 0, Smallest)
			NotificationTitleClone.Position -= UDim2.new(0, 0, 0, Smallest / 2)
			NotificationTextClone.Position -= UDim2.new(0, 0, 0, Smallest / 2)
			ObjectClone.Size += UDim2.new(0, 0, 0, Smallest)
			break
		end
		local NewXOffset = XOffset2 + XOffset1 * 2
		local NotificationImageClone = NotificationImage:Clone()
		NotificationImageClone.Image = Image
		NotificationImageClone.Parent = ObjectClone
		NotificationTitleClone.Size = UDim2.new(1, -NewXOffset - XOffset1, 0, NotificationTitleClone.Size.Y.Offset)
		NotificationTitleClone.Position = UDim2.new(0, NewXOffset, NotificationTitleClone.Position.Y.Scale, NotificationTitleClone.Position.Y.Offset)
		NotificationTitleClone.TextXAlignment = Enum.TextXAlignment.Left
		NotificationTextClone.Size = UDim2.new(1, -NewXOffset - XOffset1, 0, NotificationTextClone.Size.Y.Offset)
		NotificationTextClone.Position = UDim2.new(0, NewXOffset, NotificationTextClone.Position.Y.Scale, NotificationTextClone.Position.Y.Offset)
		NotificationTextClone.TextXAlignment = Enum.TextXAlignment.Left
		
		if not NotificationTitleClone.TextFits then
			updateNotificationForMultiLineTitle()
			local TextSize: number = NotificationTextClone.TextSize
			NotificationTextClone.Size -= UDim2.new(0, 0, 0, TextSize)
			NotificationTitleClone.Position += UDim2.new(0, 0, 0, TextSize / 2 - 2)
			NotificationTextClone.Position += UDim2.new(0, 0, 0, TextSize / 2 - 2)
			ObjectClone.Size -= UDim2.new(0, 0, 0, TextSize + 4)
		end
		if NotificationTextClone.TextFits then break end
		local Segment: string? = nil
		local Text2: string = NotificationTextClone.Text
		
		for i = string.len(Text2) - 1, 2, -1 do
			if string.sub(Text2, i, i) == " " then
				NotificationTextClone.Text = string.sub(Text2, 1, i - 1)
				
				if NotificationTextClone.TextFits then
					Segment = string.sub(Text2, i + 1)
					break
				end
			end
		end
		if Segment then
			local ExtraText = NotificationText:Clone()
			ExtraText.TextXAlignment = Enum.TextXAlignment.Left
			ExtraText.Text = Segment
			ExtraText.Name = "ExtraText"
			ExtraText.TextTruncate = Enum.TextTruncate.AtEnd
			ExtraText.Parent = ObjectClone
			local Smallest = math.min(TextService:GetTextSize(Segment, ExtraText.TextSize, ExtraText.Font, Vector2.new(ExtraText.AbsoluteSize.X, 1000)).Y, v4 - NotificationTextClone.Size.Y.Offset)
			ExtraText.Size = UDim2.new(ExtraText.Size.X.Scale, ExtraText.Size.X.Offset, 0, Smallest)
			NotificationTitleClone.Position -= UDim2.new(0, 0, 0, Smallest / 2)
			NotificationTextClone.Position -= UDim2.new(0, 0, 0, Smallest / 2)
			ObjectClone.Size += UDim2.new(0, 0, 0, Smallest)
			ExtraText.AnchorPoint = Vector2.new(0.5, 0)
			ExtraText.Position = UDim2.new(0.5, 0, NotificationTextClone.Position.Y.Scale, NotificationTextClone.Position.Y.Offset + NotificationTextClone.AbsoluteSize.Y)
			break
		end
		NotificationTextClone.Text = Text2
	until true
	if Flag and NotificationTextClone.TextFits then
		local TextSize = TextService:GetTextSize(NotificationTextClone.Text, NotificationTextClone.TextSize, NotificationTextClone.Font, Vector2.new(NotificationTextClone.AbsoluteSize.X, 1000))
		
		if TextSize.Y < NotificationTextClone.Size.Y.Offset then
			local OffsetDelta = NotificationTextClone.Size.Y.Offset - TextSize.Y
			NotificationTextClone.Size -= UDim2.new(0, 0, 0, OffsetDelta)
			NotificationTitleClone.Position += UDim2.new(0, 0, 0, OffsetDelta / 2)
			NotificationTextClone.Position += UDim2.new(0, 0, 0, OffsetDelta / 2)
			ObjectClone.Size -= UDim2.new(0, 0, 0, OffsetDelta)
		end
	end
	ObjectClone.Parent = nil
	GuiService:AddSelectionParent(HttpService:GenerateGUID(false), ObjectClone)
	
	return ObjectClone
end

local _ = function(p1): number?
	-- upvalues: List (copy)
	for i = 1, #List do
		if List[i] == p1 then
			return i
		end
	end
end

local function updateNotifications()
	-- upvalues: List (copy), YOffset (copy), InOut (copy), Sine (copy)
	local Count = 1
	local Total = 0
	
	for i = #List, 1, -1 do
		local Entry = List[i]
		
		if Entry then
			local Frame = Entry.Frame
			
			if Frame and Frame.Parent and (Entry.IsFriend and (YOffset + 2) * 1.5 or true) then
				Total += Entry.IsFriend and Frame.Size.Y.Offset + (YOffset + 2) * 0.5 or Frame.Size.Y.Offset
				Frame:TweenPositionInternal(UDim2.new(0, 0, 1, -Total - Count * 4), InOut, Sine, 0.35, true, function()
					-- upvalues: Entry (copy)
					if Entry.TweenOutCallback then
						Entry.TweenOutCallback()
					end
				end)
				Count += 1
			end
		end
	end
end

local CurrentTime = 0

v6 = function(p2)
	-- upvalues: List (copy), List1 (copy), NotificationFrame (copy), Callback (ref), CurrentTime (ref), updateNotifications (copy)
	spawn(function()
		-- upvalues: p2 (copy), List (upval), List1 (upval), NotificationFrame (upval), Callback (upval), CurrentTime (upval), updateNotifications (upval)
		p2.IsActive = true
		local CountList = #List
		
		if CountList == 3 then
			List[1].Duration = 0
			List1[#List1 + 1] = p2
			
			return
		end
		List[CountList + 1] = p2
		p2.Frame.Parent = NotificationFrame
		spawn(function()
			-- upvalues: p2 (upval), Callback (upval)
			wait(0.7)
			while p2.Duration > 0 do
				wait(0.2)
				p2.Duration -= 0.2
			end
			Callback(p2)
		end)
		while tick() - CurrentTime < 0.35 do
			wait()
		end
		CurrentTime = tick()
		updateNotifications()
	end)
end

Callback = function(p3)
	-- upvalues: List (copy), InOut (copy), Sine (copy), List1 (copy), v6 (ref), updateNotifications (copy)
	if not p3 then return end
	local v7 = p3
	local Index: number? = nil
	
	for i = 1, #List do
		if List[i] ~= v7 then
			continue
		end
		Index = i
		break
	end
	table.remove(List, Index)
	local Frame = p3.Frame
	
	if Frame and Frame.Parent then
		p3.IsActive = false
		spawn(function()
			-- upvalues: Frame (copy), InOut (upval), Sine (upval), p3 (ref)
			local function doTweenOut()
				-- upvalues: Frame (upval), InOut (upval), Sine (upval), p3 (upval)
				return if Frame:IsDescendantOf(game) then Frame:TweenPositionInternal(UDim2.new(1, 0, 1, Frame.Position.Y.Offset), InOut, Sine, 0.35, false, function()
					-- upvalues: Frame (upval), p3 (upval)
					Frame:Destroy()
					p3 = nil
				end) else false
			end
			
			if not doTweenOut() then
				p3.TweenOutCallback = doTweenOut
			end
		end)
	end
	if #List1 > 0 then
		local Entry = List1[1]
		table.remove(List1, 1)
		v6(Entry)
		
		if #List1 > 0 and List[1] then
			List[1].Duration = 0
		end
	else
		updateNotifications()
	end
end

local _ = function(p4)
	-- upvalues: SendNotificationInfo (copy)
	p4.Duration = p4.Duration or 5
	SendNotificationInfo:Fire(p4)
end

local _ = function(Text, ButtonType, p4)
	return {
		Text = Text,
		ButtonType = ButtonType,
		OnActivated = function()
			-- upvalues: p4 (copy), Text (copy)
			if p4 and type(p4) ~= "function" then
				pcall(function()
					-- upvalues: p4 (upval), Text (upval)
					p4:Invoke(Text)
				end)
				
				return
			end
			if type(p4) == "function" then
				p4(Text)
			end
		end
	}
end

SendNotificationInfo.Event:connect(function(p4)
	-- upvalues: VRService (copy), ClientToastNotificationsEnabledEngineFeature (copy), GetFFlagClientToastNotificationsRedirectModule (copy), GameTranslatorModule (copy), CoreGui (copy), GuiService (copy), createNotification (copy), createTextButton (copy), Callback (ref), YOffsetRatio (copy), v6 (ref)
	if VRService.VREnabled then return end
	local CallbackFunction = p4.Callback
	local Button1Text = p4.Button1Text
	local Button2Text = p4.Button2Text
	
	if ClientToastNotificationsEnabledEngineFeature and GetFFlagClientToastNotificationsRedirectModule() then
		local List = {}
		
		if Button1Text and Button1Text ~= "" then
			table.insert(List, {
				Text = Button1Text,
				ButtonType = Enum.NotificationButtonType.Primary,
				OnActivated = function()
					-- upvalues: CallbackFunction (copy), Button1Text (copy)
					if CallbackFunction and type(CallbackFunction) ~= "function" then
						pcall(function()
							-- upvalues: CallbackFunction (upval), Button1Text (upval)
							CallbackFunction:Invoke(Button1Text)
						end)
						
						return
					end
					if type(CallbackFunction) == "function" then
						CallbackFunction(Button1Text)
					end
				end
			})
		end
		if Button2Text and Button2Text ~= "" then
			table.insert(List, {
				Text = Button2Text,
				ButtonType = Enum.NotificationButtonType.Secondary,
				OnActivated = function()
					-- upvalues: CallbackFunction (copy), Button2Text (copy)
					if CallbackFunction and type(CallbackFunction) ~= "function" then
						pcall(function()
							-- upvalues: CallbackFunction (upval), Button2Text (upval)
							CallbackFunction:Invoke(Button2Text)
						end)
						
						return
					end
					if type(CallbackFunction) == "function" then
						CallbackFunction(Button2Text)
					end
				end
			})
		end
		GuiService:SendNotification({
			Title = if p4.Autolocalize then GameTranslatorModule:TranslateGameText(CoreGui, p4.Title) else p4.Title,
			Text = if p4.AutoLocalize then GameTranslatorModule:TranslateGameText(CoreGui, p4.Text) else p4.Text,
			Icon = p4.Image,
			OnDisplay = p4.OnDisplay,
			OnDismiss = p4.OnDismiss,
			Buttons = List
		})
		
		return
	else
		local t = {}
		local Notification = if p4.AutoLocalize then createNotification(GameTranslatorModule:TranslateGameText(CoreGui, p4.Title), GameTranslatorModule:TranslateGameText(CoreGui, p4.Text), p4.Image) else createNotification(p4.Title, p4.Text, p4.Image)
		local Button1 = nil
		
		if Button1Text and Button1Text ~= "" then
			t.IsFriend = true
			Button1 = createTextButton("Button1", UDim2.new(0, 0, 1, 2))
			
			if p4.AutoLocalize then
				GameTranslatorModule:TranslateAndRegister(Button1, CoreGui, Button1Text)
			else
				Button1.Text = Button1Text
			end
			Button1.Parent = Notification
			local MouseButton1ClickConnection = nil
			MouseButton1ClickConnection = Button1.MouseButton1Click:connect(function()
				-- upvalues: MouseButton1ClickConnection (ref), Callback (upval), t (copy), CallbackFunction (copy), Button1Text (copy)
				if MouseButton1ClickConnection then
					MouseButton1ClickConnection:disconnect()
					MouseButton1ClickConnection = nil
					Callback(t)
					
					if CallbackFunction and type(CallbackFunction) ~= "function" then
						pcall(function()
							-- upvalues: CallbackFunction (upval), Button1Text (upval)
							CallbackFunction:Invoke(Button1Text)
						end)
						
						return
					end
					if type(CallbackFunction) == "function" then
						CallbackFunction(Button1Text)
					end
				end
			end)
		end
		if Button2Text and Button2Text ~= "" then
			t.IsFriend = true
			local Button2 = createTextButton("Button2", UDim2.new(0.5, 1, 1, 2))
			
			if p4.AutoLocalize then
				GameTranslatorModule:TranslateAndRegister(Button2, CoreGui, Button2Text)
			else
				Button2.Text = Button2Text
			end
			Button2.Parent = Notification
			local MouseButton1ClickConnection1 = nil
			MouseButton1ClickConnection1 = Button2.MouseButton1Click:connect(function()
				-- upvalues: MouseButton1ClickConnection1 (ref), Callback (upval), t (copy), CallbackFunction (copy), Button2Text (copy), p4 (copy)
				if MouseButton1ClickConnection1 then
					MouseButton1ClickConnection1:disconnect()
					MouseButton1ClickConnection1 = nil
					Callback(t)
					
					if CallbackFunction and type(CallbackFunction) ~= "function" then
						pcall(function()
							-- upvalues: CallbackFunction (upval), Button2Text (upval)
							CallbackFunction:Invoke(Button2Text)
						end)
						
						return
					end
					if type(CallbackFunction) == "function" then
						CallbackFunction(p4.Button2Text)
					end
				end
			end)
		elseif Button1 then
			Button1.Size = UDim2.new(1, 0, 0, YOffsetRatio)
		end
		t.Frame = Notification
		t.Duration = p4.Duration
		v6(t)
	end
end)
StarterGui:RegisterSetCore("SendNotification", function(p4)
	-- upvalues: ClientToastNotificationsEnabledEngineFeature (copy), GetFFlagClientToastNotificationsRedirectModule (copy), SendNotificationInfo (copy)
	if type(p4) == "table" and type(p4.Title) == "string" and type(p4.Text) == "string" then
		local Icon = type(p4.Icon) == "string" and p4.Icon or ""
		local Duration = type(p4.Duration) == "number" and p4.Duration or 5
		local Callback = typeof(p4.Callback) == "Instance" and p4.Callback:IsA("BindableFunction") and p4.Callback or nil
		local Button2 = nil
		local Button1 = nil
		
		if ClientToastNotificationsEnabledEngineFeature and GetFFlagClientToastNotificationsRedirectModule() then
			Button1 = type(p4.Button1) == "string" and p4.Button1 or nil
			Button2 = type(p4.Button2) == "string" and p4.Button2 or nil
		else
			Button1 = type(p4.Button1) == "string" and p4.Button1 or ""
			Button2 = type(p4.Button2) == "string" and p4.Button2 or ""
		end
		local config = {
			GroupName = "Developer",
			Title = p4.Title,
			Text = p4.Text,
			Image = Icon,
			Duration = Duration,
			Callback = Callback,
			Button1Text = Button1,
			Button2Text = Button2,
			AutoLocalize = p4.AutoLocalize == nil or p4.AutoLocalize == true
		}
		config.Duration = config.Duration or 5
		SendNotificationInfo:Fire(config)
	end
end)
local v8 = nil
local NewCurrentTimes = {}

v8 = function(Player): boolean
	-- upvalues: NewCurrentTimes (copy), v5 (ref)
	local NewCurrentTime = NewCurrentTimes[Player]
	
	if NewCurrentTime and tick() < NewCurrentTime then
		return true
	else
		NewCurrentTimes[Player] = tick() + v5
		
		return false
	end
end

local function sendFriendNotification(Player: Player)
	-- upvalues: v8 (ref), NotificationsRenameFriendRequestToConnection (copy), UniversalAppPolicyModule (copy), translateString (copy), config (copy), SocialUtilModule (copy), RbxAnalyticsService (copy), LocalPlayer (ref), t (copy), SendNotificationInfo (copy)
	if not v8(Player) then
		local RenameFriendsToConnections = NotificationsRenameFriendRequestToConnection and UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
		local config1 = {
			GroupName = "Friends",
			Duration = 8,
			Button1Text = "Accept",
			Button2Text = "Decline",
			Title = Player.DisplayName,
			Text = if RenameFriendsToConnections then translateString(config.SENT) else "Sent you a friend request!",
			DetailText = Player.DisplayName,
			Image = SocialUtilModule.GetPlayerImage(Player.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5),
			Callback = function(Value)
				-- upvalues: RbxAnalyticsService (upval), LocalPlayer (upval), Player (copy), t (upval)
				if Value == "Accept" then
					RbxAnalyticsService:ReportCounter("NotificationScript-RequestFriendship")
					RbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "NotificationScript")
					RbxAnalyticsService:ReportCounter("NotificationScript-AcceptFriendship")
					RbxAnalyticsService:TrackEvent("Game", "AcceptFriendship", "NotificationScript")
					LocalPlayer:RequestFriendship(Player)
					
					return
				else
					RbxAnalyticsService:ReportCounter("NotificationScript-RevokeFriendship")
					RbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "NotificationScript")
					LocalPlayer:RevokeFriendship(Player)
					t[Player] = true
				end
			end,
			OnDisplay = function()
				-- upvalues: RbxAnalyticsService (upval)
				RbxAnalyticsService:ReportCounter("NotificationScript-FriendshipNotificationDisplayed")
				RbxAnalyticsService:TrackEvent("Game", "FriendshipNotificationDisplayed", "NotificationScript")
			end,
			OnDismiss = function()
				-- upvalues: RbxAnalyticsService (upval)
				RbxAnalyticsService:ReportCounter("NotificationScript-FriendshipNotificationDismissed")
				RbxAnalyticsService:TrackEvent("Game", "FriendshipNotificationDismissed", "NotificationScript")
			end
		}
		config1.Duration = config1.Duration or 5
		SendNotificationInfo:Fire(config1)
		
		return
	end
end

local function onFriendRequestEvent(Player: Player, Player1: Player, FriendRequestEvent)
	-- upvalues: LocalPlayer (ref), NotificationsRenameFriendRequestToConnection (copy), UniversalAppPolicyModule (copy), translateString (copy), config (copy), FriendingUtilityModule (copy), GetFFlagFriendshipNotifsUseSendrModule (copy), RobloxTranslatorModule (copy), SocialUtilModule (copy), SendNotificationInfo (copy), t (copy), sendFriendNotification (copy)
	if Player ~= LocalPlayer and Player1 ~= LocalPlayer then return end
	local RenameFriendsToConnections = NotificationsRenameFriendRequestToConnection and UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
	local TranslateStringResult = if RenameFriendsToConnections then translateString(config.ACCEPTED) else "New Friend"
	local RequiresOSAFriendingEducation = UniversalAppPolicyModule.getAppFeaturePolicies().getRequiresOSAFriendingEducation()
	local FriendCountAsync = FriendingUtilityModule:GetFriendCountAsync(LocalPlayer.UserId)
	local IsFriendCountAsyncMatch: boolean = FriendCountAsync == 0 or FriendCountAsync == nil
	
	if Player == LocalPlayer then
		if FriendRequestEvent == Enum.FriendRequestEvent.Accept and not GetFFlagFriendshipNotifsUseSendrModule() then
			local config1 = {
				GroupName = "Friends",
				Duration = 5,
				Title = TranslateStringResult,
				Text = Player1.Name,
				DetailText = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", { RBX_NAME = Player1.Name }),
				Image = SocialUtilModule.GetPlayerImage(Player1.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
			}
			config1.Duration = config1.Duration or 5
			SendNotificationInfo:Fire(config1)
			
			return
		end
	elseif Player1 == LocalPlayer then
		if FriendRequestEvent == Enum.FriendRequestEvent.Issue and not GetFFlagFriendshipNotifsUseSendrModule() then
			if t[Player] then return end
			if not RequiresOSAFriendingEducation or not IsFriendCountAsyncMatch then
				sendFriendNotification(Player)
				
				return
			end
			return
		elseif FriendRequestEvent == Enum.FriendRequestEvent.Accept then
			local config2 = {
				GroupName = "Friends",
				Duration = 5,
				Title = TranslateStringResult,
				Text = Player.Name,
				DetailText = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", { RBX_NAME = Player.Name }),
				Image = SocialUtilModule.GetPlayerImage(Player.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5)
			}
			config2.Duration = config2.Duration or 5
			SendNotificationInfo:Fire(config2)
		end
	end
end

local function onPointsAwarded(UserId, PointsAwarded: number, _, _)
	-- upvalues: v1 (ref), LocalPlayer (ref), RobloxTranslatorModule (copy), SendNotificationInfo (copy)
	if v1 and UserId == LocalPlayer.UserId then
		local Title: string? = nil
		local InGameNotificationScript2OnPointsAwardedMultiple = nil
		
		if PointsAwarded == 1 then
			Title = "Point Awarded"
			InGameNotificationScript2OnPointsAwardedMultiple = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.single", { RBX_NUMBER = tostring(PointsAwarded) })
		elseif PointsAwarded > 0 then
			Title = "Points Awarded"
			InGameNotificationScript2OnPointsAwardedMultiple = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.multiple", { RBX_NUMBER = tostring(PointsAwarded) })
		else
			if PointsAwarded >= 0 then return end
			Title = "Points Lost"
			InGameNotificationScript2OnPointsAwardedMultiple = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onPointsAwarded.negative", { RBX_NUMBER = tostring(PointsAwarded) })
		end
		local config = {
			GroupName = "PlayerPoints",
			Image = "https://www.roblox.com/asset?id=206410433",
			Duration = 5,
			Title = Title,
			Text = InGameNotificationScript2OnPointsAwardedMultiple,
			DetailText = InGameNotificationScript2OnPointsAwardedMultiple
		}
		config.Duration = config.Duration or 5
		SendNotificationInfo:Fire(config)
	end
end

local function onBadgeAwarded(UserId, CreatorId, BadgeId)
	-- upvalues: t1 (copy), v2 (ref), LocalPlayer (ref), GroupService (copy), Players (copy), BadgeService (copy), FixOnBadgeAwardedError (copy), RobloxTranslatorModule (copy), RbxAnalyticsService (copy), SendNotificationInfo (copy)
	if not t1[BadgeId] and v2 and UserId == LocalPlayer.UserId then
		t1[BadgeId] = true
		local Name = ""
		
		if game.CreatorType == Enum.CreatorType.Group then
			local Success, Result = pcall(function()
				-- upvalues: GroupService (upval), CreatorId (copy)
				return GroupService:GetGroupInfoAsync(CreatorId)
			end)
			
			if not Success then
				Name = ""
			end
			if Result then
				Name = Result.Name
			end
		elseif game.CreatorType == Enum.CreatorType.User then
			local Success2
			Success2, Name = pcall(function()
				-- upvalues: Players (upval), CreatorId (copy)
				return Players:GetNameFromUserIdAsync(CreatorId)
			end)
			
			if not Success2 then
				Name = ""
			end
		end
		local Success1, Result1 = pcall(function()
			-- upvalues: BadgeService (upval), BadgeId (copy)
			return BadgeService:GetBadgeInfoAsync(BadgeId)
		end)
		
		if not Success1 then return end
		if FixOnBadgeAwardedError and Name == nil then
			Name = ""
		end
		local InGameNotificationScript2OnBadgeAwardedDetail = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.onBadgeAwardedDetail", {
			RBX_NAME = LocalPlayer.Name,
			CREATOR_NAME = Name,
			BADGE_NAME = Result1.DisplayName
		})
		local FormatByKeyResult = nil
		local v9 = "InGame.NotificationScript2.onBadgeAwardedTitle"
		pcall(function()
			-- upvalues: FormatByKeyResult (ref), RobloxTranslatorModule (upval), v9 (copy)
			FormatByKeyResult = RobloxTranslatorModule:FormatByKey(v9)
		end)
		local config = {
			GroupName = "BadgeAwards",
			Image = "https://www.roblox.com/asset?id=206410289",
			Duration = 5,
			Title = FormatByKeyResult,
			Text = InGameNotificationScript2OnBadgeAwardedDetail,
			DetailText = InGameNotificationScript2OnBadgeAwardedDetail,
			OnDisplay = function()
				-- upvalues: RbxAnalyticsService (upval)
				RbxAnalyticsService:ReportCounter("NotificationScript-BadgeAwardNotificationDisplayed")
				RbxAnalyticsService:TrackEvent("Game", "BadgeAwardNotificationDisplayed", "NotificationScript")
			end,
			OnDismiss = function()
				-- upvalues: RbxAnalyticsService (upval)
				RbxAnalyticsService:ReportCounter("NotificationScript-BadgeAwardNotificationDismissed")
				RbxAnalyticsService:TrackEvent("Game", "BadgeAwardNotificationDismissed", "NotificationScript")
			end
		}
		config.Duration = config.Duration or 5
		SendNotificationInfo:Fire(config)
	end
end

function onGameSettingsChanged(p4, p5)
	-- upvalues: GameSettings (copy), Value (ref), RobloxTranslatorModule (copy), SendNotificationInfo (copy)
	if p4 == "SavedQualityLevel" then
		local NewValue = GameSettings.SavedQualityLevel.Value + p5
		
		if NewValue > 10 then
			NewValue = 10
		elseif NewValue < 1 then
			NewValue = 1
		end
		if NewValue > 0 and NewValue ~= Value and GameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
			local _: string = ("%s to (%d)"):format(if Value < NewValue then "Increased" else "Decreased", NewValue)
			local InGameNotificationScrip2OnCurrentGraphicsQualityLevelChangedIncreased = if Value < NewValue then RobloxTranslatorModule:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Increased", { RBX_NUMBER = tostring(NewValue) }) else RobloxTranslatorModule:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Decreased", { RBX_NUMBER = tostring(NewValue) })
			local config = {
				GroupName = "Graphics",
				Title = "Graphics Quality",
				Image = "",
				Duration = 2,
				Text = InGameNotificationScrip2OnCurrentGraphicsQualityLevelChangedIncreased,
				DetailText = InGameNotificationScrip2OnCurrentGraphicsQualityLevelChangedIncreased
			}
			config.Duration = config.Duration or 5
			SendNotificationInfo:Fire(config)
			Value = NewValue
		end
	end
end

if not CachedPolicyServiceModule:IsSubjectToChinaPolicies() then
	BadgeService.OnBadgeAwarded:connect(onBadgeAwarded)
end
if not IsEnabled then
	Players.FriendRequestEvent:connect(onFriendRequestEvent)
	PointsService.PointsAwarded:connect(onPointsAwarded)
	game.GraphicsQualityChangeRequest:Connect(function(_)
		onGameSettingsChanged("SavedQualityLevel", 0)
	end)
end
if not CachedPolicyServiceModule:IsSubjectToChinaPolicies() then
	if not ShouldSaveScreenshotToAlbumModule() then
		game.ScreenshotReady:Connect(function(_)
			-- upvalues: RobloxTranslatorModule (copy), SendNotificationInfo (copy)
			local InGameNotificationScript2ScreenshotButtonText = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.ButtonText")
			local config = {
				Duration = 3,
				Title = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.Title"),
				Text = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Screenshot.Description"),
				Button1Text = InGameNotificationScript2ScreenshotButtonText,
				Callback = function(Value)
					-- upvalues: InGameNotificationScript2ScreenshotButtonText (copy)
					if Value == InGameNotificationScript2ScreenshotButtonText then
						game:OpenScreenshotsFolder()
					end
				end
			}
			config.Duration = config.Duration or 5
			SendNotificationInfo:Fire(config)
		end)
	end
	settings():GetService("GameSettings").VideoRecordingChangeRequest:Connect(function(Recording)
		-- upvalues: RobloxTranslatorModule (copy), SendNotificationInfo (copy)
		if not Recording then
			local InGameNotificationScript2VideoButtonText = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.ButtonText")
			local config = {
				Duration = 3,
				Title = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.Title"),
				Text = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Video.Description"),
				Button1Text = InGameNotificationScript2VideoButtonText,
				Callback = function(Value)
					-- upvalues: InGameNotificationScript2VideoButtonText (copy)
					if Value == InGameNotificationScript2VideoButtonText then
						game:OpenVideosFolder()
					end
				end
			}
			config.Duration = config.Duration or 5
			SendNotificationInfo:Fire(config)
		end
	end)
end
function GuiService.SendCoreUiNotification(p4, p5)
	-- upvalues: createNotification (copy), Parent (copy), InOut (copy), Sine (copy)
	local Notification = createNotification(p4, p5, "")
	Notification.BackgroundTransparency = 0.5
	Notification.Size = UDim2.new(0.5, 0, 0.1, 0)
	Notification.Position = UDim2.new(0.25, 0, -0.1, 0)
	Notification.NotificationTitle.FontSize = Enum.FontSize.Size36
	Notification.NotificationText.FontSize = Enum.FontSize.Size24
	Notification.Parent = Parent
	Notification:TweenPositionInternal(UDim2.new(0.25, 0, 0, 0), InOut, Sine, 0.35, true)
	wait(5)
	
	if Notification then
		Notification:Destroy()
	end
end

MarketplaceService.ClientLuaDialogRequested:connect(function(Text, Text1, Text2): boolean
	-- upvalues: PopupText (copy), GuiService (copy), PopupFrame (copy), PopupAcceptButton (copy), MarketplaceService (copy), PopupDeclineButton (copy), PopupOKButton (copy)
	PopupText.Text = Text
	local MouseButton1ClickConnection = nil
	local MouseButton1ClickConnection1 = nil
	
	local function _()
		-- upvalues: MouseButton1ClickConnection (ref), MouseButton1ClickConnection1 (ref), GuiService (upval), PopupFrame (upval)
		if MouseButton1ClickConnection then
			MouseButton1ClickConnection:disconnect()
		end
		if MouseButton1ClickConnection1 then
			MouseButton1ClickConnection1:disconnect()
		end
		GuiService:RemoveCenterDialog(PopupFrame)
		PopupFrame.Visible = false
	end
	
	MouseButton1ClickConnection = PopupAcceptButton.MouseButton1Click:connect(function()
		-- upvalues: MouseButton1ClickConnection (ref), MouseButton1ClickConnection1 (ref), GuiService (upval), PopupFrame (upval), MarketplaceService (upval)
		if MouseButton1ClickConnection then
			MouseButton1ClickConnection:disconnect()
		end
		if MouseButton1ClickConnection1 then
			MouseButton1ClickConnection1:disconnect()
		end
		GuiService:RemoveCenterDialog(PopupFrame)
		PopupFrame.Visible = false
		MarketplaceService:SignalServerLuaDialogClosed(true)
	end)
	MouseButton1ClickConnection1 = PopupDeclineButton.MouseButton1Click:connect(function()
		-- upvalues: MouseButton1ClickConnection (ref), MouseButton1ClickConnection1 (ref), GuiService (upval), PopupFrame (upval), MarketplaceService (upval)
		if MouseButton1ClickConnection then
			MouseButton1ClickConnection:disconnect()
		end
		if MouseButton1ClickConnection1 then
			MouseButton1ClickConnection1:disconnect()
		end
		GuiService:RemoveCenterDialog(PopupFrame)
		PopupFrame.Visible = false
		MarketplaceService:SignalServerLuaDialogClosed(false)
	end)
	
	if not pcall(function()
		-- upvalues: GuiService (upval), PopupFrame (upval), PopupOKButton (upval), PopupAcceptButton (upval), PopupDeclineButton (upval), Text1 (copy), Text2 (copy)
		GuiService:AddCenterDialog(PopupFrame, Enum.CenterDialogType.QuitDialog, function()
			-- upvalues: PopupOKButton (upval), PopupAcceptButton (upval), PopupDeclineButton (upval), Text1 (upval), Text2 (upval), PopupFrame (upval)
			PopupOKButton.Visible = false
			PopupAcceptButton.Visible = true
			PopupDeclineButton.Visible = true
			PopupAcceptButton.Text = Text1
			PopupDeclineButton.Text = Text2
			PopupFrame.Visible = true
		end, function()
			-- upvalues: PopupFrame (upval)
			PopupFrame.Visible = false
		end)
	end) then
		PopupFrame.Visible = true
		PopupAcceptButton.Text = Text1
		PopupDeclineButton.Text = Text2
	end
	return true
end)
GameSettings:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
	-- upvalues: ScaledPreferredTransparency (ref), GameSettings (copy), Object (copy), List (copy)
	ScaledPreferredTransparency = 0.6 * GameSettings.PreferredTransparency
	Object.BackgroundTransparency = ScaledPreferredTransparency
	
	for i = 1, #List do
		List[i].Frame.BackgroundTransparency = ScaledPreferredTransparency
	end
end)

if FFlagCoreScriptShowTeleportPromptModule then
	local function onMenuTeleportAttemptNotification()
		-- upvalues: RobloxTranslatorModule (copy), Negated (copy), SendNotificationInfo (copy)
		local FormatByKeyResult = "Teleporting Paused"
		local v9 = "Feature.SettingsHub.Prompt.TeleportBlock.Title"
		pcall(function()
			-- upvalues: FormatByKeyResult (ref), RobloxTranslatorModule (upval), v9 (copy)
			FormatByKeyResult = RobloxTranslatorModule:FormatByKey(v9)
		end)
		local Title: string = FormatByKeyResult
		local FormatByKeyResult1 = "Teleporting will resume upon menu close."
		local v10 = "Feature.SettingsHub.Prompt.TeleportBlock.Subtitle"
		pcall(function()
			-- upvalues: FormatByKeyResult1 (ref), RobloxTranslatorModule (upval), v10 (copy)
			FormatByKeyResult1 = RobloxTranslatorModule:FormatByKey(v10)
		end)
		local config = {
			GroupName = "Teleport",
			Image = "http://www.roblox.com/asset/?id=10961494062",
			Duration = 5,
			Title = Title,
			Text = FormatByKeyResult1,
			BottomPadding = Negated
		}
		config.Duration = config.Duration or 5
		SendNotificationInfo:Fire(config)
	end
	
	local _ = function()
		-- upvalues: TeleportService (copy), onMenuTeleportAttemptNotification (copy)
		TeleportService.MenuTeleportAttempt:Connect(function()
			-- upvalues: onMenuTeleportAttemptNotification (upval)
			onMenuTeleportAttemptNotification()
		end)
	end
	
	TeleportService.MenuTeleportAttempt:Connect(function()
		-- upvalues: onMenuTeleportAttemptNotification (copy)
		onMenuTeleportAttemptNotification()
	end)
end