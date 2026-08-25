local themeModule = require(script.Parent.Theme)
local SELECTED_COLOR = themeModule.color("SELECTED_COLOR", Color3.fromRGB(0, 162, 255))
local NON_SELECTED_COLOR = themeModule.color("NON_SELECTED_COLOR", Color3.fromRGB(78, 84, 96))
local ARROW_COLOR = themeModule.color("ARROW_COLOR", Color3.fromRGB(204, 204, 204))
local ARROW_COLOR_HOVER = themeModule.color("ARROW_COLOR_HOVER", Color3.fromRGB(255, 255, 255))
local ARROW_COLOR_INACTIVE = themeModule.color("ARROW_COLOR_INACTIVE", Color3.fromRGB(150, 150, 150))
local uDim = UDim.new(0, 14)
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:FindFirstChild("RobloxGui")
local contextActionService = game:GetService("ContextActionService")
local VRService = game:GetService("VRService")
local workspaceService = game:GetService("Workspace")
local corePackagesService = game:GetService("CorePackages")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local fFlagRefactorMenuConfirmationButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local repositionDropDownScrim = game:DefineFastFlag("RepositionDropDownScrim", false)
local chrome = robloxGui.Modules.Chrome
local var20 = if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then require(chrome.Service) else nil
local signalsModule = require(corePackagesService.Packages.Signals)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local fFlagHideShortcutsWhileIemDropdownActive = require(chrome.Flags).FFlagHideShortcutsWhileIemDropdownActive
local enablePreferredTextSizeAccessGuiServiceEngineFeature = game:GetEngineFeature("EnablePreferredTextSizeAccessGuiService")
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local increaseLegacyPeopleRowButtonSize = game:DefineFastFlag("IncreaseLegacyPeopleRowButtonSize", false)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local corePackagesService_1 = game:GetService("CorePackages")
local appCommonLibModule = require(corePackagesService_1.Workspace.Packages.AppCommonLib)
local signal = appCommonLibModule.Signal
local create = appCommonLibModule.Create
local builderIconsModule = require(corePackagesService_1.Packages.BuilderIcons)
local migration = builderIconsModule.Migration
local var29 = require(robloxGui.Modules:WaitForChild("TenFootInterface")):IsEnabled()
local var30 = signalsModule.createComputed(function(p0)
	-- upvalues: responsiveModule (ref)
	return responsiveModule.GetInputModeStore(p0).getLastInputType(p0) == responsiveModule.Input.Touch
end)
local var31 = signalsModule.createComputed(function(p1)
	-- upvalues: responsiveModule (ref)
	return responsiveModule.GetInputModeStore(p1).getLastInputType(p1) == responsiveModule.Input.Pointer
end)
local t = {}
setmetatable(t, { __mode = "k" })
local var33 = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 })

function clamp(value, minValue, maxValue)
	return math.max(value, math.min(minValue, maxValue))
end

local function Linear(p2, p3, p4, p5)
	return if p5 <= p2 then p3 + p4 else p4 * p2 / p5 + p3
end

local function EaseOutQuad(p6, p7, p8, p9)
	if p9 <= p6 then
		return p7 + p8
	end
	p6 /= p9
	
	return p7 - p8 * p6 * (p6 - 2)
end

local function EaseInOutQuad(p10, p11, p12, p13)
	if p13 <= p10 then
		return p11 + p12
	end
	p10 /= p13
	
	return if p10 < 0.5 then 2 * p12 * p10 * p10 + p11 else p11 + p12 * (2 * (2 - p10) * p10 - 1)
end

function PropertyTweener(p14, p15, p16, p17, p18, p19, p20)
	-- upvalues: runService (ref)
	local t = { StartTime = tick() }
	t.EndTime = t.StartTime + p18
	t.Cancelled = false
	local var56 = false
	local var57 = 0
	
	local function _()
		-- upvalues: p14 (ref), p15 (ref), p19 (ref), p16 (ref), p17 (ref), var56 (write), var57 (write), p20 (ref)
		if p14 then
			p14[p15] = p19(1, p16, p17 - p16, 1)
		end
		var56 = true
		var57 = 1
		
		if p20 then
			p20()
		end
	end
	
	p14[p15] = p19(0, p16, p17 - p16, p18)
	coroutine.wrap(function()
		-- upvalues: t (ref), p14 (ref), p15 (ref), p19 (ref), p16 (ref), p17 (ref), p18 (ref), var57 (write), runService (copy), var56 (write), p20 (ref)
		local currentTime = tick()
		while currentTime < t.EndTime and p14 do
			if not t.Cancelled then
				p14[p15] = p19(currentTime - t.StartTime, p16, p17 - p16, p18)
				var57 = clamp(0, 1, (currentTime - t.StartTime) / p18)
				runService.RenderStepped:Wait()
				currentTime = tick()
				continue
			end
			return
		end
		if t.Cancelled == false and p14 then
			if p14 then
				p14[p15] = p19(1, p16, p17 - p16, 1)
			end
			var56 = true
			var57 = 1
			
			if p20 then
				p20()
			end
		end
	end)()
	
	function t.GetFinal(_)
		-- upvalues: p17 (ref)
		return p17
	end
	
	function t.GetPercentComplete(_)
		-- upvalues: var57 (write)
		return var57
	end
	
	function t.IsFinished(_)
		-- upvalues: var56 (write)
		return var56
	end
	
	function t.Finish(p21)
		-- upvalues: var56 (write), p14 (ref), p15 (ref), p19 (ref), p16 (ref), p17 (ref), var57 (write), p20 (ref)
		if not var56 then
			p21:Cancel()
			
			if p14 then
				p14[p15] = p19(1, p16, p17 - p16, 1)
			end
			var56 = true
			var57 = 1
			
			if p20 then
				p20()
			end
		end
	end
	
	function t.Cancel(_)
		-- upvalues: t (ref)
		t.Cancelled = true
	end
	
	return t
end

local function _()
	-- upvalues: userInputService (ref)
	return userInputService.PreferredInput == Enum.PreferredInput.Touch
end

local function CreateSignal()
	local t = {}
	local bindableEvent = Instance.new("BindableEvent")
	local var61 = nil
	local var62 = nil
	
	function t.fire(_, ...)
		-- upvalues: var61 (write), var62 (write), bindableEvent (ref)
		var61 = { ... }
		var62 = select("#", ...)
		bindableEvent:Fire()
	end
	
	function t.connect(_, p22)
		-- upvalues: bindableEvent (ref), var61 (write), var62 (write)
		if not p22 then
			error("connect(nil)", 2)
		end
		return bindableEvent.Event:Connect(function()
			-- upvalues: p22 (ref), var61 (copy), var62 (copy)
			p22(unpack(var61, 1, var62))
		end)
	end
	
	function t.wait(_)
		-- upvalues: bindableEvent (ref), var61 (write), var62 (write)
		bindableEvent.Event:wait()
		
		if not var61 then
			error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
		end
		return unpack(var61, 1, var62)
	end
	
	return t
end

local _ = function()
	-- upvalues: guiService (ref)
	return if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
end

local _ = function()
	-- upvalues: guiService (ref), userInputService (ref)
	local var63 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	return userInputService.TouchEnabled and (if var63.Y >= 500 then var63.X < 700 else true)
end

local _ = function()
	-- upvalues: guiService (ref)
	local var64 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	return var64.X < var64.Y
end

local _ = function()
	-- upvalues: var29 (ref)
	return var29
end

local _ = function()
	-- upvalues: VRService (ref), userInputService (ref)
	return if VRService.VREnabled then false else userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled
end

local function addHoverState(p23, p24, p25, p26)
	local function onNormalButtonStateCallback()
		-- upvalues: p23 (ref), p25 (ref), p24 (ref)
		if p23.Active then
			p25(p24)
		end
	end
	
	local function onHoverButtonStateCallback()
		-- upvalues: p23 (ref), p26 (ref), p24 (ref)
		if p23.Active then
			p26(p24)
		end
	end
	
	p23.MouseEnter:Connect(onHoverButtonStateCallback)
	p23.SelectionGained:Connect(onHoverButtonStateCallback)
	p23.MouseLeave:Connect(onNormalButtonStateCallback)
	p23.SelectionLost:Connect(onNormalButtonStateCallback)
	p25(p24)
end

local function addOnResizedCallback(p27, p28)
	-- upvalues: t (ref), guiService (ref)
	t[p27] = p28
	local var67 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	p28(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport(), var67.X < var67.Y)
end

local t_1 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}

local function MakeDefaultButton(p29, p30, p31, p32, p33, p34)
	-- upvalues: create (ref), themeModule (ref), t_1 (ref), userInputService (ref), guiService (ref), VRService (ref)
	local var68 = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 })
	local _ = nil
	local _ = nil
	local var69 = "DefaultButtonStroke"
	local var70 = "DefaultButton"
	
	if p29 == "DropDownFrame" then
		var69 = "ControlInputStroke"
		var70 = "ControlInputBackground"
	end
	if p34 == "ImageButton" then
		var70 = "ImageButton"
	end
	local var71 = create("ImageButton")({
		AutoButtonColor = false,
		ZIndex = 2,
		Name = p29 .. "Button",
		BackgroundColor3 = themeModule.color(var70),
		BackgroundTransparency = themeModule.transparency(var70),
		Size = p30,
		SelectionImageObject = var68
	})
	create("UICorner")({
		CornerRadius = themeModule.DefaultCornerRadius,
		Parent = var71
	})
	local var72 = create("UIStroke")({
		Name = "Border",
		Color = themeModule.color(var69),
		Transparency = themeModule.transparency(var69),
		Thickness = themeModule.DefaultStokeThickness,
		Parent = var71
	})
	local _ = create("BoolValue")({ Name = "Enabled", Value = true, Parent = var71 })
	
	if p31 then
		var71.MouseButton1Click:Connect(function()
			-- upvalues: p31 (ref), t_1 (copy), userInputService (copy)
			p31(t_1[userInputService:GetLastInputType()] or false)
		end)
	elseif var72 then
		var72.Enabled = false
	end
	var71.Selectable = false
	local function _(p35)
		return if p35.UserInputType ~= Enum.UserInputType.MouseMovement then p35.UserInputType == Enum.UserInputType.Touch else true
	end
	
	local var73 = nil
	
	local function setRowRef(value)
		-- upvalues: var73 (write)
		var73 = value
	end
	
	local function selectButton()
		-- upvalues: p33 (ref), p32 (ref), var71 (write), themeModule (copy), var73 (write)
		local var76 = p33
		
		if var76 == nil and p32 then
			var76 = p32.HubRef
		end
		if var76 and var76.Active or var76 == nil then
			var71.BackgroundColor3 = themeModule.color("DefaultButtonHover")
			var71.BackgroundTransparency = themeModule.transparency("DefaultButtonHover")
			local var77 = var73 or var71
			
			if var76 then
				var76:ScrollToFrame(var77)
			end
		end
	end
	
	local _ = function()
		-- upvalues: var71 (write), themeModule (copy), var70 (write)
		var71.BackgroundColor3 = themeModule.color(var70)
		var71.BackgroundTransparency = themeModule.transparency(var70)
	end
	
	var71.InputBegan:Connect(function(p36)
		-- upvalues: var71 (write), selectButton (ref)
		if var71.Selectable then
			if if p36.UserInputType ~= Enum.UserInputType.MouseMovement then p36.UserInputType == Enum.UserInputType.Touch else true then
				selectButton()
			end
		end
	end)
	var71.InputEnded:Connect(function(p37)
		-- upvalues: var71 (write), guiService (copy), themeModule (copy), var70 (write)
		if var71.Selectable and guiService.SelectedCoreObject ~= var71 then
			if if p37.UserInputType ~= Enum.UserInputType.MouseMovement then p37.UserInputType == Enum.UserInputType.Touch else true then
				var71.BackgroundColor3 = themeModule.color(var70)
				var71.BackgroundTransparency = themeModule.transparency(var70)
			end
		end
	end)
	var71.SelectionGained:Connect(function()
		-- upvalues: selectButton (ref)
		selectButton()
	end)
	var71.SelectionLost:Connect(function()
		-- upvalues: var71 (write), themeModule (copy), var70 (write)
		var71.BackgroundColor3 = themeModule.color(var70)
		var71.BackgroundTransparency = themeModule.transparency(var70)
	end)
	local _ = guiService.Changed:Connect(function(p38)
		-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var71 (write), themeModule (copy), var70 (write), selectButton (ref)
		if p38 ~= "SelectedCoreObject" then return end
		if not (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) then return end
		if guiService.SelectedCoreObject == nil or guiService.SelectedCoreObject ~= var71 then
			var71.BackgroundColor3 = themeModule.color(var70)
			var71.BackgroundTransparency = themeModule.transparency(var70)
			
			return
		elseif var71.Selectable then
			selectButton()
		end
	end)
	
	return var71, setRowRef
end

local function MakeButton(p39, p40, p41, p42, p43, p44)
	-- upvalues: MakeDefaultButton (ref), create (ref), themeModule (ref), guiService (ref), userInputService (ref), var29 (ref), enablePreferredTextSizeAccessGuiServiceEngineFeature (ref)
	local var78, var79 = MakeDefaultButton(p39, p41, p42, p43, p44)
	local var80 = create("TextLabel")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		TextScaled = false,
		TextWrapped = true,
		ZIndex = 2,
		Name = p39 .. "TextLabel",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		TextColor3 = themeModule.color("WhiteButtonText", Color3.fromRGB(255, 255, 255)),
		TextTransparency = themeModule.transparency("WhiteButtonText", 0),
		TextYAlignment = Enum.TextYAlignment.Center,
		Font = themeModule.font(Enum.Font.SourceSansBold, "Button"),
		TextSize = themeModule.textSize(24, "Button"),
		Text = p40,
		Parent = var78
	})
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint", var80)
	local var82 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var83 = userInputService.TouchEnabled and (if var82.Y >= 500 then var82.X < 700 else true)
	
	if var83 then
		var80.TextSize = themeModule.textSize(18)
	elseif var29 then
		var83 = if p39 ~= "FriendStatus" then p39 == "BlockButton" else true
		
		if not var83 then
			var80.TextSize = themeModule.textSize(36)
		end
	end
	if enablePreferredTextSizeAccessGuiServiceEngineFeature then
		local var84 = (guiService.PreferredTextSize.Value - 1) * 3
		UITextSizeConstraint.MaxTextSize = var80.TextSize + var84
		local textSize = var80.TextSize
		guiService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
			-- upvalues: var84 (write), guiService (copy), UITextSizeConstraint (ref), textSize (ref)
			var84 = (guiService.PreferredTextSize.Value - 1) * 3
			UITextSizeConstraint.MaxTextSize = textSize + var84
		end)
	else
		UITextSizeConstraint.MaxTextSize = var80.TextSize
	end
	return var78, var80, var79
end

local function MakeImageButton(p45, p46, p47, p48, p49, p50, p51, p52)
	-- upvalues: MakeDefaultButton (ref), migration (ref), themeModule (ref), create (ref), increaseLegacyPeopleRowButtonSize (ref), builderIconsModule (ref)
	if not p52 then
		p52 = "ImageButton"
	end
	local var85, var86 = MakeDefaultButton(p45, p47, p49, p50, p51, p52)
	local imageRectOffset = nil
	local imageRectSize = nil
	local var87 = migration.uiblox[p46] or migration.luaApps[p46]
	
	if not string.match(p46, "^rbxasset://") then
		p46 = themeModule.Images[p46]
	end
	if typeof(p46) == "table" then
		imageRectOffset = p46.ImageRectOffset
		imageRectSize = p46.ImageRectSize
		p46 = p46.Image
	end
	local var88 = if var87 then create("TextLabel")({
		BackgroundTransparency = 1,
		ZIndex = 2,
		Name = p45 .. "TextLabel",
		Size = p48,
		TextSize = if increaseLegacyPeopleRowButtonSize then p48.Y.Offset * 0.857142857143 else p48.Y.Offset * 0.666666666667,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		TextColor3 = Color3.new(1, 1, 1),
		Text = var87.name,
		FontFace = builderIconsModule.Font[var87.variant],
		Parent = var85
	}) else create("ImageLabel")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 2,
		Name = p45 .. "ImageLabel",
		Size = p48,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = p46,
		ImageRectOffset = imageRectOffset,
		ImageRectSize = imageRectSize,
		Parent = var85
	})
	
	if p52 == "ImageButton" then
		var85.Border.Thickness = 0
		var85.Border.Transparency = 1
	end
	return var85, var88, var86
end

local function AddButtonRow(p53, p54, p55, p56, p57, p58)
	-- upvalues: MakeButton (ref), create (ref)
	local var89, var90, var91 = MakeButton(p54, p55, p56, p57, p53, p58)
	local var92 = create("Frame")({
		BackgroundTransparency = 1,
		Name = p54 .. "Row",
		Size = UDim2.new(1, 0, p56.Y.Scale, p56.Y.Offset),
		Parent = p53.Page
	})
	var89.Parent = var92
	var89.AnchorPoint = Vector2.new(1, 0)
	var89.Position = UDim2.new(1, -20, 0, 0)
	
	return var92, var89, var90, var91
end

local function MakeRoundedRectFocusState(value, p59)
	-- upvalues: create (ref), uDim (ref), themeModule (ref), runService (ref), userGameSettingsService (ref)
	local var93 = create("Frame")({
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 12, 1, 12),
		Position = UDim2.fromOffset(-6, -6)
	})
	create("UICorner")({ CornerRadius = uDim, Parent = var93 })
	local var94 = create("UIGradient")({
		Rotation = 0,
		Color = themeModule.selectionCursor.GradientColorSequence,
		Transparency = themeModule.selectionCursor.GradientTransparencySequence,
		Parent = create("UIStroke")({
			Transparency = 0,
			Thickness = 3,
			Color = themeModule.selectionCursor.AnimatedColor,
			Parent = var93
		})
	})
	runService:UnbindFromRenderStep(p59)
	runService:BindToRenderStep(p59, Enum.RenderPriority.Last.Value, function()
		-- upvalues: var94 (ref), themeModule (copy), userGameSettingsService (copy)
		local var95 = var94.Rotation + 2
		local gradientColorSequence = themeModule.selectionCursor.GradientColorSequence
		local gradientTransparencySequence = themeModule.selectionCursor.GradientTransparencySequence
		
		if userGameSettingsService.ReducedMotion then
			local var96 = (math.sin(math.rad(var95)) + 1) / 2
			gradientColorSequence = ColorSequence.new(gradientColorSequence.Keypoints[1].Value:lerp(gradientColorSequence.Keypoints[#gradientColorSequence.Keypoints].Value, var96))
			local value = gradientTransparencySequence.Keypoints[1].Value
			gradientTransparencySequence = NumberSequence.new(value + (gradientTransparencySequence.Keypoints[#gradientTransparencySequence.Keypoints].Value - value) * var96)
		end
		var94.Rotation = var95
		var94.Color = gradientColorSequence
		var94.Transparency = gradientTransparencySequence
	end)
	value.AncestryChanged:Connect(function(_, p60)
		-- upvalues: runService (copy), p59 (ref)
		if not p60 then
			runService:UnbindFromRenderStep(p59)
		end
	end)
	value.SelectionImageObject = var93
end

local function CreateDropDown(p61, p62, p63)
	-- upvalues: themeModule (ref), httpService (ref), guiService (ref), create (ref), repositionDropDownScrim (ref), coreGuiService (ref), VRService (ref), isInExperienceUIVREnabled (ref), corePackagesService_1 (ref), userInputService (ref), contextActionService (ref), fFlagHideShortcutsWhileIemDropdownActive (ref), var20 (ref), robloxTranslatorModule (ref), MakeButton (ref)
	local SELECTION_TEXT_COLOR_NORMAL = themeModule.color("SELECTION_TEXT_COLOR_NORMAL", Color3.fromRGB(178, 178, 178))
	local color = Color3.fromRGB(229, 229, 229)
	local SELECTION_TEXT_COLOR_HIGHLIGHTED = themeModule.color("SELECTION_TEXT_COLOR_HIGHLIGHTED", Color3.fromRGB(255, 255, 255))
	local var100 = nil
	local t = {
		CurrentIndex = nil,
		UpdateDropDownList = nil,
		DropDownFrame = nil,
		Selections = nil
	}
	Instance.new("BindableEvent").Name = "IndexChanged"
	
	if type(p61) == "table" then
		local indexChanged = Instance.new("BindableEvent")
		indexChanged.Name = "IndexChanged"
		local var103 = true
		local var104 = httpService:GenerateGUID(false)
		local enabled = nil
		local var105 = p61
		local guiInset, _ = guiService:GetGuiInset()
		local var107 = create("ImageButton")({
			Name = "DropDownFullscreenFrame",
			BackgroundTransparency = 0.2,
			BorderSizePixel = 0,
			ZIndex = 10,
			Active = true,
			Visible = false,
			Selectable = false,
			AutoButtonColor = false,
			Size = UDim2.new(1, 0, 1, if repositionDropDownScrim then guiInset.Y else 0),
			Position = if repositionDropDownScrim then UDim2.new(0, 0, 0, -guiInset.Y) else nil,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Parent = coreGuiService.RobloxGui
		})
		
		local function onVREnabled(p64)
			-- upvalues: VRService (copy), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), var107 (ref), coreGuiService (copy), t (ref), var105 (write)
			if p64 ~= "VREnabled" then return end
			if not VRService.VREnabled then
				var107.Parent = coreGuiService.RobloxGui
				var107.BackgroundTransparency = 0.2
			elseif isInExperienceUIVREnabled then
				local vrSpatialUiModule = require(corePackagesService_1.Workspace.Packages.VrSpatialUi)
				var107.Parent = vrSpatialUiModule.UIManager.getInstance():getPanelObject(vrSpatialUiModule.Constants.PanelType.MoreMenu)
				var107.BackgroundTransparency = 0.2
			else
				var107.Parent = require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):GetGUI()
				var107.BackgroundTransparency = 1
			end
			if t.UpdateDropDownList then
				t:UpdateDropDownList(var105)
			end
		end
		
		VRService.Changed:Connect(onVREnabled)
		onVREnabled("VREnabled")
		local var109 = create("ImageLabel")({
			Name = "DropDownSelectionFrame",
			Image = "",
			ZIndex = 10,
			ScaleType = Enum.ScaleType.Stretch,
			SliceCenter = Rect.new(8, 6, 46, 44),
			BackgroundTransparency = themeModule.transparency("DropdownListBg", 1),
			BackgroundColor3 = themeModule.color("DropdownListBg"),
			Size = UDim2.new(0.6, 0, 0.9, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Parent = var107
		})
		create("UICorner")({
			CornerRadius = themeModule.DefaultCornerRadius,
			Parent = var109
		})
		local var110 = create("ScrollingFrame")({
			Name = "DropDownScrollingFrame",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10,
			Size = UDim2.new(1, -20, 1, -25),
			Position = UDim2.new(0, 10, 0, 10),
			ScrollBarThickness = themeModule.DefaultScrollBarThickness,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Parent = var109
		})
		local var111 = nil
		local var112 = false
		
		local var113 = function(p65, p66)
			-- upvalues: t (ref), var103 (write), p63 (ref), var107 (ref), VRService (copy), userInputService (copy), guiService (copy), var100 (write), var111 (write), contextActionService (copy), var104 (ref), enabled (write), var112 (write), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy)
			if p65 ~= nil and p66 ~= Enum.UserInputState.Begin then return end
			t.DropDownFrame.Selectable = var103
			p63:SetActive(true)
			
			if var107.Visible then
				if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
					guiService.SelectedCoreObject = var100
				end
			end
			var107.Visible = false
			
			if var111 then
				var111:Disconnect()
			end
			contextActionService:UnbindCoreAction(var104 .. "Action")
			contextActionService:UnbindCoreAction(var104 .. "FreezeAction")
			enabled.Value = var103
			var112 = false
			
			if VRService.VREnabled and not isInExperienceUIVREnabled then
				require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(var107, 0)
			end
		end
		
		local var114 = function() end
		
		local var115 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.ChooseOne")
		t.DropDownFrame = MakeButton("DropDownFrame", var115, UDim2.new(0.6, 0, 0, 40), function()
			-- upvalues: var103 (write), t (ref), var112 (write), var107 (ref), VRService (copy), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), var100 (write), guiService (copy), var111 (write), SELECTION_TEXT_COLOR_HIGHLIGHTED (ref), color (ref), SELECTION_TEXT_COLOR_NORMAL (ref), var113 (ref), fFlagHideShortcutsWhileIemDropdownActive (copy), var20 (copy), contextActionService (copy), var104 (ref), var114 (ref), p63 (ref), enabled (write)
			if not var103 then return end
			t.DropDownFrame.Selectable = false
			var112 = true
			var107.Visible = true
			
			if VRService.VREnabled and not isInExperienceUIVREnabled then
				require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(var107, 0.5)
			end
			var100 = t.DropDownFrame
			
			if t.CurrentIndex and t.CurrentIndex > 0 then
				guiService.SelectedCoreObject = t.Selections[t.CurrentIndex]
			elseif #t.Selections > 0 then
				guiService.SelectedCoreObject = t.Selections[1]
			end
			var111 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: t (copy), guiService (copy), SELECTION_TEXT_COLOR_HIGHLIGHTED (copy), VRService (copy), color (copy), SELECTION_TEXT_COLOR_NORMAL (copy)
				for i = 1, #t.Selections do
					if guiService.SelectedCoreObject == t.Selections[i] then
						t.Selections[i].TextColor3 = SELECTION_TEXT_COLOR_HIGHLIGHTED
					else
						t.Selections[i].TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL
					end
				end
			end)
			local var120 = var113
			
			if fFlagHideShortcutsWhileIemDropdownActive then
				var20:setHideShortcutBar("InExperienceMenuDropdown", true)
				
				var120 = function(p67, p68)
					-- upvalues: var113 (copy), var20 (copy)
					var113(p67, p68)
					var20:setHideShortcutBar("InExperienceMenuDropdown", false)
				end
			end
			contextActionService:BindCoreAction(var104 .. "FreezeAction", var114, false, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1)
			contextActionService:BindCoreAction(var104 .. "Action", var120, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
			p63:SetActive(false)
			enabled.Value = false
		end, nil, p63)
		t.DropDownFrame.Position = UDim2.new(1, 0, 0.5, 0)
		t.DropDownFrame.AnchorPoint = Vector2.new(1, 0.5)
		enabled = t.DropDownFrame.Enabled
		local dropDownFrameTextLabel = t.DropDownFrame.DropDownFrameTextLabel
		dropDownFrameTextLabel.Position = UDim2.new(0, 15, 0, 0)
		dropDownFrameTextLabel.Size = UDim2.new(1, -50, 1, 0)
		dropDownFrameTextLabel.ClipsDescendants = true
		dropDownFrameTextLabel.TextXAlignment = Enum.TextXAlignment.Left
		local var116 = create("ImageLabel")({
			Name = "DropDownImage",
			Image = "rbxasset://textures/ui/Settings/DropDown/DropDown.png",
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0, 15, 0, 10),
			Position = UDim2.new(1, -12, 0.5, 0),
			Parent = t.DropDownFrame
		})
		t.DropDownImage = var116
		
		local function setSelection(value)
			-- upvalues: t (ref), dropDownFrameTextLabel (ref), indexChanged (ref)
			local var121 = false
			
			for i, v in pairs(t.Selections) do
				if i == value then
					dropDownFrameTextLabel.Text = v.Text
					t.CurrentIndex = i
					var121 = true
				end
			end
			if var121 then
				indexChanged:Fire(value)
			end
		end
		
		local function setSelectionByValue(value)
			-- upvalues: t (ref), dropDownFrameTextLabel (ref), indexChanged (ref)
			local var122 = false
			
			for i, v in pairs(t.Selections) do
				if v.Text == value then
					dropDownFrameTextLabel.Text = v.Text
					t.CurrentIndex = i
					var122 = true
				end
			end
			if var122 then
				indexChanged:Fire(t.CurrentIndex)
			end
			return var122
		end
		
		local function _(value)
			-- upvalues: t (ref)
			if value then
				t.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5
				t.DropDownFrame.ImageTransparency = 0.5
				t.DropDownImage.ImageTransparency = 0.5
				
				return
			end
			t.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
			t.DropDownFrame.ImageTransparency = 0
			t.DropDownImage.ImageTransparency = 0
		end
		
		t.IndexChanged = indexChanged.Event
		
		function t.SetSelectionIndex(_, p69)
			-- upvalues: setSelection (ref)
			setSelection(p69)
		end
		
		function t.SetSelectionByValue(_, p70)
			-- upvalues: setSelectionByValue (ref)
			return setSelectionByValue(p70)
		end
		
		function t.ResetSelectionIndex(_)
			-- upvalues: t (ref), dropDownFrameTextLabel (ref), var115 (ref), var113 (ref)
			t.CurrentIndex = nil
			dropDownFrameTextLabel.Text = var115
			var113()
		end
		
		function t.GetSelectedIndex(_)
			-- upvalues: t (ref)
			return t.CurrentIndex
		end
		
		function t.SetZIndex(_, p71)
			-- upvalues: t (ref), var116 (ref), dropDownFrameTextLabel (ref)
			t.DropDownFrame.ZIndex = p71
			var116.ZIndex = p71
			dropDownFrameTextLabel.ZIndex = p71
		end
		
		function t.SetInteractable(_, p72)
			-- upvalues: var103 (write), t (ref), var113 (ref), VRService (copy), enabled (write), var112 (write)
			var103 = p72
			t.DropDownFrame.Selectable = var103
			
			if var103 then
				t.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
				t.DropDownFrame.ImageTransparency = 0
				t.DropDownImage.ImageTransparency = 0
				
				if not VRService.VREnabled then
					t:SetZIndex(2)
				end
			else
				var113()
				
				if VRService.VREnabled then
					t.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5
					t.DropDownFrame.ImageTransparency = 0.5
					t.DropDownImage.ImageTransparency = 0.5
				else
					t.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
					t.DropDownFrame.ImageTransparency = 0
					t.DropDownImage.ImageTransparency = 0
				end
				if not VRService.VREnabled then
					t:SetZIndex(1)
				end
			end
			enabled.Value = p72 and not var112
			t.DropDownImage.Visible = p72
			
			if p72 then
				t.DropDownFrame.ImageTransparency = 0
				
				return
			end
			t.DropDownFrame.ImageTransparency = 0.5
		end
		
		function t.SetAutoLocalize(_, p73)
			-- upvalues: var107 (ref)
			var107.AutoLocalize = p73
		end
		
		function t.UpdateDropDownList(_, p74)
			-- upvalues: var105 (write), t (ref), VRService (copy), themeModule (copy), create (copy), color (ref), SELECTION_TEXT_COLOR_NORMAL (ref), var110 (ref), p62 (ref), dropDownFrameTextLabel (ref), SELECTION_TEXT_COLOR_HIGHLIGHTED (ref), var113 (ref), indexChanged (ref), userInputService (copy), guiService (copy), var104 (ref), var107 (ref), var109 (ref)
			var105 = p74
			
			if t.Selections then
				for i = 1, #t.Selections do
					t.Selections[i]:Destroy()
				end
			end
			t.Selections = {}
			t.SelectionInfo = {}
			local VREnabled = VRService.VREnabled
			local sourceSansBold = VREnabled and themeModule.font(Enum.Font.SourceSansBold, "Bold") or themeModule.font(Enum.Font.SourceSans, "UtilityText")
			local var124 = VREnabled and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
			local var125 = if VREnabled then 70 else 50
			local var126 = var125 + 1
			local var127 = if VREnabled then 600 else 400
			local var128 = 0
			
			for i_1, v in pairs(p74) do
				local var130 = create("Frame")({
					BackgroundTransparency = 0.7,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				})
				create("UICorner")({
					CornerRadius = themeModule.DefaultCornerRadius,
					Parent = var130
				})
				local var131 = v
				local var132 = ""
				local isTable = typeof(v) == "table"
				
				if isTable then
					var131 = v.title
					var132 = v.subtitle
					var128 += 10
				end
				local var134
				local _ = nil
				
				if isTable then
					var134 = create("TextButton")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false,
						ZIndex = 10,
						Name = "Selection" .. tostring(i_1),
						TextYAlignment = Enum.TextYAlignment.Top,
						Size = UDim2.new(1, -28, 0, var125 + 10),
						Position = UDim2.new(0, 14, 0, (i_1 - 1) * (var126 + 10)),
						TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL,
						Font = sourceSansBold,
						TextSize = var124,
						Text = var131,
						SelectionImageObject = var130,
						Parent = var110
					})
					local _ = create("TextLabel")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ZIndex = 10,
						Name = "Subtitle" .. tostring(i_1),
						Size = UDim2.new(1, -28, 0, var125 * 0.8),
						Position = UDim2.new(0, 14, 0, 15),
						TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL,
						Font = sourceSansBold,
						TextSize = var124 * 0.8,
						Text = var132,
						Parent = var134
					})
				else
					var134 = create("TextButton")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false,
						ZIndex = 10,
						Name = "Selection" .. tostring(i_1),
						Size = UDim2.new(1, -28, 0, var125),
						Position = UDim2.new(0, 14, 0, (i_1 - 1) * var126),
						TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL,
						Font = sourceSansBold,
						TextSize = var124,
						Text = v,
						SelectionImageObject = var130,
						Parent = var110
					})
				end
				if i_1 == p62 then
					t.CurrentIndex = i_1
					dropDownFrameTextLabel.Text = var131
					var134.TextColor3 = SELECTION_TEXT_COLOR_HIGHLIGHTED
				elseif not p62 and i_1 == 1 then
					var134.TextColor3 = SELECTION_TEXT_COLOR_HIGHLIGHTED
				end
				local var135 = function()
					-- upvalues: dropDownFrameTextLabel (copy), var134 (write), var113 (copy), t (copy), i_1 (ref), indexChanged (copy)
					dropDownFrameTextLabel.Text = var134.Text
					var113()
					t.CurrentIndex = i_1
					indexChanged:Fire(i_1)
				end
				
				var134.MouseButton1Click:Connect(var135)
				var134.MouseEnter:Connect(function()
					-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var134 (write)
					if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
						guiService.SelectedCoreObject = var134
					end
				end)
				t.Selections[i_1] = var134
				t.SelectionInfo[var134] = { Clicked = var135 }
			end
			guiService:RemoveSelectionGroup(var104)
			guiService:AddSelectionTuple(var104, unpack(t.Selections))
			var110.CanvasSize = UDim2.new(1, -20, 0, #p74 * var126 + var128)
			
			local function updateDropDownSize()
				-- upvalues: var110 (copy), var107 (copy), var109 (copy), var127 (ref)
				if var110.CanvasSize.Y.Offset < var107.AbsoluteSize.Y - 10 then
					var109.Size = UDim2.new(0, var127, 0, var110.CanvasSize.Y.Offset + 25)
					
					return
				end
				var109.Size = UDim2.new(0, var127, 0.9, 0)
			end
			
			var107.Changed:Connect(function(p75)
				-- upvalues: updateDropDownSize (ref)
				if p75 == "AbsoluteSize" then
					updateDropDownSize()
					
					return
				end
			end)
			updateDropDownSize()
		end
		
		t:UpdateDropDownList(p61)
		var107.MouseButton1Click:Connect(var113)
		p63.PoppedMenu:Connect(function(p76)
			-- upvalues: var107 (ref), var113 (ref)
			if p76 == var107 then
				var113()
			end
		end)
		
		return t
	end
	error("CreateDropDown dropDownStringTable (first arg) is not a table", 2)
	
	return t
end

local function CreateSelector(p77, p78)
	-- upvalues: create (ref), var33 (ref), themeModule (ref), ARROW_COLOR (ref), userInputService (ref), ARROW_COLOR_HOVER (ref), addHoverState (ref), VRService (ref), guiService (ref), EaseOutQuad (ref), ARROW_COLOR_INACTIVE (ref), var29 (ref), var30 (ref), var31 (ref), t (ref)
	local var136 = 0
	local t_1 = { HubRef = nil, SetSelectionIndex = nil }
	
	if type(p77) ~= "table" then
		error("CreateSelector selectionStringTable (first arg) is not a table", 2)
		
		return t_1
	end
	local indexChanged = Instance.new("BindableEvent")
	indexChanged.Name = "IndexChanged"
	local var139 = true
	t_1.CurrentIndex = 0
	t_1.SelectorFrame = create("ImageButton")({
		Name = "Selector",
		Image = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		ZIndex = 2,
		NextSelectionLeft = t_1.SelectorFrame,
		NextSelectionRight = t_1.SelectorFrame,
		Size = UDim2.new(0.6, 0, 0, 50),
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		SelectionImageObject = var33
	})
	local var140 = create("ImageButton")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var33,
		Parent = t_1.SelectorFrame
	})
	local var141 = create("ImageButton")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var33,
		Parent = t_1.SelectorFrame
	})
	local var142 = create("ImageLabel")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Left.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 30),
		ImageColor3 = ARROW_COLOR,
		Parent = var140
	})
	local var143 = create("ImageLabel")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Right.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 30),
		ImageColor3 = ARROW_COLOR,
		Parent = var141
	})
	
	if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		local var144 = function(p79)
			-- upvalues: ARROW_COLOR (copy)
			p79.ImageColor3 = ARROW_COLOR
		end
		
		local var145 = function(p80)
			-- upvalues: ARROW_COLOR_HOVER (copy)
			p80.ImageColor3 = ARROW_COLOR_HOVER
		end
		
		addHoverState(var140, var142, var144, var145)
		addHoverState(var141, var143, var144, var145)
	end
	t_1.Selections = {}
	local t_2 = {}
	local t_3 = {}
	local var148 = create("ImageButton")({
		Name = "AutoSelectButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 2,
		Position = UDim2.new(0, var140.Size.X.Offset, 0, 0),
		Size = UDim2.new(1, var140.Size.X.Offset * -2, 1, 0),
		Parent = t_1.SelectorFrame,
		SelectionImageObject = var33
	})
	var148.MouseButton1Click:Connect(function()
		-- upvalues: var139 (write), t_1 (ref), VRService (copy), userInputService (copy), guiService (copy)
		if not var139 then return end
		if #t_1.Selections <= 1 then return end
		local var155 = t_1.CurrentIndex + 1
		
		if #t_1.Selections < var155 then
			var155 = 1
		end
		t_1:SetSelectionIndex(var155)
		
		if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
			guiService.SelectedCoreObject = t_1.SelectorFrame
		end
	end)
	t_3[var148] = true
	
	local function setSelection(value, p81)
		-- upvalues: t_1 (ref), var140 (ref), t_2 (write), EaseOutQuad (copy), indexChanged (ref)
		for i, v in pairs(t_1.Selections) do
			local var156 = i == value
			local uDim2 = UDim2.new(0, var140.Size.X.Offset, 0, 0)
			local var158 = if t_2[v] then UDim2.new(0, var140.Size.X.Offset * -p81 * 3, 0, 0) else UDim2.new(0, var140.Size.X.Offset * p81 * 3, 0, 0)
			
			if var158.X.Offset < 0 then
				var158 = UDim2.new(0, var158.X.Offset + v.AbsoluteSize.X / 4, 0, 0)
			end
			if var156 then
				t_2[v] = true
				v.Position = var158
				v.Visible = true
				PropertyTweener(v, "TextTransparency", 1, 0, 0.165, EaseOutQuad)
				
				if v:IsDescendantOf(game) then
					v:TweenPositionInternal(uDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true)
				else
					v.Position = uDim2
				end
				t_1.CurrentIndex = i
				indexChanged:Fire(value)
			elseif t_2[v] then
				t_2[v] = false
				PropertyTweener(v, "TextTransparency", 0, 1, 0.165, EaseOutQuad)
				
				if v:IsDescendantOf(game) then
					v:TweenPositionInternal(var158, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true)
				else
					v.Position = var158
				end
			end
		end
	end
	
	local function stepFunc(p82, p83)
		-- upvalues: var139 (write), VRService (copy), userInputService (copy), guiService (copy), t_1 (ref), setSelection (ref)
		if not var139 then return end
		if p82 ~= nil and p82.UserInputType ~= Enum.UserInputType.MouseButton1 and (p82.UserInputType ~= Enum.UserInputType.Gamepad1 and p82.UserInputType ~= Enum.UserInputType.Gamepad2) and (p82.UserInputType ~= Enum.UserInputType.Gamepad3 and p82.UserInputType ~= Enum.UserInputType.Gamepad4 and p82.UserInputType ~= Enum.UserInputType.Keyboard) then return end
		if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
			guiService.SelectedCoreObject = t_1.SelectorFrame
		end
		local var159 = p83 + t_1.CurrentIndex
		local var160 = if t_1.CurrentIndex < var159 then 1 else -1
		
		if #t_1.Selections < var159 then
			var159 = 1
		elseif var159 < 1 then
			var159 = #t_1.Selections
		end
		setSelection(var159, var160)
	end
	
	local var151 = nil
	
	local function _()
		-- upvalues: var151 (write), guiService (copy), t_1 (ref), t_3 (ref), VRService (copy)
		var151 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: t_1 (copy), guiService (copy), t_3 (copy), VRService (copy)
			if #t_1.Selections <= 0 then return end
			if guiService.SelectedCoreObject ~= nil and t_3[guiService.SelectedCoreObject] and not VRService.VREnabled then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
		end)
	end
	
	t_1.IndexChanged = indexChanged.Event
	
	function t_1.SetSelectionIndex(_, p84)
		-- upvalues: setSelection (ref)
		setSelection(p84, 1)
	end
	
	function t_1.GetSelectedIndex(_)
		-- upvalues: t_1 (ref)
		return t_1.CurrentIndex
	end
	
	function t_1.SetZIndex(_, p85)
		-- upvalues: var140 (ref), var141 (ref), var142 (ref), var143 (ref), t_1 (ref)
		var140.ZIndex = p85
		var141.ZIndex = p85
		var142.ZIndex = p85
		var143.ZIndex = p85
		
		for i = 1, #t_1.Selections do
			t_1.Selections[i].ZIndex = p85
		end
	end
	
	function t_1.SetInteractable(_, p86)
		-- upvalues: var139 (write), t_1 (ref), var140 (ref), var141 (ref), themeModule (copy), var142 (ref), ARROW_COLOR_INACTIVE (copy), var143 (ref), ARROW_COLOR (copy)
		var139 = p86
		t_1.SelectorFrame.Selectable = var139
		var140.Active = var139
		var141.Active = var139
		var140.Visible = var139
		var141.Visible = var139
		
		if var139 then
			for i, v in pairs(t_1.Selections) do
				v.TextColor3 = Color3.fromRGB(255, 255, 255)
			end
			var142.ImageColor3 = ARROW_COLOR
			var143.ImageColor3 = ARROW_COLOR
			
			return
		else
			for i, v in pairs(t_1.Selections) do
				v.TextColor3 = themeModule.color("NotInteractableSelection", Color3.fromRGB(255, 255, 255))
			end
			var142.ImageColor3 = ARROW_COLOR_INACTIVE
			var143.ImageColor3 = ARROW_COLOR_INACTIVE
		end
	end
	
	function t_1.UpdateOptions(_, p87)
		-- upvalues: t_1 (ref), t_2 (write), create (copy), var140 (ref), themeModule (copy), var29 (copy), p78 (ref), var141 (ref)
		for i, v in pairs(t_1.Selections) do
			v:Destroy()
		end
		t_2 = {}
		t_1.Selections = {}
		
		for i_1, v_1 in pairs(p87) do
			local var162 = create("TextLabel")({
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextWrapped = true,
				ZIndex = 2,
				Visible = false,
				Name = "Selection" .. tostring(i_1),
				Size = UDim2.new(1, var140.Size.X.Offset * -2, 1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = themeModule.font(Enum.Font.SourceSans, "UtilityText"),
				TextSize = themeModule.textSize(24, "UtilityText"),
				Text = v_1,
				Parent = t_1.SelectorFrame
			})
			
			if var29 then
				var162.TextSize = themeModule.textSize(36)
			end
			if i_1 == p78 then
				t_1.CurrentIndex = i_1
				var162.Position = UDim2.new(0, var140.Size.X.Offset, 0, 0)
				var162.Visible = true
				t_2[var162] = true
			else
				t_2[var162] = false
			end
			t_1.Selections[i_1] = var162
		end
		local var161 = #t_1.Selections > 1
		var140.Visible = var161
		var141.Visible = var161
	end
	
	VRService.Changed:Connect(function(p88)
		-- upvalues: VRService (copy), var140 (ref), var141 (ref), var148 (ref)
		if p88 == "VREnabled" then
			local VREnabled = VRService.VREnabled
			var140.Selectable = VREnabled
			var141.Selectable = VREnabled
			var148.Selectable = VREnabled
			
			return
		end
	end)
	local VREnabled = VRService.VREnabled
	var140.Selectable = VREnabled
	var141.Selectable = VREnabled
	var148.Selectable = VREnabled
	var140.InputBegan:Connect(function(p89)
		-- upvalues: var30 (copy), var31 (copy), var139 (write), VRService (copy), userInputService (copy), guiService (copy), t_1 (ref), setSelection (ref)
		if var30(false) or var31(false) and p89.UserInputType == Enum.UserInputType.MouseButton1 then
			if not var139 then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var163 = -1 + t_1.CurrentIndex
			local var164 = if t_1.CurrentIndex < var163 then 1 else -1
			
			if #t_1.Selections < var163 then
				var163 = 1
			elseif var163 < 1 then
				var163 = #t_1.Selections
			end
			setSelection(var163, var164)
		end
	end)
	var141.InputBegan:Connect(function(p90)
		-- upvalues: var30 (copy), var31 (copy), var139 (write), VRService (copy), userInputService (copy), guiService (copy), t_1 (ref), setSelection (ref)
		if var30(false) or var31(false) and p90.UserInputType == Enum.UserInputType.MouseButton1 then
			if not var139 then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var165 = 1 + t_1.CurrentIndex
			local var166 = if t_1.CurrentIndex < var165 then 1 else -1
			
			if #t_1.Selections < var165 then
				var165 = 1
			elseif var165 < 1 then
				var165 = #t_1.Selections
			end
			setSelection(var165, var166)
		end
	end)
	local var152 = true
	t_1:UpdateOptions(p77)
	userInputService.InputBegan:Connect(function(p91)
		-- upvalues: var139 (write), var152 (write), guiService (copy), t_1 (ref), VRService (copy), userInputService (copy), setSelection (ref)
		if not var139 then return end
		if not var152 then return end
		if p91.UserInputType ~= Enum.UserInputType.Gamepad1 and p91.UserInputType ~= Enum.UserInputType.Keyboard then return end
		if guiService.SelectedCoreObject ~= t_1.SelectorFrame then return end
		if p91.KeyCode == Enum.KeyCode.DPadLeft or p91.KeyCode == Enum.KeyCode.Left or p91.KeyCode == Enum.KeyCode.A then
			if not var139 then return end
			if p91 ~= nil and p91.UserInputType ~= Enum.UserInputType.MouseButton1 and (p91.UserInputType ~= Enum.UserInputType.Gamepad1 and p91.UserInputType ~= Enum.UserInputType.Gamepad2) and (p91.UserInputType ~= Enum.UserInputType.Gamepad3 and p91.UserInputType ~= Enum.UserInputType.Gamepad4 and p91.UserInputType ~= Enum.UserInputType.Keyboard) then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var167 = -1 + t_1.CurrentIndex
			local var168 = if t_1.CurrentIndex < var167 then 1 else -1
			
			if #t_1.Selections < var167 then
				var167 = 1
			elseif var167 < 1 then
				var167 = #t_1.Selections
			end
			setSelection(var167, var168)
			
			return
		elseif p91.KeyCode == Enum.KeyCode.DPadRight or p91.KeyCode == Enum.KeyCode.Right or p91.KeyCode == Enum.KeyCode.D then
			if not var139 then return end
			if p91 ~= nil and p91.UserInputType ~= Enum.UserInputType.MouseButton1 and (p91.UserInputType ~= Enum.UserInputType.Gamepad1 and p91.UserInputType ~= Enum.UserInputType.Gamepad2) and (p91.UserInputType ~= Enum.UserInputType.Gamepad3 and p91.UserInputType ~= Enum.UserInputType.Gamepad4 and p91.UserInputType ~= Enum.UserInputType.Keyboard) then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var169 = 1 + t_1.CurrentIndex
			local var170 = if t_1.CurrentIndex < var169 then 1 else -1
			
			if #t_1.Selections < var169 then
				var169 = 1
			elseif var169 < 1 then
				var169 = #t_1.Selections
			end
			setSelection(var169, var170)
		end
	end)
	userInputService.InputChanged:Connect(function(p92)
		-- upvalues: var139 (write), var152 (write), var136 (write), guiService (copy), t_1 (ref), stepFunc (ref)
		if not var139 then return end
		if not var152 then
			var136 = 0
			
			return
		elseif p92.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t_1.SelectorFrame.Parent) then return end
		if p92.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		if p92.Position.X > 0.8 and p92.Delta.X > 0 and var136 ~= 1 then
			var136 = 1
			stepFunc(p92, var136)
			
			return
		elseif p92.Position.X < -0.8 and p92.Delta.X < 0 and var136 ~= -1 then
			var136 = -1
			stepFunc(p92, var136)
			
			return
		elseif math.abs(p92.Position.X) < 0.8 then
			var136 = 0
		end
	end)
	t_1.SelectorFrame.AncestryChanged:Connect(function(_, p93)
		-- upvalues: var152 (write), var151 (write), guiService (copy), t_1 (ref), t_3 (ref), VRService (copy)
		var152 = p93
		
		if var152 then
			var151 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: t_1 (copy), guiService (copy), t_3 (copy), VRService (copy)
				if #t_1.Selections <= 0 then return end
				if guiService.SelectedCoreObject ~= nil and t_3[guiService.SelectedCoreObject] and not VRService.VREnabled then
					guiService.SelectedCoreObject = t_1.SelectorFrame
				end
			end)
		elseif var151 then
			var151:Disconnect()
			
			return
		end
	end)
	
	local function onResized(_, p94)
		-- upvalues: themeModule (copy), var29 (copy), t_1 (ref)
		local var171 = if p94 then themeModule.textSize(16) else var29 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
		
		for i, v in pairs(t_1.Selections) do
			v.TextSize = var171
		end
	end
	
	t[t_1.SelectorFrame] = onResized
	local var154 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	onResized(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport(), var154.X < var154.Y)
	var151 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
		-- upvalues: t_1 (ref), guiService (copy), t_3 (ref), VRService (copy)
		if #t_1.Selections <= 0 then return end
		if guiService.SelectedCoreObject ~= nil and t_3[guiService.SelectedCoreObject] and not VRService.VREnabled then
			guiService.SelectedCoreObject = t_1.SelectorFrame
		end
	end)
	
	return t_1
end

local function ShowAlert(p95, p96, p97, p98, p99)
	-- upvalues: coreGuiService (ref), VRService (ref), isInExperienceUIVREnabled (ref), corePackagesService_1 (ref), create (ref), themeModule (ref), httpService (ref), contextActionService (ref), guiService (ref), MakeButton (ref), userInputService (ref)
	local robloxGui = coreGuiService.RobloxGui
	
	if robloxGui:FindFirstChild("AlertViewFullScreen") then return end
	local var172 = nil
	
	local function onVREnabled(p100)
		-- upvalues: VRService (copy), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), robloxGui (write), coreGuiService (copy), var172 (write)
		if p100 ~= "VREnabled" then return end
		local _ = nil
		local settingsMenu = nil
		
		if not VRService.VREnabled then
			robloxGui = coreGuiService.RobloxGui
		elseif isInExperienceUIVREnabled then
			local vrSpatialUiModule = require(corePackagesService_1.Workspace.Packages.VrSpatialUi)
			robloxGui = vrSpatialUiModule.UIManager.getInstance():getPanelObject(vrSpatialUiModule.Constants.PanelType.MoreMenu)
		else
			settingsMenu = require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu")
			robloxGui = settingsMenu:GetGUI()
		end
		if var172 and var172.Parent ~= nil then
			var172.Parent = robloxGui
			
			if VRService.VREnabled and not isInExperienceUIVREnabled then
				settingsMenu:SetSubpanelDepth(var172, 0.5)
			end
		end
	end
	
	local changedConnection = VRService.Changed:Connect(onVREnabled)
	var172 = create("ImageLabel")({
		Name = "AlertViewBacking",
		Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 9,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 6, 46, 44),
		Size = UDim2.new(0, 400, 0, 350),
		Position = UDim2.new(0.5, -200, 0.5, -175),
		Parent = robloxGui
	})
	onVREnabled("VREnabled")
	
	if p99 or (if isInExperienceUIVREnabled then false else VRService.VREnabled) then
		var172.ImageTransparency = 0
	else
		var172.Size = UDim2.new(0.8, 0, 0, 350)
		var172.Position = UDim2.new(0.1, 0, 0.1, 0)
	end
	if coreGuiService.RobloxGui.AbsoluteSize.Y <= var172.Size.Y.Offset then
		var172.Size = UDim2.new(var172.Size.X.Scale, var172.Size.X.Offset, var172.Size.Y.Scale, coreGuiService.RobloxGui.AbsoluteSize.Y)
		var172.Position = UDim2.new(var172.Position.X.Scale, -var172.Size.X.Offset / 2, 0.5, -var172.Size.Y.Offset / 2)
	end
	if not p99 then
		create("UICorner")({
			CornerRadius = themeModule.DefaultCornerRadius,
			Parent = var172
		})
		var172.BackgroundColor3 = themeModule.color("MenuContainer")
		var172.BackgroundTransparency = themeModule.transparency("MenuContainer")
	end
	local _ = create("TextLabel")({
		Name = "AlertViewText",
		BackgroundTransparency = 1,
		TextWrapped = true,
		ZIndex = 10,
		Size = UDim2.new(0.95, 0, 0.6, 0),
		Position = UDim2.new(0.025, 0, 0.05, 0),
		Font = themeModule.font(Enum.Font.SourceSansBold, "Bold"),
		TextSize = themeModule.textSize(36),
		Text = p95,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		Parent = var172
	})
	local _ = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 })
	local var175 = httpService:GenerateGUID(false)
	
	local var176 = function(_, p101)
		-- upvalues: VRService (copy), var172 (write), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), p98 (ref), contextActionService (copy), var175 (ref), guiService (copy), p97 (ref), changedConnection (ref)
		if VRService.VREnabled and (p101 == Enum.UserInputState.Begin or p101 == Enum.UserInputState.Cancel) then return end
		if not var172 then return end
		if VRService.VREnabled and not isInExperienceUIVREnabled then
			require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(var172, 0)
		end
		var172:Destroy()
		var172 = nil
		
		if p98 then
			p98()
		end
		contextActionService:UnbindCoreAction(var175)
		guiService.SelectedCoreObject = nil
		
		if p97 then
			p97:ShowBar()
		end
		if changedConnection then
			changedConnection:Disconnect()
		end
	end
	
	local uDim2 = UDim2.new(1, -20, 0, 60)
	local uDim2_1 = UDim2.new(0, 10, 0.65, 0)
	
	if not p99 then
		uDim2 = UDim2.new(0, 200, 0, 50)
		uDim2_1 = UDim2.new(0.5, -100, 0.65, 0)
	end
	local var179, var180 = MakeButton("AlertViewButton", p96, uDim2, var176)
	var179.Position = uDim2_1
	var179.NextSelectionLeft = var179
	var179.NextSelectionRight = var179
	var179.NextSelectionUp = var179
	var179.NextSelectionDown = var179
	var179.ZIndex = 9
	var180.ZIndex = var179.ZIndex
	var179.Parent = var172
	
	if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
		guiService.SelectedCoreObject = var179
	end
	guiService.SelectedCoreObject = var179
	contextActionService:BindCoreAction(var175, var176, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA)
	
	if p97 and (if isInExperienceUIVREnabled then true else not VRService.VREnabled) then
		p97:HideBar()
		p97.Pages.CurrentPage:Hide(1, 1)
	end
end

local function CreateNewSlider(p102, p103, p104, p105, p106)
	-- upvalues: httpService (ref), signal (ref), create (ref), var33 (ref), robloxGui (ref), themeModule (ref), userInputService (ref), ARROW_COLOR_HOVER (ref), ARROW_COLOR (ref), ARROW_COLOR_HOVER (ref), addHoverState (ref), SELECTED_COLOR (ref), NON_SELECTED_COLOR (ref), VRService (ref), guiService (ref), runService (ref)
	local t = {}
	local var184 = tonumber(p102)
	local var185 = p103
	local var186 = 0
	local var187 = nil
	local var188 = true
	local var189 = httpService:GenerateGUID(false)
	_ = ""
	_ = ""
	
	if var184 <= 0 then
		error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2)
		
		return
	end
	p105 = p105 or p106
	local valueChanged = Instance.new("BindableEvent")
	valueChanged.Name = "ValueChanged"
	local var192 = signal.new()
	t.SliderFrame = create("ImageButton")({
		Name = "Slider",
		Image = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		ZIndex = 2,
		NextSelectionLeft = t.SliderFrame,
		NextSelectionRight = t.SliderFrame,
		Size = UDim2.new(0.6, 0, 0, 50),
		AutomaticSize = if p105 then Enum.AutomaticSize.Y else nil,
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		SelectionImageObject = var33
	})
	local var193 = nil
	
	if p105 then
		var193 = create("Frame")({
			Name = "StepsAndButtonsContainer",
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 50),
			Parent = t.SliderFrame
		})
		create("UIListLayout")({
			Name = "UIListLayout",
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = t.SliderFrame
		})
		local var194 = create("Frame")({
			Name = "SliderLabels",
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = t.SliderFrame
		})
		create("UIPadding")({
			Name = "UIPadding",
			PaddingRight = UDim.new(0, 50),
			PaddingLeft = UDim.new(0, 50),
			Parent = var194
		})
		
		local function _()
			-- upvalues: robloxGui (copy)
			return robloxGui.AbsoluteSize.X > 460
		end
		
		if p105 then
			t.LeftLabel = create("TextLabel")({
				Name = "LeftLabel",
				TextTransparency = 0.25,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = p105,
				Font = themeModule.font(Enum.Font.SourceSans, "UtilityRow"),
				TextSize = themeModule.textSize(18, "UtilityRow"),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = var194,
				Visible = robloxGui.AbsoluteSize.X > 460
			})
		end
		if p106 then
			t.RightLabel = create("TextLabel")({
				Name = "RightLabel",
				TextTransparency = 0.25,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = p106,
				Font = themeModule.font(Enum.Font.SourceSans, "UtilityRow"),
				TextSize = themeModule.textSize(18, "UtilityRow"),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextXAlignment = Enum.TextXAlignment.Right,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = var194,
				Visible = robloxGui.AbsoluteSize.X > 460
			})
		end
		robloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
			-- upvalues: t (ref), robloxGui (copy)
			if t.LeftLabel then
				t.LeftLabel.Visible = robloxGui.AbsoluteSize.X > 460
			end
			if t.RightLabel then
				t.RightLabel.Visible = robloxGui.AbsoluteSize.X > 460
			end
		end)
	end
	t.StepsContainer = create("Frame")({
		Name = "StepsContainer",
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -100, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = if p105 then var193 else t.SliderFrame
	})
	local var195 = create("ImageButton")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		Active = true,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var33,
		Parent = if p105 then var193 else t.SliderFrame
	})
	local var196 = create("ImageButton")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		Active = true,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var33,
		Parent = if p105 then var193 else t.SliderFrame
	})
	local var197 = create("ImageLabel")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Less.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Parent = var195,
		ImageColor3 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then ARROW_COLOR_HOVER else ARROW_COLOR
	})
	local var198 = create("ImageLabel")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/More.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Parent = var196,
		ImageColor3 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then ARROW_COLOR_HOVER else ARROW_COLOR
	})
	
	if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		local var199 = function(p107)
			-- upvalues: ARROW_COLOR (copy)
			p107.ImageColor3 = ARROW_COLOR
		end
		
		local var200 = function(p108)
			-- upvalues: ARROW_COLOR_HOVER (copy)
			p108.ImageColor3 = ARROW_COLOR_HOVER
		end
		
		addHoverState(var195, var197, var199, var200)
		addHoverState(var196, var198, var199, var200)
	end
	t.Steps = {}
	local var201 = 1 / var184
	
	for i = 1, var184 do
		local var202 = create("ImageButton")({
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Active = false,
			Image = "",
			ZIndex = 3,
			Selectable = false,
			ImageTransparency = 0.36,
			Name = "Step" .. tostring(i),
			BackgroundColor3 = SELECTED_COLOR,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new((i - 1) * var201, 2, 0.5, 0),
			Size = UDim2.new(var201, -4, 0, 24),
			Parent = t.StepsContainer,
			SelectionImageObject = var33
		})
		
		if var185 < i then
			var202.BackgroundColor3 = NON_SELECTED_COLOR
		end
		if i == 1 or i == var184 then
			create("UICorner")({
				CornerRadius = themeModule.DefaultCornerRadius,
				Parent = var202
			})
			create("Frame")({
				Name = "Filler",
				BorderSizePixel = 0,
				BackgroundColor3 = var202.BackgroundColor3,
				Parent = var202,
				Size = UDim2.new(0.25, 0, 1, 0),
				Position = if i == 1 then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0, 0, 0, 0)
			})
		end
		t.Steps[#t.Steps + 1] = var202
	end
	local function hideSelection()
		-- upvalues: var184 (ref), t (ref), NON_SELECTED_COLOR (copy)
		for i = 1, var184 do
			t.Steps[i].BackgroundColor3 = NON_SELECTED_COLOR
			
			if i == 1 or i == var184 then
				t.Steps[i].Filler.BackgroundColor3 = NON_SELECTED_COLOR
			end
		end
	end
	
	local function showSelection()
		-- upvalues: var184 (ref), var185 (write), t (ref), SELECTED_COLOR (copy)
		for i = 1, var184 do
			if var185 < i then break end
			t.Steps[i].BackgroundColor3 = SELECTED_COLOR
			
			if i == 1 or i == var184 then
				t.Steps[i].Filler.BackgroundColor3 = SELECTED_COLOR
			end
		end
	end
	
	i = function(value)
		-- upvalues: p104 (write), var195 (ref), var196 (ref), var184 (ref), var185 (write), hideSelection (ref), showSelection (ref), var187 (write), var192 (ref), valueChanged (ref)
		if not p104 then
			p104 = 0
		end
		var195.Visible = true
		var196.Visible = true
		
		if value <= p104 then
			value = p104
			var195.Visible = false
		end
		if var184 <= value then
			value = var184
			var196.Visible = false
		end
		if var185 == value then return end
		var185 = value
		hideSelection()
		showSelection()
		var187 = tick()
		
		if var192 then
			var192:fire(var185)
			
			return
		end
		valueChanged:Fire(var185)
	end
	
	local _ = function(p109)
		return if p109 then if p109.UserInputType ~= Enum.UserInputType.MouseButton1 then if p109.UserInputType ~= Enum.UserInputType.Touch then p109.UserInputType == Enum.UserInputType.Gamepad1 and p109.KeyCode == Enum.KeyCode.ButtonA else true else true else false
	end
	
	local function mouseDownFunc(p110, p111, p112)
		-- upvalues: var188 (write), VRService (copy), userInputService (copy), guiService (copy), t (ref), var186 (write), var185 (write), var184 (ref), i (ref)
		if not var188 then return end
		if p110 == nil then return end
		if not (if p110 then if p110.UserInputType ~= Enum.UserInputType.MouseButton1 then if p110.UserInputType ~= Enum.UserInputType.Touch then p110.UserInputType == Enum.UserInputType.Gamepad1 and p110.KeyCode == Enum.KeyCode.ButtonA else true else true else false) then return end
		if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and not VRService.VREnabled then
			guiService.SelectedCoreObject = t.SliderFrame
		end
		if VRService.VREnabled then
			var186 = 0
		elseif p112 then
			var186 = p111 - var185
		else
			var186 = 0
			local _ = nil
			local inputEndedConnection = nil
			local inputChangedConnection = userInputService.InputChanged:Connect(function(p113)
				-- upvalues: var184 (copy), t (copy), i (copy)
				if p113.UserInputType ~= Enum.UserInputType.MouseMovement then return end
				local x = p113.Position.X
				
				for i_1 = 1, var184 do
					local x_1 = t.Steps[i_1].AbsolutePosition.X
					
					if x_1 > x or x > x_1 + t.Steps[i_1].AbsoluteSize.X then
						if i_1 ~= 1 or x >= x_1 then
							if i_1 ~= var184 or x_1 > x then
								continue
							end
							i(i_1)
							
							return
						end
						i(0)
						
						return
					end
					i(i_1)
					
					return
				end
			end)
			inputEndedConnection = userInputService.InputEnded:Connect(function(p114)
				-- upvalues: var186 (copy), inputEndedConnection (write), inputChangedConnection (write)
				if if p114 then if p114.UserInputType ~= Enum.UserInputType.MouseButton1 then if p114.UserInputType ~= Enum.UserInputType.Touch then p114.UserInputType == Enum.UserInputType.Gamepad1 and p114.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
					var186 = 0
					inputEndedConnection:Disconnect()
					inputChangedConnection:Disconnect()
					
					return
				end
			end)
		end
		i(p111)
	end
	
	local _ = function(p115)
		-- upvalues: var188 (write), var186 (write)
		if not var188 then return end
		if if p115 then if p115.UserInputType ~= Enum.UserInputType.MouseButton1 then if p115.UserInputType ~= Enum.UserInputType.Touch then p115.UserInputType == Enum.UserInputType.Gamepad1 and p115.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
			var186 = 0
			
			return
		end
	end
	
	t.ValueChanged = valueChanged.Event
	
	if var192 then
		t.ValueChanged = var192
	end
	function t.SetValue(_, p116)
		-- upvalues: i (ref)
		i(p116)
	end
	
	function t.GetValue(_)
		-- upvalues: var185 (write)
		return var185
	end
	
	function t.SetInteractable(_, p117)
		-- upvalues: var186 (write), var188 (write), t (ref), hideSelection (ref), showSelection (ref)
		var186 = 0
		var188 = p117
		t.SliderFrame.Selectable = p117
		
		if var188 then
			showSelection()
			
			return
		end
		hideSelection()
	end
	
	function t.SetZIndex(_, p118)
		-- upvalues: var195 (ref), var196 (ref), var197 (ref), var198 (ref), t (ref)
		var195.ZIndex = p118
		var196.ZIndex = p118
		var197.ZIndex = p118
		var198.ZIndex = p118
		
		for i = 1, #t.Steps do
			t.Steps[i].ZIndex = p118
		end
	end
	
	function t.SetMinStep(_, b)
		-- upvalues: var184 (ref), p104 (write), var185 (write), var195 (ref), var196 (ref)
		if b >= 0 and b <= var184 then
			p104 = b
		end
		if var185 <= p104 then
			var185 = p104
			var195.Visible = false
		end
		if var184 <= var185 then
			var185 = var184
			var196.Visible = false
		end
	end
	
	var195.InputBegan:Connect(function(p119)
		-- upvalues: var185 (write), var188 (write), VRService (copy), userInputService (copy), guiService (copy), t (ref), var186 (write), i (ref)
		local var213 = var185 - 1
		
		if not var188 then return end
		if p119 == nil then return end
		if not (if p119 then if p119.UserInputType ~= Enum.UserInputType.MouseButton1 then if p119.UserInputType ~= Enum.UserInputType.Touch then p119.UserInputType == Enum.UserInputType.Gamepad1 and p119.KeyCode == Enum.KeyCode.ButtonA else true else true else false) then return end
		if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and not VRService.VREnabled then
			guiService.SelectedCoreObject = t.SliderFrame
		end
		var186 = if not VRService.VREnabled then var213 - var185 else 0
		i(var213)
	end)
	var195.InputEnded:Connect(function(p120)
		-- upvalues: var188 (write), var186 (write)
		if not var188 then return end
		if if p120 then if p120.UserInputType ~= Enum.UserInputType.MouseButton1 then if p120.UserInputType ~= Enum.UserInputType.Touch then p120.UserInputType == Enum.UserInputType.Gamepad1 and p120.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
			var186 = 0
			
			return
		end
	end)
	var196.InputBegan:Connect(function(p121)
		-- upvalues: var185 (write), var188 (write), VRService (copy), userInputService (copy), guiService (copy), t (ref), var186 (write), i (ref)
		local var214 = var185 + 1
		
		if not var188 then return end
		if p121 == nil then return end
		if not (if p121 then if p121.UserInputType ~= Enum.UserInputType.MouseButton1 then if p121.UserInputType ~= Enum.UserInputType.Touch then p121.UserInputType == Enum.UserInputType.Gamepad1 and p121.KeyCode == Enum.KeyCode.ButtonA else true else true else false) then return end
		if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and not VRService.VREnabled then
			guiService.SelectedCoreObject = t.SliderFrame
		end
		var186 = if not VRService.VREnabled then var214 - var185 else 0
		i(var214)
	end)
	var196.InputEnded:Connect(function(p122)
		-- upvalues: var188 (write), var186 (write)
		if not var188 then return end
		if if p122 then if p122.UserInputType ~= Enum.UserInputType.MouseButton1 then if p122.UserInputType ~= Enum.UserInputType.Touch then p122.UserInputType == Enum.UserInputType.Gamepad1 and p122.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
			var186 = 0
			
			return
		end
	end)
	
	local function onVREnabled(p123)
		-- upvalues: VRService (copy), var195 (ref), var188 (write), var196 (ref), t (ref), var184 (ref)
		if p123 ~= "VREnabled" then return end
		if VRService.VREnabled then
			var195.Selectable = var188
			var196.Selectable = var188
			t.SliderFrame.Selectable = var188
			
			for i = 1, var184 do
				t.Steps[i].Selectable = var188
				t.Steps[i].Active = var188
			end
			return
		else
			var195.Selectable = false
			var196.Selectable = false
			t.SliderFrame.Selectable = var188
			
			for i_1 = 1, var184 do
				t.Steps[i_1].Selectable = false
				t.Steps[i_1].Active = false
			end
		end
	end
	
	VRService.Changed:Connect(onVREnabled)
	onVREnabled("VREnabled")
	
	for i_1 = 1, var184 do
		t.Steps[i_1].InputBegan:Connect(function(p124)
			-- upvalues: mouseDownFunc (ref), i_1 (ref)
			mouseDownFunc(p124, i_1)
		end)
		t.Steps[i_1].InputEnded:Connect(function(p125)
			-- upvalues: var188 (write), var186 (write)
			if not var188 then return end
			if if p125 then if p125.UserInputType ~= Enum.UserInputType.MouseButton1 then if p125.UserInputType ~= Enum.UserInputType.Touch then p125.UserInputType == Enum.UserInputType.Gamepad1 and p125.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
				var186 = 0
				
				return
			end
		end)
	end
	t.SliderFrame.InputBegan:Connect(function(p126)
		-- upvalues: VRService (copy), guiService (copy), t (ref), mouseDownFunc (ref), var185 (write)
		if VRService.VREnabled then
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject and selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then
				mouseDownFunc(p126, var185)
				
				return
			else
			end
		end
	end)
	t.SliderFrame.InputEnded:Connect(function(p127)
		-- upvalues: VRService (copy), guiService (copy), t (ref), var188 (write), var186 (write)
		local selectedCoreObject
		if VRService.VREnabled then
			selectedCoreObject = guiService.SelectedCoreObject
			
			if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		end
		if not var188 then return end
		selectedCoreObject = if p127 then if p127.UserInputType ~= Enum.UserInputType.MouseButton1 then if p127.UserInputType ~= Enum.UserInputType.Touch then p127.UserInputType == Enum.UserInputType.Gamepad1 and p127.KeyCode == Enum.KeyCode.ButtonA else true else true else false
		
		if selectedCoreObject then
			var186 = 0
			
			return
		end
	end)
	
	local var207 = function()
		-- upvalues: var187 (write), i (ref), var185 (write), var186 (write)
		if var187 == nil then return end
		if tick() - var187 >= 0.2 then
			i(var185 + var186)
		end
	end
	
	local var208 = true
	local t_1 = {
		[Enum.KeyCode.Thumbstick1] = true,
		[Enum.KeyCode.DPadLeft] = -1,
		[Enum.KeyCode.DPadRight] = 1,
		[Enum.KeyCode.Left] = -1,
		[Enum.KeyCode.Right] = 1,
		[Enum.KeyCode.A] = -1,
		[Enum.KeyCode.D] = 1,
		[Enum.KeyCode.ButtonA] = true
	}
	userInputService.InputBegan:Connect(function(p128)
		-- upvalues: var188 (write), var208 (write), guiService (copy), t (ref), t_1 (ref), var186 (write), i (ref), var185 (write)
		if not var188 then return end
		if not var208 then return end
		if p128.UserInputType ~= Enum.UserInputType.Gamepad1 and p128.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if t_1[p128.KeyCode] == -1 then
			var186 = -1
			i(var185 - 1)
			
			return
		elseif t_1[p128.KeyCode] == 1 then
			var186 = 1
			i(var185 + 1)
		end
	end)
	userInputService.InputEnded:Connect(function(p129)
		-- upvalues: var188 (write), guiService (copy), t (ref), t_1 (ref), var186 (write)
		if not var188 then return end
		if p129.UserInputType ~= Enum.UserInputType.Gamepad1 and p129.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if t_1[p129.KeyCode] then
			var186 = 0
		end
	end)
	userInputService.InputChanged:Connect(function(p130)
		-- upvalues: var188 (write), var186 (write), var208 (write), guiService (copy), t (ref), i (ref), var185 (write)
		if not var188 then
			var186 = 0
			
			return
		elseif not var208 then
			var186 = 0
			
			return
		elseif p130.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if p130.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		if p130.Position.X > 0.8 and p130.Delta.X > 0 and var186 ~= 1 then
			var186 = 1
			i(var185 + 1)
			
			return
		elseif p130.Position.X < -0.8 and p130.Delta.X < 0 and var186 ~= -1 then
			var186 = -1
			i(var185 - 1)
			
			return
		elseif math.abs(p130.Position.X) < 0.8 then
			var186 = 0
		end
	end)
	local var210 = false
	guiService.Changed:Connect(function(p131)
		-- upvalues: guiService (copy), t (ref), var210 (write), var187 (write), runService (copy), var189 (ref), var207 (ref)
		if p131 ~= "SelectedCoreObject" then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject and selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then
			if var210 then
				return
			else
				var210 = true
				var187 = tick()
				runService:BindToRenderStep(var189, Enum.RenderPriority.Input.Value + 1, var207)
				
				return
			end
		elseif var210 then
			var210 = false
			runService:UnbindFromRenderStep(var189)
		end
	end)
	t.SliderFrame.AncestryChanged:Connect(function(_, p132)
		-- upvalues: var208 (write)
		var208 = p132
	end)
	i(var185)
	
	return t
end

local var50 = if var29 then 90 else 50
local t_2 = {}

local function AddNewRow(p133, p134, p135, p136, p137, p138, p139, p140, p141, p142)
	-- upvalues: t_2 (ref), create (ref), var50 (write), var33 (ref), themeModule (ref), var29 (ref), guiService (ref), t (ref), CreateNewSlider (ref), CreateSelector (ref), CreateDropDown (ref), VRService (ref), userInputService (ref), coreGuiService (ref)
	local var215 = 0
	local isNotTextBox = p135 ~= "TextBox"
	
	if t_2[p133] then
		var215 = t_2[p133]
	end
	local _ = nil
	local var217 = create("ImageButton")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 1,
		Active = false,
		AutoButtonColor = false,
		ZIndex = 2,
		Selectable = false,
		Name = p134 .. "Frame",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(2, 2, 18, 18),
		Size = UDim2.new(1, 0, 0, var50),
		AutomaticSize = if p139 or p140 or p141 then Enum.AutomaticSize.Y else nil,
		Position = UDim2.new(0, 0, 0, var215),
		SelectionImageObject = var33,
		Parent = p133.Page
	})
	var217.BackgroundColor3 = themeModule.color("RowFrameBackground")
	var217.ImageColor3 = var217.BackgroundColor3
	create("UICorner")({
		CornerRadius = themeModule.DefaultCornerRadius,
		Parent = var217
	})
	
	if var217 and p138 then
		var217.Position = UDim2.new(var217.Position.X.Scale, var217.Position.X.Offset, var217.Position.Y.Scale, var217.Position.Y.Offset + p138)
	end
	local var219
	local _ = nil
	local _ = nil
	
	if p139 then
		local var218 = create("Frame")({
			BackgroundTransparency = 1,
			Name = p134 .. "RowLabelAndDescriptionFrame",
			Position = UDim2.new(0, 10, 0, 0),
			Size = UDim2.new(0.4, -20, 0, 50),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = var217
		})
		var219 = create("TextLabel")({
			BackgroundTransparency = 1,
			TextWrapped = true,
			ZIndex = 2,
			LayoutOrder = 1,
			Name = p134 .. "Label",
			Text = p134,
			Font = themeModule.font(Enum.Font.SourceSansBold, "UtilityRow"),
			TextSize = themeModule.textSize(16, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = var218
		})
		create("TextLabel")({
			TextTransparency = 0.25,
			TextWrapped = true,
			BackgroundTransparency = 1,
			ZIndex = 2,
			LayoutOrder = 2,
			Name = p134 .. "Description",
			Text = p139,
			Font = themeModule.font(Enum.Font.SourceSans, "UtilityRow"),
			TextSize = themeModule.textSize(18, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = var218
		})
		create("UIListLayout")({
			Name = p134 .. "UIListLayout",
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
			Parent = var218
		})
		create("UIPadding")({
			Name = p134 .. "UIListLayout",
			PaddingBottom = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			Parent = var218
		})
	else
		var219 = create("TextLabel")({
			TextWrapped = true,
			BackgroundTransparency = 1,
			ZIndex = 2,
			Name = p134 .. "Label",
			Text = p134,
			Font = themeModule.font(Enum.Font.SourceSansBold, "UtilityRow"),
			TextSize = themeModule.textSize(16, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0.4, -20, 1, 0),
			Position = UDim2.new(0, 10, 0, 0),
			Parent = var217
		})
		create("UIPadding")({
			Name = p134 .. "UIPadding",
			PaddingBottom = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			Parent = var219
		})
	end
	if not isNotTextBox then
		var219.Text = ""
	end
	local function onResized(_, p143)
		-- upvalues: var219 (write), themeModule (copy), var29 (copy)
		if p143 then
			var219.TextSize = themeModule.textSize(16, "UtilityRow")
			
			return
		end
		var219.TextSize = var29 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	
	local _ = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var221 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	if var221.X < var221.Y then
		var219.TextSize = themeModule.textSize(16, "UtilityRow")
	else
		var219.TextSize = var29 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	t[var217] = onResized
	local _ = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var222 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	if var222.X < var222.Y then
		var219.TextSize = themeModule.textSize(16, "UtilityRow")
	else
		var219.TextSize = var29 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	local var223 = nil
	local t_1 = nil
	
	if p135 == "Slider" then
		t_1 = CreateNewSlider(p136, p137, nil, p140, p141)
		t_1.SliderFrame.Parent = var217
		var223 = t_1.SliderFrame
	elseif p135 == "Selector" then
		t_1 = CreateSelector(p136, p137)
		t_1.SelectorFrame.Parent = var217
		var223 = t_1.SelectorFrame
	elseif p135 == "DropDown" then
		t_1 = CreateDropDown(p136, p137, p133.HubRef)
		t_1.DropDownFrame.Parent = var217
		var223 = t_1.DropDownFrame
	elseif p135 == "TextBox" then
		t_1 = { HubRef = nil }
		local var225 = create("TextBox")({
			BorderSizePixel = 0,
			TextWrapped = true,
			ZIndex = 2,
			ClearTextOnFocus = false,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0.6, 0, 1, 0),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = p134,
			TextColor3 = Color3.fromRGB(49, 49, 49),
			BackgroundTransparency = themeModule.transparency("ControlInputBackground", 0.5),
			TextYAlignment = Enum.TextYAlignment.Top,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = themeModule.font(Enum.Font.SourceSans, "UtilityText"),
			TextSize = themeModule.textSize(24, "UtilityText"),
			SelectionImageObject = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 }),
			Interactable = p142,
			Parent = var217
		})
		var223 = var225
		var225.Focused:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var225 (ref), p134 (ref)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = var225
			end
			if var225.Text == p134 then
				var225.Text = ""
			end
		end)
		
		if p138 then
			var225.Position = UDim2.new(var225.Position.X.Scale, var225.Position.X.Offset, var225.Position.Y.Scale, var225.Position.Y.Offset + p138)
		end
		var223.SelectionGained:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var225 (ref), themeModule (copy), t_1 (write), var223 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var225.BackgroundTransparency = themeModule.transparency("ControlInputBackground", 0.1)
				
				if t_1.HubRef then
					t_1.HubRef:ScrollToFrame(var223)
				end
			end
		end)
		var223.SelectionLost:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var225 (ref), themeModule (copy)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var225.BackgroundTransparency = themeModule.transparency("ControlInputBackground", 0.5)
			end
		end)
		
		local function processInput(p144)
			-- upvalues: guiService (copy), var223 (write), var225 (ref)
			if p144.UserInputState == Enum.UserInputState.Begin and p144.KeyCode == Enum.KeyCode.Return and guiService.SelectedCoreObject == var223 then
				var225:CaptureFocus()
			end
		end
		
		var225.MouseEnter:Connect(function()
			-- upvalues: coreGuiService (copy), var223 (write), VRService (copy), userInputService (copy), p133 (ref), guiService (copy)
			local dropDownFullscreenFrame = coreGuiService.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if dropDownFullscreenFrame and dropDownFullscreenFrame.Visible then return end
			if var223 and var223.Visible and var223.ZIndex > 1 then
				if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and p133.Active then
					guiService.SelectedCoreObject = var223
				end
			end
		end)
		userInputService.InputBegan:Connect(processInput)
	elseif p135 == "TextEntry" then
		t_1 = { HubRef = nil }
		local var227 = create("TextBox")({
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextWrapped = false,
			ZIndex = 2,
			ClearTextOnFocus = false,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0.4, -10, 0, 40),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = p134,
			TextColor3 = Color3.fromRGB(178, 178, 178),
			TextYAlignment = Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = themeModule.font(Enum.Font.SourceSans, "UtilityText"),
			TextSize = themeModule.textSize(24, "UtilityText"),
			SelectionImageObject = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 }),
			Parent = var217
		})
		var223 = var227
		var227.Focused:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var227 (ref), p134 (ref)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = var227
			end
			if var227.Text == p134 then
				var227.Text = ""
			end
		end)
		
		if p138 then
			var227.Position = UDim2.new(var227.Position.X.Scale, var227.Position.X.Offset, var227.Position.Y.Scale, var227.Position.Y.Offset + p138)
		end
		var223.SelectionGained:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var227 (ref), t_1 (write), var223 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var227.BackgroundTransparency = 0.8
				
				if t_1.HubRef then
					t_1.HubRef:ScrollToFrame(var223)
				end
			end
		end)
		var223.SelectionLost:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var227 (ref)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var227.BackgroundTransparency = 1
			end
		end)
		
		local function processInput(p145)
			-- upvalues: guiService (copy), var223 (write), var227 (ref)
			if p145.UserInputState == Enum.UserInputState.Begin and p145.KeyCode == Enum.KeyCode.Return and guiService.SelectedCoreObject == var223 then
				var227:CaptureFocus()
			end
		end
		
		var217.MouseEnter:Connect(function()
			-- upvalues: coreGuiService (copy), var223 (write), VRService (copy), userInputService (copy), p133 (ref), guiService (copy)
			local dropDownFullscreenFrame = coreGuiService.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if dropDownFullscreenFrame and dropDownFullscreenFrame.Visible then return end
			if var223 and var223.Visible and var223.ZIndex > 1 then
				if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and p133.Active then
					guiService.SelectedCoreObject = var223
				end
			end
		end)
		
		function t_1.SetZIndex(_, p146)
			-- upvalues: var227 (ref)
			var227.ZIndex = p146
		end
		
		function t_1.SetInteractable(_, p147)
			-- upvalues: var227 (ref)
			var227.Selectable = p147
			
			if p147 then
				var227.TextColor3 = Color3.fromRGB(178, 178, 178)
				var227.ZIndex = 2
				
				return
			end
			var227.TextColor3 = Color3.fromRGB(49, 49, 49)
			var227.ZIndex = 1
		end
		
		function t_1.SetValue(_, p148)
			-- upvalues: var227 (ref)
			var227.Text = p148
		end
		
		local valueChanged = Instance.new("BindableEvent")
		valueChanged.Name = "ValueChanged"
		var227.FocusLost:Connect(function()
			-- upvalues: valueChanged (ref), var227 (ref)
			valueChanged:Fire(var227.Text)
		end)
		t_1.ValueChanged = valueChanged.Event
		userInputService.InputBegan:Connect(processInput)
	end
	t_1.Name = p134 .. "ValueChanger"
	local setAutoLocalize = t_1.SetAutoLocalize
	
	function t_1.SetAutoLocalize(p149, p150)
		-- upvalues: var217 (write), setAutoLocalize (ref)
		var217.AutoLocalize = p150
		
		if setAutoLocalize then
			setAutoLocalize(p149, p150)
		end
	end
	
	var215 += var50
	
	if p138 then
		var215 += p138
	end
	t_2[p133] = var215
	
	if isNotTextBox then
		var217.MouseEnter:Connect(function()
			-- upvalues: coreGuiService (copy), t_1 (write), VRService (copy), userInputService (copy), p133 (ref), guiService (copy)
			local dropDownFullscreenFrame = coreGuiService.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if dropDownFullscreenFrame and dropDownFullscreenFrame.Visible then return end
			local sliderFrame = t_1.SliderFrame or t_1.SliderFrame or t_1.DropDownFrame or t_1.SelectorFrame
			
			if sliderFrame and sliderFrame.Visible and sliderFrame.ZIndex > 1 then
				if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and p133.Active then
					guiService.SelectedCoreObject = sliderFrame
				end
			end
		end)
		VRService.Changed:Connect(function(p151)
			-- upvalues: VRService (copy), var217 (write), var223 (write), guiService (copy), themeModule (copy)
			if p151 == "VREnabled" then
				if VRService.VREnabled then
					var217.Selectable = true
					var217.Active = true
					var223.Active = true
					guiService.Changed:Connect(function(p152)
						-- upvalues: guiService (copy), var217 (copy), themeModule (copy)
						if p152 == "SelectedCoreObject" then
							local selectedCoreObject = guiService.SelectedCoreObject
							
							if selectedCoreObject and (selectedCoreObject == var217 or selectedCoreObject:IsDescendantOf(var217)) then
								var217.ImageTransparency = themeModule.transparency("RowFrameBackground", 0.5)
								var217.BackgroundTransparency = 1
								
								return
							end
							var217.ImageTransparency = 1
							var217.BackgroundTransparency = 1
						end
					end)
					
					return
				end
				var217.Selectable = false
				var217.Active = false
			end
		end)
		
		if VRService.VREnabled then
			var217.Selectable = true
			var217.Active = true
			var223.Active = true
			guiService.Changed:Connect(function(p153)
				-- upvalues: guiService (copy), var217 (write), themeModule (copy)
				if p153 == "SelectedCoreObject" then
					local selectedCoreObject = guiService.SelectedCoreObject
					
					if selectedCoreObject and (selectedCoreObject == var217 or selectedCoreObject:IsDescendantOf(var217)) then
						var217.ImageTransparency = themeModule.transparency("RowFrameBackground", 0.5)
						var217.BackgroundTransparency = 1
						
						return
					end
					var217.ImageTransparency = 1
					var217.BackgroundTransparency = 1
				end
			end)
		else
			var217.Selectable = false
			var217.Active = false
		end
		var223.SelectionGained:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var217 (write), themeModule (copy), t_1 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				if VRService.VREnabled then
					var217.ImageTransparency = 0.5
					var217.BackgroundTransparency = 1
				else
					var217.ImageTransparency = 1
					var217.BackgroundTransparency = themeModule.transparency("RowFrameBackground", 0.5)
				end
				if t_1.HubRef then
					t_1.HubRef:ScrollToFrame(var217)
				end
			end
		end)
		var223.SelectionLost:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var217 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var217.ImageTransparency = 1
				var217.BackgroundTransparency = 1
			end
		end)
	end
	p133:AddRow(var217, var219, t_1, p138, false)
	t_1.Selection = var223
	
	return var217, var219, t_1
end

local function AddNewRowObject(p154, p155, p156, p157, p158)
	-- upvalues: t_2 (ref), create (ref), var50 (write), var33 (ref), themeModule (ref), var29 (ref), t (ref), guiService (ref), VRService (ref)
	local var234 = if t_2[p154] then t_2[p154] else 0
	local var235 = create("ImageButton")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 1,
		Active = false,
		AutoButtonColor = false,
		ZIndex = 2,
		Selectable = false,
		Name = p155 .. "Frame",
		AutomaticSize = Enum.AutomaticSize.Y,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10),
		Size = UDim2.new(1, 0, 0, var50),
		Position = UDim2.new(0, 0, 0, var234),
		SelectionImageObject = var33,
		Parent = p154.Page
	})
	var235.BackgroundColor3 = themeModule.color("RowFrameBackground")
	var235.ImageColor3 = var235.BackgroundColor3
	var235.SelectionGained:Connect(function()
		-- upvalues: var235 (ref), themeModule (copy)
		var235.BackgroundTransparency = themeModule.transparency("RowFrameBackground", 0.5)
	end)
	var235.SelectionLost:Connect(function()
		-- upvalues: var235 (ref)
		var235.BackgroundTransparency = 1
	end)
	create("UICorner")({
		CornerRadius = themeModule.DefaultCornerRadius,
		Parent = var235
	})
	local var236 = create("TextLabel")({
		TextWrapped = true,
		BackgroundTransparency = 1,
		ZIndex = 2,
		Name = p155 .. "Label",
		Text = p155,
		Font = themeModule.font(Enum.Font.SourceSansBold, "UtilityRow"),
		TextSize = themeModule.textSize(16, "UtilityRow"),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(0.4, -20, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		Parent = var235
	})
	create("UIPadding")({
		Name = p155 .. "UIPadding",
		PaddingBottom = UDim.new(0, 10),
		PaddingTop = UDim.new(0, 10),
		Parent = var236
	})
	
	local function onResized(_, p159)
		-- upvalues: p158 (ref), var236 (ref), themeModule (copy), var29 (copy)
		if p158 then
			UDim2.new(0, 200, 1, 0)
		end
		if p159 then
			var236.TextSize = themeModule.textSize(16, "UtilityRow")
			
			return
		end
		var236.TextSize = var29 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	
	t[var235] = onResized
	local var238 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	onResized(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport(), var238.X < var238.Y)
	
	if p157 then
		var235.Position = UDim2.new(var235.Position.X.Scale, var235.Position.X.Offset, var235.Position.Y.Scale, var235.Position.Y.Offset + p157)
	end
	var234 += var50
	
	if p157 then
		var234 += p157
	end
	t_2[p154] = var234
	var235.MouseEnter:Connect(function()
		-- upvalues: var235 (ref), guiService (copy)
		if var235.Visible then
			guiService.SelectedCoreObject = var235
		end
	end)
	p156.SelectionImageObject = var33
	p156.SelectionGained:Connect(function()
		-- upvalues: VRService (copy), var235 (ref), themeModule (copy)
		if VRService.VREnabled then
			var235.ImageTransparency = themeModule.transparency("RowFrameBackground", 0.5)
			var235.BackgroundTransparency = 1
			
			return
		end
		var235.ImageTransparency = 1
		var235.BackgroundTransparency = themeModule.transparency("RowFrameBackground", 0.5)
	end)
	p156.SelectionLost:Connect(function()
		-- upvalues: var235 (ref)
		var235.ImageTransparency = 1
		var235.BackgroundTransparency = 1
	end)
	p156.Parent = var235
	p154:AddRow(var235, var236, p156, p157, true)
	
	return var235
end

local t_3 = {
	GetEaseLinear = function(_)
		-- upvalues: Linear (ref)
		return Linear
	end,
	GetEaseOutQuad = function(_)
		-- upvalues: EaseOutQuad (ref)
		return EaseOutQuad
	end,
	GetEaseInOutQuad = function(_)
		-- upvalues: EaseInOutQuad (ref)
		return EaseInOutQuad
	end,
	CreateNewSlider = function(_, p160, p161, p162, p163, p164)
		-- upvalues: CreateNewSlider (ref)
		return CreateNewSlider(p160, p161, p162, p163, p164)
	end,
	CreateNewSelector = function(_, p165, p166)
		-- upvalues: CreateSelector (ref)
		return CreateSelector(p165, p166)
	end,
	CreateNewDropDown = function(_, p167, p168)
		-- upvalues: CreateDropDown (ref)
		return CreateDropDown(p167, p168, nil)
	end,
	AddNewRow = function(_, p169, p170, p171, p172, p173, p174, p175, p176, p177, p178)
		-- upvalues: AddNewRow (ref)
		return AddNewRow(p169, p170, p171, p172, p173, p174, p175, p176, p177, p178)
	end,
	AddNewRowObject = function(_, p179, p180, p181, p182, p183)
		-- upvalues: AddNewRowObject (ref)
		return AddNewRowObject(p179, p180, p181, p182, p183)
	end,
	ShowAlert = function(_, p184, p185, p186, p187, p188)
		-- upvalues: ShowAlert (ref)
		ShowAlert(p184, p185, p186, p187, p188)
	end,
	IsSmallTouchScreen = function(_)
		-- upvalues: guiService (ref), userInputService (ref)
		local var239 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
		
		return userInputService.TouchEnabled and (if var239.Y >= 500 then var239.X < 700 else true)
	end,
	IsPortrait = function(_)
		-- upvalues: guiService (ref)
		local var240 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
		
		return var240.X < var240.Y
	end
}

if fFlagRefactorMenuConfirmationButtonsModule then
	local _ = function()
		-- upvalues: t_1 (ref), userInputService (ref)
		return t_1[userInputService:GetLastInputType()] or false
	end
	
	function t_3.IsUsingGamepad(_)
		-- upvalues: t_1 (ref), userInputService (ref)
		return t_1[userInputService:GetLastInputType()] or false
	end
end
function t_3.MakeStyledButton(_, p189, p190, p191, p192, p193, p194)
	-- upvalues: MakeButton (ref)
	return MakeButton(p189, p190, p191, p192, p193, p194)
end

function t_3.MakeStyledImageButton(_, p195, p196, p197, p198, p199, p200, p201, p202)
	-- upvalues: MakeImageButton (ref)
	return MakeImageButton(p195, p196, p197, p198, p199, p200, p201, p202)
end

function t_3.AddButtonRow(_, p203, p204, p205, p206, p207, p208)
	-- upvalues: AddButtonRow (ref)
	return AddButtonRow(p203, p204, p205, p206, p207, p208)
end

function t_3.MakeFocusState(_, p209, p210)
	-- upvalues: MakeRoundedRectFocusState (ref)
	return MakeRoundedRectFocusState(p209, p210)
end

function t_3.CreateSignal(_)
	-- upvalues: CreateSignal (ref)
	return CreateSignal()
end

function t_3.UsesSelectedObject(_)
	-- upvalues: VRService (ref), userInputService (ref)
	return if VRService.VREnabled then false else userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled
end

function t_3.TweenProperty(_, p211, p212, p213, p214, p215, p216, p217)
	return PropertyTweener(p211, p212, p213, p214, p215, p216, p217)
end

function t_3.OnResized(_, p218, p219)
	-- upvalues: addOnResizedCallback (ref)
	return addOnResizedCallback(p218, p219)
end

function t_3.FireOnResized(_)
	-- upvalues: guiService (ref), t_3 (ref), t (ref)
	local var241 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var242 = t_3:IsPortrait()
	
	for i, v in pairs(t) do
		v(var241, var242)
	end
end

function t_3.Lerp(_, endValue, alpha, p220)
	return (1 - endValue) * alpha + endValue * p220
end

function t_3.Round(_, p221)
	return p221 % 1 >= 0.5 and math.ceil(p221) or math.floor(p221)
end

function t_3.IsExperienceOlderThanOneWeek(_, p222)
	-- upvalues: workspaceService (ref)
	return p222 == nil or p222.Created == nil or workspaceService:GetServerTimeNow() * 1000 - DateTime.fromIsoDate(p222.Created).UnixTimestampMillis <= 604800000
end

return t_3