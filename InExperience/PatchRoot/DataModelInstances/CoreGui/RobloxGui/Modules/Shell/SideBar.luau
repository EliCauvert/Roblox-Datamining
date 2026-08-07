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

return function() --[[ line: 24 ]]
	-- upvalues: create (ref), globalSettingsModule (ref), soundManagerModule (ref), analyticsModule (ref), screenManagerModule (ref), guiService (ref), utilityModule (ref), contextActionService (ref)
	local t = {}
	local t_1 = {}
	local var11 = nil
	local var12 = false
	local var13 = create("Frame")({
		Name = "ModalOverlay",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 4,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = globalSettingsModule.ModalBackgroundColor
	})
	local var14 = create("Frame")({
		Name = "SideBarContainer",
		BorderSizePixel = 0,
		ZIndex = 5,
		Size = UDim2.new(0.3, 0, 1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = globalSettingsModule.OverlayColor,
		Parent = var13
	})
	local var15 = create("TextButton")({
		Name = "DummySelectionImage",
		Size = UDim2.new(0, 0, 0, 0),
		Visible = false,
		soundManagerModule:CreateSound("MoveSelection")
	})
	local var16 = create("TextLabel")({
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
	
	local function recalcPositions() --[[ line: 81 ]]
		-- upvalues: t_1 (ref)
		for i = 1, #t_1 do
			t_1[i].Position = UDim2.new(0, 0, 0, (i - 1) * 75 + 156)
		end
	end
	
	local closedEvent = Instance.new("BindableEvent")
	closedEvent.Name = "ClosedEvent"
	t.Closed = closedEvent.Event
	
	function t.GetAnalyticsInfo(_) --[[ line: 94 ]]
		-- upvalues: analyticsModule (copy)
		return {
			[analyticsModule.WidgetNames("WidgetId")] = analyticsModule.WidgetNames("SideBarId")
		}
	end
	
	function t.AddItem(_, p0, p1) --[[ line: 98 ]]
		-- upvalues: create (copy), globalSettingsModule (copy), var15 (ref), var14 (ref), soundManagerModule (copy), screenManagerModule (copy), t (ref), closedEvent (ref), t_1 (ref), recalcPositions (ref)
		local var19 = create("TextButton")({
			Name = "SortButton",
			Size = UDim2.new(1, 0, 0, 75),
			BorderSizePixel = 0,
			BackgroundColor3 = globalSettingsModule.BlueButtonColor,
			BackgroundTransparency = 1,
			ZIndex = 6,
			Text = "",
			SelectionImageObject = var15,
			Parent = var14,
			soundManagerModule:CreateSound("MoveSelection")
		})
		local var20 = create("TextLabel")({
			Name = "SortName",
			BackgroundTransparency = 1,
			ZIndex = 7,
			Size = UDim2.new(1, -65, 1, 0),
			Position = UDim2.new(0, 65, 0, 0),
			Text = p0,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = globalSettingsModule.WhiteTextColor,
			Font = globalSettingsModule.RegularFont,
			FontSize = globalSettingsModule.MediumFontSize,
			Parent = var19
		})
		var19.MouseButton1Click:connect(function() --[[ line: 128 ]]
			-- upvalues: soundManagerModule (copy), screenManagerModule (copy), t (copy), closedEvent (copy), p1 (ref)
			soundManagerModule:Play("ButtonPress")
			screenManagerModule:CloseCurrent(t)
			closedEvent:Fire()
			p1()
		end)
		var19.SelectionGained:connect(function() --[[ line: 134 ]]
			-- upvalues: var19 (ref), var20 (ref), globalSettingsModule (copy)
			var19.BackgroundTransparency = 0
			var20.TextColor3 = globalSettingsModule.TextSelectedColor
		end)
		var19.SelectionLost:connect(function() --[[ line: 138 ]]
			-- upvalues: var19 (ref), var20 (ref), globalSettingsModule (copy)
			var19.BackgroundTransparency = 1
			var20.TextColor3 = globalSettingsModule.WhiteTextColor
		end)
		t_1[#t_1 + 1] = var19
		recalcPositions()
	end
	
	function t.SetText(_, p2) --[[ line: 147 ]]
		-- upvalues: var16 (ref), var14 (ref)
		var16.Text = p2
		var16.Parent = var14
	end
	
	function t.ResetText(_) --[[ line: 152 ]]
		-- upvalues: var16 (ref)
		var16.Text = ""
		var16.Parent = nil
	end
	
	function t.RemoveAllItems(_) --[[ line: 157 ]]
		-- upvalues: t (ref), t_1 (ref)
		t:ResetText()
		
		for i, v in pairs(t_1) do
			v:Destroy()
			t_1[i] = nil
		end
	end
	
	function t.SetSelectedObject(_, p3, p4) --[[ line: 165 ]]
		-- upvalues: t_1 (ref), var11 (write), var12 (write), guiService (copy)
		if #t_1 > 0 then
			var11 = if p3 then t_1[p3] else t_1[1]
			
			if p4 == true and var11 and var12 then
				guiService.SelectedCoreObject = var11
				
				return
			end
		else
			var11 = nil
		end
	end
	
	function t.GetPriority(_) --[[ line: 177 ]]
		-- upvalues: globalSettingsModule (copy)
		return globalSettingsModule.OverlayPriority
	end
	
	function t.Show(p5) --[[ line: 181 ]]
		-- upvalues: var13 (ref), screenManagerModule (copy), utilityModule (copy), globalSettingsModule (copy), var14 (ref), soundManagerModule (copy)
		var13.Parent = screenManagerModule:GetScreenGuiByPriority(p5:GetPriority())
		local _ = utilityModule.PropertyTweener(var13, "BackgroundTransparency", 1, globalSettingsModule.ModalBackgroundTransparency, 0.25, utilityModule.EaseInOutQuad, true, nil)
		var14:TweenPositionInternal(UDim2.new(1 - var14.Size.X.Scale, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true, nil)
		soundManagerModule:Play("SideMenuSlideIn")
	end
	
	function t.Hide(_) --[[ line: 190 ]]
		-- upvalues: utilityModule (copy), var13 (ref), var14 (ref)
		local _ = utilityModule.PropertyTweener(var13, "BackgroundTransparency", 0.3, 1, 0.25, utilityModule.EaseInOutQuad, true, function() --[[ line: 192 ]]
			-- upvalues: var13 (copy)
			var13.Parent = nil
		end)
		var14:TweenPositionInternal(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.25, true)
	end
	
	function t.IsFocused(_) --[[ line: 198 ]]
		-- upvalues: var12 (write)
		return var12
	end
	
	function t.Focus(p6) --[[ line: 202 ]]
		-- upvalues: var12 (write), guiService (copy), var14 (ref), var11 (write), utilityModule (copy), contextActionService (copy), screenManagerModule (copy), t (ref), closedEvent (ref)
		var12 = true
		guiService:AddSelectionParent("SideBar", var14)
		
		if var11 then
			utilityModule.SetSelectedCoreObject(var11)
		else
			p6:SetSelectedObject(1)
			utilityModule.SetSelectedCoreObject(var11)
		end
		contextActionService:BindCoreAction("CloseSideBar", function(_, p7, _) --[[ line: 214 ]]
			-- upvalues: screenManagerModule (copy), t (copy), closedEvent (copy)
			if p7 == Enum.UserInputState.End then
				screenManagerModule:CloseCurrent(t)
				closedEvent:Fire()
			end
		end, false, Enum.KeyCode.ButtonB)
	end
	
	function t.RemoveFocus(_) --[[ line: 223 ]]
		-- upvalues: var12 (write), guiService (copy), contextActionService (copy), var11 (write)
		var12 = false
		guiService:RemoveSelectionGroup("SideBar")
		contextActionService:UnbindCoreAction("CloseSideBar")
		var11 = nil
	end
	
	return t
end