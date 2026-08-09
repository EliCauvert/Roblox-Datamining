local shell = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local corePackagesService = game:GetService("CorePackages")
local deprecateOldGuiObjectPropertiesEngineFeature = game:GetEngineFeature("DeprecateOldGuiObjectProperties")
local globalSettingsModule = require(shell:FindFirstChild("GlobalSettings"))
local utilityModule = require(shell:FindFirstChild("Utility"))
local screenManagerModule = require(shell:FindFirstChild("ScreenManager"))
local soundManagerModule = require(shell:FindFirstChild("SoundManager"))
local analyticsModule = require(shell:FindFirstChild("Analytics"))
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create

return function() --[[ line: 26 ]]
	-- upvalues: create (ref), globalSettingsModule (ref), soundManagerModule (ref), analyticsModule (ref), screenManagerModule (ref), guiService (ref), utilityModule (ref), deprecateOldGuiObjectPropertiesEngineFeature (ref), contextActionService (ref)
	local t = {}
	local t_1 = {}
	local var12 = nil
	local var13 = false
	local var14 = create("Frame")({
		Name = "ModalOverlay",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 4,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = globalSettingsModule.ModalBackgroundColor
	})
	local var15 = create("Frame")({
		Name = "SideBarContainer",
		BorderSizePixel = 0,
		ZIndex = 5,
		Size = UDim2.new(0.3, 0, 1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = globalSettingsModule.OverlayColor,
		Parent = var14
	})
	local var16 = create("TextButton")({
		Name = "DummySelectionImage",
		Size = UDim2.new(0, 0, 0, 0),
		Visible = false,
		soundManagerModule:CreateSound("MoveSelection")
	})
	local var17 = create("TextLabel")({
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
	
	local function recalcPositions() --[[ line: 83 ]]
		-- upvalues: t_1 (ref)
		for i = 1, #t_1 do
			t_1[i].Position = UDim2.new(0, 0, 0, (i - 1) * 75 + 156)
		end
	end
	
	local closedEvent = Instance.new("BindableEvent")
	closedEvent.Name = "ClosedEvent"
	t.Closed = closedEvent.Event
	
	function t.GetAnalyticsInfo(_) --[[ line: 96 ]]
		-- upvalues: analyticsModule (copy)
		return {
			[analyticsModule.WidgetNames("WidgetId")] = analyticsModule.WidgetNames("SideBarId")
		}
	end
	
	function t.AddItem(_, p0, p1) --[[ line: 100 ]]
		-- upvalues: create (copy), globalSettingsModule (copy), var16 (ref), var15 (ref), soundManagerModule (copy), screenManagerModule (copy), t (ref), closedEvent (ref), t_1 (ref), recalcPositions (ref)
		local var20 = create("TextButton")({
			Name = "SortButton",
			Size = UDim2.new(1, 0, 0, 75),
			BorderSizePixel = 0,
			BackgroundColor3 = globalSettingsModule.BlueButtonColor,
			BackgroundTransparency = 1,
			ZIndex = 6,
			Text = "",
			SelectionImageObject = var16,
			Parent = var15,
			soundManagerModule:CreateSound("MoveSelection")
		})
		local var21 = create("TextLabel")({
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
			Parent = var20
		})
		var20.MouseButton1Click:connect(function() --[[ line: 130 ]]
			-- upvalues: soundManagerModule (copy), screenManagerModule (copy), t (copy), closedEvent (copy), p1 (ref)
			soundManagerModule:Play("ButtonPress")
			screenManagerModule:CloseCurrent(t)
			closedEvent:Fire()
			p1()
		end)
		var20.SelectionGained:connect(function() --[[ line: 136 ]]
			-- upvalues: var20 (ref), var21 (ref), globalSettingsModule (copy)
			var20.BackgroundTransparency = 0
			var21.TextColor3 = globalSettingsModule.TextSelectedColor
		end)
		var20.SelectionLost:connect(function() --[[ line: 140 ]]
			-- upvalues: var20 (ref), var21 (ref), globalSettingsModule (copy)
			var20.BackgroundTransparency = 1
			var21.TextColor3 = globalSettingsModule.WhiteTextColor
		end)
		t_1[#t_1 + 1] = var20
		recalcPositions()
	end
	
	function t.SetText(_, p2) --[[ line: 149 ]]
		-- upvalues: var17 (ref), var15 (ref)
		var17.Text = p2
		var17.Parent = var15
	end
	
	function t.ResetText(_) --[[ line: 154 ]]
		-- upvalues: var17 (ref)
		var17.Text = ""
		var17.Parent = nil
	end
	
	function t.RemoveAllItems(_) --[[ line: 159 ]]
		-- upvalues: t (ref), t_1 (ref)
		t:ResetText()
		
		for i, v in pairs(t_1) do
			v:Destroy()
			t_1[i] = nil
		end
	end
	
	function t.SetSelectedObject(_, p3, p4) --[[ line: 167 ]]
		-- upvalues: t_1 (ref), var12 (write), var13 (write), guiService (copy)
		if #t_1 > 0 then
			var12 = if p3 then t_1[p3] else t_1[1]
			
			if p4 == true and var12 and var13 then
				guiService.SelectedCoreObject = var12
				
				return
			end
		else
			var12 = nil
		end
	end
	
	function t.GetPriority(_) --[[ line: 179 ]]
		-- upvalues: globalSettingsModule (copy)
		return globalSettingsModule.OverlayPriority
	end
	
	function t.Show(p5) --[[ line: 183 ]]
		-- upvalues: var14 (ref), screenManagerModule (copy), utilityModule (copy), globalSettingsModule (copy), deprecateOldGuiObjectPropertiesEngineFeature (copy), var15 (ref), soundManagerModule (copy)
		var14.Parent = screenManagerModule:GetScreenGuiByPriority(p5:GetPriority())
		local _ = utilityModule.PropertyTweener(var14, "BackgroundTransparency", 1, globalSettingsModule.ModalBackgroundTransparency, 0.25, utilityModule.EaseInOutQuad, true, nil)
		
		if deprecateOldGuiObjectPropertiesEngineFeature then
			var15:TweenPositionInternal(UDim2.new(1 - var15.Size.X.Scale, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true, nil)
		else
			var15:TweenPosition(UDim2.new(1 - var15.Size.X.Scale, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true)
		end
		soundManagerModule:Play("SideMenuSlideIn")
	end
	
	function t.Hide(_) --[[ line: 197 ]]
		-- upvalues: utilityModule (copy), var14 (ref), deprecateOldGuiObjectPropertiesEngineFeature (copy), var15 (ref)
		local _ = utilityModule.PropertyTweener(var14, "BackgroundTransparency", 0.3, 1, 0.25, utilityModule.EaseInOutQuad, true, function() --[[ line: 199 ]]
			-- upvalues: var14 (copy)
			var14.Parent = nil
		end)
		
		if deprecateOldGuiObjectPropertiesEngineFeature then
			var15:TweenPositionInternal(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.25, true)
			
			return
		end
		var15:TweenPosition(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.25, true)
	end
	
	function t.IsFocused(_) --[[ line: 209 ]]
		-- upvalues: var13 (write)
		return var13
	end
	
	function t.Focus(p6) --[[ line: 213 ]]
		-- upvalues: var13 (write), guiService (copy), var15 (ref), var12 (write), utilityModule (copy), contextActionService (copy), screenManagerModule (copy), t (ref), closedEvent (ref)
		var13 = true
		guiService:AddSelectionParent("SideBar", var15)
		
		if var12 then
			utilityModule.SetSelectedCoreObject(var12)
		else
			p6:SetSelectedObject(1)
			utilityModule.SetSelectedCoreObject(var12)
		end
		contextActionService:BindCoreAction("CloseSideBar", function(_, p7, _) --[[ line: 225 ]]
			-- upvalues: screenManagerModule (copy), t (copy), closedEvent (copy)
			if p7 == Enum.UserInputState.End then
				screenManagerModule:CloseCurrent(t)
				closedEvent:Fire()
			end
		end, false, Enum.KeyCode.ButtonB)
	end
	
	function t.RemoveFocus(_) --[[ line: 234 ]]
		-- upvalues: var13 (write), guiService (copy), contextActionService (copy), var12 (write)
		var13 = false
		guiService:RemoveSelectionGroup("SideBar")
		contextActionService:UnbindCoreAction("CloseSideBar")
		var12 = nil
	end
	
	return t
end