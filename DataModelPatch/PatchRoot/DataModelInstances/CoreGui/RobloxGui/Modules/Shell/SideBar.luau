local Shell = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local GlobalSettingsModule = require(Shell:FindFirstChild("GlobalSettings"))
local UtilityModule = require(Shell:FindFirstChild("Utility"))
local ScreenManagerModule = require(Shell:FindFirstChild("ScreenManager"))
local SoundManagerModule = require(Shell:FindFirstChild("SoundManager"))
local AnalyticsModule = require(Shell:FindFirstChild("Analytics"))
local CreateFunction = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create

return function()
	-- upvalues: CreateFunction (copy), GlobalSettingsModule (copy), SoundManagerModule (copy), AnalyticsModule (copy), ScreenManagerModule (copy), GuiService (copy), UtilityModule (copy), ContextActionService (copy)
	local Buttons = {}
	local SelectedCoreObject = nil
	local Flag = false
	local Parent = CreateFunction("Frame")({
		Name = "ModalOverlay",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 4,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = GlobalSettingsModule.ModalBackgroundColor
	})
	local Parent1 = CreateFunction("Frame")({
		Name = "SideBarContainer",
		BorderSizePixel = 0,
		ZIndex = 5,
		Size = UDim2.new(0.3, 0, 1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = GlobalSettingsModule.OverlayColor,
		Parent = Parent
	})
	local SelectionImageObject = CreateFunction("TextButton")({
		Name = "DummySelectionImage",
		Size = UDim2.new(0, 0, 0, 0),
		Visible = false,
		SoundManagerModule:CreateSound("MoveSelection")
	})
	local v1 = CreateFunction("TextLabel")({
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
		TextColor3 = GlobalSettingsModule.WhiteTextColor,
		Font = GlobalSettingsModule.RegularFont,
		FontSize = GlobalSettingsModule.DescriptionSize
	})
	
	local function recalcPositions()
		-- upvalues: Buttons (copy)
		for i = 1, #Buttons do
			Buttons[i].Position = UDim2.new(0, 0, 0, (i - 1) * 75 + 156)
		end
	end
	
	local ClosedEvent = Instance.new("BindableEvent")
	ClosedEvent.Name = "ClosedEvent"
	local config = {
		Closed = ClosedEvent.Event,
		GetAnalyticsInfo = function(_)
			-- upvalues: AnalyticsModule (upval)
			return {
				[AnalyticsModule.WidgetNames("WidgetId")] = AnalyticsModule.WidgetNames("SideBarId")
			}
		end
	}
	
	function config:AddItem(Text, Callback)
		-- upvalues: CreateFunction (upval), GlobalSettingsModule (upval), SelectionImageObject (copy), Parent1 (copy), SoundManagerModule (upval), ScreenManagerModule (upval), config (copy), ClosedEvent (copy), Buttons (copy), recalcPositions (copy)
		local Button = CreateFunction("TextButton")({
			Name = "SortButton",
			Size = UDim2.new(1, 0, 0, 75),
			BorderSizePixel = 0,
			BackgroundColor3 = GlobalSettingsModule.BlueButtonColor,
			BackgroundTransparency = 1,
			ZIndex = 6,
			Text = "",
			SelectionImageObject = SelectionImageObject,
			Parent = Parent1,
			SoundManagerModule:CreateSound("MoveSelection")
		})
		local Label = CreateFunction("TextLabel")({
			Name = "SortName",
			BackgroundTransparency = 1,
			ZIndex = 7,
			Size = UDim2.new(1, -65, 1, 0),
			Position = UDim2.new(0, 65, 0, 0),
			Text = Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = GlobalSettingsModule.WhiteTextColor,
			Font = GlobalSettingsModule.RegularFont,
			FontSize = GlobalSettingsModule.MediumFontSize,
			Parent = Button
		})
		Button.MouseButton1Click:connect(function()
			-- upvalues: SoundManagerModule (upval), ScreenManagerModule (upval), config (upval), ClosedEvent (upval), Callback (copy)
			SoundManagerModule:Play("ButtonPress")
			ScreenManagerModule:CloseCurrent(config)
			ClosedEvent:Fire()
			Callback()
		end)
		Button.SelectionGained:connect(function()
			-- upvalues: Button (copy), Label (copy), GlobalSettingsModule (upval)
			Button.BackgroundTransparency = 0
			Label.TextColor3 = GlobalSettingsModule.TextSelectedColor
		end)
		Button.SelectionLost:connect(function()
			-- upvalues: Button (copy), Label (copy), GlobalSettingsModule (upval)
			Button.BackgroundTransparency = 1
			Label.TextColor3 = GlobalSettingsModule.WhiteTextColor
		end)
		Buttons[#Buttons + 1] = Button
		recalcPositions()
	end
	
	function config:SetText(Text)
		-- upvalues: v1 (copy), Parent1 (copy)
		v1.Text = Text
		v1.Parent = Parent1
	end
	
	function config:ResetText()
		-- upvalues: v1 (copy)
		v1.Text = ""
		v1.Parent = nil
	end
	
	function config:RemoveAllItems()
		-- upvalues: config (copy), Buttons (copy)
		config:ResetText()
		
		for i, button in pairs(Buttons) do
			button:Destroy()
			Buttons[i] = nil
		end
	end
	
	function config:SetSelectedObject(p1, Enabled)
		-- upvalues: Buttons (copy), SelectedCoreObject (ref), Flag (ref), GuiService (upval)
		if #Buttons > 0 then
			SelectedCoreObject = p1 and Buttons[p1] or Buttons[1]
			
			if Enabled == true and SelectedCoreObject and Flag then
				GuiService.SelectedCoreObject = SelectedCoreObject
				
				return
			end
		else
			SelectedCoreObject = nil
		end
	end
	
	function config:GetPriority()
		-- upvalues: GlobalSettingsModule (upval)
		return GlobalSettingsModule.OverlayPriority
	end
	
	function config.Show(p1)
		-- upvalues: Parent (copy), ScreenManagerModule (upval), UtilityModule (upval), GlobalSettingsModule (upval), Parent1 (copy), SoundManagerModule (upval)
		Parent.Parent = ScreenManagerModule:GetScreenGuiByPriority(p1:GetPriority())
		local _ = UtilityModule.PropertyTweener(Parent, "BackgroundTransparency", 1, GlobalSettingsModule.ModalBackgroundTransparency, 0.25, UtilityModule.EaseInOutQuad, true, nil)
		Parent1:TweenPositionInternal(UDim2.new(1 - Parent1.Size.X.Scale, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true, nil)
		SoundManagerModule:Play("SideMenuSlideIn")
	end
	
	function config:Hide()
		-- upvalues: UtilityModule (upval), Parent (copy), Parent1 (copy)
		local _ = UtilityModule.PropertyTweener(Parent, "BackgroundTransparency", 0.3, 1, 0.25, UtilityModule.EaseInOutQuad, true, function()
			-- upvalues: Parent (upval)
			Parent.Parent = nil
		end)
		Parent1:TweenPositionInternal(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.25, true)
	end
	
	function config:IsFocused()
		-- upvalues: Flag (ref)
		return Flag
	end
	
	function config.Focus(p1)
		-- upvalues: Flag (ref), GuiService (upval), Parent1 (copy), SelectedCoreObject (ref), UtilityModule (upval), ContextActionService (upval), ScreenManagerModule (upval), config (copy), ClosedEvent (copy)
		Flag = true
		GuiService:AddSelectionParent("SideBar", Parent1)
		
		if SelectedCoreObject then
			UtilityModule.SetSelectedCoreObject(SelectedCoreObject)
		else
			p1:SetSelectedObject(1)
			UtilityModule.SetSelectedCoreObject(SelectedCoreObject)
		end
		ContextActionService:BindCoreAction("CloseSideBar", function(_, UserInputState, _)
			-- upvalues: ScreenManagerModule (upval), config (upval), ClosedEvent (upval)
			if UserInputState == Enum.UserInputState.End then
				ScreenManagerModule:CloseCurrent(config)
				ClosedEvent:Fire()
			end
		end, false, Enum.KeyCode.ButtonB)
	end
	
	function config:RemoveFocus()
		-- upvalues: Flag (ref), GuiService (upval), ContextActionService (upval), SelectedCoreObject (ref)
		Flag = false
		GuiService:RemoveSelectionGroup("SideBar")
		ContextActionService:UnbindCoreAction("CloseSideBar")
		SelectedCoreObject = nil
	end
	
	return config
end