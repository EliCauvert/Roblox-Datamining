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
local fFlagAddNextUpContainerModule = require(robloxGui.Modules.Settings.Pages.LeaveGameWithNextUp.Flags.FFlagAddNextUpContainer)
local repositionDropDownScrim = game:DefineFastFlag("RepositionDropDownScrim", false)
local deprecateOldGuiObjectPropertiesEngineFeature = game:GetEngineFeature("DeprecateOldGuiObjectProperties")
local chrome = robloxGui.Modules.Chrome
local var22 = if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then require(chrome.Service) else nil
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
local var31 = require(robloxGui.Modules:WaitForChild("TenFootInterface")):IsEnabled()
local var32 = signalsModule.createComputed(function(p0) --[[ line: 86 ]]
	-- upvalues: responsiveModule (ref)
	return responsiveModule.GetInputModeStore(p0).getLastInputType(p0) == responsiveModule.Input.Touch
end)
local var33 = signalsModule.createComputed(function(p1) --[[ line: 91 ]]
	-- upvalues: responsiveModule (ref)
	return responsiveModule.GetInputModeStore(p1).getLastInputType(p1) == responsiveModule.Input.Pointer
end)
local t = {}
setmetatable(t, { __mode = "k" })
local var35 = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 })

function clamp(value, minValue, maxValue) --[[ line: 108 ]]
	return math.max(value, math.min(minValue, maxValue))
end

local function Linear(p2, p3, p4, p5) --[[ line: 113 ]]
	return if p5 <= p2 then p3 + p4 else p4 * p2 / p5 + p3
end

local function EaseOutQuad(p6, p7, p8, p9) --[[ line: 121 ]]
	if p9 <= p6 then
		return p7 + p8
	end
	p6 /= p9
	
	return p7 - p8 * p6 * (p6 - 2)
end

local function EaseInOutQuad(p10, p11, p12, p13) --[[ line: 130 ]]
	if p13 <= p10 then
		return p11 + p12
	end
	p10 /= p13
	
	return if p10 < 0.5 then 2 * p12 * p10 * p10 + p11 else p11 + p12 * (2 * (2 - p10) * p10 - 1)
end

function PropertyTweener(p14, p15, p16, p17, p18, p19, p20) --[[ line: 142 ]]
	-- upvalues: runService (ref)
	local t = { StartTime = tick() }
	t.EndTime = t.StartTime + p18
	t.Cancelled = false
	local var58 = false
	local var59 = 0
	
	local function _() --[[ line: 151 | named "finalize" ]]
		-- upvalues: p14 (ref), p15 (ref), p19 (ref), p16 (ref), p17 (ref), var58 (write), var59 (write), p20 (ref)
		if p14 then
			p14[p15] = p19(1, p16, p17 - p16, 1)
		end
		var58 = true
		var59 = 1
		
		if p20 then
			p20()
		end
	end
	
	p14[p15] = p19(0, p16, p17 - p16, p18)
	coroutine.wrap(function() --[[ line: 164 ]]
		-- upvalues: t (ref), p14 (ref), p15 (ref), p19 (ref), p16 (ref), p17 (ref), p18 (ref), var59 (write), runService (copy), var58 (write), p20 (ref)
		local currentTime = tick()
		while currentTime < t.EndTime and p14 do
			if not t.Cancelled then
				p14[p15] = p19(currentTime - t.StartTime, p16, p17 - p16, p18)
				var59 = clamp(0, 1, (currentTime - t.StartTime) / p18)
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
			var58 = true
			var59 = 1
			
			if p20 then
				p20()
			end
		end
	end)()
	
	function t.GetFinal(_) --[[ line: 180 ]]
		-- upvalues: p17 (ref)
		return p17
	end
	
	function t.GetPercentComplete(_) --[[ line: 184 ]]
		-- upvalues: var59 (write)
		return var59
	end
	
	function t.IsFinished(_) --[[ line: 188 ]]
		-- upvalues: var58 (write)
		return var58
	end
	
	function t.Finish(p21) --[[ line: 192 ]]
		-- upvalues: var58 (write), p14 (ref), p15 (ref), p19 (ref), p16 (ref), p17 (ref), var59 (write), p20 (ref)
		if not var58 then
			p21:Cancel()
			
			if p14 then
				p14[p15] = p19(1, p16, p17 - p16, 1)
			end
			var58 = true
			var59 = 1
			
			if p20 then
				p20()
			end
		end
	end
	
	function t.Cancel(_) --[[ line: 199 ]]
		-- upvalues: t (ref)
		t.Cancelled = true
	end
	
	return t
end

local function _() --[[ line: 206 | named "isTouchInput" ]]
	-- upvalues: userInputService (ref)
	return userInputService.PreferredInput == Enum.PreferredInput.Touch
end

local function CreateSignal() --[[ line: 212 ]]
	local t = {}
	local bindableEvent = Instance.new("BindableEvent")
	local var63 = nil
	local var64 = nil
	
	function t.fire(_, ...) --[[ line: 220 ]]
		-- upvalues: var63 (write), var64 (write), bindableEvent (ref)
		var63 = { ... }
		var64 = select("#", ...)
		bindableEvent:Fire()
	end
	
	function t.connect(_, p22) --[[ line: 226 ]]
		-- upvalues: bindableEvent (ref), var63 (write), var64 (write)
		if not p22 then
			error("connect(nil)", 2)
		end
		return bindableEvent.Event:Connect(function() --[[ line: 230 ]]
			-- upvalues: p22 (ref), var63 (copy), var64 (copy)
			p22(unpack(var63, 1, var64))
		end)
	end
	
	function t.wait(_) --[[ line: 235 ]]
		-- upvalues: bindableEvent (ref), var63 (write), var64 (write)
		bindableEvent.Event:wait()
		
		if not var63 then
			error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
		end
		return unpack(var63, 1, var64)
	end
	
	return t
end

local _ = function() --[[ line: 246 | named "getViewportSize" ]]
	-- upvalues: guiService (ref)
	return if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
end

local _ = function() --[[ line: 255 | named "isSmallTouchScreen" ]]
	-- upvalues: guiService (ref), userInputService (ref)
	local var65 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	return userInputService.TouchEnabled and (if var65.Y >= 500 then var65.X < 700 else true)
end

local _ = function() --[[ line: 260 | named "isPortrait" ]]
	-- upvalues: guiService (ref)
	local var66 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	return var66.X < var66.Y
end

local _ = function() --[[ line: 265 | named "isTenFootInterface" ]]
	-- upvalues: var31 (ref)
	return var31
end

local _ = function() --[[ line: 269 | named "usesSelectedObject" ]]
	-- upvalues: VRService (ref), userInputService (ref)
	return if VRService.VREnabled then false else userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled
end

local function addHoverState(p23, p24, p25, p26) --[[ line: 282 ]]
	local function onNormalButtonStateCallback() --[[ line: 283 ]]
		-- upvalues: p23 (ref), p25 (ref), p24 (ref)
		if p23.Active then
			p25(p24)
		end
	end
	
	local function onHoverButtonStateCallback() --[[ line: 288 ]]
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

local function addOnResizedCallback(p27, p28) --[[ line: 302 ]]
	-- upvalues: t (ref), guiService (ref)
	t[p27] = p28
	local var69 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	p28(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport(), var69.X < var69.Y)
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

local function MakeDefaultButton(p29, p30, p31, p32, p33, p34) --[[ line: 318 ]]
	-- upvalues: create (ref), themeModule (ref), t_1 (ref), userInputService (ref), guiService (ref), VRService (ref)
	local var70 = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 })
	local _ = nil
	local _ = nil
	local var71 = "DefaultButtonStroke"
	local var72 = "DefaultButton"
	
	if p29 == "DropDownFrame" then
		var71 = "ControlInputStroke"
		var72 = "ControlInputBackground"
	end
	if p34 == "ImageButton" then
		var72 = "ImageButton"
	end
	local var73 = create("ImageButton")({
		AutoButtonColor = false,
		ZIndex = 2,
		Name = p29 .. "Button",
		BackgroundColor3 = themeModule.color(var72),
		BackgroundTransparency = themeModule.transparency(var72),
		Size = p30,
		SelectionImageObject = var70
	})
	create("UICorner")({
		CornerRadius = themeModule.DefaultCornerRadius,
		Parent = var73
	})
	local var74 = create("UIStroke")({
		Name = "Border",
		Color = themeModule.color(var71),
		Transparency = themeModule.transparency(var71),
		Thickness = themeModule.DefaultStokeThickness,
		Parent = var73
	})
	local _ = create("BoolValue")({ Name = "Enabled", Value = true, Parent = var73 })
	
	if p31 then
		var73.MouseButton1Click:Connect(function() --[[ line: 365 ]]
			-- upvalues: p31 (ref), t_1 (copy), userInputService (copy)
			p31(t_1[userInputService:GetLastInputType()] or false)
		end)
	elseif var74 then
		var74.Enabled = false
	end
	var73.Selectable = false
	local function _(p35) --[[ line: 375 | named "isPointerInput" ]]
		return if p35.UserInputType ~= Enum.UserInputType.MouseMovement then p35.UserInputType == Enum.UserInputType.Touch else true
	end
	
	local var75 = nil
	
	local function setRowRef(value) --[[ line: 381 ]]
		-- upvalues: var75 (write)
		var75 = value
	end
	
	local function selectButton() --[[ line: 385 ]]
		-- upvalues: p33 (ref), p32 (ref), var73 (write), themeModule (copy), var75 (write)
		local var78 = p33
		
		if var78 == nil and p32 then
			var78 = p32.HubRef
		end
		if var78 and var78.Active or var78 == nil then
			var73.BackgroundColor3 = themeModule.color("DefaultButtonHover")
			var73.BackgroundTransparency = themeModule.transparency("DefaultButtonHover")
			local var79 = var75 or var73
			
			if var78 then
				var78:ScrollToFrame(var79)
			end
		end
	end
	
	local _ = function() --[[ line: 407 | named "deselectButton" ]]
		-- upvalues: var73 (write), themeModule (copy), var72 (write)
		var73.BackgroundColor3 = themeModule.color(var72)
		var73.BackgroundTransparency = themeModule.transparency(var72)
	end
	
	var73.InputBegan:Connect(function(p36) --[[ line: 412 ]]
		-- upvalues: var73 (write), selectButton (ref)
		if var73.Selectable then
			if if p36.UserInputType ~= Enum.UserInputType.MouseMovement then p36.UserInputType == Enum.UserInputType.Touch else true then
				selectButton()
			end
		end
	end)
	var73.InputEnded:Connect(function(p37) --[[ line: 417 ]]
		-- upvalues: var73 (write), guiService (copy), themeModule (copy), var72 (write)
		if var73.Selectable and guiService.SelectedCoreObject ~= var73 then
			if if p37.UserInputType ~= Enum.UserInputType.MouseMovement then p37.UserInputType == Enum.UserInputType.Touch else true then
				var73.BackgroundColor3 = themeModule.color(var72)
				var73.BackgroundTransparency = themeModule.transparency(var72)
			end
		end
	end)
	var73.SelectionGained:Connect(function() --[[ line: 423 ]]
		-- upvalues: selectButton (ref)
		selectButton()
	end)
	var73.SelectionLost:Connect(function() --[[ line: 426 ]]
		-- upvalues: var73 (write), themeModule (copy), var72 (write)
		var73.BackgroundColor3 = themeModule.color(var72)
		var73.BackgroundTransparency = themeModule.transparency(var72)
	end)
	local _ = guiService.Changed:Connect(function(p38) --[[ line: 430 ]]
		-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var73 (write), themeModule (copy), var72 (write), selectButton (ref)
		if p38 ~= "SelectedCoreObject" then return end
		if not (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) then return end
		if guiService.SelectedCoreObject == nil or guiService.SelectedCoreObject ~= var73 then
			var73.BackgroundColor3 = themeModule.color(var72)
			var73.BackgroundTransparency = themeModule.transparency(var72)
			
			return
		elseif var73.Selectable then
			selectButton()
		end
	end)
	
	return var73, setRowRef
end

local function MakeButton(p39, p40, p41, p42, p43, p44) --[[ line: 451 ]]
	-- upvalues: MakeDefaultButton (ref), create (ref), themeModule (ref), guiService (ref), userInputService (ref), var31 (ref), enablePreferredTextSizeAccessGuiServiceEngineFeature (ref)
	local var80, var81 = MakeDefaultButton(p39, p41, p42, p43, p44)
	local var82 = create("TextLabel")({
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
		Parent = var80
	})
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint", var82)
	local var84 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var85 = userInputService.TouchEnabled and (if var84.Y >= 500 then var84.X < 700 else true)
	
	if var85 then
		var82.TextSize = themeModule.textSize(18)
	elseif var31 then
		var85 = if p39 ~= "FriendStatus" then p39 == "BlockButton" else true
		
		if not var85 then
			var82.TextSize = themeModule.textSize(36)
		end
	end
	if enablePreferredTextSizeAccessGuiServiceEngineFeature then
		local var86 = (guiService.PreferredTextSize.Value - 1) * 3
		UITextSizeConstraint.MaxTextSize = var82.TextSize + var86
		local textSize = var82.TextSize
		guiService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function() --[[ line: 487 ]]
			-- upvalues: var86 (write), guiService (copy), UITextSizeConstraint (ref), textSize (ref)
			var86 = (guiService.PreferredTextSize.Value - 1) * 3
			UITextSizeConstraint.MaxTextSize = textSize + var86
		end)
	else
		UITextSizeConstraint.MaxTextSize = var82.TextSize
	end
	return var80, var82, var81
end

local function MakeImageButton(p45, p46, p47, p48, p49, p50, p51, p52) --[[ line: 496 ]]
	-- upvalues: MakeDefaultButton (ref), migration (ref), themeModule (ref), create (ref), increaseLegacyPeopleRowButtonSize (ref), builderIconsModule (ref)
	if not p52 then
		p52 = "ImageButton"
	end
	local var87, var88 = MakeDefaultButton(p45, p47, p49, p50, p51, p52)
	local imageRectOffset = nil
	local imageRectSize = nil
	local var89 = migration.uiblox[p46] or migration.luaApps[p46]
	
	if not string.match(p46, "^rbxasset://") then
		p46 = themeModule.Images[p46]
	end
	if typeof(p46) == "table" then
		imageRectOffset = p46.ImageRectOffset
		imageRectSize = p46.ImageRectSize
		p46 = p46.Image
	end
	local var90 = if var89 then create("TextLabel")({
		BackgroundTransparency = 1,
		ZIndex = 2,
		Name = p45 .. "TextLabel",
		Size = p48,
		TextSize = if increaseLegacyPeopleRowButtonSize then p48.Y.Offset * 0.857142857143 else p48.Y.Offset * 0.666666666667,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		TextColor3 = Color3.new(1, 1, 1),
		Text = var89.name,
		FontFace = builderIconsModule.Font[var89.variant],
		Parent = var87
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
		Parent = var87
	})
	
	if p52 == "ImageButton" then
		var87.Border.Thickness = 0
		var87.Border.Transparency = 1
	end
	return var87, var90, var88
end

local function AddButtonRow(p53, p54, p55, p56, p57, p58) --[[ line: 551 ]]
	-- upvalues: MakeButton (ref), create (ref)
	local var91, var92, var93 = MakeButton(p54, p55, p56, p57, p53, p58)
	local var94 = create("Frame")({
		BackgroundTransparency = 1,
		Name = p54 .. "Row",
		Size = UDim2.new(1, 0, p56.Y.Scale, p56.Y.Offset),
		Parent = p53.Page
	})
	var91.Parent = var94
	var91.AnchorPoint = Vector2.new(1, 0)
	var91.Position = UDim2.new(1, -20, 0, 0)
	
	return var94, var91, var92, var93
end

local function MakeRoundedRectFocusState(value, p59) --[[ line: 567 ]]
	-- upvalues: create (ref), uDim (ref), themeModule (ref), runService (ref), userGameSettingsService (ref)
	local var95 = create("Frame")({
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 12, 1, 12),
		Position = UDim2.fromOffset(-6, -6)
	})
	create("UICorner")({ CornerRadius = uDim, Parent = var95 })
	local var96 = create("UIGradient")({
		Rotation = 0,
		Color = themeModule.selectionCursor.GradientColorSequence,
		Transparency = themeModule.selectionCursor.GradientTransparencySequence,
		Parent = create("UIStroke")({
			Transparency = 0,
			Thickness = 3,
			Color = themeModule.selectionCursor.AnimatedColor,
			Parent = var95
		})
	})
	runService:UnbindFromRenderStep(p59)
	runService:BindToRenderStep(p59, Enum.RenderPriority.Last.Value, function() --[[ line: 594 ]]
		-- upvalues: var96 (ref), themeModule (copy), userGameSettingsService (copy)
		local var97 = var96.Rotation + 2
		local gradientColorSequence = themeModule.selectionCursor.GradientColorSequence
		local gradientTransparencySequence = themeModule.selectionCursor.GradientTransparencySequence
		
		if userGameSettingsService.ReducedMotion then
			local var98 = (math.sin(math.rad(var97)) + 1) / 2
			gradientColorSequence = ColorSequence.new(gradientColorSequence.Keypoints[1].Value:lerp(gradientColorSequence.Keypoints[#gradientColorSequence.Keypoints].Value, var98))
			local value = gradientTransparencySequence.Keypoints[1].Value
			gradientTransparencySequence = NumberSequence.new(value + (gradientTransparencySequence.Keypoints[#gradientTransparencySequence.Keypoints].Value - value) * var98)
		end
		var96.Rotation = var97
		var96.Color = gradientColorSequence
		var96.Transparency = gradientTransparencySequence
	end)
	value.AncestryChanged:Connect(function(_, p60) --[[ line: 618 ]]
		-- upvalues: runService (copy), p59 (ref)
		if not p60 then
			runService:UnbindFromRenderStep(p59)
		end
	end)
	value.SelectionImageObject = var95
end

local function CreateDropDown(p61, p62, p63) --[[ line: 627 ]]
	-- upvalues: themeModule (ref), httpService (ref), guiService (ref), create (ref), repositionDropDownScrim (ref), coreGuiService (ref), VRService (ref), isInExperienceUIVREnabled (ref), corePackagesService_1 (ref), userInputService (ref), contextActionService (ref), fFlagHideShortcutsWhileIemDropdownActive (ref), var22 (ref), robloxTranslatorModule (ref), MakeButton (ref)
	local SELECTION_TEXT_COLOR_NORMAL = themeModule.color("SELECTION_TEXT_COLOR_NORMAL", Color3.fromRGB(178, 178, 178))
	local color = Color3.fromRGB(229, 229, 229)
	local SELECTION_TEXT_COLOR_HIGHLIGHTED = themeModule.color("SELECTION_TEXT_COLOR_HIGHLIGHTED", Color3.fromRGB(255, 255, 255))
	local var102 = nil
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
		local var105 = true
		local var106 = httpService:GenerateGUID(false)
		local enabled = nil
		local var107 = p61
		local guiInset, _ = guiService:GetGuiInset()
		local var109 = create("ImageButton")({
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
		
		local function onVREnabled(p64) --[[ line: 679 ]]
			-- upvalues: VRService (copy), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), var109 (ref), coreGuiService (copy), t (ref), var107 (write)
			if p64 ~= "VREnabled" then return end
			if not VRService.VREnabled then
				var109.Parent = coreGuiService.RobloxGui
				var109.BackgroundTransparency = 0.2
			elseif isInExperienceUIVREnabled then
				local vrSpatialUiModule = require(corePackagesService_1.Workspace.Packages.VrSpatialUi)
				var109.Parent = vrSpatialUiModule.UIManager.getInstance():getPanelObject(vrSpatialUiModule.Constants.PanelType.MoreMenu)
				var109.BackgroundTransparency = 0.2
			else
				var109.Parent = require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):GetGUI()
				var109.BackgroundTransparency = 1
			end
			if t.UpdateDropDownList then
				t:UpdateDropDownList(var107)
			end
		end
		
		VRService.Changed:Connect(onVREnabled)
		onVREnabled("VREnabled")
		local var111 = create("ImageLabel")({
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
			Parent = var109
		})
		create("UICorner")({
			CornerRadius = themeModule.DefaultCornerRadius,
			Parent = var111
		})
		local var112 = create("ScrollingFrame")({
			Name = "DropDownScrollingFrame",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10,
			Size = UDim2.new(1, -20, 1, -25),
			Position = UDim2.new(0, 10, 0, 10),
			ScrollBarThickness = themeModule.DefaultScrollBarThickness,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Parent = var111
		})
		local var113 = nil
		local var114 = false
		
		local var115 = function(p65, p66) --[[ line: 743 ]]
			-- upvalues: t (ref), var105 (write), p63 (ref), var109 (ref), VRService (copy), userInputService (copy), guiService (copy), var102 (write), var113 (write), contextActionService (copy), var106 (ref), enabled (write), var114 (write), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy)
			if p65 ~= nil and p66 ~= Enum.UserInputState.Begin then return end
			t.DropDownFrame.Selectable = var105
			p63:SetActive(true)
			
			if var109.Visible then
				if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
					guiService.SelectedCoreObject = var102
				end
			end
			var109.Visible = false
			
			if var113 then
				var113:Disconnect()
			end
			contextActionService:UnbindCoreAction(var106 .. "Action")
			contextActionService:UnbindCoreAction(var106 .. "FreezeAction")
			enabled.Value = var105
			var114 = false
			
			if VRService.VREnabled and not isInExperienceUIVREnabled then
				require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(var109, 0)
			end
		end
		
		local var116 = function() --[[ line: 773 ]] end
		
		local var117 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.ChooseOne")
		t.DropDownFrame = MakeButton("DropDownFrame", var117, UDim2.new(0.6, 0, 0, 40), function() --[[ line: 775 ]]
			-- upvalues: var105 (write), t (ref), var114 (write), var109 (ref), VRService (copy), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), var102 (write), guiService (copy), var113 (write), SELECTION_TEXT_COLOR_HIGHLIGHTED (ref), color (ref), SELECTION_TEXT_COLOR_NORMAL (ref), var115 (ref), fFlagHideShortcutsWhileIemDropdownActive (copy), var22 (copy), contextActionService (copy), var106 (ref), var116 (ref), p63 (ref), enabled (write)
			if not var105 then return end
			t.DropDownFrame.Selectable = false
			var114 = true
			var109.Visible = true
			
			if VRService.VREnabled and not isInExperienceUIVREnabled then
				require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(var109, 0.5)
			end
			var102 = t.DropDownFrame
			
			if t.CurrentIndex and t.CurrentIndex > 0 then
				guiService.SelectedCoreObject = t.Selections[t.CurrentIndex]
			elseif #t.Selections > 0 then
				guiService.SelectedCoreObject = t.Selections[1]
			end
			var113 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 798 ]]
				-- upvalues: t (copy), guiService (copy), SELECTION_TEXT_COLOR_HIGHLIGHTED (copy), VRService (copy), color (copy), SELECTION_TEXT_COLOR_NORMAL (copy)
				for i = 1, #t.Selections do
					if guiService.SelectedCoreObject == t.Selections[i] then
						t.Selections[i].TextColor3 = SELECTION_TEXT_COLOR_HIGHLIGHTED
					else
						t.Selections[i].TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL
					end
				end
			end)
			local var122 = var115
			
			if fFlagHideShortcutsWhileIemDropdownActive then
				var22:setHideShortcutBar("InExperienceMenuDropdown", true)
				
				var122 = function(p67, p68) --[[ line: 812 ]]
					-- upvalues: var115 (copy), var22 (copy)
					var115(p67, p68)
					var22:setHideShortcutBar("InExperienceMenuDropdown", false)
				end
			end
			contextActionService:BindCoreAction(var106 .. "FreezeAction", var116, false, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1)
			contextActionService:BindCoreAction(var106 .. "Action", var122, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
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
		local var118 = create("ImageLabel")({
			Name = "DropDownImage",
			Image = "rbxasset://textures/ui/Settings/DropDown/DropDown.png",
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0, 15, 0, 10),
			Position = UDim2.new(1, -12, 0.5, 0),
			Parent = t.DropDownFrame
		})
		t.DropDownImage = var118
		
		local function setSelection(value) --[[ line: 865 ]]
			-- upvalues: t (ref), dropDownFrameTextLabel (ref), indexChanged (ref)
			local var123 = false
			
			for i, v in pairs(t.Selections) do
				if i == value then
					dropDownFrameTextLabel.Text = v.Text
					t.CurrentIndex = i
					var123 = true
				end
			end
			if var123 then
				indexChanged:Fire(value)
			end
		end
		
		local function setSelectionByValue(value) --[[ line: 881 ]]
			-- upvalues: t (ref), dropDownFrameTextLabel (ref), indexChanged (ref)
			local var124 = false
			
			for i, v in pairs(t.Selections) do
				if v.Text == value then
					dropDownFrameTextLabel.Text = v.Text
					t.CurrentIndex = i
					var124 = true
				end
			end
			if var124 then
				indexChanged:Fire(t.CurrentIndex)
			end
			return var124
		end
		
		local function _(value) --[[ line: 898 | named "setIsFaded" ]]
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
		
		function t.SetSelectionIndex(_, p69) --[[ line: 913 ]]
			-- upvalues: setSelection (ref)
			setSelection(p69)
		end
		
		function t.SetSelectionByValue(_, p70) --[[ line: 917 ]]
			-- upvalues: setSelectionByValue (ref)
			return setSelectionByValue(p70)
		end
		
		function t.ResetSelectionIndex(_) --[[ line: 921 ]]
			-- upvalues: t (ref), dropDownFrameTextLabel (ref), var117 (ref), var115 (ref)
			t.CurrentIndex = nil
			dropDownFrameTextLabel.Text = var117
			var115()
		end
		
		function t.GetSelectedIndex(_) --[[ line: 927 ]]
			-- upvalues: t (ref)
			return t.CurrentIndex
		end
		
		function t.SetZIndex(_, p71) --[[ line: 931 ]]
			-- upvalues: t (ref), var118 (ref), dropDownFrameTextLabel (ref)
			t.DropDownFrame.ZIndex = p71
			var118.ZIndex = p71
			dropDownFrameTextLabel.ZIndex = p71
		end
		
		function t.SetInteractable(_, p72) --[[ line: 937 ]]
			-- upvalues: var105 (write), t (ref), var115 (ref), VRService (copy), enabled (write), var114 (write)
			var105 = p72
			t.DropDownFrame.Selectable = var105
			
			if var105 then
				t.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
				t.DropDownFrame.ImageTransparency = 0
				t.DropDownImage.ImageTransparency = 0
				
				if not VRService.VREnabled then
					t:SetZIndex(2)
				end
			else
				var115()
				
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
			enabled.Value = p72 and not var114
			t.DropDownImage.Visible = p72
			
			if p72 then
				t.DropDownFrame.ImageTransparency = 0
				
				return
			end
			t.DropDownFrame.ImageTransparency = 0.5
		end
		
		function t.SetAutoLocalize(_, p73) --[[ line: 964 ]]
			-- upvalues: var109 (ref)
			var109.AutoLocalize = p73
		end
		
		function t.UpdateDropDownList(_, p74) --[[ line: 968 ]]
			-- upvalues: var107 (write), t (ref), VRService (copy), themeModule (copy), create (copy), color (ref), SELECTION_TEXT_COLOR_NORMAL (ref), var112 (ref), p62 (ref), dropDownFrameTextLabel (ref), SELECTION_TEXT_COLOR_HIGHLIGHTED (ref), var115 (ref), indexChanged (ref), userInputService (copy), guiService (copy), var106 (ref), var109 (ref), var111 (ref)
			var107 = p74
			
			if t.Selections then
				for i = 1, #t.Selections do
					t.Selections[i]:Destroy()
				end
			end
			t.Selections = {}
			t.SelectionInfo = {}
			local VREnabled = VRService.VREnabled
			local sourceSansBold = VREnabled and themeModule.font(Enum.Font.SourceSansBold, "Bold") or themeModule.font(Enum.Font.SourceSans, "UtilityText")
			local var126 = VREnabled and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
			local var127 = if VREnabled then 70 else 50
			local var128 = var127 + 1
			local var129 = if VREnabled then 600 else 400
			local var130 = 0
			
			for i_1, v in pairs(p74) do
				local var132 = create("Frame")({
					BackgroundTransparency = 0.7,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				})
				create("UICorner")({
					CornerRadius = themeModule.DefaultCornerRadius,
					Parent = var132
				})
				local var133 = v
				local var134 = ""
				local isTable = typeof(v) == "table"
				
				if isTable then
					var133 = v.title
					var134 = v.subtitle
					var130 += 10
				end
				local var136
				local _ = nil
				
				if isTable then
					var136 = create("TextButton")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false,
						ZIndex = 10,
						Name = "Selection" .. tostring(i_1),
						TextYAlignment = Enum.TextYAlignment.Top,
						Size = UDim2.new(1, -28, 0, var127 + 10),
						Position = UDim2.new(0, 14, 0, (i_1 - 1) * (var128 + 10)),
						TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL,
						Font = sourceSansBold,
						TextSize = var126,
						Text = var133,
						SelectionImageObject = var132,
						Parent = var112
					})
					local _ = create("TextLabel")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ZIndex = 10,
						Name = "Subtitle" .. tostring(i_1),
						Size = UDim2.new(1, -28, 0, var127 * 0.8),
						Position = UDim2.new(0, 14, 0, 15),
						TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL,
						Font = sourceSansBold,
						TextSize = var126 * 0.8,
						Text = var134,
						Parent = var136
					})
				else
					var136 = create("TextButton")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false,
						ZIndex = 10,
						Name = "Selection" .. tostring(i_1),
						Size = UDim2.new(1, -28, 0, var127),
						Position = UDim2.new(0, 14, 0, (i_1 - 1) * var128),
						TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL,
						Font = sourceSansBold,
						TextSize = var126,
						Text = v,
						SelectionImageObject = var132,
						Parent = var112
					})
				end
				if i_1 == p62 then
					t.CurrentIndex = i_1
					dropDownFrameTextLabel.Text = var133
					var136.TextColor3 = SELECTION_TEXT_COLOR_HIGHLIGHTED
				elseif not p62 and i_1 == 1 then
					var136.TextColor3 = SELECTION_TEXT_COLOR_HIGHLIGHTED
				end
				local var137 = function() --[[ line: 1072 ]]
					-- upvalues: dropDownFrameTextLabel (copy), var136 (write), var115 (copy), t (copy), i_1 (ref), indexChanged (copy)
					dropDownFrameTextLabel.Text = var136.Text
					var115()
					t.CurrentIndex = i_1
					indexChanged:Fire(i_1)
				end
				
				var136.MouseButton1Click:Connect(var137)
				var136.MouseEnter:Connect(function() --[[ line: 1081 ]]
					-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var136 (write)
					if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
						guiService.SelectedCoreObject = var136
					end
				end)
				t.Selections[i_1] = var136
				t.SelectionInfo[var136] = { Clicked = var137 }
			end
			guiService:RemoveSelectionGroup(var106)
			guiService:AddSelectionTuple(var106, unpack(t.Selections))
			var112.CanvasSize = UDim2.new(1, -20, 0, #p74 * var128 + var130)
			
			local function updateDropDownSize() --[[ line: 1097 ]]
				-- upvalues: var112 (copy), var109 (copy), var111 (copy), var129 (ref)
				if var112.CanvasSize.Y.Offset < var109.AbsoluteSize.Y - 10 then
					var111.Size = UDim2.new(0, var129, 0, var112.CanvasSize.Y.Offset + 25)
					
					return
				end
				var111.Size = UDim2.new(0, var129, 0.9, 0)
			end
			
			var109.Changed:Connect(function(p75) --[[ line: 1110 ]]
				-- upvalues: updateDropDownSize (ref)
				if p75 == "AbsoluteSize" then
					updateDropDownSize()
					
					return
				end
			end)
			updateDropDownSize()
		end
		
		t:UpdateDropDownList(p61)
		var109.MouseButton1Click:Connect(var115)
		p63.PoppedMenu:Connect(function(p76) --[[ line: 1125 ]]
			-- upvalues: var109 (ref), var115 (ref)
			if p76 == var109 then
				var115()
			end
		end)
		
		return t
	end
	error("CreateDropDown dropDownStringTable (first arg) is not a table", 2)
	
	return t
end

local function CreateSelector(p77, p78) --[[ line: 1134 ]]
	-- upvalues: create (ref), var35 (ref), themeModule (ref), ARROW_COLOR (ref), userInputService (ref), ARROW_COLOR_HOVER (ref), addHoverState (ref), VRService (ref), guiService (ref), EaseOutQuad (ref), deprecateOldGuiObjectPropertiesEngineFeature (ref), ARROW_COLOR_INACTIVE (ref), var31 (ref), var32 (ref), var33 (ref), t (ref)
	local var138 = 0
	local t_1 = { HubRef = nil, SetSelectionIndex = nil }
	
	if type(p77) ~= "table" then
		error("CreateSelector selectionStringTable (first arg) is not a table", 2)
		
		return t_1
	end
	local indexChanged = Instance.new("BindableEvent")
	indexChanged.Name = "IndexChanged"
	local var141 = true
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
		SelectionImageObject = var35
	})
	local var142 = create("ImageButton")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var35,
		Parent = t_1.SelectorFrame
	})
	local var143 = create("ImageButton")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var35,
		Parent = t_1.SelectorFrame
	})
	local var144 = create("ImageLabel")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Left.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 30),
		ImageColor3 = ARROW_COLOR,
		Parent = var142
	})
	local var145 = create("ImageLabel")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Right.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 30),
		ImageColor3 = ARROW_COLOR,
		Parent = var143
	})
	
	if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		local var146 = function(p79) --[[ line: 1220 ]]
			-- upvalues: ARROW_COLOR (copy)
			p79.ImageColor3 = ARROW_COLOR
		end
		
		local var147 = function(p80) --[[ line: 1222 ]]
			-- upvalues: ARROW_COLOR_HOVER (copy)
			p80.ImageColor3 = ARROW_COLOR_HOVER
		end
		
		addHoverState(var142, var144, var146, var147)
		addHoverState(var143, var145, var146, var147)
	end
	t_1.Selections = {}
	local t_2 = {}
	local t_3 = {}
	local var150 = create("ImageButton")({
		Name = "AutoSelectButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 2,
		Position = UDim2.new(0, var142.Size.X.Offset, 0, 0),
		Size = UDim2.new(1, var142.Size.X.Offset * -2, 1, 0),
		Parent = t_1.SelectorFrame,
		SelectionImageObject = var35
	})
	var150.MouseButton1Click:Connect(function() --[[ line: 1243 ]]
		-- upvalues: var141 (write), t_1 (ref), VRService (copy), userInputService (copy), guiService (copy)
		if not var141 then return end
		if #t_1.Selections <= 1 then return end
		local var157 = t_1.CurrentIndex + 1
		
		if #t_1.Selections < var157 then
			var157 = 1
		end
		t_1:SetSelectionIndex(var157)
		
		if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
			guiService.SelectedCoreObject = t_1.SelectorFrame
		end
	end)
	t_3[var150] = true
	
	local function setSelection(value, p81) --[[ line: 1262 ]]
		-- upvalues: t_1 (ref), var142 (ref), t_2 (write), EaseOutQuad (copy), deprecateOldGuiObjectPropertiesEngineFeature (copy), indexChanged (ref)
		for i, v in pairs(t_1.Selections) do
			local var158 = i == value
			local uDim2 = UDim2.new(0, var142.Size.X.Offset, 0, 0)
			local var160 = if t_2[v] then UDim2.new(0, var142.Size.X.Offset * -p81 * 3, 0, 0) else UDim2.new(0, var142.Size.X.Offset * p81 * 3, 0, 0)
			
			if var160.X.Offset < 0 then
				var160 = UDim2.new(0, var160.X.Offset + v.AbsoluteSize.X / 4, 0, 0)
			end
			if var158 then
				t_2[v] = true
				v.Position = var160
				v.Visible = true
				PropertyTweener(v, "TextTransparency", 1, 0, 0.165, EaseOutQuad)
				
				if not v:IsDescendantOf(game) then
					v.Position = uDim2
				elseif deprecateOldGuiObjectPropertiesEngineFeature then
					v:TweenPositionInternal(uDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true)
				else
					v:TweenPosition(uDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true)
				end
				t_1.CurrentIndex = i
				indexChanged:Fire(value)
			elseif t_2[v] then
				t_2[v] = false
				PropertyTweener(v, "TextTransparency", 0, 1, 0.165, EaseOutQuad)
				
				if not v:IsDescendantOf(game) then
					v.Position = var160
				elseif deprecateOldGuiObjectPropertiesEngineFeature then
					v:TweenPositionInternal(var160, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true)
				else
					v:TweenPosition(var160, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true)
				end
			end
		end
	end
	
	local function stepFunc(p82, p83) --[[ line: 1333 ]]
		-- upvalues: var141 (write), VRService (copy), userInputService (copy), guiService (copy), t_1 (ref), setSelection (ref)
		if not var141 then return end
		if p82 ~= nil and p82.UserInputType ~= Enum.UserInputType.MouseButton1 and (p82.UserInputType ~= Enum.UserInputType.Gamepad1 and p82.UserInputType ~= Enum.UserInputType.Gamepad2) and (p82.UserInputType ~= Enum.UserInputType.Gamepad3 and p82.UserInputType ~= Enum.UserInputType.Gamepad4 and p82.UserInputType ~= Enum.UserInputType.Keyboard) then return end
		if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
			guiService.SelectedCoreObject = t_1.SelectorFrame
		end
		local var161 = p83 + t_1.CurrentIndex
		local var162 = if t_1.CurrentIndex < var161 then 1 else -1
		
		if #t_1.Selections < var161 then
			var161 = 1
		elseif var161 < 1 then
			var161 = #t_1.Selections
		end
		setSelection(var161, var162)
	end
	
	local var153 = nil
	
	local function _() --[[ line: 1373 | named "connectToGuiService" ]]
		-- upvalues: var153 (write), guiService (copy), t_1 (ref), t_3 (ref), VRService (copy)
		var153 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 1374 ]]
			-- upvalues: t_1 (copy), guiService (copy), t_3 (copy), VRService (copy)
			if #t_1.Selections <= 0 then return end
			if guiService.SelectedCoreObject ~= nil and t_3[guiService.SelectedCoreObject] and not VRService.VREnabled then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
		end)
	end
	
	t_1.IndexChanged = indexChanged.Event
	
	function t_1.SetSelectionIndex(_, p84) --[[ line: 1387 ]]
		-- upvalues: setSelection (ref)
		setSelection(p84, 1)
	end
	
	function t_1.GetSelectedIndex(_) --[[ line: 1391 ]]
		-- upvalues: t_1 (ref)
		return t_1.CurrentIndex
	end
	
	function t_1.SetZIndex(_, p85) --[[ line: 1395 ]]
		-- upvalues: var142 (ref), var143 (ref), var144 (ref), var145 (ref), t_1 (ref)
		var142.ZIndex = p85
		var143.ZIndex = p85
		var144.ZIndex = p85
		var145.ZIndex = p85
		
		for i = 1, #t_1.Selections do
			t_1.Selections[i].ZIndex = p85
		end
	end
	
	function t_1.SetInteractable(_, p86) --[[ line: 1406 ]]
		-- upvalues: var141 (write), t_1 (ref), var142 (ref), var143 (ref), themeModule (copy), var144 (ref), ARROW_COLOR_INACTIVE (copy), var145 (ref), ARROW_COLOR (copy)
		var141 = p86
		t_1.SelectorFrame.Selectable = var141
		var142.Active = var141
		var143.Active = var141
		var142.Visible = var141
		var143.Visible = var141
		
		if var141 then
			for i, v in pairs(t_1.Selections) do
				v.TextColor3 = Color3.fromRGB(255, 255, 255)
			end
			var144.ImageColor3 = ARROW_COLOR
			var145.ImageColor3 = ARROW_COLOR
			
			return
		else
			for i, v in pairs(t_1.Selections) do
				v.TextColor3 = themeModule.color("NotInteractableSelection", Color3.fromRGB(255, 255, 255))
			end
			var144.ImageColor3 = ARROW_COLOR_INACTIVE
			var145.ImageColor3 = ARROW_COLOR_INACTIVE
		end
	end
	
	function t_1.UpdateOptions(_, p87) --[[ line: 1431 ]]
		-- upvalues: t_1 (ref), t_2 (write), create (copy), var142 (ref), themeModule (copy), var31 (copy), p78 (ref), var143 (ref)
		for i, v in pairs(t_1.Selections) do
			v:Destroy()
		end
		t_2 = {}
		t_1.Selections = {}
		
		for i_1, v_1 in pairs(p87) do
			local var164 = create("TextLabel")({
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextWrapped = true,
				ZIndex = 2,
				Visible = false,
				Name = "Selection" .. tostring(i_1),
				Size = UDim2.new(1, var142.Size.X.Offset * -2, 1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = themeModule.font(Enum.Font.SourceSans, "UtilityText"),
				TextSize = themeModule.textSize(24, "UtilityText"),
				Text = v_1,
				Parent = t_1.SelectorFrame
			})
			
			if var31 then
				var164.TextSize = themeModule.textSize(36)
			end
			if i_1 == p78 then
				t_1.CurrentIndex = i_1
				var164.Position = UDim2.new(0, var142.Size.X.Offset, 0, 0)
				var164.Visible = true
				t_2[var164] = true
			else
				t_2[var164] = false
			end
			t_1.Selections[i_1] = var164
		end
		local var163 = #t_1.Selections > 1
		var142.Visible = var163
		var143.Visible = var163
	end
	
	VRService.Changed:Connect(function(p88) --[[ line: 1479 | named "onVREnabled" ]]
		-- upvalues: VRService (copy), var142 (ref), var143 (ref), var150 (ref)
		if p88 == "VREnabled" then
			local VREnabled = VRService.VREnabled
			var142.Selectable = VREnabled
			var143.Selectable = VREnabled
			var150.Selectable = VREnabled
			
			return
		end
	end)
	local VREnabled = VRService.VREnabled
	var142.Selectable = VREnabled
	var143.Selectable = VREnabled
	var150.Selectable = VREnabled
	var142.InputBegan:Connect(function(p89) --[[ line: 1491 ]]
		-- upvalues: var32 (copy), var33 (copy), var141 (write), VRService (copy), userInputService (copy), guiService (copy), t_1 (ref), setSelection (ref)
		if var32(false) or var33(false) and p89.UserInputType == Enum.UserInputType.MouseButton1 then
			if not var141 then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var165 = -1 + t_1.CurrentIndex
			local var166 = if t_1.CurrentIndex < var165 then 1 else -1
			
			if #t_1.Selections < var165 then
				var165 = 1
			elseif var165 < 1 then
				var165 = #t_1.Selections
			end
			setSelection(var165, var166)
		end
	end)
	var143.InputBegan:Connect(function(p90) --[[ line: 1497 ]]
		-- upvalues: var32 (copy), var33 (copy), var141 (write), VRService (copy), userInputService (copy), guiService (copy), t_1 (ref), setSelection (ref)
		if var32(false) or var33(false) and p90.UserInputType == Enum.UserInputType.MouseButton1 then
			if not var141 then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var167 = 1 + t_1.CurrentIndex
			local var168 = if t_1.CurrentIndex < var167 then 1 else -1
			
			if #t_1.Selections < var167 then
				var167 = 1
			elseif var167 < 1 then
				var167 = #t_1.Selections
			end
			setSelection(var167, var168)
		end
	end)
	local var154 = true
	t_1:UpdateOptions(p77)
	userInputService.InputBegan:Connect(function(p91) --[[ line: 1507 ]]
		-- upvalues: var141 (write), var154 (write), guiService (copy), t_1 (ref), VRService (copy), userInputService (copy), setSelection (ref)
		if not var141 then return end
		if not var154 then return end
		if p91.UserInputType ~= Enum.UserInputType.Gamepad1 and p91.UserInputType ~= Enum.UserInputType.Keyboard then return end
		if guiService.SelectedCoreObject ~= t_1.SelectorFrame then return end
		if p91.KeyCode == Enum.KeyCode.DPadLeft or p91.KeyCode == Enum.KeyCode.Left or p91.KeyCode == Enum.KeyCode.A then
			if not var141 then return end
			if p91 ~= nil and p91.UserInputType ~= Enum.UserInputType.MouseButton1 and (p91.UserInputType ~= Enum.UserInputType.Gamepad1 and p91.UserInputType ~= Enum.UserInputType.Gamepad2) and (p91.UserInputType ~= Enum.UserInputType.Gamepad3 and p91.UserInputType ~= Enum.UserInputType.Gamepad4 and p91.UserInputType ~= Enum.UserInputType.Keyboard) then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var169 = -1 + t_1.CurrentIndex
			local var170 = if t_1.CurrentIndex < var169 then 1 else -1
			
			if #t_1.Selections < var169 then
				var169 = 1
			elseif var169 < 1 then
				var169 = #t_1.Selections
			end
			setSelection(var169, var170)
			
			return
		elseif p91.KeyCode == Enum.KeyCode.DPadRight or p91.KeyCode == Enum.KeyCode.Right or p91.KeyCode == Enum.KeyCode.D then
			if not var141 then return end
			if p91 ~= nil and p91.UserInputType ~= Enum.UserInputType.MouseButton1 and (p91.UserInputType ~= Enum.UserInputType.Gamepad1 and p91.UserInputType ~= Enum.UserInputType.Gamepad2) and (p91.UserInputType ~= Enum.UserInputType.Gamepad3 and p91.UserInputType ~= Enum.UserInputType.Gamepad4 and p91.UserInputType ~= Enum.UserInputType.Keyboard) then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var171 = 1 + t_1.CurrentIndex
			local var172 = if t_1.CurrentIndex < var171 then 1 else -1
			
			if #t_1.Selections < var171 then
				var171 = 1
			elseif var171 < 1 then
				var171 = #t_1.Selections
			end
			setSelection(var171, var172)
		end
	end)
	userInputService.InputChanged:Connect(function(p92) --[[ line: 1540 ]]
		-- upvalues: var141 (write), var154 (write), var138 (write), guiService (copy), t_1 (ref), stepFunc (ref)
		if not var141 then return end
		if not var154 then
			var138 = 0
			
			return
		elseif p92.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t_1.SelectorFrame.Parent) then return end
		if p92.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		if p92.Position.X > 0.8 and p92.Delta.X > 0 and var138 ~= 1 then
			var138 = 1
			stepFunc(p92, var138)
			
			return
		elseif p92.Position.X < -0.8 and p92.Delta.X < 0 and var138 ~= -1 then
			var138 = -1
			stepFunc(p92, var138)
			
			return
		elseif math.abs(p92.Position.X) < 0.8 then
			var138 = 0
		end
	end)
	t_1.SelectorFrame.AncestryChanged:Connect(function(_, p93) --[[ line: 1581 ]]
		-- upvalues: var154 (write), var153 (write), guiService (copy), t_1 (ref), t_3 (ref), VRService (copy)
		var154 = p93
		
		if var154 then
			var153 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 1374 ]]
				-- upvalues: t_1 (copy), guiService (copy), t_3 (copy), VRService (copy)
				if #t_1.Selections <= 0 then return end
				if guiService.SelectedCoreObject ~= nil and t_3[guiService.SelectedCoreObject] and not VRService.VREnabled then
					guiService.SelectedCoreObject = t_1.SelectorFrame
				end
			end)
		elseif var153 then
			var153:Disconnect()
			
			return
		end
	end)
	
	local function onResized(_, p94) --[[ line: 1592 ]]
		-- upvalues: themeModule (copy), var31 (copy), t_1 (ref)
		local var173 = if p94 then themeModule.textSize(16) else var31 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
		
		for i, v in pairs(t_1.Selections) do
			v.TextSize = var173
		end
	end
	
	t[t_1.SelectorFrame] = onResized
	local var156 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	onResized(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport(), var156.X < var156.Y)
	var153 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 1374 ]]
		-- upvalues: t_1 (ref), guiService (copy), t_3 (ref), VRService (copy)
		if #t_1.Selections <= 0 then return end
		if guiService.SelectedCoreObject ~= nil and t_3[guiService.SelectedCoreObject] and not VRService.VREnabled then
			guiService.SelectedCoreObject = t_1.SelectorFrame
		end
	end)
	
	return t_1
end

local function ShowAlert(p95, p96, p97, p98, p99) --[[ line: 1611 ]]
	-- upvalues: coreGuiService (ref), VRService (ref), isInExperienceUIVREnabled (ref), corePackagesService_1 (ref), create (ref), themeModule (ref), httpService (ref), contextActionService (ref), guiService (ref), MakeButton (ref), userInputService (ref)
	local robloxGui = coreGuiService.RobloxGui
	
	if robloxGui:FindFirstChild("AlertViewFullScreen") then return end
	local var174 = nil
	
	local function onVREnabled(p100) --[[ line: 1622 ]]
		-- upvalues: VRService (copy), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), robloxGui (write), coreGuiService (copy), var174 (write)
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
		if var174 and var174.Parent ~= nil then
			var174.Parent = robloxGui
			
			if VRService.VREnabled and not isInExperienceUIVREnabled then
				settingsMenu:SetSubpanelDepth(var174, 0.5)
			end
		end
	end
	
	local changedConnection = VRService.Changed:Connect(onVREnabled)
	var174 = create("ImageLabel")({
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
		var174.ImageTransparency = 0
	else
		var174.Size = UDim2.new(0.8, 0, 0, 350)
		var174.Position = UDim2.new(0.1, 0, 0.1, 0)
	end
	if coreGuiService.RobloxGui.AbsoluteSize.Y <= var174.Size.Y.Offset then
		var174.Size = UDim2.new(var174.Size.X.Scale, var174.Size.X.Offset, var174.Size.Y.Scale, coreGuiService.RobloxGui.AbsoluteSize.Y)
		var174.Position = UDim2.new(var174.Position.X.Scale, -var174.Size.X.Offset / 2, 0.5, -var174.Size.Y.Offset / 2)
	end
	if not p99 then
		create("UICorner")({
			CornerRadius = themeModule.DefaultCornerRadius,
			Parent = var174
		})
		var174.BackgroundColor3 = themeModule.color("MenuContainer")
		var174.BackgroundTransparency = themeModule.transparency("MenuContainer")
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
		Parent = var174
	})
	local _ = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 })
	local var177 = httpService:GenerateGUID(false)
	
	local var178 = function(_, p101) --[[ line: 1721 ]]
		-- upvalues: VRService (copy), var174 (write), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), p98 (ref), contextActionService (copy), var177 (ref), guiService (copy), p97 (ref), changedConnection (ref)
		if VRService.VREnabled and (p101 == Enum.UserInputState.Begin or p101 == Enum.UserInputState.Cancel) then return end
		if not var174 then return end
		if VRService.VREnabled and not isInExperienceUIVREnabled then
			require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(var174, 0)
		end
		var174:Destroy()
		var174 = nil
		
		if p98 then
			p98()
		end
		contextActionService:UnbindCoreAction(var177)
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
	local var181, var182 = MakeButton("AlertViewButton", p96, uDim2, var178)
	var181.Position = uDim2_1
	var181.NextSelectionLeft = var181
	var181.NextSelectionRight = var181
	var181.NextSelectionUp = var181
	var181.NextSelectionDown = var181
	var181.ZIndex = 9
	var182.ZIndex = var181.ZIndex
	var181.Parent = var174
	
	if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
		guiService.SelectedCoreObject = var181
	end
	guiService.SelectedCoreObject = var181
	contextActionService:BindCoreAction(var177, var178, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA)
	
	if p97 and (if isInExperienceUIVREnabled then true else not VRService.VREnabled) then
		p97:HideBar()
		p97.Pages.CurrentPage:Hide(1, 1)
	end
end

local function CreateNewSlider(p102, p103, p104, p105, p106) --[[ line: 1791 ]]
	-- upvalues: httpService (ref), signal (ref), create (ref), var35 (ref), robloxGui (ref), themeModule (ref), userInputService (ref), ARROW_COLOR_HOVER (ref), ARROW_COLOR (ref), ARROW_COLOR_HOVER (ref), addHoverState (ref), SELECTED_COLOR (ref), NON_SELECTED_COLOR (ref), VRService (ref), guiService (ref), runService (ref)
	local t = {}
	local var186 = tonumber(p102)
	local var187 = p103
	local var188 = 0
	local var189 = nil
	local var190 = true
	local var191 = httpService:GenerateGUID(false)
	_ = ""
	_ = ""
	
	if var186 <= 0 then
		error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2)
		
		return
	end
	p105 = p105 or p106
	local valueChanged = Instance.new("BindableEvent")
	valueChanged.Name = "ValueChanged"
	local var194 = signal.new()
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
		SelectionImageObject = var35
	})
	local var195 = nil
	
	if p105 then
		var195 = create("Frame")({
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
		local var196 = create("Frame")({
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
			Parent = var196
		})
		
		local function _() --[[ line: 1873 | named "isWideEnough" ]]
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
				Parent = var196,
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
				Parent = var196,
				Visible = robloxGui.AbsoluteSize.X > 460
			})
		end
		robloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ line: 1912 ]]
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
		Parent = if p105 then var195 else t.SliderFrame
	})
	local var197 = create("ImageButton")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		Active = true,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var35,
		Parent = if p105 then var195 else t.SliderFrame
	})
	local var198 = create("ImageButton")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		Active = true,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var35,
		Parent = if p105 then var195 else t.SliderFrame
	})
	local var199 = create("ImageLabel")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Less.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Parent = var197,
		ImageColor3 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then ARROW_COLOR_HOVER else ARROW_COLOR
	})
	local var200 = create("ImageLabel")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/More.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Parent = var198,
		ImageColor3 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then ARROW_COLOR_HOVER else ARROW_COLOR
	})
	
	if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		local var201 = function(p107) --[[ line: 1983 ]]
			-- upvalues: ARROW_COLOR (copy)
			p107.ImageColor3 = ARROW_COLOR
		end
		
		local var202 = function(p108) --[[ line: 1985 ]]
			-- upvalues: ARROW_COLOR_HOVER (copy)
			p108.ImageColor3 = ARROW_COLOR_HOVER
		end
		
		addHoverState(var197, var199, var201, var202)
		addHoverState(var198, var200, var201, var202)
	end
	t.Steps = {}
	local var203 = 1 / var186
	
	for i = 1, var186 do
		local var204 = create("ImageButton")({
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
			Position = UDim2.new((i - 1) * var203, 2, 0.5, 0),
			Size = UDim2.new(var203, -4, 0, 24),
			Parent = t.StepsContainer,
			SelectionImageObject = var35
		})
		
		if var187 < i then
			var204.BackgroundColor3 = NON_SELECTED_COLOR
		end
		if i == 1 or i == var186 then
			create("UICorner")({
				CornerRadius = themeModule.DefaultCornerRadius,
				Parent = var204
			})
			create("Frame")({
				Name = "Filler",
				BorderSizePixel = 0,
				BackgroundColor3 = var204.BackgroundColor3,
				Parent = var204,
				Size = UDim2.new(0.25, 0, 1, 0),
				Position = if i == 1 then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0, 0, 0, 0)
			})
		end
		t.Steps[#t.Steps + 1] = var204
	end
	local function hideSelection() --[[ line: 2039 ]]
		-- upvalues: var186 (ref), t (ref), NON_SELECTED_COLOR (copy)
		for i = 1, var186 do
			t.Steps[i].BackgroundColor3 = NON_SELECTED_COLOR
			
			if i == 1 or i == var186 then
				t.Steps[i].Filler.BackgroundColor3 = NON_SELECTED_COLOR
			end
		end
	end
	
	local function showSelection() --[[ line: 2047 ]]
		-- upvalues: var186 (ref), var187 (write), t (ref), SELECTED_COLOR (copy)
		for i = 1, var186 do
			if var187 < i then break end
			t.Steps[i].BackgroundColor3 = SELECTED_COLOR
			
			if i == 1 or i == var186 then
				t.Steps[i].Filler.BackgroundColor3 = SELECTED_COLOR
			end
		end
	end
	
	i = function(value) --[[ line: 2059 | named "setCurrentStep" ]]
		-- upvalues: p104 (write), var197 (ref), var198 (ref), var186 (ref), var187 (write), hideSelection (ref), showSelection (ref), var189 (write), var194 (ref), valueChanged (ref)
		if not p104 then
			p104 = 0
		end
		var197.Visible = true
		var198.Visible = true
		
		if value <= p104 then
			value = p104
			var197.Visible = false
		end
		if var186 <= value then
			value = var186
			var198.Visible = false
		end
		if var187 == value then return end
		var187 = value
		hideSelection()
		showSelection()
		var189 = tick()
		
		if var194 then
			var194:fire(var187)
			
			return
		end
		valueChanged:Fire(var187)
	end
	
	local _ = function(p109) --[[ line: 2093 | named "isActivateEvent" ]]
		return if p109 then if p109.UserInputType ~= Enum.UserInputType.MouseButton1 then if p109.UserInputType ~= Enum.UserInputType.Touch then p109.UserInputType == Enum.UserInputType.Gamepad1 and p109.KeyCode == Enum.KeyCode.ButtonA else true else true else false
	end
	
	local function mouseDownFunc(p110, p111, p112) --[[ line: 2104 ]]
		-- upvalues: var190 (write), VRService (copy), userInputService (copy), guiService (copy), t (ref), var188 (write), var187 (write), var186 (ref), i (ref)
		if not var190 then return end
		if p110 == nil then return end
		if not (if p110 then if p110.UserInputType ~= Enum.UserInputType.MouseButton1 then if p110.UserInputType ~= Enum.UserInputType.Touch then p110.UserInputType == Enum.UserInputType.Gamepad1 and p110.KeyCode == Enum.KeyCode.ButtonA else true else true else false) then return end
		if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and not VRService.VREnabled then
			guiService.SelectedCoreObject = t.SliderFrame
		end
		if VRService.VREnabled then
			var188 = 0
		elseif p112 then
			var188 = p111 - var187
		else
			var188 = 0
			local _ = nil
			local inputEndedConnection = nil
			local inputChangedConnection = userInputService.InputChanged:Connect(function(p113) --[[ line: 2130 ]]
				-- upvalues: var186 (copy), t (copy), i (copy)
				if p113.UserInputType ~= Enum.UserInputType.MouseMovement then return end
				local x = p113.Position.X
				
				for i_1 = 1, var186 do
					local x_1 = t.Steps[i_1].AbsolutePosition.X
					
					if x_1 > x or x > x_1 + t.Steps[i_1].AbsoluteSize.X then
						if i_1 ~= 1 or x >= x_1 then
							if i_1 ~= var186 or x_1 > x then
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
			inputEndedConnection = userInputService.InputEnded:Connect(function(p114) --[[ line: 2151 ]]
				-- upvalues: var188 (copy), inputEndedConnection (write), inputChangedConnection (write)
				if if p114 then if p114.UserInputType ~= Enum.UserInputType.MouseButton1 then if p114.UserInputType ~= Enum.UserInputType.Touch then p114.UserInputType == Enum.UserInputType.Gamepad1 and p114.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
					var188 = 0
					inputEndedConnection:Disconnect()
					inputChangedConnection:Disconnect()
					
					return
				end
			end)
		end
		i(p111)
	end
	
	local _ = function(p115) --[[ line: 2168 | named "mouseUpFunc" ]]
		-- upvalues: var190 (write), var188 (write)
		if not var190 then return end
		if if p115 then if p115.UserInputType ~= Enum.UserInputType.MouseButton1 then if p115.UserInputType ~= Enum.UserInputType.Touch then p115.UserInputType == Enum.UserInputType.Gamepad1 and p115.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
			var188 = 0
			
			return
		end
	end
	
	t.ValueChanged = valueChanged.Event
	
	if var194 then
		t.ValueChanged = var194
	end
	function t.SetValue(_, p116) --[[ line: 2185 ]]
		-- upvalues: i (ref)
		i(p116)
	end
	
	function t.GetValue(_) --[[ line: 2189 ]]
		-- upvalues: var187 (write)
		return var187
	end
	
	function t.SetInteractable(_, p117) --[[ line: 2193 ]]
		-- upvalues: var188 (write), var190 (write), t (ref), hideSelection (ref), showSelection (ref)
		var188 = 0
		var190 = p117
		t.SliderFrame.Selectable = p117
		
		if var190 then
			showSelection()
			
			return
		end
		hideSelection()
	end
	
	function t.SetZIndex(_, p118) --[[ line: 2204 ]]
		-- upvalues: var197 (ref), var198 (ref), var199 (ref), var200 (ref), t (ref)
		var197.ZIndex = p118
		var198.ZIndex = p118
		var199.ZIndex = p118
		var200.ZIndex = p118
		
		for i = 1, #t.Steps do
			t.Steps[i].ZIndex = p118
		end
	end
	
	function t.SetMinStep(_, b) --[[ line: 2215 ]]
		-- upvalues: var186 (ref), p104 (write), var187 (write), var197 (ref), var198 (ref)
		if b >= 0 and b <= var186 then
			p104 = b
		end
		if var187 <= p104 then
			var187 = p104
			var197.Visible = false
		end
		if var186 <= var187 then
			var187 = var186
			var198.Visible = false
		end
	end
	
	var197.InputBegan:Connect(function(p119) --[[ line: 2232 ]]
		-- upvalues: var187 (write), var190 (write), VRService (copy), userInputService (copy), guiService (copy), t (ref), var188 (write), i (ref)
		local var215 = var187 - 1
		
		if not var190 then return end
		if p119 == nil then return end
		if not (if p119 then if p119.UserInputType ~= Enum.UserInputType.MouseButton1 then if p119.UserInputType ~= Enum.UserInputType.Touch then p119.UserInputType == Enum.UserInputType.Gamepad1 and p119.KeyCode == Enum.KeyCode.ButtonA else true else true else false) then return end
		if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and not VRService.VREnabled then
			guiService.SelectedCoreObject = t.SliderFrame
		end
		var188 = if not VRService.VREnabled then var215 - var187 else 0
		i(var215)
	end)
	var197.InputEnded:Connect(function(p120) --[[ line: 2235 ]]
		-- upvalues: var190 (write), var188 (write)
		if not var190 then return end
		if if p120 then if p120.UserInputType ~= Enum.UserInputType.MouseButton1 then if p120.UserInputType ~= Enum.UserInputType.Touch then p120.UserInputType == Enum.UserInputType.Gamepad1 and p120.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
			var188 = 0
			
			return
		end
	end)
	var198.InputBegan:Connect(function(p121) --[[ line: 2238 ]]
		-- upvalues: var187 (write), var190 (write), VRService (copy), userInputService (copy), guiService (copy), t (ref), var188 (write), i (ref)
		local var216 = var187 + 1
		
		if not var190 then return end
		if p121 == nil then return end
		if not (if p121 then if p121.UserInputType ~= Enum.UserInputType.MouseButton1 then if p121.UserInputType ~= Enum.UserInputType.Touch then p121.UserInputType == Enum.UserInputType.Gamepad1 and p121.KeyCode == Enum.KeyCode.ButtonA else true else true else false) then return end
		if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and not VRService.VREnabled then
			guiService.SelectedCoreObject = t.SliderFrame
		end
		var188 = if not VRService.VREnabled then var216 - var187 else 0
		i(var216)
	end)
	var198.InputEnded:Connect(function(p122) --[[ line: 2241 ]]
		-- upvalues: var190 (write), var188 (write)
		if not var190 then return end
		if if p122 then if p122.UserInputType ~= Enum.UserInputType.MouseButton1 then if p122.UserInputType ~= Enum.UserInputType.Touch then p122.UserInputType == Enum.UserInputType.Gamepad1 and p122.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
			var188 = 0
			
			return
		end
	end)
	
	local function onVREnabled(p123) --[[ line: 2245 ]]
		-- upvalues: VRService (copy), var197 (ref), var190 (write), var198 (ref), t (ref), var186 (ref)
		if p123 ~= "VREnabled" then return end
		if VRService.VREnabled then
			var197.Selectable = var190
			var198.Selectable = var190
			t.SliderFrame.Selectable = var190
			
			for i = 1, var186 do
				t.Steps[i].Selectable = var190
				t.Steps[i].Active = var190
			end
			return
		else
			var197.Selectable = false
			var198.Selectable = false
			t.SliderFrame.Selectable = var190
			
			for i_1 = 1, var186 do
				t.Steps[i_1].Selectable = false
				t.Steps[i_1].Active = false
			end
		end
	end
	
	VRService.Changed:Connect(onVREnabled)
	onVREnabled("VREnabled")
	
	for i_1 = 1, var186 do
		t.Steps[i_1].InputBegan:Connect(function(p124) --[[ line: 2272 ]]
			-- upvalues: mouseDownFunc (ref), i_1 (ref)
			mouseDownFunc(p124, i_1)
		end)
		t.Steps[i_1].InputEnded:Connect(function(p125) --[[ line: 2275 ]]
			-- upvalues: var190 (write), var188 (write)
			if not var190 then return end
			if if p125 then if p125.UserInputType ~= Enum.UserInputType.MouseButton1 then if p125.UserInputType ~= Enum.UserInputType.Touch then p125.UserInputType == Enum.UserInputType.Gamepad1 and p125.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
				var188 = 0
				
				return
			end
		end)
	end
	t.SliderFrame.InputBegan:Connect(function(p126) --[[ line: 2280 ]]
		-- upvalues: VRService (copy), guiService (copy), t (ref), mouseDownFunc (ref), var187 (write)
		if VRService.VREnabled then
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject and selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then
				mouseDownFunc(p126, var187)
				
				return
			else
			end
		end
	end)
	t.SliderFrame.InputEnded:Connect(function(p127) --[[ line: 2289 ]]
		-- upvalues: VRService (copy), guiService (copy), t (ref), var190 (write), var188 (write)
		local selectedCoreObject
		if VRService.VREnabled then
			selectedCoreObject = guiService.SelectedCoreObject
			
			if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		end
		if not var190 then return end
		selectedCoreObject = if p127 then if p127.UserInputType ~= Enum.UserInputType.MouseButton1 then if p127.UserInputType ~= Enum.UserInputType.Touch then p127.UserInputType == Enum.UserInputType.Gamepad1 and p127.KeyCode == Enum.KeyCode.ButtonA else true else true else false
		
		if selectedCoreObject then
			var188 = 0
			
			return
		end
	end)
	
	local var209 = function() --[[ line: 2299 ]]
		-- upvalues: var189 (write), i (ref), var187 (write), var188 (write)
		if var189 == nil then return end
		if tick() - var189 >= 0.2 then
			i(var187 + var188)
		end
	end
	
	local var210 = true
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
	userInputService.InputBegan:Connect(function(p128) --[[ line: 2325 ]]
		-- upvalues: var190 (write), var210 (write), guiService (copy), t (ref), t_1 (ref), var188 (write), i (ref), var187 (write)
		if not var190 then return end
		if not var210 then return end
		if p128.UserInputType ~= Enum.UserInputType.Gamepad1 and p128.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if t_1[p128.KeyCode] == -1 then
			var188 = -1
			i(var187 - 1)
			
			return
		elseif t_1[p128.KeyCode] == 1 then
			var188 = 1
			i(var187 + 1)
		end
	end)
	userInputService.InputEnded:Connect(function(p129) --[[ line: 2353 ]]
		-- upvalues: var190 (write), guiService (copy), t (ref), t_1 (ref), var188 (write)
		if not var190 then return end
		if p129.UserInputType ~= Enum.UserInputType.Gamepad1 and p129.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if t_1[p129.KeyCode] then
			var188 = 0
		end
	end)
	userInputService.InputChanged:Connect(function(p130) --[[ line: 2374 ]]
		-- upvalues: var190 (write), var188 (write), var210 (write), guiService (copy), t (ref), i (ref), var187 (write)
		if not var190 then
			var188 = 0
			
			return
		elseif not var210 then
			var188 = 0
			
			return
		elseif p130.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if p130.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		if p130.Position.X > 0.8 and p130.Delta.X > 0 and var188 ~= 1 then
			var188 = 1
			i(var187 + 1)
			
			return
		elseif p130.Position.X < -0.8 and p130.Delta.X < 0 and var188 ~= -1 then
			var188 = -1
			i(var187 - 1)
			
			return
		elseif math.abs(p130.Position.X) < 0.8 then
			var188 = 0
		end
	end)
	local var212 = false
	guiService.Changed:Connect(function(p131) --[[ line: 2415 ]]
		-- upvalues: guiService (copy), t (ref), var212 (write), var189 (write), runService (copy), var191 (ref), var209 (ref)
		if p131 ~= "SelectedCoreObject" then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject and selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then
			if var212 then
				return
			else
				var212 = true
				var189 = tick()
				runService:BindToRenderStep(var191, Enum.RenderPriority.Input.Value + 1, var209)
				
				return
			end
		elseif var212 then
			var212 = false
			runService:UnbindFromRenderStep(var191)
		end
	end)
	t.SliderFrame.AncestryChanged:Connect(function(_, p132) --[[ line: 2436 ]]
		-- upvalues: var210 (write)
		var210 = p132
	end)
	i(var187)
	
	return t
end

local var52 = if var31 then 90 else 50
local t_2 = {}

local function AddNewRow(p133, p134, p135, p136, p137, p138, p139, p140, p141, p142) --[[ line: 2451 ]]
	-- upvalues: t_2 (ref), create (ref), var52 (write), var35 (ref), themeModule (ref), var31 (ref), guiService (ref), t (ref), CreateNewSlider (ref), CreateSelector (ref), CreateDropDown (ref), VRService (ref), userInputService (ref), coreGuiService (ref)
	local var217 = 0
	local isNotTextBox = p135 ~= "TextBox"
	
	if t_2[p133] then
		var217 = t_2[p133]
	end
	local _ = nil
	local var219 = create("ImageButton")({
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
		Size = UDim2.new(1, 0, 0, var52),
		AutomaticSize = if p139 or p140 or p141 then Enum.AutomaticSize.Y else nil,
		Position = UDim2.new(0, 0, 0, var217),
		SelectionImageObject = var35,
		Parent = p133.Page
	})
	var219.BackgroundColor3 = themeModule.color("RowFrameBackground")
	var219.ImageColor3 = var219.BackgroundColor3
	create("UICorner")({
		CornerRadius = themeModule.DefaultCornerRadius,
		Parent = var219
	})
	
	if var219 and p138 then
		var219.Position = UDim2.new(var219.Position.X.Scale, var219.Position.X.Offset, var219.Position.Y.Scale, var219.Position.Y.Offset + p138)
	end
	local var221
	local _ = nil
	local _ = nil
	
	if p139 then
		local var220 = create("Frame")({
			BackgroundTransparency = 1,
			Name = p134 .. "RowLabelAndDescriptionFrame",
			Position = UDim2.new(0, 10, 0, 0),
			Size = UDim2.new(0.4, -20, 0, 50),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = var219
		})
		var221 = create("TextLabel")({
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
			Parent = var220
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
			Parent = var220
		})
		create("UIListLayout")({
			Name = p134 .. "UIListLayout",
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
			Parent = var220
		})
		create("UIPadding")({
			Name = p134 .. "UIListLayout",
			PaddingBottom = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			Parent = var220
		})
	else
		var221 = create("TextLabel")({
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
			Parent = var219
		})
		create("UIPadding")({
			Name = p134 .. "UIPadding",
			PaddingBottom = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			Parent = var221
		})
	end
	if not isNotTextBox then
		var221.Text = ""
	end
	local function onResized(_, p143) --[[ line: 2583 ]]
		-- upvalues: var221 (write), themeModule (copy), var31 (copy)
		if p143 then
			var221.TextSize = themeModule.textSize(16, "UtilityRow")
			
			return
		end
		var221.TextSize = var31 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	
	local _ = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var223 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	if var223.X < var223.Y then
		var221.TextSize = themeModule.textSize(16, "UtilityRow")
	else
		var221.TextSize = var31 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	t[var219] = onResized
	local _ = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var224 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	if var224.X < var224.Y then
		var221.TextSize = themeModule.textSize(16, "UtilityRow")
	else
		var221.TextSize = var31 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	local var225 = nil
	local t_1 = nil
	
	if p135 == "Slider" then
		t_1 = CreateNewSlider(p136, p137, nil, p140, p141)
		t_1.SliderFrame.Parent = var219
		var225 = t_1.SliderFrame
	elseif p135 == "Selector" then
		t_1 = CreateSelector(p136, p137)
		t_1.SelectorFrame.Parent = var219
		var225 = t_1.SelectorFrame
	elseif p135 == "DropDown" then
		t_1 = CreateDropDown(p136, p137, p133.HubRef)
		t_1.DropDownFrame.Parent = var219
		var225 = t_1.DropDownFrame
	elseif p135 == "TextBox" then
		t_1 = { HubRef = nil }
		local var227 = create("TextBox")({
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
			Parent = var219
		})
		var225 = var227
		var227.Focused:Connect(function() --[[ line: 2637 ]]
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
		var225.SelectionGained:Connect(function() --[[ line: 2655 ]]
			-- upvalues: VRService (copy), userInputService (copy), var227 (ref), themeModule (copy), t_1 (write), var225 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var227.BackgroundTransparency = themeModule.transparency("ControlInputBackground", 0.1)
				
				if t_1.HubRef then
					t_1.HubRef:ScrollToFrame(var225)
				end
			end
		end)
		var225.SelectionLost:Connect(function() --[[ line: 2664 ]]
			-- upvalues: VRService (copy), userInputService (copy), var227 (ref), themeModule (copy)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var227.BackgroundTransparency = themeModule.transparency("ControlInputBackground", 0.5)
			end
		end)
		
		local function processInput(p144) --[[ line: 2688 ]]
			-- upvalues: guiService (copy), var225 (write), var227 (ref)
			if p144.UserInputState == Enum.UserInputState.Begin and p144.KeyCode == Enum.KeyCode.Return and guiService.SelectedCoreObject == var225 then
				var227:CaptureFocus()
			end
		end
		
		var227.MouseEnter:Connect(function() --[[ line: 2670 ]]
			-- upvalues: coreGuiService (copy), var225 (write), VRService (copy), userInputService (copy), p133 (ref), guiService (copy)
			local dropDownFullscreenFrame = coreGuiService.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if dropDownFullscreenFrame and dropDownFullscreenFrame.Visible then return end
			if var225 and var225.Visible and var225.ZIndex > 1 then
				if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and p133.Active then
					guiService.SelectedCoreObject = var225
				end
			end
		end)
		userInputService.InputBegan:Connect(processInput)
	elseif p135 == "TextEntry" then
		t_1 = { HubRef = nil }
		local var229 = create("TextBox")({
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
			Parent = var219
		})
		var225 = var229
		var229.Focused:Connect(function() --[[ line: 2729 ]]
			-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var229 (ref), p134 (ref)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = var229
			end
			if var229.Text == p134 then
				var229.Text = ""
			end
		end)
		
		if p138 then
			var229.Position = UDim2.new(var229.Position.X.Scale, var229.Position.X.Offset, var229.Position.Y.Scale, var229.Position.Y.Offset + p138)
		end
		var225.SelectionGained:Connect(function() --[[ line: 2747 ]]
			-- upvalues: VRService (copy), userInputService (copy), var229 (ref), t_1 (write), var225 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var229.BackgroundTransparency = 0.8
				
				if t_1.HubRef then
					t_1.HubRef:ScrollToFrame(var225)
				end
			end
		end)
		var225.SelectionLost:Connect(function() --[[ line: 2756 ]]
			-- upvalues: VRService (copy), userInputService (copy), var229 (ref)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var229.BackgroundTransparency = 1
			end
		end)
		
		local function processInput(p145) --[[ line: 2780 ]]
			-- upvalues: guiService (copy), var225 (write), var229 (ref)
			if p145.UserInputState == Enum.UserInputState.Begin and p145.KeyCode == Enum.KeyCode.Return and guiService.SelectedCoreObject == var225 then
				var229:CaptureFocus()
			end
		end
		
		var219.MouseEnter:Connect(function() --[[ line: 2762 ]]
			-- upvalues: coreGuiService (copy), var225 (write), VRService (copy), userInputService (copy), p133 (ref), guiService (copy)
			local dropDownFullscreenFrame = coreGuiService.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if dropDownFullscreenFrame and dropDownFullscreenFrame.Visible then return end
			if var225 and var225.Visible and var225.ZIndex > 1 then
				if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and p133.Active then
					guiService.SelectedCoreObject = var225
				end
			end
		end)
		
		function t_1.SetZIndex(_, p146) --[[ line: 2791 ]]
			-- upvalues: var229 (ref)
			var229.ZIndex = p146
		end
		
		function t_1.SetInteractable(_, p147) --[[ line: 2795 ]]
			-- upvalues: var229 (ref)
			var229.Selectable = p147
			
			if p147 then
				var229.TextColor3 = Color3.fromRGB(178, 178, 178)
				var229.ZIndex = 2
				
				return
			end
			var229.TextColor3 = Color3.fromRGB(49, 49, 49)
			var229.ZIndex = 1
		end
		
		function t_1.SetValue(_, p148) --[[ line: 2806 ]]
			-- upvalues: var229 (ref)
			var229.Text = p148
		end
		
		local valueChanged = Instance.new("BindableEvent")
		valueChanged.Name = "ValueChanged"
		var229.FocusLost:Connect(function() --[[ line: 2813 ]]
			-- upvalues: valueChanged (ref), var229 (ref)
			valueChanged:Fire(var229.Text)
		end)
		t_1.ValueChanged = valueChanged.Event
		userInputService.InputBegan:Connect(processInput)
	end
	t_1.Name = p134 .. "ValueChanger"
	local setAutoLocalize = t_1.SetAutoLocalize
	
	function t_1.SetAutoLocalize(p149, p150) --[[ line: 2825 ]]
		-- upvalues: var219 (write), setAutoLocalize (ref)
		var219.AutoLocalize = p150
		
		if setAutoLocalize then
			setAutoLocalize(p149, p150)
		end
	end
	
	var217 += var52
	
	if p138 then
		var217 += p138
	end
	t_2[p133] = var217
	
	if isNotTextBox then
		var219.MouseEnter:Connect(function() --[[ line: 2840 ]]
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
		VRService.Changed:Connect(function(p151) --[[ line: 2870 | named "onVREnabled" ]]
			-- upvalues: VRService (copy), var219 (write), var225 (write), guiService (copy), themeModule (copy)
			if p151 == "VREnabled" then
				if VRService.VREnabled then
					var219.Selectable = true
					var219.Active = true
					var225.Active = true
					guiService.Changed:Connect(function(p152) --[[ line: 2876 ]]
						-- upvalues: guiService (copy), var219 (copy), themeModule (copy)
						if p152 == "SelectedCoreObject" then
							local selectedCoreObject = guiService.SelectedCoreObject
							
							if selectedCoreObject and (selectedCoreObject == var219 or selectedCoreObject:IsDescendantOf(var219)) then
								var219.ImageTransparency = themeModule.transparency("RowFrameBackground", 0.5)
								var219.BackgroundTransparency = 1
								
								return
							end
							var219.ImageTransparency = 1
							var219.BackgroundTransparency = 1
						end
					end)
					
					return
				end
				var219.Selectable = false
				var219.Active = false
			end
		end)
		
		if VRService.VREnabled then
			var219.Selectable = true
			var219.Active = true
			var225.Active = true
			guiService.Changed:Connect(function(p153) --[[ line: 2876 ]]
				-- upvalues: guiService (copy), var219 (write), themeModule (copy)
				if p153 == "SelectedCoreObject" then
					local selectedCoreObject = guiService.SelectedCoreObject
					
					if selectedCoreObject and (selectedCoreObject == var219 or selectedCoreObject:IsDescendantOf(var219)) then
						var219.ImageTransparency = themeModule.transparency("RowFrameBackground", 0.5)
						var219.BackgroundTransparency = 1
						
						return
					end
					var219.ImageTransparency = 1
					var219.BackgroundTransparency = 1
				end
			end)
		else
			var219.Selectable = false
			var219.Active = false
		end
		var225.SelectionGained:Connect(function() --[[ line: 2897 ]]
			-- upvalues: VRService (copy), userInputService (copy), var219 (write), themeModule (copy), t_1 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				if VRService.VREnabled then
					var219.ImageTransparency = 0.5
					var219.BackgroundTransparency = 1
				else
					var219.ImageTransparency = 1
					var219.BackgroundTransparency = themeModule.transparency("RowFrameBackground", 0.5)
				end
				if t_1.HubRef then
					t_1.HubRef:ScrollToFrame(var219)
				end
			end
		end)
		var225.SelectionLost:Connect(function() --[[ line: 2912 ]]
			-- upvalues: VRService (copy), userInputService (copy), var219 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var219.ImageTransparency = 1
				var219.BackgroundTransparency = 1
			end
		end)
	end
	p133:AddRow(var219, var221, t_1, p138, false)
	t_1.Selection = var225
	
	return var219, var221, t_1
end

local function AddNewRowObject(p154, p155, p156, p157, p158) --[[ line: 2927 ]]
	-- upvalues: t_2 (ref), create (ref), var52 (write), var35 (ref), themeModule (ref), var31 (ref), t (ref), guiService (ref), VRService (ref)
	local var236 = if t_2[p154] then t_2[p154] else 0
	local var237 = create("ImageButton")({
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
		Size = UDim2.new(1, 0, 0, var52),
		Position = UDim2.new(0, 0, 0, var236),
		SelectionImageObject = var35,
		Parent = p154.Page
	})
	var237.BackgroundColor3 = themeModule.color("RowFrameBackground")
	var237.ImageColor3 = var237.BackgroundColor3
	var237.SelectionGained:Connect(function() --[[ line: 2955 ]]
		-- upvalues: var237 (ref), themeModule (copy)
		var237.BackgroundTransparency = themeModule.transparency("RowFrameBackground", 0.5)
	end)
	var237.SelectionLost:Connect(function() --[[ line: 2958 ]]
		-- upvalues: var237 (ref)
		var237.BackgroundTransparency = 1
	end)
	create("UICorner")({
		CornerRadius = themeModule.DefaultCornerRadius,
		Parent = var237
	})
	local var238 = create("TextLabel")({
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
		Parent = var237
	})
	create("UIPadding")({
		Name = p155 .. "UIPadding",
		PaddingBottom = UDim.new(0, 10),
		PaddingTop = UDim.new(0, 10),
		Parent = var238
	})
	
	local function onResized(_, p159) --[[ line: 2990 ]]
		-- upvalues: p158 (ref), var238 (ref), themeModule (copy), var31 (copy)
		if p158 then
			UDim2.new(0, 200, 1, 0)
		end
		if p159 then
			var238.TextSize = themeModule.textSize(16, "UtilityRow")
			
			return
		end
		var238.TextSize = var31 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	
	t[var237] = onResized
	local var240 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	onResized(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport(), var240.X < var240.Y)
	
	if p157 then
		var237.Position = UDim2.new(var237.Position.X.Scale, var237.Position.X.Offset, var237.Position.Y.Scale, var237.Position.Y.Offset + p157)
	end
	var236 += var52
	
	if p157 then
		var236 += p157
	end
	t_2[p154] = var236
	var237.MouseEnter:Connect(function() --[[ line: 3018 ]]
		-- upvalues: var237 (ref), guiService (copy)
		if var237.Visible then
			guiService.SelectedCoreObject = var237
		end
	end)
	p156.SelectionImageObject = var35
	p156.SelectionGained:Connect(function() --[[ line: 3027 ]]
		-- upvalues: VRService (copy), var237 (ref), themeModule (copy)
		if VRService.VREnabled then
			var237.ImageTransparency = themeModule.transparency("RowFrameBackground", 0.5)
			var237.BackgroundTransparency = 1
			
			return
		end
		var237.ImageTransparency = 1
		var237.BackgroundTransparency = themeModule.transparency("RowFrameBackground", 0.5)
	end)
	p156.SelectionLost:Connect(function() --[[ line: 3036 ]]
		-- upvalues: var237 (ref)
		var237.ImageTransparency = 1
		var237.BackgroundTransparency = 1
	end)
	p156.Parent = var237
	p154:AddRow(var237, var238, p156, p157, true)
	
	return var237
end

local t_3 = {
	GetEaseLinear = function(_) --[[ line: 3050 ]]
		-- upvalues: Linear (ref)
		return Linear
	end,
	GetEaseOutQuad = function(_) --[[ line: 3053 ]]
		-- upvalues: EaseOutQuad (ref)
		return EaseOutQuad
	end,
	GetEaseInOutQuad = function(_) --[[ line: 3056 ]]
		-- upvalues: EaseInOutQuad (ref)
		return EaseInOutQuad
	end,
	CreateNewSlider = function(_, p160, p161, p162, p163, p164) --[[ line: 3060 ]]
		-- upvalues: CreateNewSlider (ref)
		return CreateNewSlider(p160, p161, p162, p163, p164)
	end,
	CreateNewSelector = function(_, p165, p166) --[[ line: 3064 ]]
		-- upvalues: CreateSelector (ref)
		return CreateSelector(p165, p166)
	end,
	CreateNewDropDown = function(_, p167, p168) --[[ line: 3068 ]]
		-- upvalues: CreateDropDown (ref)
		return CreateDropDown(p167, p168, nil)
	end,
	AddNewRow = function(_, p169, p170, p171, p172, p173, p174, p175, p176, p177, p178) --[[ line: 3072 ]]
		-- upvalues: AddNewRow (ref)
		return AddNewRow(p169, p170, p171, p172, p173, p174, p175, p176, p177, p178)
	end,
	AddNewRowObject = function(_, p179, p180, p181, p182, p183) --[[ line: 3076 ]]
		-- upvalues: AddNewRowObject (ref)
		return AddNewRowObject(p179, p180, p181, p182, p183)
	end,
	ShowAlert = function(_, p184, p185, p186, p187, p188) --[[ line: 3080 ]]
		-- upvalues: ShowAlert (ref)
		ShowAlert(p184, p185, p186, p187, p188)
	end,
	IsSmallTouchScreen = function(_) --[[ line: 3084 ]]
		-- upvalues: guiService (ref), userInputService (ref)
		local var241 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
		
		return userInputService.TouchEnabled and (if var241.Y >= 500 then var241.X < 700 else true)
	end,
	IsPortrait = function(_) --[[ line: 3088 ]]
		-- upvalues: guiService (ref)
		local var242 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
		
		return var242.X < var242.Y
	end
}

if fFlagRefactorMenuConfirmationButtonsModule or fFlagAddNextUpContainerModule then
	local _ = function() --[[ line: 3093 | named "isUsingGamepad" ]]
		-- upvalues: t_1 (ref), userInputService (ref)
		return t_1[userInputService:GetLastInputType()] or false
	end
	
	function t_3.IsUsingGamepad(_) --[[ line: 3097 ]]
		-- upvalues: t_1 (ref), userInputService (ref)
		return t_1[userInputService:GetLastInputType()] or false
	end
end
function t_3.MakeStyledButton(_, p189, p190, p191, p192, p193, p194) --[[ line: 3102 ]]
	-- upvalues: MakeButton (ref)
	return MakeButton(p189, p190, p191, p192, p193, p194)
end

function t_3.MakeStyledImageButton(_, p195, p196, p197, p198, p199, p200, p201, p202) --[[ line: 3106 ]]
	-- upvalues: MakeImageButton (ref)
	return MakeImageButton(p195, p196, p197, p198, p199, p200, p201, p202)
end

function t_3.AddButtonRow(_, p203, p204, p205, p206, p207, p208) --[[ line: 3110 ]]
	-- upvalues: AddButtonRow (ref)
	return AddButtonRow(p203, p204, p205, p206, p207, p208)
end

function t_3.MakeFocusState(_, p209, p210) --[[ line: 3114 ]]
	-- upvalues: MakeRoundedRectFocusState (ref)
	return MakeRoundedRectFocusState(p209, p210)
end

function t_3.CreateSignal(_) --[[ line: 3118 ]]
	-- upvalues: CreateSignal (ref)
	return CreateSignal()
end

function t_3.UsesSelectedObject(_) --[[ line: 3122 ]]
	-- upvalues: VRService (ref), userInputService (ref)
	return if VRService.VREnabled then false else userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled
end

function t_3.TweenProperty(_, p211, p212, p213, p214, p215, p216, p217) --[[ line: 3126 ]]
	return PropertyTweener(p211, p212, p213, p214, p215, p216, p217)
end

function t_3.OnResized(_, p218, p219) --[[ line: 3130 ]]
	-- upvalues: addOnResizedCallback (ref)
	return addOnResizedCallback(p218, p219)
end

function t_3.FireOnResized(_) --[[ line: 3134 ]]
	-- upvalues: guiService (ref), t_3 (ref), t (ref)
	local var243 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var244 = t_3:IsPortrait()
	
	for i, v in pairs(t) do
		v(var243, var244)
	end
end

function t_3.Lerp(_, endValue, alpha, p220) --[[ line: 3145 ]]
	return (1 - endValue) * alpha + endValue * p220
end

function t_3.Round(_, p221) --[[ line: 3150 ]]
	return p221 % 1 >= 0.5 and math.ceil(p221) or math.floor(p221)
end

function t_3.IsExperienceOlderThanOneWeek(_, p222) --[[ line: 3154 ]]
	-- upvalues: workspaceService (ref)
	return p222 == nil or p222.Created == nil or workspaceService:GetServerTimeNow() * 1000 - DateTime.fromIsoDate(p222.Created).UnixTimestampMillis <= 604800000
end

return t_3