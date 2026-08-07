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
local var8 = create("ImageLabel")({ BackgroundTransparency = 1, Image = "" })
local color3_4 = Color3.new(1, 1, 1)
local t = {
	ModuleName = "Notifications",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = true,
	UnreadCountChanged = function(...) --[[ line: 79 ]] end,
	SetVisible = nil
}
VRHub:RegisterModule(t)
local notifications = panel3D.Get("Notifications")
local _ = nil
local notificationDetails = panel3D.Get("NotificationDetails")
local _ = nil

local function _() --[[ line: 88 | named "IsDeveloperGroupEnabled" ]]
	return false
end

local t_1 = {}
local t_2 = {}
local t_3 = { __index = t_1 }

function t_1.new(p0, p1, p2) --[[ line: 96 ]]
	-- upvalues: t_2 (ref), create (ref), color3 (ref), color3_4 (ref), color3_2 (ref), t_3 (ref)
	local t = {}
	table.insert(t_2, t)
	t.zeroCF = p0.localCF
	t.zOffset = 0
	t.isPopping = false
	t.isAnimating = false
	t.tweener = nil
	t.panel = p0
	t.SetPopOut = nil
	
	function t.panel.OnMouseEnter() --[[ line: 106 ]]
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
		Parent = p1,
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
		Text = p2,
		TextColor3 = color3_4,
		Font = Enum.Font.SourceSans,
		FontSize = Enum.FontSize.Size36
	})
	t.content = create("ImageLabel")({
		Name = "ContentFrame",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 0.5,
		Parent = p1,
		Position = UDim2.new(0, -1, 0, 74),
		Size = UDim2.new(1, 2, 1, -76),
		ImageColor3 = color3_2,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10)
	})
	
	return setmetatable(t, t_3)
end

function t_1.SetTitle(value, p3) --[[ line: 163 ]]
	value.titleText.Text = p3
end

function t_1.AddCloseButton(p4, p5) --[[ line: 167 ]]
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

function t_1.TweenZOffsetTo(value, p6, p7, p8, p9) --[[ line: 189 ]]
	-- upvalues: utilityModule (ref)
	if value.tweener and not value.tweener:IsFinished() then
		value.tweener:Cancel()
	end
	value.tweener = utilityModule:TweenProperty(value, "zOffset", value.zOffset, p6, p7, p8, p9)
end

function t_1.AnimateOut(p10, p11) --[[ line: 196 ]]
	-- upvalues: utilityModule (ref)
	p10.isAnimating = true
	p10:TweenZOffsetTo(-100, 0.25, utilityModule:GetEaseInOutQuad(), function() --[[ line: 198 ]]
		-- upvalues: p11 (ref), p10 (ref)
		if p11 then
			p11()
		end
		p10.isAnimating = false
	end)
end

function t_1.AnimateIn(p12, p13) --[[ line: 204 ]]
	-- upvalues: utilityModule (ref)
	p12.zOffset = -100
	p12:OnUpdate(0)
	p12.isAnimating = true
	p12:TweenZOffsetTo(0, 0.25, utilityModule:GetEaseInOutQuad(), function() --[[ line: 208 ]]
		-- upvalues: p13 (ref), p12 (ref)
		if p13 then
			p13()
		end
		p12.isAnimating = false
	end)
end

function t_1.SetPopOut(value, p14) --[[ line: 214 ]]
	-- upvalues: utilityModule (ref)
	if value.isAnimating then return end
	if p14 then
		value.isPopping = true
		value:TweenZOffsetTo(0.25, 0.25, utilityModule:GetEaseInOutQuad(), function() --[[ line: 221 ]]
			-- upvalues: value (ref)
			value.isPopping = false
		end)
		
		return
	end
	value.isPopping = true
	value:TweenZOffsetTo(0, 0.25, utilityModule:GetEaseInOutQuad(), function() --[[ line: 226 ]]
		-- upvalues: value (ref)
		value.isPopping = false
	end)
end

function t_1.OnUpdate(p15, _) --[[ line: 232 ]]
	-- upvalues: color3 (ref), color3_1 (ref)
	p15.panel.localCF = p15.zeroCF * CFrame.new(0, 0, p15.zOffset)
	p15.panel.needsLocalPositionUpdate = p15.isAnimating or p15.isPopping
	
	if p15.isPopping then
		p15.titlebar.ImageColor3 = color3:lerp(color3_1, math.max(0, math.min(1, p15.zOffset / 0.25)))
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
	SelectionImageObject = var8
}), "Notifications")
notifications_1:AddCloseButton(function() --[[ line: 263 ]]
	-- upvalues: t (ref)
	t:SetVisible(false)
end)

function notifications.OnUpdate(_, p16) --[[ line: 266 ]]
	-- upvalues: notifications_1 (write)
	notifications_1:OnUpdate(p16)
end

notificationDetails:SetType(panel3D.Type.Standard)
notificationDetails:SetVisible(false)
notificationDetails:SetCanFade(false)
notificationDetails:ResizeStuds(3.415999986, 3.5, 150)
local var17 = t_1.new(notificationDetails, create("TextButton")({
	Name = "NotificationsDetailFrame",
	BackgroundTransparency = 1,
	Text = "",
	Selectable = true,
	Parent = notificationDetails:GetGUI(),
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(1, 0, 1, 0),
	SelectionImageObject = var8
}), "Friend Requests")

function notificationDetails.OnUpdate(_, p17) --[[ line: 291 ]]
	-- upvalues: var17 (write)
	var17:OnUpdate(p17)
end

local t_4 = {}
local t_5 = {}

local function groupSort(p18, p19) --[[ line: 298 ]]
	return p18.order < p19.order
end

local var21 = nil

local function layoutNotificationsGroups() --[[ line: 303 ]]
	-- upvalues: t_5 (ref), notifications (ref), var21 (write)
	local var33 = 20
	
	for i, v in ipairs(t_5) do
		if #v.notifications > 0 then
			local var34 = (math.min(3, #v.notifications) - 1) * 20 + 80
			v.frame.Position = UDim2.new(0.075, 0, 0, var33)
			v.frame.Size = UDim2.new(0.85, -40, 0, var34)
			var33 = var33 + var34 + 20
			
			if v.notificationsDirty then
				v.notificationsDirty = false
				local var35 = 0
				local var36 = 0
				local notificationsCount = #v.notifications
				
				if notificationsCount > 0 then
					local var39
					local maxValue = math.max(1, notificationsCount - 3 + 1)
					
					for i_1 = 1, notificationsCount do
						var39 = v.notifications[i_1]
						
						if maxValue <= i_1 then
							var39.frame.Visible = true
							var39.frame.Position = UDim2.new(0, var35, 0, var35)
							var35 += 20
							local _ = notifications:SetSubpanelDepth(var39.frame, var36)
							var36 += 0.25
						else
							var39.frame.Visible = false
						end
					end
					if var21 == v then
						local maxValue_1 = math.max(1, notificationsCount - 2 + 1)
						local var41 = 0
						
						for var39 = 1, notificationsCount do
							local var42 = v.notifications[var39]
							
							if maxValue_1 <= var39 then
								var42.detailsFrame.Visible = true
								var42.detailsFrame.Position = UDim2.new(0, 20, var41, 20)
								var42.detailsFrame.Size = UDim2.new(1, -40, 0.5, -40)
								var41 += 0.5
							else
								var42.detailsFrame.Visible = false
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

function t_6.new(p20, p21, p22) --[[ line: 362 ]]
	-- upvalues: t_7 (ref), create (ref), notifications_1 (write), t_4 (ref), t_5 (ref)
	local tbl = setmetatable({}, t_7)
	tbl.key = p20
	tbl.title = p21
	tbl.order = p22
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
	t_4[p20] = tbl
	table.insert(t_5, tbl)
	
	return tbl
end

function t_6.Deactivate(p23) --[[ line: 389 ]]
	-- upvalues: notificationDetails (ref)
	p23.detailsFrame.Parent = nil
	
	for i, v in pairs(p23.detailsFrame:GetChildren()) do
		notificationDetails:RemoveSubpanel(v)
	end
end

function t_6.SwitchTo(p24) --[[ line: 396 ]]
	-- upvalues: var17 (write), t_4 (ref), var21 (write)
	var17:SetTitle(p24.title)
	
	for i, v in pairs(t_4) do
		if v ~= p24 then
			v:Deactivate()
		end
	end
	p24.detailsFrame.Parent = var17.content
	var21 = p24
	p24.notificationsDirty = true
end

function t_6.BringNotificationToFront(p25, p26) --[[ line: 409 ]]
	-- upvalues: var21 (write), layoutNotificationsGroups (ref)
	if var21 ~= p25 then
		p25:SwitchTo()
	end
	if #p25.notifications ~= 0 and p26 == p25.notifications[#p25.notifications] then
		layoutNotificationsGroups()
		
		return
	end
	for i, v in ipairs(p25.notifications) do
		if v == p26 then
			table.remove(p25.notifications, i)
			break
		end
	end
	table.insert(p25.notifications, p26)
	p25.notificationsDirty = true
	layoutNotificationsGroups()
end

function t_6.RemoveNotification(p27, p28) --[[ line: 432 ]]
	-- upvalues: notifications (ref), notificationDetails (ref), layoutNotificationsGroups (ref)
	for i, v in ipairs(p27.notifications) do
		if v == p28 then
			table.remove(p27.notifications, i)
			notifications:RemoveSubpanel(p28.frame)
			notificationDetails:RemoveSubpanel(p28.detailsFrame)
			p28.detailsFrame:Destroy()
			p28.frame:Destroy()
			p27.notificationsDirty = true
			layoutNotificationsGroups()
			
			return
		end
	end
end

function t_6.GetTopNotification(p29) --[[ line: 448 ]]
	local notificationsCount = #p29.notifications
	
	return if notificationsCount <= 0 then nil else p29.notifications[notificationsCount]
end

t_6.new("Friends", "Friends", 1)
t_6.new("BadgeAwards", "Badges", 2)
t_6.new("PlayerPoints", "Points", 3)
table.sort(t_5, groupSort)

local function doCallback(p30, ...) --[[ line: 465 ]]
	if not p30 then return end
	if type(p30) == "function" then
		p30(...)
		
		return
	elseif p30:IsA("BindableEvent") then
		p30:Fire(...)
		
		return
	elseif p30:IsA("BindableFunction") then
		p30:Invoke(...)
		
		return
	end
end

local t_8 = {}
local t_9 = { __index = t_8 }

function t_8.new(p31, p32) --[[ line: 487 ]]
	-- upvalues: t_9 (ref), create (ref), var8 (ref), color3_3 (ref), color3_4 (ref), notificationDetails (ref), doCallback (ref), layoutNotificationsGroups (ref)
	local tbl = setmetatable({}, t_9)
	tbl.group = p31
	tbl.frame = create("ImageButton")({
		BackgroundTransparency = 1,
		Parent = p31.frame,
		Size = UDim2.new(1, 0, 0, 80),
		SelectionImageObject = var8
	})
	tbl.frame.MouseButton1Click:connect(function() --[[ line: 498 ]]
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
		ImageColor3 = p32.imgBackgroundColor or Color3.new(1, 1, 1)
	})
	tbl.image = create("ImageLabel")({
		BackgroundTransparency = 1,
		Parent = tbl.imageBackground,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Image = p32.Image
	})
	tbl.text = create("TextLabel")({
		BackgroundTransparency = 1,
		TextWrapped = true,
		Parent = tbl.frame,
		Position = UDim2.new(0, 80, 0, 0),
		Size = UDim2.new(1, -80, 1, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
		Text = if p32.Title and p32.Text then ("%s\n%s"):format(p32.Title, p32.Text) else p32.Text,
		Font = Enum.Font.SourceSans,
		FontSize = Enum.FontSize.Size18,
		TextColor3 = color3_4
	})
	tbl.detailsFrame = create("Frame")({ BackgroundTransparency = 1, Parent = p31.detailsFrame })
	tbl.detailsFrame.MouseEnter:connect(function() --[[ line: 558 ]]
		-- upvalues: notificationDetails (copy), tbl (ref)
		notificationDetails:SetSubpanelDepth(tbl.detailsFrame, 0.25)
	end)
	tbl.detailsFrame.MouseLeave:connect(function() --[[ line: 561 ]]
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
		ImageColor3 = p32.imgBackgroundColor or Color3.new(1, 1, 1)
	})
	tbl.detailsIcon = create("ImageLabel")({
		BackgroundTransparency = 1,
		Parent = tbl.detailsIconBackground,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Image = p32.Image
	})
	tbl.detailsText = create("TextLabel")({
		BackgroundTransparency = 1,
		TextWrapped = true,
		Parent = tbl.detailsFrame,
		Position = UDim2.new(0, 110, 0, 10),
		Size = UDim2.new(1, -120, 0, 90),
		Text = p32.DetailText or p32.Title,
		TextColor3 = color3_4,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size36
	})
	
	local function createButton(p33, p34, p35) --[[ line: 614 ]]
		-- upvalues: create (copy), tbl (ref), var8 (copy), color3_4 (copy)
		local var53 = create("ImageButton")({
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
			Parent = tbl.detailsFrame,
			Position = UDim2.new(p33, 0, 0.55, 0),
			Size = UDim2.new(p34, 0, 0.29, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 6, 46, 44),
			SelectionImageObject = var8
		})
		local var54 = create("TextLabel")({
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, -6),
			Text = p35,
			TextColor3 = color3_4,
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size24
		})
		var54.Parent = var53
		var53.SelectionGained:connect(function() --[[ line: 640 ]]
			-- upvalues: var53 (ref)
			var53.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
		end)
		var53.SelectionLost:connect(function() --[[ line: 643 ]]
			-- upvalues: var53 (ref)
			var53.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
		end)
		
		return var53, var54
	end
	
	if p32.Button1Text and p32.Button2Text then
		local var49, var50 = createButton(0.07, 0.415, p32.Button1Text)
		tbl.detailsButton1 = var49
		tbl.detailsButton1Text = var50
		local var51, var52 = createButton(0.511, 0.415, p32.Button2Text)
		tbl.detailsButton2 = var51
		tbl.detailsButton2Text = var52
		tbl.detailsButton1.MouseButton1Click:connect(function() --[[ line: 653 ]]
			-- upvalues: doCallback (copy), p32 (ref), tbl (ref)
			doCallback(p32.Callback, p32.Button1Text)
			tbl:Dismiss()
		end)
		tbl.detailsButton2.MouseButton1Click:connect(function() --[[ line: 657 ]]
			-- upvalues: doCallback (copy), p32 (ref), tbl (ref)
			doCallback(p32.Callback, p32.Button2Text)
			tbl:Dismiss()
		end)
	elseif not p32.button2Text then
		local var47, var48 = createButton(0.07, 0.86, p32.Button1Text or "Dismiss")
		tbl.detailsButton1 = var47
		tbl.detailsButton1Text = var48
		tbl.detailsButton1.MouseButton1Click:connect(function() --[[ line: 664 ]]
			-- upvalues: doCallback (copy), p32 (ref), tbl (ref)
			doCallback(p32.Callback, p32.Button1Text)
			tbl:Dismiss()
		end)
	end
	table.insert(p31.notifications, tbl)
	p31.notificationsDirty = true
	layoutNotificationsGroups()
	
	return tbl
end

function t_8.OnClicked(p36) --[[ line: 677 ]]
	-- upvalues: layoutNotificationsGroups (ref)
	p36.group:SwitchTo()
	layoutNotificationsGroups()
end

function t_8.Dismiss(p37) --[[ line: 685 ]]
	p37.group:RemoveNotification(p37)
end

local t_10 = {}
local var29 = false
local var30 = 0
robloxGui:WaitForChild("SendNotificationInfo").Event:connect(function(p38) --[[ line: 697 ]]
	-- upvalues: t_4 (ref), t_8 (ref), var29 (write), var30 (write), t (ref)
	local groupName = p38.GroupName and t_4[p38.GroupName]
	
	if not groupName then return end
	t_8.new(groupName, p38)
	
	if not var29 then
		var30 += 1
		t.UnreadCountChanged(var30)
	end
end)

local function onMenuCloseShortcut(_, p39, _) --[[ line: 716 ]]
	-- upvalues: t (ref)
	if p39 == Enum.UserInputState.Begin then
		t:SetVisible(false)
	end
end

t.VisibilityStateChanged = create("BindableEvent")({ Name = "VisibilityStateChanged" })

function t.GetNumberOfPendingNotifications(_) --[[ line: 726 ]]
	-- upvalues: t_10 (ref)
	return #t_10
end

function t.IsVisible(_) --[[ line: 730 ]]
	-- upvalues: var29 (write)
	return var29
end

function t.SetVisible(_, p40) --[[ line: 734 ]]
	-- upvalues: var29 (write), panel3D (ref), var30 (write), t (ref), notifications (ref), notifications_1 (write), notificationDetails (ref), var17 (write), contextActionService (ref), onMenuCloseShortcut (ref), VRHub (ref)
	if var29 == p40 then return end
	var29 = p40
	panel3D.Get("Topbar3D"):SetCanFade(not p40)
	
	if p40 then
		var30 = 0
		t.UnreadCountChanged(var30)
		notifications.localCF = CFrame.new(-1.707999993, 0, 0)
		notifications_1.zeroCF = notifications.localCF
		notifications_1:AnimateIn(nil)
		notificationDetails.localCF = CFrame.new(1.138666662, 0, 0)
		var17.zeroCF = notificationDetails.localCF
		var17:AnimateIn(nil)
		notifications:SetVisible(true)
		notificationDetails:SetVisible(true)
		contextActionService:BindCoreAction("NotificationsMenuCloseShortcut", onMenuCloseShortcut, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
		VRHub:FireModuleOpened(t.ModuleName)
	else
		spawn(function() --[[ line: 766 ]]
			-- upvalues: notifications_1 (copy), notifications (copy), var17 (copy), notificationDetails (copy)
			notifications_1:AnimateOut(function() --[[ line: 767 ]]
				-- upvalues: notifications (copy)
				notifications:SetVisible(false)
			end)
			var17:AnimateOut(function() --[[ line: 770 ]]
				-- upvalues: notificationDetails (copy)
				notificationDetails:SetVisible(false)
			end)
		end)
		contextActionService:UnbindCoreAction("NotificationsMenuCloseShortcut")
		VRHub:FireModuleClosed(t.ModuleName)
	end
	t.VisibilityStateChanged:Fire(p40)
end

VRHub.ModuleOpened.Event:connect(function(p41, _, _, _) --[[ line: 788 ]]
	-- upvalues: t (ref)
	if p41 ~= t.ModuleName then
		t:SetVisible(false)
	end
end)

return t