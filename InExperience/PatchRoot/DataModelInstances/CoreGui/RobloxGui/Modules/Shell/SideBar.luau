local shell = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local corePackagesService = game:GetService("CorePackages")
local globalSettingsModule = require(shell:FindFirstChild("GlobalSettings"))
local utilityModule = require(shell:FindFirstChild("Utility"))
local screenManagerModule = require(shell:FindFirstChild("ScreenManager"))
local soundManagerModule = require(shell:FindFirstChild("SoundManager"))
local analyticsModule = require(shell:FindFirstChild("Analytics"))
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create

return function()
	-- upvalues: create (ref), globalSettingsModule (ref), soundManagerModule (ref), analyticsModule (ref), screenManagerModule (ref), guiService (ref), utilityModule (ref), contextActionService (ref)
	local t = {}
	local t_1 = {}
	local var1 = nil
	local var2 = false
	local var3 = create("Frame")({
		Name = "ModalOverlay",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 4,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = globalSettingsModule.ModalBackgroundColor
	})
	local var4 = create("Frame")({
		Name = "SideBarContainer",
		BorderSizePixel = 0,
		ZIndex = 5,
		Size = UDim2.new(0.3, 0, 1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = globalSettingsModule.OverlayColor,
		Parent = var3
	})
	local var5 = create("TextButton")({
		Name = "DummySelectionImage",
		Size = UDim2.new(0, 0, 0, 0),
		Visible = false,
		soundManagerModule:CreateSound("MoveSelection")
	})
	local var6 = create("TextLabel")({
		Name = "Text",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ZIndex = 6,
		Text = "",
		TextWrapped = true,
		Size = UDim2.new(1, -165, 1, -156),
		Position = UDim2.new(0, 65, 0, 156),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextColor3 = globalSettingsModule.WhiteTextColor,
		Font = globalSettingsModule.RegularFont,
		FontSize = globalSettingsModule.DescriptionSize
	})
	
	local function recalcPositions()
		-- upvalues: t_1 (ref)
		for i = 1, #t_1 do
			t_1[i].Position = UDim2.new(0, 0, 0, (i - 1) * 75 + 156)
		end
	end
	
	local closedEvent = Instance.new("BindableEvent")
	closedEvent.Name = "ClosedEvent"
	t.Closed = closedEvent.Event
	
	function t.GetAnalyticsInfo(_)
		-- upvalues: analyticsModule (copy)
		return {
			[analyticsModule.WidgetNames("WidgetId")] = analyticsModule.WidgetNames("SideBarId")
		}
	end
	
	function t.AddItem(_, p1, p2)
		-- upvalues: create (copy), globalSettingsModule (copy), var5 (ref), var4 (ref), soundManagerModule (copy), screenManagerModule (copy), t (ref), closedEvent (ref), t_1 (ref), recalcPositions (ref)
		local var7 = create("TextButton")({
			Name = "SortButton",
			Size = UDim2.new(1, 0, 0, 75),
			BorderSizePixel = 0,
			BackgroundColor3 = globalSettingsModule.BlueButtonColor,
			BackgroundTransparency = 1,
			ZIndex = 6,
			Text = "",
			SelectionImageObject = var5,
			Parent = var4,
			soundManagerModule:CreateSound("MoveSelection")
		})
		local var8 = create("TextLabel")({
			Name = "SortName",
			BackgroundTransparency = 1,
			ZIndex = 7,
			Size = UDim2.new(1, -65, 1, 0),
			Position = UDim2.new(0, 65, 0, 0),
			Text = p1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = globalSettingsModule.WhiteTextColor,
			Font = globalSettingsModule.RegularFont,
			FontSize = globalSettingsModule.MediumFontSize,
			Parent = var7
		})
		var7.MouseButton1Click:connect(function()
			-- upvalues: soundManagerModule (copy), screenManagerModule (copy), t (copy), closedEvent (copy), p2 (ref)
			soundManagerModule:Play("ButtonPress")
			screenManagerModule:CloseCurrent(t)
			closedEvent:Fire()
			p2()
		end)
		var7.SelectionGained:connect(function()
			-- upvalues: var7 (ref), var8 (ref), globalSettingsModule (copy)
			var7.BackgroundTransparency = 0
			var8.TextColor3 = globalSettingsModule.TextSelectedColor
		end)
		var7.SelectionLost:connect(function()
			-- upvalues: var7 (ref), var8 (ref), globalSettingsModule (copy)
			var7.BackgroundTransparency = 1
			var8.TextColor3 = globalSettingsModule.WhiteTextColor
		end)
		t_1[#t_1 + 1] = var7
		recalcPositions()
	end
	
	function t.SetText(_, p1)
		-- upvalues: var6 (ref), var4 (ref)
		var6.Text = p1
		var6.Parent = var4
	end
	
	function t.ResetText(_)
		-- upvalues: var6 (ref)
		var6.Text = ""
		var6.Parent = nil
	end
	
	function t.RemoveAllItems(_)
		-- upvalues: t (ref), t_1 (ref)
		t:ResetText()
		
		for i, v in pairs(t_1) do
			v:Destroy()
			t_1[i] = nil
		end
	end
	
	function t.SetSelectedObject(_, p1, p2)
		-- upvalues: t_1 (ref), var1 (write), var2 (write), guiService (copy)
		if #t_1 > 0 then
			var1 = if p1 then t_1[p1] else t_1[1]
			
			if p2 == true and var1 and var2 then
				guiService.SelectedCoreObject = var1
				
				return
			end
		else
			var1 = nil
		end
	end
	
	function t.GetPriority(_)
		-- upvalues: globalSettingsModule (copy)
		return globalSettingsModule.OverlayPriority
	end
	
	function t.Show(p1)
		-- upvalues: var3 (ref), screenManagerModule (copy), utilityModule (copy), globalSettingsModule (copy), var4 (ref), soundManagerModule (copy)
		var3.Parent = screenManagerModule:GetScreenGuiByPriority(p1:GetPriority())
		local _ = utilityModule.PropertyTweener(var3, "BackgroundTransparency", 1, globalSettingsModule.ModalBackgroundTransparency, 0.25, utilityModule.EaseInOutQuad, true, nil)
		var4:TweenPositionInternal(UDim2.new(1 - var4.Size.X.Scale, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true, nil)
		soundManagerModule:Play("SideMenuSlideIn")
	end
	
	function t.Hide(_)
		-- upvalues: utilityModule (copy), var3 (ref), var4 (ref)
		local _ = utilityModule.PropertyTweener(var3, "BackgroundTransparency", 0.3, 1, 0.25, utilityModule.EaseInOutQuad, true, function()
			-- upvalues: var3 (copy)
			var3.Parent = nil
		end)
		var4:TweenPositionInternal(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.25, true)
	end
	
	function t.IsFocused(_)
		-- upvalues: var2 (write)
		return var2
	end
	
	function t.Focus(p1)
		-- upvalues: var2 (write), guiService (copy), var4 (ref), var1 (write), utilityModule (copy), contextActionService (copy), screenManagerModule (copy), t (ref), closedEvent (ref)
		var2 = true
		guiService:AddSelectionParent("SideBar", var4)
		
		if var1 then
			utilityModule.SetSelectedCoreObject(var1)
		else
			p1:SetSelectedObject(1)
			utilityModule.SetSelectedCoreObject(var1)
		end
		contextActionService:BindCoreAction("CloseSideBar", function(_, p2, _)
			-- upvalues: screenManagerModule (copy), t (copy), closedEvent (copy)
			if p2 == Enum.UserInputState.End then
				screenManagerModule:CloseCurrent(t)
				closedEvent:Fire()
			end
		end, false, Enum.KeyCode.ButtonB)
	end
	
	function t.RemoveFocus(_)
		-- upvalues: var2 (write), guiService (copy), contextActionService (copy), var1 (write)
		var2 = false
		guiService:RemoveSelectionGroup("SideBar")
		contextActionService:UnbindCoreAction("CloseSideBar")
		var1 = nil
	end
	
	return t
end