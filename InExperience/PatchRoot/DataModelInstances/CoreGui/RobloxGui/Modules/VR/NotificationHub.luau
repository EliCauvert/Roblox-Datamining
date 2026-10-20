local ContextActionService = game:GetService("ContextActionService")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local Panel3D = require(CorePackages.Workspace.Packages.VrCommon).Panel3D
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local _ = CFrame.Angles(-0.08726646259971647, 0, 0) * CFrame.new(0, 4, 0) * CFrame.Angles(-0.2617993877991494, 0, 0)
local _Color3 = Color3.new(0.3058823529411765, 0.32941176470588235, 0.3764705882352941)
local _Color3_1 = Color3.new(0.3215686274509804, 0.396078431372549, 0.5529411764705883)
local _Color3_2 = Color3.new(0.0784313725490196, 0.0784313725490196, 0.0784313725490196)
local _Color3_3 = Color3.new(0.2, 0.2, 0.2)
local SelectionImageObject = CreateFunction("ImageLabel")({ BackgroundTransparency = 1, Image = "" })
local _Color3_4 = Color3.new(1, 1, 1)
local NotificationHubModule = {
	ModuleName = "Notifications",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = true,
	UnreadCountChanged = function(...) end,
	SetVisible = nil
}
VRHub:RegisterModule(NotificationHubModule)
local Notifications = Panel3D.Get("Notifications")
local Notifications1 = nil
local NotificationDetails = Panel3D.Get("NotificationDetails")
local FriendRequests = nil

local function _(): boolean
	return false
end

local t = {}
local List = {}
local config = { __index = t }

function t.new(Panel, Parent, Text)
	-- upvalues: List (copy), CreateFunction (copy), _Color3 (copy), _Color3_4 (copy), _Color3_2 (copy), config (copy)
	local t = {}
	table.insert(List, t)
	t.zeroCF = Panel.localCF
	t.zOffset = 0
	t.isPopping = false
	t.isAnimating = false
	t.tweener = nil
	t.panel = Panel
	t.SetPopOut = nil
	
	function t.panel.OnMouseEnter()
		-- upvalues: List (upval), t (copy)
		for _, value in pairs(List) do
			if value ~= t then
				value:SetPopOut(false)
			end
		end
		t:SetPopOut(true)
	end
	
	t.titlebar = CreateFunction("ImageLabel")({
		Name = "TitlebarBackground",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		Parent = Parent,
		Position = UDim2.new(0, -1, 0, -1),
		Size = UDim2.new(1, 2, 0, 74),
		ImageColor3 = _Color3,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10)
	})
	t.titleText = CreateFunction("TextLabel")({
		Name = "TitleText",
		BackgroundTransparency = 1,
		Parent = t.titlebar,
		Position = UDim2.new(0, 1, 0, 1),
		Size = UDim2.new(1, -2, 1, -2),
		Text = Text,
		TextColor3 = _Color3_4,
		Font = Enum.Font.SourceSans,
		FontSize = Enum.FontSize.Size36
	})
	t.content = CreateFunction("ImageLabel")({
		Name = "ContentFrame",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 0.5,
		Parent = Parent,
		Position = UDim2.new(0, -1, 0, 74),
		Size = UDim2.new(1, 2, 1, -76),
		ImageColor3 = _Color3_2,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10)
	})
	
	return (setmetatable(t, config))
end

function t.SetTitle(p1, Text)
	p1.titleText.Text = Text
end

function t.AddCloseButton(p1, p2)
	-- upvalues: CreateFunction (copy)
	p1.closeButton = CreateFunction("ImageButton")({
		Name = "CloseButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Keyboard/close_button_icon.png",
		Parent = p1.titlebar,
		Position = UDim2.new(0, 22, 0, 22),
		Size = UDim2.new(0, 32, 0, 32),
		SelectionImageObject = CreateFunction("ImageButton")({
			Name = "CloseButtonHover",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png",
			Position = UDim2.new(0, -11, 0, -11),
			Size = UDim2.new(1, 22, 1, 22)
		})
	})
	p1.closeButton.MouseButton1Click:connect(p2)
end

function t.TweenZOffsetTo(p1, p2, p3, EaseInOutQuad, p4)
	-- upvalues: UtilityModule (copy)
	if p1.tweener and not p1.tweener:IsFinished() then
		p1.tweener:Cancel()
	end
	p1.tweener = UtilityModule:TweenProperty(p1, "zOffset", p1.zOffset, p2, p3, EaseInOutQuad, p4)
end

function t.AnimateOut(p1, Callback)
	-- upvalues: UtilityModule (copy)
	p1.isAnimating = true
	p1:TweenZOffsetTo(-100, 0.25, UtilityModule:GetEaseInOutQuad(), function()
		-- upvalues: Callback (copy), p1 (copy)
		if Callback then
			Callback()
		end
		p1.isAnimating = false
	end)
end

function t.AnimateIn(GlobalDataStore, Callback)
	-- upvalues: UtilityModule (copy)
	GlobalDataStore.zOffset = -100
	GlobalDataStore:OnUpdate(0)
	GlobalDataStore.isAnimating = true
	GlobalDataStore:TweenZOffsetTo(0, 0.25, UtilityModule:GetEaseInOutQuad(), function()
		-- upvalues: Callback (copy), GlobalDataStore (copy)
		if Callback then
			Callback()
		end
		GlobalDataStore.isAnimating = false
	end)
end

function t.SetPopOut(p1, p2)
	-- upvalues: UtilityModule (copy)
	if p1.isAnimating then return end
	if p2 then
		p1.isPopping = true
		p1:TweenZOffsetTo(0.25, 0.25, UtilityModule:GetEaseInOutQuad(), function()
			-- upvalues: p1 (copy)
			p1.isPopping = false
		end)
		
		return
	else
		p1.isPopping = true
		p1:TweenZOffsetTo(0, 0.25, UtilityModule:GetEaseInOutQuad(), function()
			-- upvalues: p1 (copy)
			p1.isPopping = false
		end)
	end
end

function t.OnUpdate(p1, _)
	-- upvalues: _Color3 (copy), _Color3_1 (copy)
	p1.panel.localCF = p1.zeroCF * CFrame.new(0, 0, p1.zOffset)
	p1.panel.needsLocalPositionUpdate = p1.isAnimating or p1.isPopping
	
	if p1.isPopping then
		p1.titlebar.ImageColor3 = _Color3:lerp(_Color3_1, (math.max(0, (math.min(1, p1.zOffset / 0.25)))))
	end
end

Notifications:SetType(Panel3D.Type.Standard)
Notifications:SetVisible(false)
Notifications:SetCanFade(false)
Notifications:ResizeStuds(2.277333324, 3.5, 150)
Notifications1 = t.new(Notifications, CreateFunction("TextButton")({
	Name = "NotificationsListFrame",
	BackgroundTransparency = 1,
	Text = "",
	Selectable = true,
	Parent = Notifications:GetGUI(),
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(1, -4, 1, 0),
	SelectionImageObject = SelectionImageObject
}), "Notifications")
Notifications1:AddCloseButton(function()
	-- upvalues: NotificationHubModule (copy)
	NotificationHubModule:SetVisible(false)
end)

function Notifications:OnUpdate(p1)
	-- upvalues: Notifications1 (ref)
	Notifications1:OnUpdate(p1)
end

NotificationDetails:SetType(Panel3D.Type.Standard)
NotificationDetails:SetVisible(false)
NotificationDetails:SetCanFade(false)
NotificationDetails:ResizeStuds(3.4159999859999997, 3.5, 150)
FriendRequests = t.new(NotificationDetails, CreateFunction("TextButton")({
	Name = "NotificationsDetailFrame",
	BackgroundTransparency = 1,
	Text = "",
	Selectable = true,
	Parent = NotificationDetails:GetGUI(),
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(1, 0, 1, 0),
	SelectionImageObject = SelectionImageObject
}), "Friend Requests")

function NotificationDetails:OnUpdate(p1)
	-- upvalues: FriendRequests (ref)
	FriendRequests:OnUpdate(p1)
end

local t1 = {}
local List1 = {}

local function groupSort(A, B): boolean
	return A.order < B.order
end

local v1 = nil

local function layoutNotificationsGroups()
	-- upvalues: List1 (copy), Notifications (copy), v1 (ref)
	local YOffset = 20
	
	for _, value in ipairs(List1) do
		if #value.notifications > 0 then
			local NewSmallest = (math.min(3, #value.notifications) - 1) * 20 + 80
			value.frame.Position = UDim2.new(0.07500000000000001, 0, 0, YOffset)
			value.frame.Size = UDim2.new(0.85, -40, 0, NewSmallest)
			YOffset = YOffset + NewSmallest + 20
			
			if value.notificationsDirty then
				value.notificationsDirty = false
				local XOffset = 0
				local Count = 0
				local CountNotifications = #value.notifications
				
				if CountNotifications > 0 then
					local Largest = math.max(1, CountNotifications - 3 + 1)
					
					for i = 1, CountNotifications do
						local Notification = value.notifications[i]
						
						if Largest <= i then
							Notification.frame.Visible = true
							Notification.frame.Position = UDim2.new(0, XOffset, 0, XOffset)
							XOffset += 20
							local _ = Notifications:SetSubpanelDepth(Notification.frame, Count)
							Count += 0.25
						else
							Notification.frame.Visible = false
						end
					end
					if v1 == value then
						local Largest1 = math.max(1, CountNotifications - 2 + 1)
						local YScale = 0
						
						for i1 = 1, CountNotifications do
							local Notification = value.notifications[i1]
							
							if Largest1 <= i1 then
								Notification.detailsFrame.Visible = true
								Notification.detailsFrame.Position = UDim2.new(0, 20, YScale, 20)
								Notification.detailsFrame.Size = UDim2.new(1, -40, 0.5, -40)
								YScale += 0.5
							else
								Notification.detailsFrame.Visible = false
							end
						end
					end
				end
			end
		end
	end
end

local t2 = {}
local config1 = { __index = t2 }

function t2.new(Key, Title, Order)
	-- upvalues: config1 (copy), CreateFunction (copy), Notifications1 (ref), t1 (copy), List1 (copy)
	local self = setmetatable({}, config1)
	self.key = Key
	self.title = Title
	self.order = Order
	self.notifications = {}
	self.notificationsDirty = false
	self.frame = CreateFunction("Frame")({
		Name = "NotificationGroup",
		BackgroundTransparency = 1,
		Parent = Notifications1.content
	})
	self.detailsFrame = CreateFunction("Frame")({
		Parent = nil,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	})
	t1[Key] = self
	table.insert(List1, self)
	
	return self
end

function t2.Deactivate(p1)
	-- upvalues: NotificationDetails (copy)
	p1.detailsFrame.Parent = nil
	
	for _, child in pairs(p1.detailsFrame:GetChildren()) do
		NotificationDetails:RemoveSubpanel(child)
	end
end

function t2.SwitchTo(p2)
	-- upvalues: FriendRequests (ref), t1 (copy), v1 (ref)
	FriendRequests:SetTitle(p2.title)
	
	for _, value in pairs(t1) do
		if value ~= p2 then
			value:Deactivate()
		end
	end
	p2.detailsFrame.Parent = FriendRequests.content
	v1 = p2
	p2.notificationsDirty = true
end

function t2.BringNotificationToFront(p3, Notification)
	-- upvalues: v1 (ref), layoutNotificationsGroups (copy)
	if v1 ~= p3 then
		p3:SwitchTo()
	end
	if #p3.notifications ~= 0 and Notification == p3.notifications[#p3.notifications] then
		layoutNotificationsGroups()
		
		return
	end
	for i, notification in ipairs(p3.notifications) do
		if notification == Notification then
			table.remove(p3.notifications, i)
			break
		end
	end
	table.insert(p3.notifications, Notification)
	p3.notificationsDirty = true
	layoutNotificationsGroups()
end

function t2.RemoveNotification(p4, p5)
	-- upvalues: Notifications (copy), NotificationDetails (copy), layoutNotificationsGroups (copy)
	for i, notification in ipairs(p4.notifications) do
		if notification == p5 then
			table.remove(p4.notifications, i)
			Notifications:RemoveSubpanel(p5.frame)
			NotificationDetails:RemoveSubpanel(p5.detailsFrame)
			p5.detailsFrame:Destroy()
			p5.frame:Destroy()
			p4.notificationsDirty = true
			layoutNotificationsGroups()
			break
		end
	end
end

function t2.GetTopNotification(p6)
	local CountNotifications = #p6.notifications
	
	return if CountNotifications <= 0 then nil else p6.notifications[CountNotifications]
end

t2.new("Friends", "Friends", 1)
t2.new("BadgeAwards", "Badges", 2)
t2.new("PlayerPoints", "Points", 3)
table.sort(List1, groupSort)

local function doCallback(Callback: (any) -> (), ...)
	if not Callback then return end
	if type(Callback) == "function" then
		Callback(...)
		
		return
	end
	if Callback:IsA("BindableEvent") then
		Callback:Fire(...)
		
		return
	end
	if Callback:IsA("BindableFunction") then
		Callback:Invoke(...)
		
		return
	end
end

local t3 = {}
local config2 = { __index = t3 }

function t3.new(Group, p6)
	-- upvalues: config2 (copy), CreateFunction (copy), SelectionImageObject (copy), _Color3_3 (copy), _Color3_4 (copy), NotificationDetails (copy), doCallback (copy), layoutNotificationsGroups (copy)
	local self = setmetatable({}, config2)
	self.group = Group
	self.frame = CreateFunction("ImageButton")({
		BackgroundTransparency = 1,
		Parent = Group.frame,
		Size = UDim2.new(1, 0, 0, 80),
		SelectionImageObject = SelectionImageObject
	})
	self.frame.MouseButton1Click:connect(function()
		-- upvalues: self (copy)
		self:OnClicked()
	end)
	self.background = CreateFunction("ImageLabel")({
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/vr/rectBackgroundWhite.png",
		ImageTransparency = 0.1,
		Parent = self.frame,
		Position = UDim2.new(0, -1, 0, -1),
		Size = UDim2.new(1, 2, 1, 2),
		ImageColor3 = _Color3_3,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10)
	})
	self.imageBackground = CreateFunction("ImageLabel")({
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/circleWhite.png",
		Parent = self.frame,
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(0, 70, 0, 70),
		ImageColor3 = p6.imgBackgroundColor or Color3.new(1, 1, 1)
	})
	self.image = CreateFunction("ImageLabel")({
		BackgroundTransparency = 1,
		Parent = self.imageBackground,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Image = p6.Image
	})
	self.text = CreateFunction("TextLabel")({
		BackgroundTransparency = 1,
		TextWrapped = true,
		Parent = self.frame,
		Position = UDim2.new(0, 80, 0, 0),
		Size = UDim2.new(1, -80, 1, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
		Text = if p6.Title and p6.Text then ("%s\n%s"):format(p6.Title, p6.Text) else p6.Text,
		Font = Enum.Font.SourceSans,
		FontSize = Enum.FontSize.Size18,
		TextColor3 = _Color3_4
	})
	self.detailsFrame = CreateFunction("Frame")({ BackgroundTransparency = 1, Parent = Group.detailsFrame })
	self.detailsFrame.MouseEnter:connect(function()
		-- upvalues: NotificationDetails (upval), self (copy)
		NotificationDetails:SetSubpanelDepth(self.detailsFrame, 0.25)
	end)
	self.detailsFrame.MouseLeave:connect(function()
		-- upvalues: NotificationDetails (upval), self (copy)
		NotificationDetails:SetSubpanelDepth(self.detailsFrame, 0)
	end)
	self.detailsBackground = CreateFunction("ImageLabel")({
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 0.1,
		Parent = self.detailsFrame,
		Position = UDim2.new(0, -1, 0, -1),
		Size = UDim2.new(1, 2, 1, 2),
		ImageColor3 = Color3.new(0.2, 0.2, 0.2),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10)
	})
	self.detailsIconBackground = CreateFunction("ImageLabel")({
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/circleWhite.png",
		Parent = self.detailsFrame,
		Position = UDim2.new(0, 20, 0, 10),
		Size = UDim2.new(0, 80, 0, 80),
		ImageColor3 = p6.imgBackgroundColor or Color3.new(1, 1, 1)
	})
	self.detailsIcon = CreateFunction("ImageLabel")({
		BackgroundTransparency = 1,
		Parent = self.detailsIconBackground,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Image = p6.Image
	})
	self.detailsText = CreateFunction("TextLabel")({
		BackgroundTransparency = 1,
		TextWrapped = true,
		Parent = self.detailsFrame,
		Position = UDim2.new(0, 110, 0, 10),
		Size = UDim2.new(1, -120, 0, 90),
		Text = p6.DetailText or p6.Title,
		TextColor3 = _Color3_4,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size36
	})
	
	local function createButton(XScale, XScale1, Button1Text)
		-- upvalues: CreateFunction (upval), self (copy), SelectionImageObject (upval), _Color3_4 (upval)
		local Parent = CreateFunction("ImageButton")({
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
			Parent = self.detailsFrame,
			Position = UDim2.new(XScale, 0, 0.55, 0),
			Size = UDim2.new(XScale1, 0, 0.29, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 6, 46, 44),
			SelectionImageObject = SelectionImageObject
		})
		local v2 = CreateFunction("TextLabel")({
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, -6),
			Text = Button1Text,
			TextColor3 = _Color3_4,
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size24
		})
		v2.Parent = Parent
		Parent.SelectionGained:connect(function()
			-- upvalues: Parent (copy)
			Parent.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
		end)
		Parent.SelectionLost:connect(function()
			-- upvalues: Parent (copy)
			Parent.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
		end)
		
		return Parent, v2
	end
	
	if p6.Button1Text and p6.Button2Text then
		self.detailsButton1, self.detailsButton1Text = createButton(0.07, 0.415, p6.Button1Text)
		self.detailsButton2, self.detailsButton2Text = createButton(0.511, 0.415, p6.Button2Text)
		self.detailsButton1.MouseButton1Click:connect(function()
			-- upvalues: doCallback (upval), p6 (copy), self (copy)
			doCallback(p6.Callback, p6.Button1Text)
			self:Dismiss()
		end)
		self.detailsButton2.MouseButton1Click:connect(function()
			-- upvalues: doCallback (upval), p6 (copy), self (copy)
			doCallback(p6.Callback, p6.Button2Text)
			self:Dismiss()
		end)
	elseif not p6.button2Text then
		self.detailsButton1, self.detailsButton1Text = createButton(0.07, 0.86, p6.Button1Text or "Dismiss")
		self.detailsButton1.MouseButton1Click:connect(function()
			-- upvalues: doCallback (upval), p6 (copy), self (copy)
			doCallback(p6.Callback, p6.Button1Text)
			self:Dismiss()
		end)
	end
	table.insert(Group.notifications, self)
	Group.notificationsDirty = true
	layoutNotificationsGroups()
	
	return self
end

function t3.OnClicked(p6)
	-- upvalues: layoutNotificationsGroups (copy)
	p6.group:SwitchTo()
	layoutNotificationsGroups()
end

function t3.Dismiss(p6)
	p6.group:RemoveNotification(p6)
end

local t4 = {}
local Visible = false
local Count = 0
RobloxGui:WaitForChild("SendNotificationInfo").Event:connect(function(p6)
	-- upvalues: t1 (copy), t3 (copy), Visible (ref), Count (ref), NotificationHubModule (copy)
	local Entry = p6.GroupName and t1[p6.GroupName]
	
	if not Entry then return end
	t3.new(Entry, p6)
	
	if not Visible then
		Count += 1
		NotificationHubModule.UnreadCountChanged(Count)
	end
end)

local function onMenuCloseShortcut(_, UserInputState, _)
	-- upvalues: NotificationHubModule (copy)
	if UserInputState == Enum.UserInputState.Begin then
		NotificationHubModule:SetVisible(false)
	end
end

NotificationHubModule.VisibilityStateChanged = CreateFunction("BindableEvent")({ Name = "VisibilityStateChanged" })

function NotificationHubModule:GetNumberOfPendingNotifications(): number
	-- upvalues: t4 (copy)
	return #t4
end

function NotificationHubModule:IsVisible()
	-- upvalues: Visible (ref)
	return Visible
end

function NotificationHubModule:SetVisible(Value)
	-- upvalues: Visible (ref), Panel3D (copy), Count (ref), NotificationHubModule (copy), Notifications (copy), Notifications1 (ref), NotificationDetails (copy), FriendRequests (ref), ContextActionService (copy), onMenuCloseShortcut (copy), VRHub (copy)
	if Visible == Value then return end
	Visible = Value
	Panel3D.Get("Topbar3D"):SetCanFade(not Value)
	
	if Value then
		Count = 0
		NotificationHubModule.UnreadCountChanged(Count)
		Notifications.localCF = CFrame.new(-1.7079999929999998, 0, 0)
		Notifications1.zeroCF = Notifications.localCF
		Notifications1:AnimateIn(nil)
		NotificationDetails.localCF = CFrame.new(1.138666662, 0, 0)
		FriendRequests.zeroCF = NotificationDetails.localCF
		FriendRequests:AnimateIn(nil)
		Notifications:SetVisible(true)
		NotificationDetails:SetVisible(true)
		ContextActionService:BindCoreAction("NotificationsMenuCloseShortcut", onMenuCloseShortcut, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
		VRHub:FireModuleOpened(NotificationHubModule.ModuleName)
	else
		spawn(function()
			-- upvalues: Notifications1 (upval), Notifications (upval), FriendRequests (upval), NotificationDetails (upval)
			Notifications1:AnimateOut(function()
				-- upvalues: Notifications (upval)
				Notifications:SetVisible(false)
			end)
			FriendRequests:AnimateOut(function()
				-- upvalues: NotificationDetails (upval)
				NotificationDetails:SetVisible(false)
			end)
		end)
		ContextActionService:UnbindCoreAction("NotificationsMenuCloseShortcut")
		VRHub:FireModuleClosed(NotificationHubModule.ModuleName)
	end
	NotificationHubModule.VisibilityStateChanged:Fire(Value)
end

VRHub.ModuleOpened.Event:connect(function(ModuleName, _, _, _)
	-- upvalues: NotificationHubModule (copy)
	if ModuleName ~= NotificationHubModule.ModuleName then
		NotificationHubModule:SetVisible(false)
	end
end)

return NotificationHubModule