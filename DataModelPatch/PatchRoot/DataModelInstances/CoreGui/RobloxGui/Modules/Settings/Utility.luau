local ThemeModule = require(script.Parent.Theme)
local SELECTEDCOLOR = ThemeModule.color("SELECTED_COLOR", Color3.fromRGB(0, 162, 255))
local NONSELECTEDCOLOR = ThemeModule.color("NON_SELECTED_COLOR", Color3.fromRGB(78, 84, 96))
local ARROWCOLOR = ThemeModule.color("ARROW_COLOR", Color3.fromRGB(204, 204, 204))
local ARROWCOLORHOVER = ThemeModule.color("ARROW_COLOR_HOVER", Color3.fromRGB(255, 255, 255))
local ARROWCOLORINACTIVE = ThemeModule.color("ARROW_COLOR_INACTIVE", Color3.fromRGB(150, 150, 150))
local _UDim = UDim.new(0, 14)
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:FindFirstChild("RobloxGui")
local ContextActionService = game:GetService("ContextActionService")
local VRService = game:GetService("VRService")
local Workspace = game:GetService("Workspace")
local CorePackages = game:GetService("CorePackages")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local FFlagRefactorMenuConfirmationButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local FFlagAddNextUpContainerModule = require(RobloxGui.Modules.Settings.Pages.LeaveGameWithNextUp.Flags.FFlagAddNextUpContainer)
local RepositionDropDownScrim = game:DefineFastFlag("RepositionDropDownScrim", false)
local Chrome = RobloxGui.Modules.Chrome
local ServiceModule = if require(CorePackages.Workspace.Packages.Chrome).Enabled() then require(Chrome.Service) else nil
local SignalsModule = require(CorePackages.Packages.Signals)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local FFlagHideShortcutsWhileIemDropdownActive = require(Chrome.Flags).FFlagHideShortcutsWhileIemDropdownActive
local EnablePreferredTextSizeAccessGuiServiceEngineFeature = game:GetEngineFeature("EnablePreferredTextSizeAccessGuiService")
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local IncreaseLegacyPeopleRowButtonSize = game:DefineFastFlag("IncreaseLegacyPeopleRowButtonSize", false)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local CorePackages1 = game:GetService("CorePackages")
local AppCommonLibModule = require(CorePackages1.Workspace.Packages.AppCommonLib)
local Signal = AppCommonLibModule.Signal
local CreateFunction = AppCommonLibModule.Create
local BuilderIconsModule = require(CorePackages1.Packages.BuilderIcons)
local Migration = BuilderIconsModule.Migration
local IsEnabled = require(RobloxGui.Modules:WaitForChild("TenFootInterface")):IsEnabled()
local Computed = SignalsModule.createComputed(function(p1): boolean
	-- upvalues: ResponsiveModule (copy)
	return ResponsiveModule.GetInputModeStore(p1).getLastInputType(p1) == ResponsiveModule.Input.Touch
end)
local Computed1 = SignalsModule.createComputed(function(p1): boolean
	-- upvalues: ResponsiveModule (copy)
	return ResponsiveModule.GetInputModeStore(p1).getLastInputType(p1) == ResponsiveModule.Input.Pointer
end)
local t = {}
setmetatable(t, { __mode = "k" })
local SelectionImageObject = CreateFunction("ImageLabel")({ Image = "", BackgroundTransparency = 1 })

function clamp(p1: number, p2: number, p3: number): number
	return (math.max(p1, (math.min(p2, p3))))
end

local function Linear(p1, p2, p3, p4)
	return if p4 <= p1 then p2 + p3 else p3 * p1 / p4 + p2
end

local function EaseOutQuad(p1, p2, p3, p4)
	if p4 <= p1 then
		return p2 + p3
	else
		local v1 = p1 / p4
		
		return p2 - p3 * v1 * (v1 - 2)
	end
end

local function EaseInOutQuad(p1, p2: number, p3: number, p4): number
	if p4 <= p1 then
		return p2 + p3
	else
		local v1 = p1 / p4
		
		return if v1 < 0.5 then 2 * p3 * v1 * v1 + p2 else p2 + p3 * (2 * (2 - v1) * v1 - 1)
	end
end

function PropertyTweener(p1, Key, p2, p3, p4, Callback, Callback1)
	-- upvalues: RunService (copy)
	local config = { StartTime = tick() }
	config.EndTime = config.StartTime + p4
	config.Cancelled = false
	local Flag = false
	local ClampResult = 0
	
	local function _()
		-- upvalues: p1 (copy), Key (copy), Callback (copy), p2 (copy), p3 (copy), Flag (ref), ClampResult (ref), Callback1 (copy)
		if p1 then
			p1[Key] = Callback(1, p2, p3 - p2, 1)
		end
		Flag = true
		ClampResult = 1
		
		if Callback1 then
			Callback1()
		end
	end
	
	p1[Key] = Callback(0, p2, p3 - p2, p4)
	coroutine.wrap(function()
		-- upvalues: config (copy), p1 (copy), Key (copy), Callback (copy), p2 (copy), p3 (copy), p4 (copy), ClampResult (ref), RunService (upval), Flag (ref), Callback1 (copy)
		local CurrentTime = tick()
		while CurrentTime < config.EndTime and p1 do
			if config.Cancelled then return end
			p1[Key] = Callback(CurrentTime - config.StartTime, p2, p3 - p2, p4)
			ClampResult = clamp(0, 1, (CurrentTime - config.StartTime) / p4)
			RunService.RenderStepped:Wait()
			CurrentTime = tick()
		end
		if config.Cancelled == false and p1 then
			if p1 then
				p1[Key] = Callback(1, p2, p3 - p2, 1)
			end
			Flag = true
			ClampResult = 1
			
			if Callback1 then
				Callback1()
			end
		end
	end)()
	
	function config:GetFinal()
		-- upvalues: p3 (copy)
		return p3
	end
	
	function config:GetPercentComplete()
		-- upvalues: ClampResult (ref)
		return ClampResult
	end
	
	function config:IsFinished()
		-- upvalues: Flag (ref)
		return Flag
	end
	
	function config.Finish(p5)
		-- upvalues: Flag (ref), p1 (copy), Key (copy), Callback (copy), p2 (copy), p3 (copy), ClampResult (ref), Callback1 (copy)
		if not Flag then
			p5:Cancel()
			
			if p1 then
				p1[Key] = Callback(1, p2, p3 - p2, 1)
			end
			Flag = true
			ClampResult = 1
			
			if Callback1 then
				Callback1()
			end
		end
	end
	
	function config:Cancel()
		-- upvalues: config (copy)
		config.Cancelled = true
	end
	
	return config
end

local function _(): boolean
	-- upvalues: UserInputService (copy)
	return UserInputService.PreferredInput == Enum.PreferredInput.Touch
end

local function CreateSignal()
	local BindableEvent = Instance.new("BindableEvent")
	local List = nil
	local Selected = nil
	
	return {
		fire = function(_, ...)
			-- upvalues: List (ref), Selected (ref), BindableEvent (copy)
			List = { ... }
			Selected = select("#", ...)
			BindableEvent:Fire()
		end,
		connect = function(_, Callback)
			-- upvalues: BindableEvent (copy), List (ref), Selected (ref)
			if not Callback then
				error("connect(nil)", 2)
			end
			return BindableEvent.Event:Connect(function()
				-- upvalues: Callback (copy), List (upval), Selected (upval)
				Callback(unpack(List, 1, Selected))
			end)
		end,
		wait = function(_)
			-- upvalues: BindableEvent (copy), List (ref), Selected (ref)
			BindableEvent.Event:wait()
			
			if not List then
				error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
			end
			return unpack(List, 1, Selected)
		end
	}
end

local _ = function()
	-- upvalues: GuiService (copy)
	return if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
end

local _ = function(): boolean
	-- upvalues: GuiService (copy), UserInputService (copy)
	local _Vector2 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	
	return UserInputService.TouchEnabled and (_Vector2.Y < 500 or _Vector2.X < 700)
end

local _ = function(): boolean
	-- upvalues: GuiService (copy)
	local _Vector2 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	
	return _Vector2.X < _Vector2.Y
end

local _ = function()
	-- upvalues: IsEnabled (copy)
	return IsEnabled
end

local _ = function()
	-- upvalues: VRService (copy), UserInputService (copy)
	return not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled)
end

local function addHoverState(Parent: Frame, Image, Callback: (any) -> (), Callback1)
	local function onNormalButtonStateCallback()
		-- upvalues: Parent (copy), Callback (copy), Image (copy)
		if Parent.Active then
			Callback(Image)
		end
	end
	
	local function onHoverButtonStateCallback()
		-- upvalues: Parent (copy), Callback1 (copy), Image (copy)
		if Parent.Active then
			Callback1(Image)
		end
	end
	
	Parent.MouseEnter:Connect(onHoverButtonStateCallback)
	Parent.SelectionGained:Connect(onHoverButtonStateCallback)
	Parent.MouseLeave:Connect(onNormalButtonStateCallback)
	Parent.SelectionLost:Connect(onNormalButtonStateCallback)
	Callback(Image)
end

local function addOnResizedCallback(Key, Callback: (any, any) -> ())
	-- upvalues: t (copy), GuiService (copy)
	t[Key] = Callback
	local _Vector2 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	Callback(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport(), _Vector2.X < _Vector2.Y)
end

local config = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}

local function MakeDefaultButton(Text, Size, Callback, p5, HubRef, p6)
	-- upvalues: CreateFunction (copy), ThemeModule (copy), config (copy), UserInputService (copy), GuiService (copy), VRService (copy)
	local SelectionImageObject = CreateFunction("ImageLabel")({ Image = "", BackgroundTransparency = 1 })
	local Parent = nil
	local v1 = "DefaultButtonStroke"
	local v2 = "DefaultButton"
	
	if Text == "DropDownFrame" then
		v1 = "ControlInputStroke"
		v2 = "ControlInputBackground"
	end
	if p6 == "ImageButton" then
		v2 = "ImageButton"
	end
	Parent = CreateFunction("ImageButton")({
		AutoButtonColor = false,
		ZIndex = 2,
		Name = Text .. "Button",
		BackgroundColor3 = ThemeModule.color(v2),
		BackgroundTransparency = ThemeModule.transparency(v2),
		Size = Size,
		SelectionImageObject = SelectionImageObject
	})
	CreateFunction("UICorner")({
		CornerRadius = ThemeModule.DefaultCornerRadius,
		Parent = Parent
	})
	local v3 = CreateFunction("UIStroke")({
		Name = "Border",
		Color = ThemeModule.color(v1),
		Transparency = ThemeModule.transparency(v1),
		Thickness = ThemeModule.DefaultStokeThickness,
		Parent = Parent
	})
	local _ = CreateFunction("BoolValue")({ Name = "Enabled", Value = true, Parent = Parent })
	
	if Callback then
		Parent.MouseButton1Click:Connect(function()
			-- upvalues: Callback (copy), config (upval), UserInputService (upval)
			Callback(config[UserInputService:GetLastInputType()] or false)
		end)
	else
		if v3 then
			v3.Enabled = false
		end
		Parent.Selectable = false
	end
	local function _(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch
	end
	
	local RowRef = nil
	
	local function setRowRef(Value)
		-- upvalues: RowRef (ref)
		RowRef = Value
	end
	
	local function selectButton()
		-- upvalues: HubRef (copy), p5 (copy), Parent (ref), ThemeModule (upval), RowRef (ref)
		local HubRef1 = HubRef
		
		if HubRef1 == nil and p5 then
			HubRef1 = p5.HubRef
		end
		if HubRef1 and HubRef1.Active or HubRef1 == nil then
			Parent.BackgroundColor3 = ThemeModule.color("DefaultButtonHover")
			Parent.BackgroundTransparency = ThemeModule.transparency("DefaultButtonHover")
			local RowRef1 = if RowRef then RowRef else Parent
			
			if HubRef1 then
				HubRef1:ScrollToFrame(RowRef1)
			end
		end
	end
	
	local _ = function()
		-- upvalues: Parent (ref), ThemeModule (upval), v2 (ref)
		Parent.BackgroundColor3 = ThemeModule.color(v2)
		Parent.BackgroundTransparency = ThemeModule.transparency(v2)
	end
	
	Parent.InputBegan:Connect(function(Input)
		-- upvalues: Parent (ref), selectButton (copy)
		if Parent.Selectable and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
			selectButton()
		end
	end)
	Parent.InputEnded:Connect(function(Input)
		-- upvalues: Parent (ref), GuiService (upval), ThemeModule (upval), v2 (ref)
		if Parent.Selectable and GuiService.SelectedCoreObject ~= Parent and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
			Parent.BackgroundColor3 = ThemeModule.color(v2)
			Parent.BackgroundTransparency = ThemeModule.transparency(v2)
		end
	end)
	Parent.SelectionGained:Connect(function()
		-- upvalues: selectButton (copy)
		selectButton()
	end)
	Parent.SelectionLost:Connect(function()
		-- upvalues: Parent (ref), ThemeModule (upval), v2 (ref)
		Parent.BackgroundColor3 = ThemeModule.color(v2)
		Parent.BackgroundTransparency = ThemeModule.transparency(v2)
	end)
	local _ = GuiService.Changed:Connect(function(p7)
		-- upvalues: VRService (upval), UserInputService (upval), GuiService (upval), Parent (ref), ThemeModule (upval), v2 (ref), selectButton (copy)
		if p7 ~= "SelectedCoreObject" then return end
		if VRService.VREnabled or UserInputService.PreferredInput == Enum.PreferredInput.Touch and not UserInputService.GamepadEnabled then return end
		if GuiService.SelectedCoreObject == nil or GuiService.SelectedCoreObject ~= Parent then
			Parent.BackgroundColor3 = ThemeModule.color(v2)
			Parent.BackgroundTransparency = ThemeModule.transparency(v2)
			
			return
		end
		if Parent.Selectable then
			selectButton()
		end
	end)
	
	return Parent, setRowRef
end

local function MakeButton(Text, Text1, Size, FunctionToBind, p5, PluginToolbarButton)
	-- upvalues: MakeDefaultButton (copy), CreateFunction (copy), ThemeModule (copy), GuiService (copy), UserInputService (copy), IsEnabled (copy), EnablePreferredTextSizeAccessGuiServiceEngineFeature (copy)
	local DefaultButton, DefaultButton2 = MakeDefaultButton(Text, Size, FunctionToBind, p5, PluginToolbarButton)
	local Label = CreateFunction("TextLabel")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		TextScaled = false,
		TextWrapped = true,
		ZIndex = 2,
		Name = Text .. "TextLabel",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		TextColor3 = ThemeModule.color("WhiteButtonText", Color3.fromRGB(255, 255, 255)),
		TextTransparency = ThemeModule.transparency("WhiteButtonText", 0),
		TextYAlignment = Enum.TextYAlignment.Center,
		Font = ThemeModule.font(Enum.Font.SourceSansBold, "Button"),
		TextSize = ThemeModule.textSize(24, "Button"),
		Text = Text1,
		Parent = DefaultButton
	})
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint", Label)
	local _Vector2 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	
	if UserInputService.TouchEnabled and (_Vector2.Y < 500 or _Vector2.X < 700) then
		Label.TextSize = ThemeModule.textSize(18)
	elseif IsEnabled and (Text ~= "FriendStatus" and Text ~= "BlockButton") then
		Label.TextSize = ThemeModule.textSize(36)
	end
	if EnablePreferredTextSizeAccessGuiServiceEngineFeature then
		local ScaledValue = (GuiService.PreferredTextSize.Value - 1) * 3
		UITextSizeConstraint.MaxTextSize = Label.TextSize + ScaledValue
		local TextSize = Label.TextSize
		GuiService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
			-- upvalues: ScaledValue (ref), GuiService (upval), UITextSizeConstraint (copy), TextSize (copy)
			ScaledValue = (GuiService.PreferredTextSize.Value - 1) * 3
			UITextSizeConstraint.MaxTextSize = TextSize + ScaledValue
		end)
	else
		UITextSizeConstraint.MaxTextSize = Label.TextSize
	end
	return DefaultButton, Label, DefaultButton2
end

local function MakeImageButton(Text1, Text, Size, Size1, p5, p6, p7, p8: string)
	-- upvalues: MakeDefaultButton (copy), Migration (copy), ThemeModule (copy), CreateFunction (copy), IncreaseLegacyPeopleRowButtonSize (copy), BuilderIconsModule (copy)
	if not p8 then
		p8 = "ImageButton"
	end
	local DefaultButton, DefaultButton2 = MakeDefaultButton(Text1, Size, p5, p6, p7, p8)
	local ImageRectOffset = nil
	local ImageRectSize = nil
	local UibloxEntry = Migration.uiblox[Text] or Migration.luaApps[Text]
	
	if not string.match(Text, "^rbxasset://") then
		Text = ThemeModule.Images[Text]
	end
	if typeof(Text) == "table" then
		ImageRectOffset = Text.ImageRectOffset
		ImageRectSize = Text.ImageRectSize
		Text = Text.Image
	end
	local v1 = if UibloxEntry then CreateFunction("TextLabel")({
		BackgroundTransparency = 1,
		ZIndex = 2,
		Name = Text1 .. "TextLabel",
		Size = Size1,
		TextSize = if IncreaseLegacyPeopleRowButtonSize then Size1.Y.Offset * 0.8571428571428571 else Size1.Y.Offset * 0.6666666666666666,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		TextColor3 = Color3.new(1, 1, 1),
		Text = UibloxEntry.name,
		FontFace = BuilderIconsModule.Font[UibloxEntry.variant],
		Parent = DefaultButton
	}) else CreateFunction("ImageLabel")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 2,
		Name = Text1 .. "ImageLabel",
		Size = Size1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = Text,
		ImageRectOffset = ImageRectOffset,
		ImageRectSize = ImageRectSize,
		Parent = DefaultButton
	})
	
	if p8 == "ImageButton" then
		DefaultButton.Border.Thickness = 0
		DefaultButton.Border.Transparency = 1
	end
	return DefaultButton, v1, DefaultButton2
end

local function AddButtonRow(p5, Text, p6, Vector, p7, p8)
	-- upvalues: MakeButton (copy), CreateFunction (copy)
	local Button, Button2, Button3 = MakeButton(Text, p6, Vector, p7, p5, p8)
	local Parent = CreateFunction("Frame")({
		BackgroundTransparency = 1,
		Name = Text .. "Row",
		Size = UDim2.new(1, 0, Vector.Y.Scale, Vector.Y.Offset),
		Parent = p5.Page
	})
	Button.Parent = Parent
	Button.AnchorPoint = Vector2.new(1, 0)
	Button.Position = UDim2.new(1, -20, 0, 0)
	
	return Parent, Button, Button2, Button3
end

local function MakeRoundedRectFocusState(p5, ActionName)
	-- upvalues: CreateFunction (copy), _UDim (copy), ThemeModule (copy), RunService (copy), UserGameSettings (copy)
	local Parent = CreateFunction("Frame")({
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 12, 1, 12),
		Position = UDim2.fromOffset(-6, -6)
	})
	CreateFunction("UICorner")({ CornerRadius = _UDim, Parent = Parent })
	local v1 = CreateFunction("UIGradient")({
		Rotation = 0,
		Color = ThemeModule.selectionCursor.GradientColorSequence,
		Transparency = ThemeModule.selectionCursor.GradientTransparencySequence,
		Parent = CreateFunction("UIStroke")({
			Transparency = 0,
			Thickness = 3,
			Color = ThemeModule.selectionCursor.AnimatedColor,
			Parent = Parent
		})
	})
	RunService:UnbindFromRenderStep(ActionName)
	RunService:BindToRenderStep(ActionName, Enum.RenderPriority.Last.Value, function()
		-- upvalues: v1 (copy), ThemeModule (upval), UserGameSettings (upval)
		local NewRotation = v1.Rotation + 2
		local GradientColorSequence = ThemeModule.selectionCursor.GradientColorSequence
		local GradientTransparencySequence = ThemeModule.selectionCursor.GradientTransparencySequence
		
		if UserGameSettings.ReducedMotion then
			local SineRatio = (math.sin((math.rad(NewRotation))) + 1) / 2
			GradientColorSequence = ColorSequence.new(GradientColorSequence.Keypoints[1].Value:lerp(GradientColorSequence.Keypoints[#GradientColorSequence.Keypoints].Value, SineRatio))
			local Value = GradientTransparencySequence.Keypoints[1].Value
			GradientTransparencySequence = NumberSequence.new(Value + (GradientTransparencySequence.Keypoints[#GradientTransparencySequence.Keypoints].Value - Value) * SineRatio)
		end
		v1.Rotation = NewRotation
		v1.Color = GradientColorSequence
		v1.Transparency = GradientTransparencySequence
	end)
	p5.AncestryChanged:Connect(function(_, NewParent)
		-- upvalues: RunService (upval), ActionName (copy)
		if not NewParent then
			RunService:UnbindFromRenderStep(ActionName)
		end
	end)
	p5.SelectionImageObject = Parent
end

local function CreateDropDown(p5, CurrentIndex, HubRef)
	-- upvalues: ThemeModule (copy), HttpService (copy), GuiService (copy), CreateFunction (copy), RepositionDropDownScrim (copy), CoreGui (copy), VRService (copy), IsInExperienceUIVREnabled (copy), CorePackages1 (copy), UserInputService (copy), ContextActionService (copy), FFlagHideShortcutsWhileIemDropdownActive (copy), ServiceModule (copy), RobloxTranslatorModule (copy), MakeButton (copy)
	local SELECTIONTEXTCOLORNORMAL = ThemeModule.color("SELECTION_TEXT_COLOR_NORMAL", Color3.fromRGB(178, 178, 178))
	local _Color3 = Color3.fromRGB(229, 229, 229)
	local SELECTIONTEXTCOLORHIGHLIGHTED = ThemeModule.color("SELECTION_TEXT_COLOR_HIGHLIGHTED", Color3.fromRGB(255, 255, 255))
	local DropDownFrame = nil
	local config = {
		CurrentIndex = nil,
		UpdateDropDownList = nil,
		DropDownFrame = nil,
		Selections = nil
	}
	Instance.new("BindableEvent").Name = "IndexChanged"
	
	if type(p5) == "table" then
		local IndexChanged = Instance.new("BindableEvent")
		IndexChanged.Name = "IndexChanged"
		local Interactable = true
		local Guid = HttpService:GenerateGUID(false)
		local Enabled = nil
		local v1 = p5
		local GuiInset, _ = GuiService:GetGuiInset()
		local Button = CreateFunction("ImageButton")({
			Name = "DropDownFullscreenFrame",
			BackgroundTransparency = 0.2,
			BorderSizePixel = 0,
			ZIndex = 10,
			Active = true,
			Visible = false,
			Selectable = false,
			AutoButtonColor = false,
			Size = UDim2.new(1, 0, 1, if RepositionDropDownScrim then GuiInset.Y else 0),
			Position = if RepositionDropDownScrim then UDim2.new(0, 0, 0, -GuiInset.Y) else nil,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Parent = CoreGui.RobloxGui
		})
		
		local function onVREnabled(p6)
			-- upvalues: VRService (upval), IsInExperienceUIVREnabled (upval), CorePackages1 (upval), Button (copy), CoreGui (upval), config (copy), v1 (ref)
			if p6 ~= "VREnabled" then return end
			if VRService.VREnabled then
				if IsInExperienceUIVREnabled then
					local VrSpatialUiModule = require(CorePackages1.Workspace.Packages.VrSpatialUi)
					Button.Parent = VrSpatialUiModule.UIManager.getInstance():getPanelObject(VrSpatialUiModule.Constants.PanelType.MoreMenu)
					Button.BackgroundTransparency = 0.2
				else
					Button.Parent = require(CorePackages1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):GetGUI()
					Button.BackgroundTransparency = 1
				end
			else
				Button.Parent = CoreGui.RobloxGui
				Button.BackgroundTransparency = 0.2
			end
			if config.UpdateDropDownList then
				config:UpdateDropDownList(v1)
			end
		end
		
		VRService.Changed:Connect(onVREnabled)
		onVREnabled("VREnabled")
		local Parent = CreateFunction("ImageLabel")({
			Name = "DropDownSelectionFrame",
			Image = "",
			ZIndex = 10,
			ScaleType = Enum.ScaleType.Stretch,
			SliceCenter = Rect.new(8, 6, 46, 44),
			BackgroundTransparency = ThemeModule.transparency("DropdownListBg", 1),
			BackgroundColor3 = ThemeModule.color("DropdownListBg"),
			Size = UDim2.new(0.6, 0, 0.9, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Parent = Button
		})
		CreateFunction("UICorner")({
			CornerRadius = ThemeModule.DefaultCornerRadius,
			Parent = Parent
		})
		local ScrollFrame = CreateFunction("ScrollingFrame")({
			Name = "DropDownScrollingFrame",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10,
			Size = UDim2.new(1, -20, 1, -25),
			Position = UDim2.new(0, 10, 0, 10),
			ScrollBarThickness = ThemeModule.DefaultScrollBarThickness,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Parent = Parent
		})
		local Connection = nil
		local Flag = false
		
		local function Callback(p6, UserInputState)
			-- upvalues: config (copy), Interactable (ref), HubRef (copy), Button (copy), VRService (upval), UserInputService (upval), GuiService (upval), DropDownFrame (ref), Connection (ref), ContextActionService (upval), Guid (copy), Enabled (ref), Flag (ref), IsInExperienceUIVREnabled (upval), CorePackages1 (upval)
			if p6 ~= nil and UserInputState ~= Enum.UserInputState.Begin then return end
			config.DropDownFrame.Selectable = Interactable
			HubRef:SetActive(true)
			
			if Button.Visible and (not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled)) then
				GuiService.SelectedCoreObject = DropDownFrame
			end
			Button.Visible = false
			
			if Connection then
				Connection:Disconnect()
			end
			ContextActionService:UnbindCoreAction(Guid .. "Action")
			ContextActionService:UnbindCoreAction(Guid .. "FreezeAction")
			Enabled.Value = Interactable
			Flag = false
			
			if VRService.VREnabled and not IsInExperienceUIVREnabled then
				require(CorePackages1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(Button, 0)
			end
		end
		
		local function FunctionToBind() end
		
		local FeatureSettingsHubLabelChooseOne = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.ChooseOne")
		config.DropDownFrame = MakeButton("DropDownFrame", FeatureSettingsHubLabelChooseOne, UDim2.new(0.6, 0, 0, 40), function()
			-- upvalues: Interactable (ref), config (copy), Flag (ref), Button (copy), VRService (upval), IsInExperienceUIVREnabled (upval), CorePackages1 (upval), DropDownFrame (ref), GuiService (upval), Connection (ref), SELECTIONTEXTCOLORHIGHLIGHTED (copy), _Color3 (copy), SELECTIONTEXTCOLORNORMAL (copy), Callback (copy), FFlagHideShortcutsWhileIemDropdownActive (upval), ServiceModule (upval), ContextActionService (upval), Guid (copy), FunctionToBind (copy), HubRef (copy), Enabled (ref)
			if not Interactable then return end
			config.DropDownFrame.Selectable = false
			Flag = true
			Button.Visible = true
			
			if VRService.VREnabled and not IsInExperienceUIVREnabled then
				require(CorePackages1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(Button, 0.5)
			end
			DropDownFrame = config.DropDownFrame
			
			if config.CurrentIndex and config.CurrentIndex > 0 then
				GuiService.SelectedCoreObject = config.Selections[config.CurrentIndex]
			elseif #config.Selections > 0 then
				GuiService.SelectedCoreObject = config.Selections[1]
			end
			Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: config (upval), GuiService (upval), SELECTIONTEXTCOLORHIGHLIGHTED (upval), VRService (upval), _Color3 (upval), SELECTIONTEXTCOLORNORMAL (upval)
				for i = 1, #config.Selections do
					if GuiService.SelectedCoreObject == config.Selections[i] then
						config.Selections[i].TextColor3 = SELECTIONTEXTCOLORHIGHLIGHTED
					else
						config.Selections[i].TextColor3 = VRService.VREnabled and _Color3 or SELECTIONTEXTCOLORNORMAL
					end
				end
			end)
			local Callback1: (any, any) -> () = Callback
			
			if FFlagHideShortcutsWhileIemDropdownActive then
				ServiceModule:setHideShortcutBar("InExperienceMenuDropdown", true)
				
				Callback1 = function(p6, p7)
					-- upvalues: Callback (upval), ServiceModule (upval)
					Callback(p6, p7)
					ServiceModule:setHideShortcutBar("InExperienceMenuDropdown", false)
				end
			end
			ContextActionService:BindCoreAction(Guid .. "FreezeAction", FunctionToBind, false, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1)
			ContextActionService:BindCoreAction(Guid .. "Action", Callback1, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
			HubRef:SetActive(false)
			Enabled.Value = false
		end, nil, HubRef)
		config.DropDownFrame.Position = UDim2.new(1, 0, 0.5, 0)
		config.DropDownFrame.AnchorPoint = Vector2.new(1, 0.5)
		Enabled = config.DropDownFrame.Enabled
		local DropDownFrameTextLabel = config.DropDownFrame.DropDownFrameTextLabel
		DropDownFrameTextLabel.Position = UDim2.new(0, 15, 0, 0)
		DropDownFrameTextLabel.Size = UDim2.new(1, -50, 1, 0)
		DropDownFrameTextLabel.ClipsDescendants = true
		DropDownFrameTextLabel.TextXAlignment = Enum.TextXAlignment.Left
		local DropDownImage = CreateFunction("ImageLabel")({
			Name = "DropDownImage",
			Image = "rbxasset://textures/ui/Settings/DropDown/DropDown.png",
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0, 15, 0, 10),
			Position = UDim2.new(1, -12, 0.5, 0),
			Parent = config.DropDownFrame
		})
		config.DropDownImage = DropDownImage
		
		local function setSelection(CurrentIndex)
			-- upvalues: config (copy), DropDownFrameTextLabel (copy), IndexChanged (copy)
			local Flag = false
			
			for CurrentIndex1, selection in pairs(config.Selections) do
				if CurrentIndex1 == CurrentIndex then
					DropDownFrameTextLabel.Text = selection.Text
					config.CurrentIndex = CurrentIndex1
					Flag = true
				end
			end
			if Flag then
				IndexChanged:Fire(CurrentIndex)
			end
		end
		
		local function setSelectionByValue(p6): boolean
			-- upvalues: config (copy), DropDownFrameTextLabel (copy), IndexChanged (copy)
			local Flag = false
			
			for CurrentIndex, selection in pairs(config.Selections) do
				if selection.Text == p6 then
					DropDownFrameTextLabel.Text = selection.Text
					config.CurrentIndex = CurrentIndex
					Flag = true
				end
			end
			if Flag then
				IndexChanged:Fire(config.CurrentIndex)
			end
			return Flag
		end
		
		local function _(p7)
			-- upvalues: config (copy)
			if p7 then
				config.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5
				config.DropDownFrame.ImageTransparency = 0.5
				config.DropDownImage.ImageTransparency = 0.5
				
				return
			else
				config.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
				config.DropDownFrame.ImageTransparency = 0
				config.DropDownImage.ImageTransparency = 0
			end
		end
		
		config.IndexChanged = IndexChanged.Event
		
		function config:SetSelectionIndex(p7)
			-- upvalues: setSelection (copy)
			setSelection(p7)
		end
		
		function config:SetSelectionByValue(p7)
			-- upvalues: setSelectionByValue (copy)
			return (setSelectionByValue(p7))
		end
		
		function config:ResetSelectionIndex()
			-- upvalues: config (copy), DropDownFrameTextLabel (copy), FeatureSettingsHubLabelChooseOne (copy), Callback (copy)
			config.CurrentIndex = nil
			DropDownFrameTextLabel.Text = FeatureSettingsHubLabelChooseOne
			Callback()
		end
		
		function config:GetSelectedIndex()
			-- upvalues: config (copy)
			return config.CurrentIndex
		end
		
		function config:SetZIndex(ZIndex)
			-- upvalues: config (copy), DropDownImage (copy), DropDownFrameTextLabel (copy)
			config.DropDownFrame.ZIndex = ZIndex
			DropDownImage.ZIndex = ZIndex
			DropDownFrameTextLabel.ZIndex = ZIndex
		end
		
		function config:SetInteractable(Value)
			-- upvalues: Interactable (ref), config (copy), Callback (copy), VRService (upval), Enabled (ref), Flag (ref)
			Interactable = Value
			config.DropDownFrame.Selectable = Interactable
			
			if Interactable then
				config.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
				config.DropDownFrame.ImageTransparency = 0
				config.DropDownImage.ImageTransparency = 0
				
				if not VRService.VREnabled then
					config:SetZIndex(2)
				end
			else
				Callback()
				
				if VRService.VREnabled then
					config.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5
					config.DropDownFrame.ImageTransparency = 0.5
					config.DropDownImage.ImageTransparency = 0.5
				else
					config.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
					config.DropDownFrame.ImageTransparency = 0
					config.DropDownImage.ImageTransparency = 0
				end
				if not VRService.VREnabled then
					config:SetZIndex(1)
				end
			end
			Enabled.Value = Value and not Flag
			config.DropDownImage.Visible = Value
			
			if Value then
				config.DropDownFrame.ImageTransparency = 0
				
				return
			else
				config.DropDownFrame.ImageTransparency = 0.5
			end
		end
		
		function config:SetAutoLocalize(AutoLocalize)
			-- upvalues: Button (copy)
			Button.AutoLocalize = AutoLocalize
		end
		
		function config:UpdateDropDownList(List)
			-- upvalues: v1 (ref), config (copy), VRService (upval), ThemeModule (upval), CreateFunction (upval), _Color3 (copy), SELECTIONTEXTCOLORNORMAL (copy), ScrollFrame (copy), CurrentIndex (copy), DropDownFrameTextLabel (copy), SELECTIONTEXTCOLORHIGHLIGHTED (copy), Callback (copy), IndexChanged (copy), UserInputService (upval), GuiService (upval), Guid (copy), Button (copy), Parent (copy)
			v1 = List
			
			if config.Selections then
				for i = 1, #config.Selections do
					config.Selections[i]:Destroy()
				end
			end
			config.Selections = {}
			config.SelectionInfo = {}
			local VREnabled = VRService.VREnabled
			local Bold = VREnabled and ThemeModule.font(Enum.Font.SourceSansBold, "Bold") or ThemeModule.font(Enum.Font.SourceSans, "UtilityText")
			local TextSizeResult = VREnabled and ThemeModule.textSize(36) or ThemeModule.textSize(24, "UtilityText")
			local YOffset: number = if VREnabled then 70 else 50
			local NewYOffset = YOffset + 1
			local XOffset: number = if VREnabled then 600 else 400
			local Count = 0
			
			for CurrentIndex1, Text1 in pairs(List) do
				local SelectionImageObject = CreateFunction("Frame")({
					BackgroundTransparency = 0.7,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				})
				CreateFunction("UICorner")({
					CornerRadius = ThemeModule.DefaultCornerRadius,
					Parent = SelectionImageObject
				})
				local Text = Text1
				local Subtitle = ""
				local IsTable = typeof(Text1) == "table"
				
				if IsTable then
					Text = Text1.title
					Subtitle = Text1.subtitle
					Count += 10
				end
				local Label = nil
				
				if IsTable then
					Label = CreateFunction("TextButton")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false,
						ZIndex = 10,
						Name = "Selection" .. tostring(CurrentIndex1),
						TextYAlignment = Enum.TextYAlignment.Top,
						Size = UDim2.new(1, -28, 0, YOffset + 10),
						Position = UDim2.new(0, 14, 0, (CurrentIndex1 - 1) * (NewYOffset + 10)),
						TextColor3 = VRService.VREnabled and _Color3 or SELECTIONTEXTCOLORNORMAL,
						Font = Bold,
						TextSize = TextSizeResult,
						Text = Text,
						SelectionImageObject = SelectionImageObject,
						Parent = ScrollFrame
					})
					local _ = CreateFunction("TextLabel")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ZIndex = 10,
						Name = "Subtitle" .. tostring(CurrentIndex1),
						Size = UDim2.new(1, -28, 0, YOffset * 0.8),
						Position = UDim2.new(0, 14, 0, 15),
						TextColor3 = VRService.VREnabled and _Color3 or SELECTIONTEXTCOLORNORMAL,
						Font = Bold,
						TextSize = TextSizeResult * 0.8,
						Text = Subtitle,
						Parent = Label
					})
				else
					Label = CreateFunction("TextButton")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false,
						ZIndex = 10,
						Name = "Selection" .. tostring(CurrentIndex1),
						Size = UDim2.new(1, -28, 0, YOffset),
						Position = UDim2.new(0, 14, 0, (CurrentIndex1 - 1) * NewYOffset),
						TextColor3 = VRService.VREnabled and _Color3 or SELECTIONTEXTCOLORNORMAL,
						Font = Bold,
						TextSize = TextSizeResult,
						Text = Text1,
						SelectionImageObject = SelectionImageObject,
						Parent = ScrollFrame
					})
				end
				if CurrentIndex1 == CurrentIndex then
					config.CurrentIndex = CurrentIndex1
					DropDownFrameTextLabel.Text = Text
					Label.TextColor3 = SELECTIONTEXTCOLORHIGHLIGHTED
				elseif not CurrentIndex and CurrentIndex1 == 1 then
					Label.TextColor3 = SELECTIONTEXTCOLORHIGHLIGHTED
				end
				local function Callback1()
					-- upvalues: DropDownFrameTextLabel (upval), Label (ref), Callback (upval), config (upval), CurrentIndex1 (copy), IndexChanged (upval)
					DropDownFrameTextLabel.Text = Label.Text
					Callback()
					config.CurrentIndex = CurrentIndex1
					IndexChanged:Fire(CurrentIndex1)
				end
				
				Label.MouseButton1Click:Connect(Callback1)
				Label.MouseEnter:Connect(function()
					-- upvalues: VRService (upval), UserInputService (upval), GuiService (upval), Label (ref)
					if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
						GuiService.SelectedCoreObject = Label
					end
				end)
				config.Selections[CurrentIndex1] = Label
				config.SelectionInfo[Label] = { Clicked = Callback1 }
			end
			GuiService:RemoveSelectionGroup(Guid)
			GuiService:AddSelectionTuple(Guid, unpack(config.Selections))
			ScrollFrame.CanvasSize = UDim2.new(1, -20, 0, #List * NewYOffset + Count)
			
			local function updateDropDownSize()
				-- upvalues: ScrollFrame (upval), Button (upval), Parent (upval), XOffset (copy)
				if ScrollFrame.CanvasSize.Y.Offset < Button.AbsoluteSize.Y - 10 then
					Parent.Size = UDim2.new(0, XOffset, 0, ScrollFrame.CanvasSize.Y.Offset + 25)
					
					return
				else
					Parent.Size = UDim2.new(0, XOffset, 0.9, 0)
				end
			end
			
			Button.Changed:Connect(function(p7)
				-- upvalues: updateDropDownSize (copy)
				if p7 == "AbsoluteSize" then
					updateDropDownSize()
					
					return
				end
			end)
			updateDropDownSize()
		end
		
		config:UpdateDropDownList(p5)
		Button.MouseButton1Click:Connect(Callback)
		HubRef.PoppedMenu:Connect(function(Button1)
			-- upvalues: Button (copy), Callback (copy)
			if Button1 == Button then
				Callback()
			end
		end)
		
		return config
	else
		error("CreateDropDown dropDownStringTable (first arg) is not a table", 2)
		
		return config
	end
end

local function CreateSelector(p7, CurrentIndex)
	-- upvalues: CreateFunction (copy), SelectionImageObject (copy), ThemeModule (copy), ARROWCOLOR (copy), UserInputService (copy), ARROWCOLORHOVER (copy), addHoverState (copy), VRService (copy), GuiService (copy), EaseOutQuad (copy), ARROWCOLORINACTIVE (copy), IsEnabled (copy), Computed (copy), Computed1 (copy), t (copy)
	local v2 = 0
	local config = { HubRef = nil, SetSelectionIndex = nil }
	
	if type(p7) ~= "table" then
		error("CreateSelector selectionStringTable (first arg) is not a table", 2)
		
		return config
	end
	local IndexChanged = Instance.new("BindableEvent")
	IndexChanged.Name = "IndexChanged"
	local Interactable = true
	config.CurrentIndex = 0
	config.SelectorFrame = CreateFunction("ImageButton")({
		Name = "Selector",
		Image = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		ZIndex = 2,
		NextSelectionLeft = config.SelectorFrame,
		NextSelectionRight = config.SelectorFrame,
		Size = UDim2.new(0.6, 0, 0, 50),
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		SelectionImageObject = SelectionImageObject
	})
	local Parent = CreateFunction("ImageButton")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, ThemeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = SelectionImageObject,
		Parent = config.SelectorFrame
	})
	local Parent1 = CreateFunction("ImageButton")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, ThemeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = SelectionImageObject,
		Parent = config.SelectorFrame
	})
	local Image = CreateFunction("ImageLabel")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Left.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 30),
		ImageColor3 = ARROWCOLOR,
		Parent = Parent
	})
	local Image1 = CreateFunction("ImageLabel")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Right.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 30),
		ImageColor3 = ARROWCOLOR,
		Parent = Parent1
	})
	
	if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		local function v172(Image)
			-- upvalues: ARROWCOLOR (upval)
			Image.ImageColor3 = ARROWCOLOR
		end
		
		local function v173(Image)
			-- upvalues: ARROWCOLORHOVER (upval)
			Image.ImageColor3 = ARROWCOLORHOVER
		end
		
		addHoverState(Parent, Image, v172, v173)
		addHoverState(Parent1, Image1, v172, v173)
	end
	config.Selections = {}
	local t1 = {}
	local t2 = {}
	local Button = CreateFunction("ImageButton")({
		Name = "AutoSelectButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 2,
		Position = UDim2.new(0, Parent.Size.X.Offset, 0, 0),
		Size = UDim2.new(1, Parent.Size.X.Offset * -2, 1, 0),
		Parent = config.SelectorFrame,
		SelectionImageObject = SelectionImageObject
	})
	Button.MouseButton1Click:Connect(function()
		-- upvalues: Interactable (ref), config (copy), VRService (upval), UserInputService (upval), GuiService (upval)
		if not Interactable then return end
		if #config.Selections <= 1 then return end
		local NewCurrentIndex = config.CurrentIndex + 1
		
		if #config.Selections < NewCurrentIndex then
			NewCurrentIndex = 1
		end
		config:SetSelectionIndex(NewCurrentIndex)
		
		if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
			GuiService.SelectedCoreObject = config.SelectorFrame
		end
	end)
	t2[Button] = true
	
	local function setSelection(NewCurrentIndex, p8)
		-- upvalues: config (copy), Parent (copy), t1 (ref), EaseOutQuad (upval), IndexChanged (copy)
		for CurrentIndex, selection in pairs(config.Selections) do
			local IsNewCurrentIndexMatch = CurrentIndex == NewCurrentIndex
			local _UDim2 = UDim2.new(0, Parent.Size.X.Offset, 0, 0)
			local _UDim2_1: UDim2 = if t1[selection] then UDim2.new(0, Parent.Size.X.Offset * -p8 * 3, 0, 0) else UDim2.new(0, Parent.Size.X.Offset * p8 * 3, 0, 0)
			
			if _UDim2_1.X.Offset < 0 then
				_UDim2_1 = UDim2.new(0, _UDim2_1.X.Offset + selection.AbsoluteSize.X / 4, 0, 0)
			end
			if IsNewCurrentIndexMatch then
				t1[selection] = true
				selection.Position = _UDim2_1
				selection.Visible = true
				PropertyTweener(selection, "TextTransparency", 1, 0, 0.165, EaseOutQuad)
				
				if selection:IsDescendantOf(game) then
					selection:TweenPositionInternal(_UDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true)
				else
					selection.Position = _UDim2
				end
				config.CurrentIndex = CurrentIndex
				IndexChanged:Fire(NewCurrentIndex)
			elseif t1[selection] then
				t1[selection] = false
				PropertyTweener(selection, "TextTransparency", 0, 1, 0.165, EaseOutQuad)
				
				if selection:IsDescendantOf(game) then
					selection:TweenPositionInternal(_UDim2_1, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true)
				else
					selection.Position = _UDim2_1
				end
			end
		end
	end
	
	local function stepFunc(Input, p9)
		-- upvalues: Interactable (ref), VRService (upval), UserInputService (upval), GuiService (upval), config (copy), setSelection (copy)
		if not Interactable then return end
		if Input ~= nil and Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Gamepad1 and Input.UserInputType ~= Enum.UserInputType.Gamepad2 and Input.UserInputType ~= Enum.UserInputType.Gamepad3 and Input.UserInputType ~= Enum.UserInputType.Gamepad4 and Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
			GuiService.SelectedCoreObject = config.SelectorFrame
		end
		local NewCurrentIndex = p9 + config.CurrentIndex
		local v3: number = if NewCurrentIndex > config.CurrentIndex then 1 else -1
		
		if #config.Selections < NewCurrentIndex then
			NewCurrentIndex = 1
		elseif NewCurrentIndex < 1 then
			NewCurrentIndex = #config.Selections
		end
		setSelection(NewCurrentIndex, v3)
	end
	
	local Connection = nil
	
	local function _()
		-- upvalues: Connection (ref), GuiService (upval), config (copy), t2 (copy), VRService (upval)
		Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: config (upval), GuiService (upval), t2 (upval), VRService (upval)
			if #config.Selections <= 0 then return end
			if GuiService.SelectedCoreObject ~= nil and t2[GuiService.SelectedCoreObject] and not VRService.VREnabled then
				GuiService.SelectedCoreObject = config.SelectorFrame
			end
		end)
	end
	
	config.IndexChanged = IndexChanged.Event
	
	function config:SetSelectionIndex(NewCurrentIndex)
		-- upvalues: setSelection (copy)
		setSelection(NewCurrentIndex, 1)
	end
	
	function config:GetSelectedIndex()
		-- upvalues: config (copy)
		return config.CurrentIndex
	end
	
	function config:SetZIndex(ZIndex)
		-- upvalues: Parent (copy), Parent1 (copy), Image (copy), Image1 (copy), config (copy)
		Parent.ZIndex = ZIndex
		Parent1.ZIndex = ZIndex
		Image.ZIndex = ZIndex
		Image1.ZIndex = ZIndex
		
		for i = 1, #config.Selections do
			config.Selections[i].ZIndex = ZIndex
		end
	end
	
	function config:SetInteractable(Value)
		-- upvalues: Interactable (ref), config (copy), Parent (copy), Parent1 (copy), ThemeModule (upval), Image (copy), ARROWCOLORINACTIVE (upval), Image1 (copy), ARROWCOLOR (upval)
		Interactable = Value
		config.SelectorFrame.Selectable = Interactable
		Parent.Active = Interactable
		Parent1.Active = Interactable
		Parent.Visible = Interactable
		Parent1.Visible = Interactable
		
		if Interactable then
			for _, selection1 in pairs(config.Selections) do
				selection1.TextColor3 = Color3.fromRGB(255, 255, 255)
			end
			Image.ImageColor3 = ARROWCOLOR
			Image1.ImageColor3 = ARROWCOLOR
			
			return
		else
			for _, selection in pairs(config.Selections) do
				selection.TextColor3 = ThemeModule.color("NotInteractableSelection", Color3.fromRGB(255, 255, 255))
			end
			Image.ImageColor3 = ARROWCOLORINACTIVE
			Image1.ImageColor3 = ARROWCOLORINACTIVE
		end
	end
	
	function config:UpdateOptions(List)
		-- upvalues: config (copy), t1 (ref), CreateFunction (upval), Parent (copy), ThemeModule (upval), IsEnabled (upval), CurrentIndex (copy), Parent1 (copy)
		for _, selection in pairs(config.Selections) do
			selection:Destroy()
		end
		t1 = {}
		config.Selections = {}
		
		for CurrentIndex1, Text in pairs(List) do
			local Label = CreateFunction("TextLabel")({
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextWrapped = true,
				ZIndex = 2,
				Visible = false,
				Name = "Selection" .. tostring(CurrentIndex1),
				Size = UDim2.new(1, Parent.Size.X.Offset * -2, 1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = ThemeModule.font(Enum.Font.SourceSans, "UtilityText"),
				TextSize = ThemeModule.textSize(24, "UtilityText"),
				Text = Text,
				Parent = config.SelectorFrame
			})
			
			if IsEnabled then
				Label.TextSize = ThemeModule.textSize(36)
			end
			if CurrentIndex1 == CurrentIndex then
				config.CurrentIndex = CurrentIndex1
				Label.Position = UDim2.new(0, Parent.Size.X.Offset, 0, 0)
				Label.Visible = true
				t1[Label] = true
			else
				t1[Label] = false
			end
			config.Selections[CurrentIndex1] = Label
		end
		local Visible = #config.Selections > 1
		Parent.Visible = Visible
		Parent1.Visible = Visible
	end
	
	VRService.Changed:Connect(function(p9)
		-- upvalues: VRService (upval), Parent (copy), Parent1 (copy), Button (copy)
		if p9 == "VREnabled" then
			local VREnabled = VRService.VREnabled
			Parent.Selectable = VREnabled
			Parent1.Selectable = VREnabled
			Button.Selectable = VREnabled
			
			return
		end
	end)
	local VREnabled = VRService.VREnabled
	Parent.Selectable = VREnabled
	Parent1.Selectable = VREnabled
	Button.Selectable = VREnabled
	Parent.InputBegan:Connect(function(Input)
		-- upvalues: Computed (upval), Computed1 (upval), Interactable (ref), VRService (upval), UserInputService (upval), GuiService (upval), config (copy), setSelection (copy)
		if Computed(false) or Computed1(false) and Input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not Interactable then return end
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				GuiService.SelectedCoreObject = config.SelectorFrame
			end
			local NewCurrentIndex = -1 + config.CurrentIndex
			local v3: number = if NewCurrentIndex > config.CurrentIndex then 1 else -1
			
			if #config.Selections < NewCurrentIndex then
				NewCurrentIndex = 1
			elseif NewCurrentIndex < 1 then
				NewCurrentIndex = #config.Selections
			end
			setSelection(NewCurrentIndex, v3)
		end
	end)
	Parent1.InputBegan:Connect(function(Input)
		-- upvalues: Computed (upval), Computed1 (upval), Interactable (ref), VRService (upval), UserInputService (upval), GuiService (upval), config (copy), setSelection (copy)
		if Computed(false) or Computed1(false) and Input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not Interactable then return end
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				GuiService.SelectedCoreObject = config.SelectorFrame
			end
			local NewCurrentIndex = 1 + config.CurrentIndex
			local v3: number = if NewCurrentIndex > config.CurrentIndex then 1 else -1
			
			if #config.Selections < NewCurrentIndex then
				NewCurrentIndex = 1
			elseif NewCurrentIndex < 1 then
				NewCurrentIndex = #config.Selections
			end
			setSelection(NewCurrentIndex, v3)
		end
	end)
	local v3 = true
	config:UpdateOptions(p7)
	UserInputService.InputBegan:Connect(function(Input)
		-- upvalues: Interactable (ref), v3 (ref), GuiService (upval), config (copy), VRService (upval), UserInputService (upval), setSelection (copy)
		if not Interactable then return end
		if not v3 then return end
		if Input.UserInputType ~= Enum.UserInputType.Gamepad1 and Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		if GuiService.SelectedCoreObject ~= config.SelectorFrame then return end
		if Input.KeyCode == Enum.KeyCode.DPadLeft or Input.KeyCode == Enum.KeyCode.Left or Input.KeyCode == Enum.KeyCode.A then
			if not Interactable then return end
			if Input ~= nil and Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Gamepad1 and Input.UserInputType ~= Enum.UserInputType.Gamepad2 and Input.UserInputType ~= Enum.UserInputType.Gamepad3 and Input.UserInputType ~= Enum.UserInputType.Gamepad4 and Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				GuiService.SelectedCoreObject = config.SelectorFrame
			end
			local NewCurrentIndex = -1 + config.CurrentIndex
			local v4: number = if NewCurrentIndex > config.CurrentIndex then 1 else -1
			
			if #config.Selections < NewCurrentIndex then
				NewCurrentIndex = 1
			elseif NewCurrentIndex < 1 then
				NewCurrentIndex = #config.Selections
			end
			setSelection(NewCurrentIndex, v4)
			
			return
		else
			if Input.KeyCode == Enum.KeyCode.DPadRight or Input.KeyCode == Enum.KeyCode.Right or Input.KeyCode == Enum.KeyCode.D then
				if not Interactable then return end
				if Input ~= nil and Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Gamepad1 and Input.UserInputType ~= Enum.UserInputType.Gamepad2 and Input.UserInputType ~= Enum.UserInputType.Gamepad3 and Input.UserInputType ~= Enum.UserInputType.Gamepad4 and Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
				if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
					GuiService.SelectedCoreObject = config.SelectorFrame
				end
				local CountSelections = 1 + config.CurrentIndex
				local v5: number = if CountSelections > config.CurrentIndex then 1 else -1
				
				if #config.Selections < CountSelections then
					CountSelections = 1
				elseif CountSelections < 1 then
					CountSelections = #config.Selections
				end
				setSelection(CountSelections, v5)
			end
		end
	end)
	UserInputService.InputChanged:Connect(function(Input)
		-- upvalues: Interactable (ref), v3 (ref), v2 (ref), GuiService (upval), config (copy), stepFunc (copy)
		if not Interactable then return end
		if not v3 then
			v2 = 0
			
			return
		end
		if Input.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		local SelectedCoreObject = GuiService.SelectedCoreObject
		
		if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(config.SelectorFrame.Parent) then return end
		if Input.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		if Input.Position.X > 0.8 and Input.Delta.X > 0 and v2 ~= 1 then
			v2 = 1
			stepFunc(Input, v2)
			
			return
		end
		if Input.Position.X < -0.8 and Input.Delta.X < 0 and v2 ~= -1 then
			v2 = -1
			stepFunc(Input, v2)
			
			return
		end
		if math.abs(Input.Position.X) < 0.8 then
			v2 = 0
		end
	end)
	config.SelectorFrame.AncestryChanged:Connect(function(_, NewParent)
		-- upvalues: v3 (ref), Connection (ref), GuiService (upval), config (copy), t2 (copy), VRService (upval)
		v3 = NewParent
		
		if v3 then
			Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: config (upval), GuiService (upval), t2 (upval), VRService (upval)
				if #config.Selections <= 0 then return end
				if GuiService.SelectedCoreObject ~= nil and t2[GuiService.SelectedCoreObject] and not VRService.VREnabled then
					GuiService.SelectedCoreObject = config.SelectorFrame
				end
			end)
		elseif Connection then
			Connection:Disconnect()
			
			return
		end
	end)
	
	local function onResized(_, IsXBelow)
		-- upvalues: ThemeModule (upval), IsEnabled (upval), config (copy)
		local TextSizeResult = if IsXBelow then ThemeModule.textSize(16) else IsEnabled and ThemeModule.textSize(36) or ThemeModule.textSize(24, "UtilityText")
		for _, selection in pairs(config.Selections) do
			selection.TextSize = TextSizeResult
		end
	end
	
	t[config.SelectorFrame] = onResized
	local _Vector2 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	onResized(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport(), _Vector2.X < _Vector2.Y)
	Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
		-- upvalues: config (copy), GuiService (upval), t2 (copy), VRService (upval)
		if #config.Selections <= 0 then return end
		if GuiService.SelectedCoreObject ~= nil and t2[GuiService.SelectedCoreObject] and not VRService.VREnabled then
			GuiService.SelectedCoreObject = config.SelectorFrame
		end
	end)
	
	return config
end

local function ShowAlert(Text, p9, p10, Callback, p11)
	-- upvalues: CoreGui (copy), VRService (copy), IsInExperienceUIVREnabled (copy), CorePackages1 (copy), CreateFunction (copy), ThemeModule (copy), HttpService (copy), ContextActionService (copy), GuiService (copy), MakeButton (copy), UserInputService (copy)
	local RobloxGui = CoreGui.RobloxGui
	
	if RobloxGui:FindFirstChild("AlertViewFullScreen") then return end
	local Parent = nil
	
	local function onVREnabled(p12)
		-- upvalues: VRService (upval), IsInExperienceUIVREnabled (upval), CorePackages1 (upval), RobloxGui (ref), CoreGui (upval), Parent (ref)
		if p12 ~= "VREnabled" then return end
		local SettingsMenu = nil
		
		if VRService.VREnabled then
			if IsInExperienceUIVREnabled then
				local VrSpatialUiModule = require(CorePackages1.Workspace.Packages.VrSpatialUi)
				RobloxGui = VrSpatialUiModule.UIManager.getInstance():getPanelObject(VrSpatialUiModule.Constants.PanelType.MoreMenu)
			else
				SettingsMenu = require(CorePackages1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu")
				RobloxGui = SettingsMenu:GetGUI()
			end
		else
			RobloxGui = CoreGui.RobloxGui
		end
		if Parent and Parent.Parent ~= nil then
			Parent.Parent = RobloxGui
			
			if VRService.VREnabled and not IsInExperienceUIVREnabled then
				SettingsMenu:SetSubpanelDepth(Parent, 0.5)
			end
		end
	end
	
	local ChangedConnection = VRService.Changed:Connect(onVREnabled)
	Parent = CreateFunction("ImageLabel")({
		Name = "AlertViewBacking",
		Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 9,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 6, 46, 44),
		Size = UDim2.new(0, 400, 0, 350),
		Position = UDim2.new(0.5, -200, 0.5, -175),
		Parent = RobloxGui
	})
	onVREnabled("VREnabled")
	
	if p11 or not IsInExperienceUIVREnabled and VRService.VREnabled then
		Parent.ImageTransparency = 0
	else
		Parent.Size = UDim2.new(0.8, 0, 0, 350)
		Parent.Position = UDim2.new(0.1, 0, 0.1, 0)
	end
	if CoreGui.RobloxGui.AbsoluteSize.Y <= Parent.Size.Y.Offset then
		Parent.Size = UDim2.new(Parent.Size.X.Scale, Parent.Size.X.Offset, Parent.Size.Y.Scale, CoreGui.RobloxGui.AbsoluteSize.Y)
		Parent.Position = UDim2.new(Parent.Position.X.Scale, -Parent.Size.X.Offset / 2, 0.5, -Parent.Size.Y.Offset / 2)
	end
	if not p11 then
		CreateFunction("UICorner")({
			CornerRadius = ThemeModule.DefaultCornerRadius,
			Parent = Parent
		})
		Parent.BackgroundColor3 = ThemeModule.color("MenuContainer")
		Parent.BackgroundTransparency = ThemeModule.transparency("MenuContainer")
	end
	local _ = CreateFunction("TextLabel")({
		Name = "AlertViewText",
		BackgroundTransparency = 1,
		TextWrapped = true,
		ZIndex = 10,
		Size = UDim2.new(0.95, 0, 0.6, 0),
		Position = UDim2.new(0.025, 0, 0.05, 0),
		Font = ThemeModule.font(Enum.Font.SourceSansBold, "Bold"),
		TextSize = ThemeModule.textSize(36),
		Text = Text,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		Parent = Parent
	})
	local _ = CreateFunction("ImageLabel")({ Image = "", BackgroundTransparency = 1 })
	local Guid = HttpService:GenerateGUID(false)
	
	local function FunctionToBind(_, UserInputState)
		-- upvalues: VRService (upval), Parent (ref), IsInExperienceUIVREnabled (upval), CorePackages1 (upval), Callback (copy), ContextActionService (upval), Guid (copy), GuiService (upval), p10 (copy), ChangedConnection (copy)
		if VRService.VREnabled and (UserInputState == Enum.UserInputState.Begin or UserInputState == Enum.UserInputState.Cancel) then return end
		if not Parent then return end
		if VRService.VREnabled and not IsInExperienceUIVREnabled then
			require(CorePackages1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(Parent, 0)
		end
		Parent:Destroy()
		Parent = nil
		
		if Callback then
			Callback()
		end
		ContextActionService:UnbindCoreAction(Guid)
		GuiService.SelectedCoreObject = nil
		
		if p10 then
			p10:ShowBar()
		end
		if ChangedConnection then
			ChangedConnection:Disconnect()
		end
	end
	
	local _UDim2 = UDim2.new(1, -20, 0, 60)
	local _UDim2_1 = UDim2.new(0, 10, 0.65, 0)
	
	if not p11 then
		_UDim2 = UDim2.new(0, 200, 0, 50)
		_UDim2_1 = UDim2.new(0.5, -100, 0.65, 0)
	end
	local AlertViewButton, AlertViewButton2 = MakeButton("AlertViewButton", p9, _UDim2, FunctionToBind)
	AlertViewButton.Position = _UDim2_1
	AlertViewButton.NextSelectionLeft = AlertViewButton
	AlertViewButton.NextSelectionRight = AlertViewButton
	AlertViewButton.NextSelectionUp = AlertViewButton
	AlertViewButton.NextSelectionDown = AlertViewButton
	AlertViewButton.ZIndex = 9
	AlertViewButton2.ZIndex = AlertViewButton.ZIndex
	AlertViewButton.Parent = Parent
	
	if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
		GuiService.SelectedCoreObject = AlertViewButton
	end
	GuiService.SelectedCoreObject = AlertViewButton
	ContextActionService:BindCoreAction(Guid, FunctionToBind, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA)
	
	if p10 and (if IsInExperienceUIVREnabled then true else not VRService.VREnabled) then
		p10:HideBar()
		p10.Pages.CurrentPage:Hide(1, 1)
	end
end

local function CreateNewSlider(p9, CurrentStep, MinStep, Text, Text1)
	-- upvalues: HttpService (copy), Signal (copy), CreateFunction (copy), SelectionImageObject (copy), RobloxGui (copy), ThemeModule (copy), UserInputService (copy), ARROWCOLORHOVER (copy), ARROWCOLOR (copy), ARROWCOLORHOVER (copy), addHoverState (copy), SELECTEDCOLOR (copy), NONSELECTEDCOLOR (copy), VRService (copy), GuiService (copy), RunService (copy)
	local t = {}
	local Number: number? = tonumber(p9)
	local CurrentStep1 = CurrentStep
	local v4 = 0
	local CurrentTime = nil
	local Selectable = true
	local Guid = HttpService:GenerateGUID(false)
	
	if Number <= 0 then
		error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2)
		
		return
	end
	local Text2 = Text or Text1
	local ValueChanged = Instance.new("BindableEvent")
	ValueChanged.Name = "ValueChanged"
	local NewSignal = Signal.new()
	t.SliderFrame = CreateFunction("ImageButton")({
		Name = "Slider",
		Image = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		ZIndex = 2,
		NextSelectionLeft = t.SliderFrame,
		NextSelectionRight = t.SliderFrame,
		Size = UDim2.new(0.6, 0, 0, 50),
		AutomaticSize = if Text2 then Enum.AutomaticSize.Y else nil,
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		SelectionImageObject = SelectionImageObject
	})
	local v5 = nil
	
	if Text2 then
		v5 = CreateFunction("Frame")({
			Name = "StepsAndButtonsContainer",
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 50),
			Parent = t.SliderFrame
		})
		CreateFunction("UIListLayout")({
			Name = "UIListLayout",
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = t.SliderFrame
		})
		local Parent = CreateFunction("Frame")({
			Name = "SliderLabels",
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = t.SliderFrame
		})
		CreateFunction("UIPadding")({
			Name = "UIPadding",
			PaddingRight = UDim.new(0, 50),
			PaddingLeft = UDim.new(0, 50),
			Parent = Parent
		})
		
		local function _(): boolean
			-- upvalues: RobloxGui (upval)
			return RobloxGui.AbsoluteSize.X > 460
		end
		
		if Text then
			t.LeftLabel = CreateFunction("TextLabel")({
				Name = "LeftLabel",
				TextTransparency = 0.25,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = Text,
				Font = ThemeModule.font(Enum.Font.SourceSans, "UtilityRow"),
				TextSize = ThemeModule.textSize(18, "UtilityRow"),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = Parent,
				Visible = RobloxGui.AbsoluteSize.X > 460
			})
		end
		if Text1 then
			t.RightLabel = CreateFunction("TextLabel")({
				Name = "RightLabel",
				TextTransparency = 0.25,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = Text1,
				Font = ThemeModule.font(Enum.Font.SourceSans, "UtilityRow"),
				TextSize = ThemeModule.textSize(18, "UtilityRow"),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextXAlignment = Enum.TextXAlignment.Right,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = Parent,
				Visible = RobloxGui.AbsoluteSize.X > 460
			})
		end
		RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
			-- upvalues: t (copy), RobloxGui (upval)
			if t.LeftLabel then
				t.LeftLabel.Visible = RobloxGui.AbsoluteSize.X > 460
			end
			if t.RightLabel then
				t.RightLabel.Visible = RobloxGui.AbsoluteSize.X > 460
			end
		end)
	end
	t.StepsContainer = CreateFunction("Frame")({
		Name = "StepsContainer",
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -100, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = if Text2 then v5 else t.SliderFrame
	})
	local Parent1 = CreateFunction("ImageButton")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		Active = true,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, ThemeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = SelectionImageObject,
		Parent = if Text2 then v5 else t.SliderFrame
	})
	local Parent2 = CreateFunction("ImageButton")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		Active = true,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, ThemeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = SelectionImageObject,
		Parent = if Text2 then v5 else t.SliderFrame
	})
	local v6 = CreateFunction("ImageLabel")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Less.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Parent = Parent1,
		ImageColor3 = UserInputService.PreferredInput == Enum.PreferredInput.Touch and ARROWCOLORHOVER or ARROWCOLOR
	})
	local v7 = CreateFunction("ImageLabel")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/More.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Parent = Parent2,
		ImageColor3 = UserInputService.PreferredInput == Enum.PreferredInput.Touch and ARROWCOLORHOVER or ARROWCOLOR
	})
	
	if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		local function v236(Image)
			-- upvalues: ARROWCOLOR (upval)
			Image.ImageColor3 = ARROWCOLOR
		end
		
		local function v237(Image)
			-- upvalues: ARROWCOLORHOVER (upval)
			Image.ImageColor3 = ARROWCOLORHOVER
		end
		
		addHoverState(Parent1, v6, v236, v237)
		addHoverState(Parent2, v7, v236, v237)
	end
	t.Steps = {}
	local XScale = 1 / Number
	
	for i1 = 1, Number do
		local Parent = CreateFunction("ImageButton")({
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Active = false,
			Image = "",
			ZIndex = 3,
			Selectable = false,
			ImageTransparency = 0.36,
			Name = "Step" .. tostring(i1),
			BackgroundColor3 = SELECTEDCOLOR,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new((i1 - 1) * XScale, 2, 0.5, 0),
			Size = UDim2.new(XScale, -4, 0, 24),
			Parent = t.StepsContainer,
			SelectionImageObject = SelectionImageObject
		})
		
		if CurrentStep1 < i1 then
			Parent.BackgroundColor3 = NONSELECTEDCOLOR
		end
		if i1 == 1 or i1 == Number then
			CreateFunction("UICorner")({
				CornerRadius = ThemeModule.DefaultCornerRadius,
				Parent = Parent
			})
			CreateFunction("Frame")({
				Name = "Filler",
				BorderSizePixel = 0,
				BackgroundColor3 = Parent.BackgroundColor3,
				Parent = Parent,
				Size = UDim2.new(0.25, 0, 1, 0),
				Position = if i1 == 1 then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0, 0, 0, 0)
			})
		end
		t.Steps[#t.Steps + 1] = Parent
	end
	local function hideSelection()
		-- upvalues: Number (copy), t (copy), NONSELECTEDCOLOR (upval)
		for i = 1, Number do
			t.Steps[i].BackgroundColor3 = NONSELECTEDCOLOR
			
			if i == 1 or i == Number then
				t.Steps[i].Filler.BackgroundColor3 = NONSELECTEDCOLOR
			end
		end
	end
	
	local function showSelection()
		-- upvalues: Number (copy), CurrentStep1 (ref), t (copy), SELECTEDCOLOR (upval)
		for i = 1, Number do
			if CurrentStep1 < i then break end
			t.Steps[i].BackgroundColor3 = SELECTEDCOLOR
			
			if i == 1 or i == Number then
				t.Steps[i].Filler.BackgroundColor3 = SELECTEDCOLOR
			end
		end
	end
	
	local function setCurrentStep(Value: number)
		-- upvalues: MinStep (ref), Parent1 (copy), Parent2 (copy), Number (copy), CurrentStep1 (ref), hideSelection (copy), showSelection (copy), CurrentTime (ref), NewSignal (copy), ValueChanged (copy)
		if not MinStep then
			MinStep = 0
		end
		Parent1.Visible = true
		Parent2.Visible = true
		
		if Value <= MinStep then
			Value = MinStep
			Parent1.Visible = false
		end
		if Number <= Value then
			Value = Number
			Parent2.Visible = false
		end
		if CurrentStep1 == Value then return end
		CurrentStep1 = Value
		hideSelection()
		showSelection()
		CurrentTime = tick()
		
		if NewSignal then
			NewSignal:fire(CurrentStep1)
			
			return
		else
			ValueChanged:Fire(CurrentStep1)
		end
	end
	
	local _ = function(Input): boolean
		return if Input then Input.UserInputType == Enum.UserInputType.MouseButton1 or (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA) else false
	end
	
	local function mouseDownFunc(Input, CurrentStep, p10)
		-- upvalues: Selectable (ref), VRService (upval), UserInputService (upval), GuiService (upval), t (copy), v4 (ref), CurrentStep1 (ref), Number (copy), setCurrentStep (copy)
		if not Selectable then return end
		if Input == nil then return end
		if not (if Input then Input.UserInputType == Enum.UserInputType.MouseButton1 or (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA) else false) then return end
		if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) and not VRService.VREnabled then
			GuiService.SelectedCoreObject = t.SliderFrame
		end
		if VRService.VREnabled then
			v4 = 0
		elseif p10 then
			v4 = CurrentStep - CurrentStep1
		else
			v4 = 0
			local InputChangedConnection = nil
			local Connection = nil
			InputChangedConnection = UserInputService.InputChanged:Connect(function(Input)
				-- upvalues: Number (upval), t (upval), setCurrentStep (upval)
				if Input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
				local X = Input.Position.X
				
				for i = 1, Number do
					local X1 = t.Steps[i].AbsolutePosition.X
					local X2 = t.Steps[i].AbsoluteSize.X
					
					if X1 <= X and X <= X1 + X2 then
						setCurrentStep(i)
						break
					end
					if i == 1 and X < X1 then
						setCurrentStep(0)
						break
					end
					if i == Number and X1 <= X then
						setCurrentStep(i)
						break
					end
				end
			end)
			Connection = UserInputService.InputEnded:Connect(function(Input)
				-- upvalues: v4 (upval), Connection (ref), InputChangedConnection (ref)
				if if Input then Input.UserInputType == Enum.UserInputType.MouseButton1 or (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA) else false then
					v4 = 0
					Connection:Disconnect()
					InputChangedConnection:Disconnect()
					
					return
				end
			end)
		end
		setCurrentStep(CurrentStep)
	end
	
	local _ = function(Input)
		-- upvalues: Selectable (ref), v4 (ref)
		if not Selectable then return end
		if if Input then Input.UserInputType == Enum.UserInputType.MouseButton1 or (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA) else false then
			v4 = 0
			
			return
		end
	end
	
	t.ValueChanged = ValueChanged.Event
	
	if NewSignal then
		t.ValueChanged = NewSignal
	end
	function t:SetValue(p11)
		-- upvalues: setCurrentStep (copy)
		setCurrentStep(p11)
	end
	
	function t:GetValue()
		-- upvalues: CurrentStep1 (ref)
		return CurrentStep1
	end
	
	function t:SetInteractable(Value)
		-- upvalues: v4 (ref), Selectable (ref), t (copy), hideSelection (copy), showSelection (copy)
		v4 = 0
		Selectable = Value
		t.SliderFrame.Selectable = Value
		
		if Selectable then
			showSelection()
			
			return
		else
			hideSelection()
		end
	end
	
	function t:SetZIndex(ZIndex)
		-- upvalues: Parent1 (copy), Parent2 (copy), v6 (copy), v7 (copy), t (copy)
		Parent1.ZIndex = ZIndex
		Parent2.ZIndex = ZIndex
		v6.ZIndex = ZIndex
		v7.ZIndex = ZIndex
		
		for i = 1, #t.Steps do
			t.Steps[i].ZIndex = ZIndex
		end
	end
	
	function t:SetMinStep(Value: number)
		-- upvalues: Number (copy), MinStep (ref), CurrentStep1 (ref), Parent1 (copy), Parent2 (copy)
		if Value >= 0 and Value <= Number then
			MinStep = Value
		end
		if CurrentStep1 <= MinStep then
			CurrentStep1 = MinStep
			Parent1.Visible = false
		end
		if Number <= CurrentStep1 then
			CurrentStep1 = Number
			Parent2.Visible = false
		end
	end
	
	Parent1.InputBegan:Connect(function(Input)
		-- upvalues: CurrentStep1 (ref), Selectable (ref), VRService (upval), UserInputService (upval), GuiService (upval), t (copy), v4 (ref), setCurrentStep (copy)
		local CurrentStepDelta = CurrentStep1 - 1
		
		if not Selectable then return end
		if Input == nil then return end
		if not (if Input then Input.UserInputType == Enum.UserInputType.MouseButton1 or (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA) else false) then return end
		if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) and not VRService.VREnabled then
			GuiService.SelectedCoreObject = t.SliderFrame
		end
		v4 = if VRService.VREnabled then 0 else CurrentStepDelta - CurrentStep1
		setCurrentStep(CurrentStepDelta)
	end)
	Parent1.InputEnded:Connect(function(Input)
		-- upvalues: Selectable (ref), v4 (ref)
		if not Selectable then return end
		if if Input then Input.UserInputType == Enum.UserInputType.MouseButton1 or (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA) else false then
			v4 = 0
			
			return
		end
	end)
	Parent2.InputBegan:Connect(function(Input)
		-- upvalues: CurrentStep1 (ref), Selectable (ref), VRService (upval), UserInputService (upval), GuiService (upval), t (copy), v4 (ref), setCurrentStep (copy)
		local NewCurrentStep = CurrentStep1 + 1
		
		if not Selectable then return end
		if Input == nil then return end
		if not (if Input then Input.UserInputType == Enum.UserInputType.MouseButton1 or (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA) else false) then return end
		if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) and not VRService.VREnabled then
			GuiService.SelectedCoreObject = t.SliderFrame
		end
		v4 = if VRService.VREnabled then 0 else NewCurrentStep - CurrentStep1
		setCurrentStep(NewCurrentStep)
	end)
	Parent2.InputEnded:Connect(function(Input)
		-- upvalues: Selectable (ref), v4 (ref)
		if not Selectable then return end
		if if Input then Input.UserInputType == Enum.UserInputType.MouseButton1 or (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA) else false then
			v4 = 0
			
			return
		end
	end)
	
	local function onVREnabled(p11)
		-- upvalues: VRService (upval), Parent1 (copy), Selectable (ref), Parent2 (copy), t (copy), Number (copy)
		if p11 ~= "VREnabled" then return end
		if VRService.VREnabled then
			Parent1.Selectable = Selectable
			Parent2.Selectable = Selectable
			t.SliderFrame.Selectable = Selectable
			
			for i = 1, Number do
				t.Steps[i].Selectable = Selectable
				t.Steps[i].Active = Selectable
			end
			return
		else
			Parent1.Selectable = false
			Parent2.Selectable = false
			t.SliderFrame.Selectable = Selectable
			
			for i1 = 1, Number do
				t.Steps[i1].Selectable = false
				t.Steps[i1].Active = false
			end
		end
	end
	
	VRService.Changed:Connect(onVREnabled)
	onVREnabled("VREnabled")
	
	for i = 1, Number do
		t.Steps[i].InputBegan:Connect(function(Input)
			-- upvalues: mouseDownFunc (copy), i (copy)
			mouseDownFunc(Input, i)
		end)
		t.Steps[i].InputEnded:Connect(function(Input)
			-- upvalues: Selectable (ref), v4 (ref)
			if not Selectable then return end
			if if Input then Input.UserInputType == Enum.UserInputType.MouseButton1 or (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA) else false then
				v4 = 0
				
				return
			end
		end)
	end
	t.SliderFrame.InputBegan:Connect(function(Input)
		-- upvalues: VRService (upval), GuiService (upval), t (copy), mouseDownFunc (copy), CurrentStep1 (ref)
		if VRService.VREnabled then
			local SelectedCoreObject = GuiService.SelectedCoreObject
			
			if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		end
		mouseDownFunc(Input, CurrentStep1)
	end)
	t.SliderFrame.InputEnded:Connect(function(Input)
		-- upvalues: VRService (upval), GuiService (upval), t (copy), Selectable (ref), v4 (ref)
		if VRService.VREnabled then
			local SelectedCoreObject = GuiService.SelectedCoreObject
			
			if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		end
		if not Selectable then return end
		if if Input then Input.UserInputType == Enum.UserInputType.MouseButton1 or (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA) else false then
			v4 = 0
			
			return
		end
	end)
	
	local function v245()
		-- upvalues: CurrentTime (ref), setCurrentStep (copy), CurrentStep1 (ref), v4 (ref)
		if CurrentTime == nil then return end
		if tick() - CurrentTime >= 0.2 then
			setCurrentStep(CurrentStep1 + v4)
		end
	end
	
	local v8 = true
	local config = {
		[Enum.KeyCode.Thumbstick1] = true,
		[Enum.KeyCode.DPadLeft] = -1,
		[Enum.KeyCode.DPadRight] = 1,
		[Enum.KeyCode.Left] = -1,
		[Enum.KeyCode.Right] = 1,
		[Enum.KeyCode.A] = -1,
		[Enum.KeyCode.D] = 1,
		[Enum.KeyCode.ButtonA] = true
	}
	UserInputService.InputBegan:Connect(function(Input)
		-- upvalues: Selectable (ref), v8 (ref), GuiService (upval), t (copy), config (copy), v4 (ref), setCurrentStep (copy), CurrentStep1 (ref)
		if not Selectable then return end
		if not v8 then return end
		if Input.UserInputType ~= Enum.UserInputType.Gamepad1 and Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local SelectedCoreObject = GuiService.SelectedCoreObject
		
		if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if config[Input.KeyCode] == -1 then
			v4 = -1
			setCurrentStep(CurrentStep1 - 1)
			
			return
		end
		if config[Input.KeyCode] == 1 then
			v4 = 1
			setCurrentStep(CurrentStep1 + 1)
		end
	end)
	UserInputService.InputEnded:Connect(function(Input)
		-- upvalues: Selectable (ref), GuiService (upval), t (copy), config (copy), v4 (ref)
		if not Selectable then return end
		if Input.UserInputType ~= Enum.UserInputType.Gamepad1 and Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local SelectedCoreObject = GuiService.SelectedCoreObject
		
		if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if config[Input.KeyCode] then
			v4 = 0
		end
	end)
	UserInputService.InputChanged:Connect(function(Input)
		-- upvalues: Selectable (ref), v4 (ref), v8 (ref), GuiService (upval), t (copy), setCurrentStep (copy), CurrentStep1 (ref)
		if not Selectable then
			v4 = 0
			
			return
		end
		if not v8 then
			v4 = 0
			
			return
		end
		if Input.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		local SelectedCoreObject = GuiService.SelectedCoreObject
		
		if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if Input.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		if Input.Position.X > 0.8 and Input.Delta.X > 0 and v4 ~= 1 then
			v4 = 1
			setCurrentStep(CurrentStep1 + 1)
			
			return
		end
		if Input.Position.X < -0.8 and Input.Delta.X < 0 and v4 ~= -1 then
			v4 = -1
			setCurrentStep(CurrentStep1 - 1)
			
			return
		end
		if math.abs(Input.Position.X) < 0.8 then
			v4 = 0
		end
	end)
	local Flag = false
	GuiService.Changed:Connect(function(p12)
		-- upvalues: GuiService (upval), t (copy), Flag (ref), CurrentTime (ref), RunService (upval), Guid (copy), v245 (copy)
		if p12 ~= "SelectedCoreObject" then return end
		local SelectedCoreObject = GuiService.SelectedCoreObject
		
		if SelectedCoreObject and SelectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then
			if not Flag then
				Flag = true
				CurrentTime = tick()
				RunService:BindToRenderStep(Guid, Enum.RenderPriority.Input.Value + 1, v245)
				
				return
			end
		elseif Flag then
			Flag = false
			RunService:UnbindFromRenderStep(Guid)
		end
	end)
	t.SliderFrame.AncestryChanged:Connect(function(_, NewParent)
		-- upvalues: v8 (ref)
		v8 = NewParent
	end)
	setCurrentStep(CurrentStep1)
	
	return t
end

local YOffset: number = if IsEnabled then 90 else 50
local Totals = {}

local function AddNewRow(Key, Text, p12, p13, p14, Amount: number, Text1, p15, p16, Interactable)
	-- upvalues: Totals (copy), CreateFunction (copy), YOffset (ref), SelectionImageObject (copy), ThemeModule (copy), IsEnabled (copy), GuiService (copy), t (copy), CreateNewSlider (copy), CreateSelector (copy), CreateDropDown (copy), VRService (copy), UserInputService (copy), CoreGui (copy)
	local YOffset1 = 0
	local IsNotTextBox = p12 ~= "TextBox"
	
	if Totals[Key] then
		YOffset1 = Totals[Key]
	end
	local Parent = nil
	Parent = CreateFunction("ImageButton")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 1,
		Active = false,
		AutoButtonColor = false,
		ZIndex = 2,
		Selectable = false,
		Name = Text .. "Frame",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(2, 2, 18, 18),
		Size = UDim2.new(1, 0, 0, YOffset),
		AutomaticSize = if Text1 or p15 or p16 then Enum.AutomaticSize.Y else nil,
		Position = UDim2.new(0, 0, 0, YOffset1),
		SelectionImageObject = SelectionImageObject,
		Parent = Key.Page
	})
	Parent.BackgroundColor3 = ThemeModule.color("RowFrameBackground")
	Parent.ImageColor3 = Parent.BackgroundColor3
	CreateFunction("UICorner")({
		CornerRadius = ThemeModule.DefaultCornerRadius,
		Parent = Parent
	})
	
	if Parent and Amount then
		Parent.Position = UDim2.new(Parent.Position.X.Scale, Parent.Position.X.Offset, Parent.Position.Y.Scale, Parent.Position.Y.Offset + Amount)
	end
	local Label = nil
	
	if Text1 then
		local Parent1 = CreateFunction("Frame")({
			BackgroundTransparency = 1,
			Name = Text .. "RowLabelAndDescriptionFrame",
			Position = UDim2.new(0, 10, 0, 0),
			Size = UDim2.new(0.4, -20, 0, 50),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = Parent
		})
		Label = CreateFunction("TextLabel")({
			BackgroundTransparency = 1,
			TextWrapped = true,
			ZIndex = 2,
			LayoutOrder = 1,
			Name = Text .. "Label",
			Text = Text,
			Font = ThemeModule.font(Enum.Font.SourceSansBold, "UtilityRow"),
			TextSize = ThemeModule.textSize(16, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = Parent1
		})
		CreateFunction("TextLabel")({
			TextTransparency = 0.25,
			TextWrapped = true,
			BackgroundTransparency = 1,
			ZIndex = 2,
			LayoutOrder = 2,
			Name = Text .. "Description",
			Text = Text1,
			Font = ThemeModule.font(Enum.Font.SourceSans, "UtilityRow"),
			TextSize = ThemeModule.textSize(18, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = Parent1
		})
		CreateFunction("UIListLayout")({
			Name = Text .. "UIListLayout",
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
			Parent = Parent1
		})
		CreateFunction("UIPadding")({
			Name = Text .. "UIListLayout",
			PaddingBottom = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			Parent = Parent1
		})
	else
		Label = CreateFunction("TextLabel")({
			TextWrapped = true,
			BackgroundTransparency = 1,
			ZIndex = 2,
			Name = Text .. "Label",
			Text = Text,
			Font = ThemeModule.font(Enum.Font.SourceSansBold, "UtilityRow"),
			TextSize = ThemeModule.textSize(16, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0.4, -20, 1, 0),
			Position = UDim2.new(0, 10, 0, 0),
			Parent = Parent
		})
		CreateFunction("UIPadding")({
			Name = Text .. "UIPadding",
			PaddingBottom = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			Parent = Label
		})
	end
	if not IsNotTextBox then
		Label.Text = ""
	end
	local function onResized(_, p17)
		-- upvalues: Label (ref), ThemeModule (upval), IsEnabled (upval)
		if p17 then
			Label.TextSize = ThemeModule.textSize(16, "UtilityRow")
			
			return
		else
			Label.TextSize = IsEnabled and ThemeModule.textSize(36) or ThemeModule.textSize(24, "UtilityText")
		end
	end
	
	local _ = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	local _Vector2 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	
	if _Vector2.Y > _Vector2.X then
		Label.TextSize = ThemeModule.textSize(16, "UtilityRow")
	else
		Label.TextSize = IsEnabled and ThemeModule.textSize(36) or ThemeModule.textSize(24, "UtilityText")
	end
	t[Parent] = onResized
	local _ = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	local _Vector21 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	
	if _Vector21.Y > _Vector21.X then
		Label.TextSize = ThemeModule.textSize(16, "UtilityRow")
	else
		Label.TextSize = IsEnabled and ThemeModule.textSize(36) or ThemeModule.textSize(24, "UtilityText")
	end
	local DropDownFrame = nil
	local Config = nil
	
	if p12 == "Slider" then
		Config = CreateNewSlider(p13, p14, nil, p15, p16)
		Config.SliderFrame.Parent = Parent
		DropDownFrame = Config.SliderFrame
	elseif p12 == "Selector" then
		Config = CreateSelector(p13, p14)
		Config.SelectorFrame.Parent = Parent
		DropDownFrame = Config.SelectorFrame
	elseif p12 == "DropDown" then
		Config = CreateDropDown(p13, p14, Key.HubRef)
		Config.DropDownFrame.Parent = Parent
		DropDownFrame = Config.DropDownFrame
	elseif p12 == "TextBox" then
		local SelectionImageObject1 = CreateFunction("ImageLabel")({ Image = "", BackgroundTransparency = 1 })
		Config = { HubRef = nil }
		local TextBox = CreateFunction("TextBox")({
			BorderSizePixel = 0,
			TextWrapped = true,
			ZIndex = 2,
			ClearTextOnFocus = false,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0.6, 0, 1, 0),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = Text,
			TextColor3 = Color3.fromRGB(49, 49, 49),
			BackgroundTransparency = ThemeModule.transparency("ControlInputBackground", 0.5),
			TextYAlignment = Enum.TextYAlignment.Top,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = ThemeModule.font(Enum.Font.SourceSans, "UtilityText"),
			TextSize = ThemeModule.textSize(24, "UtilityText"),
			SelectionImageObject = SelectionImageObject1,
			Interactable = Interactable,
			Parent = Parent
		})
		DropDownFrame = TextBox
		TextBox.Focused:Connect(function()
			-- upvalues: VRService (upval), UserInputService (upval), GuiService (upval), TextBox (copy), Text (copy)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				GuiService.SelectedCoreObject = TextBox
			end
			if TextBox.Text == Text then
				TextBox.Text = ""
			end
		end)
		
		if Amount then
			TextBox.Position = UDim2.new(TextBox.Position.X.Scale, TextBox.Position.X.Offset, TextBox.Position.Y.Scale, TextBox.Position.Y.Offset + Amount)
		end
		DropDownFrame.SelectionGained:Connect(function()
			-- upvalues: VRService (upval), UserInputService (upval), TextBox (copy), ThemeModule (upval), Config (ref), DropDownFrame (ref)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				TextBox.BackgroundTransparency = ThemeModule.transparency("ControlInputBackground", 0.1)
				
				if Config.HubRef then
					Config.HubRef:ScrollToFrame(DropDownFrame)
				end
			end
		end)
		DropDownFrame.SelectionLost:Connect(function()
			-- upvalues: VRService (upval), UserInputService (upval), TextBox (copy), ThemeModule (upval)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				TextBox.BackgroundTransparency = ThemeModule.transparency("ControlInputBackground", 0.5)
			end
		end)
		
		local function processInput(Input)
			-- upvalues: GuiService (upval), DropDownFrame (ref), TextBox (copy)
			if Input.UserInputState == Enum.UserInputState.Begin and Input.KeyCode == Enum.KeyCode.Return and GuiService.SelectedCoreObject == DropDownFrame then
				TextBox:CaptureFocus()
			end
		end
		
		TextBox.MouseEnter:Connect(function()
			-- upvalues: CoreGui (upval), DropDownFrame (ref), VRService (upval), UserInputService (upval), Key (copy), GuiService (upval)
			local DropDownFullscreenFrame = CoreGui.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if DropDownFullscreenFrame and DropDownFullscreenFrame.Visible then return end
			local SelectedCoreObject = DropDownFrame
			
			if SelectedCoreObject and SelectedCoreObject.Visible and SelectedCoreObject.ZIndex > 1 and (not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) and Key.Active) then
				GuiService.SelectedCoreObject = SelectedCoreObject
			end
		end)
		UserInputService.InputBegan:Connect(processInput)
	elseif p12 == "TextEntry" then
		local SelectionImageObject2 = CreateFunction("ImageLabel")({ Image = "", BackgroundTransparency = 1 })
		Config = { HubRef = nil }
		local TextBox1 = CreateFunction("TextBox")({
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextWrapped = false,
			ZIndex = 2,
			ClearTextOnFocus = false,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0.4, -10, 0, 40),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = Text,
			TextColor3 = Color3.fromRGB(178, 178, 178),
			TextYAlignment = Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = ThemeModule.font(Enum.Font.SourceSans, "UtilityText"),
			TextSize = ThemeModule.textSize(24, "UtilityText"),
			SelectionImageObject = SelectionImageObject2,
			Parent = Parent
		})
		DropDownFrame = TextBox1
		TextBox1.Focused:Connect(function()
			-- upvalues: VRService (upval), UserInputService (upval), GuiService (upval), TextBox1 (copy), Text (copy)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				GuiService.SelectedCoreObject = TextBox1
			end
			if TextBox1.Text == Text then
				TextBox1.Text = ""
			end
		end)
		
		if Amount then
			TextBox1.Position = UDim2.new(TextBox1.Position.X.Scale, TextBox1.Position.X.Offset, TextBox1.Position.Y.Scale, TextBox1.Position.Y.Offset + Amount)
		end
		DropDownFrame.SelectionGained:Connect(function()
			-- upvalues: VRService (upval), UserInputService (upval), TextBox1 (copy), Config (ref), DropDownFrame (ref)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				TextBox1.BackgroundTransparency = 0.8
				
				if Config.HubRef then
					Config.HubRef:ScrollToFrame(DropDownFrame)
				end
			end
		end)
		DropDownFrame.SelectionLost:Connect(function()
			-- upvalues: VRService (upval), UserInputService (upval), TextBox1 (copy)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				TextBox1.BackgroundTransparency = 1
			end
		end)
		
		local function processInput(Input)
			-- upvalues: GuiService (upval), DropDownFrame (ref), TextBox1 (copy)
			if Input.UserInputState == Enum.UserInputState.Begin and Input.KeyCode == Enum.KeyCode.Return and GuiService.SelectedCoreObject == DropDownFrame then
				TextBox1:CaptureFocus()
			end
		end
		
		Parent.MouseEnter:Connect(function()
			-- upvalues: CoreGui (upval), DropDownFrame (ref), VRService (upval), UserInputService (upval), Key (copy), GuiService (upval)
			local DropDownFullscreenFrame = CoreGui.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if DropDownFullscreenFrame and DropDownFullscreenFrame.Visible then return end
			local SelectedCoreObject = DropDownFrame
			
			if SelectedCoreObject and SelectedCoreObject.Visible and SelectedCoreObject.ZIndex > 1 and (not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) and Key.Active) then
				GuiService.SelectedCoreObject = SelectedCoreObject
			end
		end)
		
		function Config:SetZIndex(ZIndex)
			-- upvalues: TextBox1 (copy)
			TextBox1.ZIndex = ZIndex
		end
		
		function Config:SetInteractable(Selectable)
			-- upvalues: TextBox1 (copy)
			TextBox1.Selectable = Selectable
			
			if Selectable then
				TextBox1.TextColor3 = Color3.fromRGB(178, 178, 178)
				TextBox1.ZIndex = 2
				
				return
			else
				TextBox1.TextColor3 = Color3.fromRGB(49, 49, 49)
				TextBox1.ZIndex = 1
			end
		end
		
		function Config:SetValue(Text)
			-- upvalues: TextBox1 (copy)
			TextBox1.Text = Text
		end
		
		local ValueChanged = Instance.new("BindableEvent")
		ValueChanged.Name = "ValueChanged"
		TextBox1.FocusLost:Connect(function()
			-- upvalues: ValueChanged (copy), TextBox1 (copy)
			ValueChanged:Fire(TextBox1.Text)
		end)
		Config.ValueChanged = ValueChanged.Event
		UserInputService.InputBegan:Connect(processInput)
	end
	Config.Name = Text .. "ValueChanger"
	local SetAutoLocalizeFunction = Config.SetAutoLocalize
	
	function Config.SetAutoLocalize(p17, AutoLocalize)
		-- upvalues: Parent (ref), SetAutoLocalizeFunction (copy)
		Parent.AutoLocalize = AutoLocalize
		
		if SetAutoLocalizeFunction then
			SetAutoLocalizeFunction(p17, AutoLocalize)
		end
	end
	
	local NewYOffset = YOffset1 + YOffset
	
	if Amount then
		NewYOffset += Amount
	end
	Totals[Key] = NewYOffset
	
	if IsNotTextBox then
		Parent.MouseEnter:Connect(function()
			-- upvalues: CoreGui (upval), Config (ref), VRService (upval), UserInputService (upval), Key (copy), GuiService (upval)
			local DropDownFullscreenFrame = CoreGui.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if DropDownFullscreenFrame and DropDownFullscreenFrame.Visible then return end
			local SliderFrame = Config.SliderFrame or Config.SliderFrame or Config.DropDownFrame or Config.SelectorFrame
			
			if SliderFrame and SliderFrame.Visible and SliderFrame.ZIndex > 1 and (not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) and Key.Active) then
				GuiService.SelectedCoreObject = SliderFrame
			end
		end)
		VRService.Changed:Connect(function(p17)
			-- upvalues: VRService (upval), Parent (ref), DropDownFrame (ref), GuiService (upval), ThemeModule (upval)
			if p17 == "VREnabled" then
				if VRService.VREnabled then
					Parent.Selectable = true
					Parent.Active = true
					DropDownFrame.Active = true
					GuiService.Changed:Connect(function(p18)
						-- upvalues: GuiService (upval), Parent (upval), ThemeModule (upval)
						if p18 == "SelectedCoreObject" then
							local SelectedCoreObject = GuiService.SelectedCoreObject
							
							if SelectedCoreObject and (SelectedCoreObject == Parent or SelectedCoreObject:IsDescendantOf(Parent)) then
								Parent.ImageTransparency = ThemeModule.transparency("RowFrameBackground", 0.5)
								Parent.BackgroundTransparency = 1
								
								return
							end
							Parent.ImageTransparency = 1
							Parent.BackgroundTransparency = 1
						end
					end)
					
					return
				else
					Parent.Selectable = false
					Parent.Active = false
				end
			end
		end)
		
		if VRService.VREnabled then
			Parent.Selectable = true
			Parent.Active = true
			DropDownFrame.Active = true
			GuiService.Changed:Connect(function(p17)
				-- upvalues: GuiService (upval), Parent (ref), ThemeModule (upval)
				if p17 == "SelectedCoreObject" then
					local SelectedCoreObject = GuiService.SelectedCoreObject
					
					if SelectedCoreObject and (SelectedCoreObject == Parent or SelectedCoreObject:IsDescendantOf(Parent)) then
						Parent.ImageTransparency = ThemeModule.transparency("RowFrameBackground", 0.5)
						Parent.BackgroundTransparency = 1
						
						return
					end
					Parent.ImageTransparency = 1
					Parent.BackgroundTransparency = 1
				end
			end)
		else
			Parent.Selectable = false
			Parent.Active = false
		end
		DropDownFrame.SelectionGained:Connect(function()
			-- upvalues: VRService (upval), UserInputService (upval), Parent (ref), ThemeModule (upval), Config (ref)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				if VRService.VREnabled then
					Parent.ImageTransparency = 0.5
					Parent.BackgroundTransparency = 1
				else
					Parent.ImageTransparency = 1
					Parent.BackgroundTransparency = ThemeModule.transparency("RowFrameBackground", 0.5)
				end
				if Config.HubRef then
					Config.HubRef:ScrollToFrame(Parent)
				end
			end
		end)
		DropDownFrame.SelectionLost:Connect(function()
			-- upvalues: VRService (upval), UserInputService (upval), Parent (ref)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled) then
				Parent.ImageTransparency = 1
				Parent.BackgroundTransparency = 1
			end
		end)
	end
	Key:AddRow(Parent, Label, Config, Amount, false)
	Config.Selection = DropDownFrame
	
	return Parent, Label, Config
end

local function AddNewRowObject(Key, Text, Gui, Amount, p12)
	-- upvalues: Totals (copy), CreateFunction (copy), YOffset (ref), SelectionImageObject (copy), ThemeModule (copy), IsEnabled (copy), t (copy), GuiService (copy), VRService (copy)
	local Total = if Totals[Key] then Totals[Key] else 0
	local Image = CreateFunction("ImageButton")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 1,
		Active = false,
		AutoButtonColor = false,
		ZIndex = 2,
		Selectable = false,
		Name = Text .. "Frame",
		AutomaticSize = Enum.AutomaticSize.Y,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10),
		Size = UDim2.new(1, 0, 0, YOffset),
		Position = UDim2.new(0, 0, 0, Total),
		SelectionImageObject = SelectionImageObject,
		Parent = Key.Page
	})
	Image.BackgroundColor3 = ThemeModule.color("RowFrameBackground")
	Image.ImageColor3 = Image.BackgroundColor3
	Image.SelectionGained:Connect(function()
		-- upvalues: Image (copy), ThemeModule (upval)
		Image.BackgroundTransparency = ThemeModule.transparency("RowFrameBackground", 0.5)
	end)
	Image.SelectionLost:Connect(function()
		-- upvalues: Image (copy)
		Image.BackgroundTransparency = 1
	end)
	CreateFunction("UICorner")({
		CornerRadius = ThemeModule.DefaultCornerRadius,
		Parent = Image
	})
	local Label = CreateFunction("TextLabel")({
		TextWrapped = true,
		BackgroundTransparency = 1,
		ZIndex = 2,
		Name = Text .. "Label",
		Text = Text,
		Font = ThemeModule.font(Enum.Font.SourceSansBold, "UtilityRow"),
		TextSize = ThemeModule.textSize(16, "UtilityRow"),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(0.4, -20, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		Parent = Image
	})
	CreateFunction("UIPadding")({
		Name = Text .. "UIPadding",
		PaddingBottom = UDim.new(0, 10),
		PaddingTop = UDim.new(0, 10),
		Parent = Label
	})
	
	local function onResized(_, IsXBelow)
		-- upvalues: p12 (copy), Label (copy), ThemeModule (upval), IsEnabled (upval)
		if p12 then
			UDim2.new(0, 200, 1, 0)
		end
		if IsXBelow then
			Label.TextSize = ThemeModule.textSize(16, "UtilityRow")
			
			return
		else
			Label.TextSize = IsEnabled and ThemeModule.textSize(36) or ThemeModule.textSize(24, "UtilityText")
		end
	end
	
	t[Image] = onResized
	local _Vector2 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	onResized(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport(), _Vector2.X < _Vector2.Y)
	
	if Amount then
		Image.Position = UDim2.new(Image.Position.X.Scale, Image.Position.X.Offset, Image.Position.Y.Scale, Image.Position.Y.Offset + Amount)
	end
	local NewTotal = Total + YOffset
	
	if Amount then
		NewTotal += Amount
	end
	Totals[Key] = NewTotal
	Image.MouseEnter:Connect(function()
		-- upvalues: Image (copy), GuiService (upval)
		if Image.Visible then
			GuiService.SelectedCoreObject = Image
		end
	end)
	Gui.SelectionImageObject = SelectionImageObject
	Gui.SelectionGained:Connect(function()
		-- upvalues: VRService (upval), Image (copy), ThemeModule (upval)
		if VRService.VREnabled then
			Image.ImageTransparency = ThemeModule.transparency("RowFrameBackground", 0.5)
			Image.BackgroundTransparency = 1
			
			return
		else
			Image.ImageTransparency = 1
			Image.BackgroundTransparency = ThemeModule.transparency("RowFrameBackground", 0.5)
		end
	end)
	Gui.SelectionLost:Connect(function()
		-- upvalues: Image (copy)
		Image.ImageTransparency = 1
		Image.BackgroundTransparency = 1
	end)
	Gui.Parent = Image
	Key:AddRow(Image, Label, Gui, Amount, true)
	
	return Image
end

local UtilityModule = {
	GetEaseLinear = function(_)
		-- upvalues: Linear (copy)
		return Linear
	end,
	GetEaseOutQuad = function(_)
		-- upvalues: EaseOutQuad (copy)
		return EaseOutQuad
	end,
	GetEaseInOutQuad = function(_)
		-- upvalues: EaseInOutQuad (copy)
		return EaseInOutQuad
	end,
	CreateNewSlider = function(_, p12, p13, MinStep, p14, p15)
		-- upvalues: CreateNewSlider (copy)
		return CreateNewSlider(p12, p13, MinStep, p14, p15)
	end,
	CreateNewSelector = function(_, p12, p13)
		-- upvalues: CreateSelector (copy)
		return (CreateSelector(p12, p13))
	end,
	CreateNewDropDown = function(_, p12, p13)
		-- upvalues: CreateDropDown (copy)
		return (CreateDropDown(p12, p13, nil))
	end,
	AddNewRow = function(_, p12, p13, p14, p15, p16, p17, p18, p19, p20, Interactable)
		-- upvalues: AddNewRow (copy)
		return AddNewRow(p12, p13, p14, p15, p16, p17, p18, p19, p20, Interactable)
	end,
	AddNewRowObject = function(_, p12, p13, p14, p15, p16)
		-- upvalues: AddNewRowObject (copy)
		return (AddNewRowObject(p12, p13, p14, p15, p16))
	end,
	ShowAlert = function(_, p12, p13, p14, p15, p16)
		-- upvalues: ShowAlert (copy)
		ShowAlert(p12, p13, p14, p15, p16)
	end,
	IsSmallTouchScreen = function(_): boolean
		-- upvalues: GuiService (copy), UserInputService (copy)
		local _Vector2 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
		
		return UserInputService.TouchEnabled and (_Vector2.Y < 500 or _Vector2.X < 700)
	end,
	IsPortrait = function(_): boolean
		-- upvalues: GuiService (copy)
		local _Vector2 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
		
		return _Vector2.X < _Vector2.Y
	end
}

if FFlagRefactorMenuConfirmationButtonsModule or FFlagAddNextUpContainerModule then
	local _ = function()
		-- upvalues: config (copy), UserInputService (copy)
		return config[UserInputService:GetLastInputType()] or false
	end
	
	function UtilityModule:IsUsingGamepad()
		-- upvalues: config (copy), UserInputService (copy)
		return config[UserInputService:GetLastInputType()] or false
	end
end
function UtilityModule:MakeStyledButton(p12, p13, p14, p15, p16, p17)
	-- upvalues: MakeButton (copy)
	return MakeButton(p12, p13, p14, p15, p16, p17)
end

function UtilityModule:MakeStyledImageButton(p12, Image, p13, Size, p14, p15, p16, p17)
	-- upvalues: MakeImageButton (copy)
	return MakeImageButton(p12, Image, p13, Size, p14, p15, p16, p17)
end

function UtilityModule:AddButtonRow(p12, p13, p14, p15, p16, p17)
	-- upvalues: AddButtonRow (copy)
	return AddButtonRow(p12, p13, p14, p15, p16, p17)
end

function UtilityModule:MakeFocusState(p12, ActionName)
	-- upvalues: MakeRoundedRectFocusState (copy)
	return MakeRoundedRectFocusState(p12, ActionName)
end

function UtilityModule:CreateSignal()
	-- upvalues: CreateSignal (copy)
	return (CreateSignal())
end

function UtilityModule:UsesSelectedObject()
	-- upvalues: VRService (copy), UserInputService (copy)
	return not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or UserInputService.GamepadEnabled)
end

function UtilityModule:TweenProperty(p12, p13, p14, p15, p16, p17, p18)
	return PropertyTweener(p12, p13, p14, p15, p16, p17, p18)
end

function UtilityModule:OnResized(p12, p13)
	-- upvalues: addOnResizedCallback (copy)
	return addOnResizedCallback(p12, p13)
end

function UtilityModule:FireOnResized()
	-- upvalues: GuiService (copy), UtilityModule (copy), t (copy)
	local _Vector2 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else GuiService:GetHardwareSafeViewport()
	local IsPortrait = UtilityModule:IsPortrait()
	
	for _, value in pairs(t) do
		value(_Vector2, IsPortrait)
	end
end

function UtilityModule:Lerp(p12: number, p13, p14)
	return (1 - p12) * p13 + p12 * p14
end

function UtilityModule:Round(Value: number): number
	return Value % 1 >= 0.5 and math.ceil(Value) or math.floor(Value)
end

function UtilityModule:IsExperienceOlderThanOneWeek(p12): boolean
	-- upvalues: Workspace (copy)
	return p12 ~= nil and p12.Created ~= nil and Workspace:GetServerTimeNow() * 1000 - DateTime.fromIsoDate(p12.Created).UnixTimestampMillis > 604800000
end

return UtilityModule