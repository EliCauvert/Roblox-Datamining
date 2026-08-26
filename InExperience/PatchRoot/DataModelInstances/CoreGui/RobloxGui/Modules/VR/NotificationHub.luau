local contextActionService = game:GetService("ContextActionService")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local _ = CFrame.Angles(-0.0872664626, 0, 0) * CFrame.new(0, 4, 0) * CFrame.Angles(-0.261799387799, 0, 0)
local color3 = Color3.new(0.305882352941, 0.329411764706, 0.376470588235)
local color3_1 = Color3.new(0.321568627451, 0.396078431373, 0.552941176471)
local color3_2 = Color3.new(0.078431372549, 0.078431372549, 0.078431372549)
local color3_3 = Color3.new(0.2, 0.2, 0.2)
local var1 = create("ImageLabel")({ BackgroundTransparency = 1, Image = "" })
local color3_4 = Color3.new(1, 1, 1)
local t = {
	ModuleName = "Notifications",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = true,
	UnreadCountChanged = function(...) end,
	SetVisible = nil
}
VRHub:RegisterModule(t)
local notifications = panel3D.Get("Notifications")
local _ = nil
local notificationDetails = panel3D.Get("NotificationDetails")
local _ = nil

local function _()
	return false
end

local t_1 = {}
local t_2 = {}
local t_3 = { __index = t_1 }

function t_1.new(p1, p2, p3)
	-- upvalues: t_2 (ref), create (ref), color3 (ref), color3_4 (ref), color3_2 (ref), t_3 (ref)
	local t = {}
	table.insert(t_2, t)
	t.zeroCF = p1.localCF
	t.zOffset = 0
	t.isPopping = false
	t.isAnimating = false
	t.tweener = nil
	t.panel = p1
	t.SetPopOut = nil
	
	function t.panel.OnMouseEnter()
		-- upvalues: t_2 (copy), t (ref)
		for i, v in pairs(t_2) do
			if v ~= t then
				v:SetPopOut(false)
			end
		end
		t:SetPopOut(true)
	end
	
	t.titlebar = create("ImageLabel")({
		Name = "TitlebarBackground",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		Parent = p2,
		Position = UDim2.new(0, -1, 0, -1),
		Size = UDim2.new(1, 2, 0, 74),
		ImageColor3 = color3,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10)
	})
	t.titleText = create("TextLabel")({
		Name = "TitleText",
		BackgroundTransparency = 1,
		Parent = t.titlebar,
		Position = UDim2.new(0, 1, 0, 1),
		Size = UDim2.new(1, -2, 1, -2),
		Text = p3,
		TextColor3 = color3_4,
		Font = Enum.Font.SourceSans,
		FontSize = Enum.FontSize.Size36
	})
	t.content = create("ImageLabel")({
		Name = "ContentFrame",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 0.5,
		Parent = p2,
		Position = UDim2.new(0, -1, 0, 74),
		Size = UDim2.new(1, 2, 1, -76),
		ImageColor3 = color3_2,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10)
	})
	
	return setmetatable(t, t_3)
end

function t_1.SetTitle(value, p4)
	value.titleText.Text = p4
end

function t_1.AddCloseButton(p4, p5)
	-- upvalues: create (ref)
	p4.closeButton = create("ImageButton")({
		Name = "CloseButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Keyboard/close_button_icon.png",
		Parent = p4.titlebar,
		Position = UDim2.new(0, 22, 0, 22),
		Size = UDim2.new(0, 32, 0, 32),
		SelectionImageObject = create("ImageButton")({
			Name = "CloseButtonHover",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png",
			Position = UDim2.new(0, -11, 0, -11),
			Size = UDim2.new(1, 22, 1, 22)
		})
	})
	p4.closeButton.MouseButton1Click:connect(p5)
end

function t_1.TweenZOffsetTo(value, p4, p5, p6, p7)
	-- upvalues: utilityModule (ref)
	if value.tweener and not value.tweener:IsFinished() then
		value.tweener:Cancel()
	end
	value.tweener = utilityModule:TweenProperty(value, "zOffset", value.zOffset, p4, p5, p6, p7)
end

function t_1.AnimateOut(p4, p5)
	-- upvalues: utilityModule (ref)
	p4.isAnimating = true
	p4:TweenZOffsetTo(-100, 0.25, utilityModule:GetEaseInOutQuad(), function()
		-- upvalues: p5 (ref), p4 (ref)
		if p5 then
			p5()
		end
		p4.isAnimating = false
	end)
end

function t_1.AnimateIn(p4, p5)
	-- upvalues: utilityModule (ref)
	p4.zOffset = -100
	p4:OnUpdate(0)
	p4.isAnimating = true
	p4:TweenZOffsetTo(0, 0.25, utilityModule:GetEaseInOutQuad(), function()
		-- upvalues: p5 (ref), p4 (ref)
		if p5 then
			p5()
		end
		p4.isAnimating = false
	end)
end

function t_1.SetPopOut(value, p4)
	-- upvalues: utilityModule (ref)
	if value.isAnimating then return end
	if p4 then
		value.isPopping = true
		value:TweenZOffsetTo(0.25, 0.25, utilityModule:GetEaseInOutQuad(), function()
			-- upvalues: value (ref)
			value.isPopping = false
		end)
		
		return
	end
	value.isPopping = true
	value:TweenZOffsetTo(0, 0.25, utilityModule:GetEaseInOutQuad(), function()
		-- upvalues: value (ref)
		value.isPopping = false
	end)
end

function t_1.OnUpdate(p4, _)
	-- upvalues: color3 (ref), color3_1 (ref)
	p4.panel.localCF = p4.zeroCF * CFrame.new(0, 0, p4.zOffset)
	p4.panel.needsLocalPositionUpdate = p4.isAnimating or p4.isPopping
	
	if p4.isPopping then
		p4.titlebar.ImageColor3 = color3:lerp(color3_1, math.max(0, math.min(1, p4.zOffset / 0.25)))
	end
end

notifications:SetType(panel3D.Type.Standard)
notifications:SetVisible(false)
notifications:SetCanFade(false)
notifications:ResizeStuds(2.277333324, 3.5, 150)
local notifications_1 = t_1.new(notifications, create("TextButton")({
	Name = "NotificationsListFrame",
	BackgroundTransparency = 1,
	Text = "",
	Selectable = true,
	Parent = notifications:GetGUI(),
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(1, -4, 1, 0),
	SelectionImageObject = var1
}), "Notifications")
notifications_1:AddCloseButton(function()
	-- upvalues: t (ref)
	t:SetVisible(false)
end)

function notifications.OnUpdate(_, p4)
	-- upvalues: notifications_1 (write)
	notifications_1:OnUpdate(p4)
end

notificationDetails:SetType(panel3D.Type.Standard)
notificationDetails:SetVisible(false)
notificationDetails:SetCanFade(false)
notificationDetails:ResizeStuds(3.415999986, 3.5, 150)
local var2 = t_1.new(notificationDetails, create("TextButton")({
	Name = "NotificationsDetailFrame",
	BackgroundTransparency = 1,
	Text = "",
	Selectable = true,
	Parent = notificationDetails:GetGUI(),
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(1, 0, 1, 0),
	SelectionImageObject = var1
}), "Friend Requests")

function notificationDetails.OnUpdate(_, p4)
	-- upvalues: var2 (write)
	var2:OnUpdate(p4)
end

local t_4 = {}
local t_5 = {}

local function groupSort(p4, p5)
	return p4.order < p5.order
end

local var3 = nil

local function layoutNotificationsGroups()
	-- upvalues: t_5 (ref), notifications (ref), var3 (write)
	local var4 = 20
	
	for i, v in ipairs(t_5) do
		if #v.notifications > 0 then
			local var5 = (math.min(3, #v.notifications) - 1) * 20 + 80
			v.frame.Position = UDim2.new(0.075, 0, 0, var4)
			v.frame.Size = UDim2.new(0.85, -40, 0, var5)
			var4 = var4 + var5 + 20
			
			if v.notificationsDirty then
				v.notificationsDirty = false
				local var6 = 0
				local var7 = 0
				local notificationsCount = #v.notifications
				
				if notificationsCount > 0 then
					local var8
					local maxValue = math.max(1, notificationsCount - 3 + 1)
					
					for i_1 = 1, notificationsCount do
						var8 = v.notifications[i_1]
						
						if maxValue <= i_1 then
							var8.frame.Visible = true
							var8.frame.Position = UDim2.new(0, var6, 0, var6)
							var6 += 20
							local _ = notifications:SetSubpanelDepth(var8.frame, var7)
							var7 += 0.25
						else
							var8.frame.Visible = false
						end
					end
					if var3 == v then
						local maxValue_1 = math.max(1, notificationsCount - 2 + 1)
						local var9 = 0
						
						for var8 = 1, notificationsCount do
							local var10 = v.notifications[var8]
							
							if maxValue_1 <= var8 then
								var10.detailsFrame.Visible = true
								var10.detailsFrame.Position = UDim2.new(0, 20, var9, 20)
								var10.detailsFrame.Size = UDim2.new(1, -40, 0.5, -40)
								var9 += 0.5
							else
								var10.detailsFrame.Visible = false
							end
						end
					end
				end
			end
		end
	end
end

local t_6 = {}
local t_7 = { __index = t_6 }

function t_6.new(p4, p5, p6)
	-- upvalues: t_7 (ref), create (ref), notifications_1 (write), t_4 (ref), t_5 (ref)
	local tbl = setmetatable({}, t_7)
	tbl.key = p4
	tbl.title = p5
	tbl.order = p6
	tbl.notifications = {}
	tbl.notificationsDirty = false
	tbl.frame = create("Frame")({
		Name = "NotificationGroup",
		BackgroundTransparency = 1,
		Parent = notifications_1.content
	})
	tbl.detailsFrame = create("Frame")({
		Parent = nil,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	})
	t_4[p4] = tbl
	table.insert(t_5, tbl)
	
	return tbl
end

function t_6.Deactivate(p4)
	-- upvalues: notificationDetails (ref)
	p4.detailsFrame.Parent = nil
	
	for i, v in pairs(p4.detailsFrame:GetChildren()) do
		notificationDetails:RemoveSubpanel(v)
	end
end

function t_6.SwitchTo(p5)
	-- upvalues: var2 (write), t_4 (ref), var3 (write)
	var2:SetTitle(p5.title)
	
	for i, v in pairs(t_4) do
		if v ~= p5 then
			v:Deactivate()
		end
	end
	p5.detailsFrame.Parent = var2.content
	var3 = p5
	p5.notificationsDirty = true
end

function t_6.BringNotificationToFront(p6, p7)
	-- upvalues: var3 (write), layoutNotificationsGroups (ref)
	if var3 ~= p6 then
		p6:SwitchTo()
	end
	if #p6.notifications ~= 0 and p7 == p6.notifications[#p6.notifications] then
		layoutNotificationsGroups()
		
		return
	end
	for i, v in ipairs(p6.notifications) do
		if v == p7 then
			table.remove(p6.notifications, i)
			break
		end
	end
	table.insert(p6.notifications, p7)
	p6.notificationsDirty = true
	layoutNotificationsGroups()
end

function t_6.RemoveNotification(p8, p9)
	-- upvalues: notifications (ref), notificationDetails (ref), layoutNotificationsGroups (ref)
	for i, v in ipairs(p8.notifications) do
		if v == p9 then
			table.remove(p8.notifications, i)
			notifications:RemoveSubpanel(p9.frame)
			notificationDetails:RemoveSubpanel(p9.detailsFrame)
			p9.detailsFrame:Destroy()
			p9.frame:Destroy()
			p8.notificationsDirty = true
			layoutNotificationsGroups()
			
			return
		end
	end
end

function t_6.GetTopNotification(p10)
	local notificationsCount = #p10.notifications
	
	return if notificationsCount <= 0 then nil else p10.notifications[notificationsCount]
end

t_6.new("Friends", "Friends", 1)
t_6.new("BadgeAwards", "Badges", 2)
t_6.new("PlayerPoints", "Points", 3)
table.sort(t_5, groupSort)

local function doCallback(p10, ...)
	if not p10 then return end
	if type(p10) == "function" then
		p10(...)
		
		return
	elseif p10:IsA("BindableEvent") then
		p10:Fire(...)
		
		return
	elseif p10:IsA("BindableFunction") then
		p10:Invoke(...)
		
		return
	end
end

local t_8 = {}
local t_9 = { __index = t_8 }

function t_8.new(p10, p11)
	-- upvalues: t_9 (ref), create (ref), var1 (ref), color3_3 (ref), color3_4 (ref), notificationDetails (ref), doCallback (ref), layoutNotificationsGroups (ref)
	local tbl = setmetatable({}, t_9)
	tbl.group = p10
	tbl.frame = create("ImageButton")({
		BackgroundTransparency = 1,
		Parent = p10.frame,
		Size = UDim2.new(1, 0, 0, 80),
		SelectionImageObject = var1
	})
	tbl.frame.MouseButton1Click:connect(function()
		-- upvalues: tbl (ref)
		tbl:OnClicked()
	end)
	tbl.background = create("ImageLabel")({
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/vr/rectBackgroundWhite.png",
		ImageTransparency = 0.1,
		Parent = tbl.frame,
		Position = UDim2.new(0, -1, 0, -1),
		Size = UDim2.new(1, 2, 1, 2),
		ImageColor3 = color3_3,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10)
	})
	tbl.imageBackground = create("ImageLabel")({
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/circleWhite.png",
		Parent = tbl.frame,
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(0, 70, 0, 70),
		ImageColor3 = p11.imgBackgroundColor or Color3.new(1, 1, 1)
	})
	tbl.image = create("ImageLabel")({
		BackgroundTransparency = 1,
		Parent = tbl.imageBackground,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Image = p11.Image
	})
	tbl.text = create("TextLabel")({
		BackgroundTransparency = 1,
		TextWrapped = true,
		Parent = tbl.frame,
		Position = UDim2.new(0, 80, 0, 0),
		Size = UDim2.new(1, -80, 1, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
		Text = if p11.Title and p11.Text then ("%s\n%s"):format(p11.Title, p11.Text) else p11.Text,
		Font = Enum.Font.SourceSans,
		FontSize = Enum.FontSize.Size18,
		TextColor3 = color3_4
	})
	tbl.detailsFrame = create("Frame")({ BackgroundTransparency = 1, Parent = p10.detailsFrame })
	tbl.detailsFrame.MouseEnter:connect(function()
		-- upvalues: notificationDetails (copy), tbl (ref)
		notificationDetails:SetSubpanelDepth(tbl.detailsFrame, 0.25)
	end)
	tbl.detailsFrame.MouseLeave:connect(function()
		-- upvalues: notificationDetails (copy), tbl (ref)
		notificationDetails:SetSubpanelDepth(tbl.detailsFrame, 0)
	end)
	tbl.detailsBackground = create("ImageLabel")({
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 0.1,
		Parent = tbl.detailsFrame,
		Position = UDim2.new(0, -1, 0, -1),
		Size = UDim2.new(1, 2, 1, 2),
		ImageColor3 = Color3.new(0.2, 0.2, 0.2),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10)
	})
	tbl.detailsIconBackground = create("ImageLabel")({
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/circleWhite.png",
		Parent = tbl.detailsFrame,
		Position = UDim2.new(0, 20, 0, 10),
		Size = UDim2.new(0, 80, 0, 80),
		ImageColor3 = p11.imgBackgroundColor or Color3.new(1, 1, 1)
	})
	tbl.detailsIcon = create("ImageLabel")({
		BackgroundTransparency = 1,
		Parent = tbl.detailsIconBackground,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Image = p11.Image
	})
	tbl.detailsText = create("TextLabel")({
		BackgroundTransparency = 1,
		TextWrapped = true,
		Parent = tbl.detailsFrame,
		Position = UDim2.new(0, 110, 0, 10),
		Size = UDim2.new(1, -120, 0, 90),
		Text = p11.DetailText or p11.Title,
		TextColor3 = color3_4,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size36
	})
	
	local function createButton(p12, p13, p14)
		-- upvalues: create (copy), tbl (ref), var1 (copy), color3_4 (copy)
		local var11 = create("ImageButton")({
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
			Parent = tbl.detailsFrame,
			Position = UDim2.new(p12, 0, 0.55, 0),
			Size = UDim2.new(p13, 0, 0.29, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 6, 46, 44),
			SelectionImageObject = var1
		})
		local var12 = create("TextLabel")({
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, -6),
			Text = p14,
			TextColor3 = color3_4,
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size24
		})
		var12.Parent = var11
		var11.SelectionGained:connect(function()
			-- upvalues: var11 (ref)
			var11.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
		end)
		var11.SelectionLost:connect(function()
			-- upvalues: var11 (ref)
			var11.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
		end)
		
		return var11, var12
	end
	
	if p11.Button1Text and p11.Button2Text then
		local var11, var12 = createButton(0.07, 0.415, p11.Button1Text)
		tbl.detailsButton1 = var11
		tbl.detailsButton1Text = var12
		local var13, var14 = createButton(0.511, 0.415, p11.Button2Text)
		tbl.detailsButton2 = var13
		tbl.detailsButton2Text = var14
		tbl.detailsButton1.MouseButton1Click:connect(function()
			-- upvalues: doCallback (copy), p11 (ref), tbl (ref)
			doCallback(p11.Callback, p11.Button1Text)
			tbl:Dismiss()
		end)
		tbl.detailsButton2.MouseButton1Click:connect(function()
			-- upvalues: doCallback (copy), p11 (ref), tbl (ref)
			doCallback(p11.Callback, p11.Button2Text)
			tbl:Dismiss()
		end)
	elseif not p11.button2Text then
		local var15, var16 = createButton(0.07, 0.86, p11.Button1Text or "Dismiss")
		tbl.detailsButton1 = var15
		tbl.detailsButton1Text = var16
		tbl.detailsButton1.MouseButton1Click:connect(function()
			-- upvalues: doCallback (copy), p11 (ref), tbl (ref)
			doCallback(p11.Callback, p11.Button1Text)
			tbl:Dismiss()
		end)
	end
	table.insert(p10.notifications, tbl)
	p10.notificationsDirty = true
	layoutNotificationsGroups()
	
	return tbl
end

function t_8.OnClicked(p10)
	-- upvalues: layoutNotificationsGroups (ref)
	p10.group:SwitchTo()
	layoutNotificationsGroups()
end

function t_8.Dismiss(p10)
	p10.group:RemoveNotification(p10)
end

local t_10 = {}
local var11 = false
local var12 = 0
robloxGui:WaitForChild("SendNotificationInfo").Event:connect(function(p10)
	-- upvalues: t_4 (ref), t_8 (ref), var11 (write), var12 (write), t (ref)
	local groupName = p10.GroupName and t_4[p10.GroupName]
	
	if not groupName then return end
	t_8.new(groupName, p10)
	
	if not var11 then
		var12 += 1
		t.UnreadCountChanged(var12)
	end
end)

local function onMenuCloseShortcut(_, p10, _)
	-- upvalues: t (ref)
	if p10 == Enum.UserInputState.Begin then
		t:SetVisible(false)
	end
end

t.VisibilityStateChanged = create("BindableEvent")({ Name = "VisibilityStateChanged" })

function t.GetNumberOfPendingNotifications(_)
	-- upvalues: t_10 (ref)
	return #t_10
end

function t.IsVisible(_)
	-- upvalues: var11 (write)
	return var11
end

function t.SetVisible(_, p10)
	-- upvalues: var11 (write), panel3D (ref), var12 (write), t (ref), notifications (ref), notifications_1 (write), notificationDetails (ref), var2 (write), contextActionService (ref), onMenuCloseShortcut (ref), VRHub (ref)
	if var11 == p10 then return end
	var11 = p10
	panel3D.Get("Topbar3D"):SetCanFade(not p10)
	
	if p10 then
		var12 = 0
		t.UnreadCountChanged(var12)
		notifications.localCF = CFrame.new(-1.707999993, 0, 0)
		notifications_1.zeroCF = notifications.localCF
		notifications_1:AnimateIn(nil)
		notificationDetails.localCF = CFrame.new(1.138666662, 0, 0)
		var2.zeroCF = notificationDetails.localCF
		var2:AnimateIn(nil)
		notifications:SetVisible(true)
		notificationDetails:SetVisible(true)
		contextActionService:BindCoreAction("NotificationsMenuCloseShortcut", onMenuCloseShortcut, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
		VRHub:FireModuleOpened(t.ModuleName)
	else
		spawn(function()
			-- upvalues: notifications_1 (copy), notifications (copy), var2 (copy), notificationDetails (copy)
			notifications_1:AnimateOut(function()
				-- upvalues: notifications (copy)
				notifications:SetVisible(false)
			end)
			var2:AnimateOut(function()
				-- upvalues: notificationDetails (copy)
				notificationDetails:SetVisible(false)
			end)
		end)
		contextActionService:UnbindCoreAction("NotificationsMenuCloseShortcut")
		VRHub:FireModuleClosed(t.ModuleName)
	end
	t.VisibilityStateChanged:Fire(p10)
end

VRHub.ModuleOpened.Event:connect(function(p10, _, _, _)
	-- upvalues: t (ref)
	if p10 ~= t.ModuleName then
		t:SetVisible(false)
	end
end)

return t