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
local var1 = if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then require(chrome.Service) else nil
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
local var2 = require(robloxGui.Modules:WaitForChild("TenFootInterface")):IsEnabled()
local var3 = signalsModule.createComputed(function(p1)
	-- upvalues: responsiveModule (ref)
	return responsiveModule.GetInputModeStore(p1).getLastInputType(p1) == responsiveModule.Input.Touch
end)
local var4 = signalsModule.createComputed(function(p1)
	-- upvalues: responsiveModule (ref)
	return responsiveModule.GetInputModeStore(p1).getLastInputType(p1) == responsiveModule.Input.Pointer
end)
local t = {}
setmetatable(t, { __mode = "k" })
local var5 = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 })

function clamp(value, minValue, maxValue)
	return math.max(value, math.min(minValue, maxValue))
end

local function Linear(p1, p2, p3, p4)
	return if p4 <= p1 then p2 + p3 else p3 * p1 / p4 + p2
end

local function EaseOutQuad(p1, p2, p3, p4)
	if p4 <= p1 then
		return p2 + p3
	end
	p1 /= p4
	
	return p2 - p3 * p1 * (p1 - 2)
end

local function EaseInOutQuad(p1, p2, p3, p4)
	if p4 <= p1 then
		return p2 + p3
	end
	p1 /= p4
	
	return if p1 < 0.5 then 2 * p3 * p1 * p1 + p2 else p2 + p3 * (2 * (2 - p1) * p1 - 1)
end

function PropertyTweener(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: runService (ref)
	local t = { StartTime = tick() }
	t.EndTime = t.StartTime + p5
	t.Cancelled = false
	local var6 = false
	local var7 = 0
	
	local function _()
		-- upvalues: p1 (ref), p2 (ref), p6 (ref), p3 (ref), p4 (ref), var6 (write), var7 (write), p7 (ref)
		if p1 then
			p1[p2] = p6(1, p3, p4 - p3, 1)
		end
		var6 = true
		var7 = 1
		
		if p7 then
			p7()
		end
	end
	
	p1[p2] = p6(0, p3, p4 - p3, p5)
	coroutine.wrap(function()
		-- upvalues: t (ref), p1 (ref), p2 (ref), p6 (ref), p3 (ref), p4 (ref), p5 (ref), var7 (write), runService (copy), var6 (write), p7 (ref)
		local currentTime = tick()
		while currentTime < t.EndTime and p1 do
			if not t.Cancelled then
				p1[p2] = p6(currentTime - t.StartTime, p3, p4 - p3, p5)
				var7 = clamp(0, 1, (currentTime - t.StartTime) / p5)
				runService.RenderStepped:Wait()
				currentTime = tick()
				continue
			end
			return
		end
		if t.Cancelled == false and p1 then
			if p1 then
				p1[p2] = p6(1, p3, p4 - p3, 1)
			end
			var6 = true
			var7 = 1
			
			if p7 then
				p7()
			end
		end
	end)()
	
	function t.GetFinal(_)
		-- upvalues: p4 (ref)
		return p4
	end
	
	function t.GetPercentComplete(_)
		-- upvalues: var7 (write)
		return var7
	end
	
	function t.IsFinished(_)
		-- upvalues: var6 (write)
		return var6
	end
	
	function t.Finish(p8)
		-- upvalues: var6 (write), p1 (ref), p2 (ref), p6 (ref), p3 (ref), p4 (ref), var7 (write), p7 (ref)
		if not var6 then
			p8:Cancel()
			
			if p1 then
				p1[p2] = p6(1, p3, p4 - p3, 1)
			end
			var6 = true
			var7 = 1
			
			if p7 then
				p7()
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
	local var8 = nil
	local var9 = nil
	
	function t.fire(_, ...)
		-- upvalues: var8 (write), var9 (write), bindableEvent (ref)
		var8 = { ... }
		var9 = select("#", ...)
		bindableEvent:Fire()
	end
	
	function t.connect(_, p8)
		-- upvalues: bindableEvent (ref), var8 (write), var9 (write)
		if not p8 then
			error("connect(nil)", 2)
		end
		return bindableEvent.Event:Connect(function()
			-- upvalues: p8 (ref), var8 (copy), var9 (copy)
			p8(unpack(var8, 1, var9))
		end)
	end
	
	function t.wait(_)
		-- upvalues: bindableEvent (ref), var8 (write), var9 (write)
		bindableEvent.Event:wait()
		
		if not var8 then
			error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
		end
		return unpack(var8, 1, var9)
	end
	
	return t
end

local _ = function()
	-- upvalues: guiService (ref)
	return if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
end

local _ = function()
	-- upvalues: guiService (ref), userInputService (ref)
	local var8 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	return userInputService.TouchEnabled and (if var8.Y >= 500 then var8.X < 700 else true)
end

local _ = function()
	-- upvalues: guiService (ref)
	local var8 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	return var8.X < var8.Y
end

local _ = function()
	-- upvalues: var2 (ref)
	return var2
end

local _ = function()
	-- upvalues: VRService (ref), userInputService (ref)
	return if VRService.VREnabled then false else userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled
end

local function addHoverState(p8, p9, p10, p11)
	local function onNormalButtonStateCallback()
		-- upvalues: p8 (ref), p10 (ref), p9 (ref)
		if p8.Active then
			p10(p9)
		end
	end
	
	local function onHoverButtonStateCallback()
		-- upvalues: p8 (ref), p11 (ref), p9 (ref)
		if p8.Active then
			p11(p9)
		end
	end
	
	p8.MouseEnter:Connect(onHoverButtonStateCallback)
	p8.SelectionGained:Connect(onHoverButtonStateCallback)
	p8.MouseLeave:Connect(onNormalButtonStateCallback)
	p8.SelectionLost:Connect(onNormalButtonStateCallback)
	p10(p9)
end

local function addOnResizedCallback(p8, p9)
	-- upvalues: t (ref), guiService (ref)
	t[p8] = p9
	local var8 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	p9(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport(), var8.X < var8.Y)
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

local function MakeDefaultButton(p8, p9, p10, p11, p12, p13)
	-- upvalues: create (ref), themeModule (ref), t_1 (ref), userInputService (ref), guiService (ref), VRService (ref)
	local var8 = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 })
	local _ = nil
	local _ = nil
	local var9 = "DefaultButtonStroke"
	local var10 = "DefaultButton"
	
	if p8 == "DropDownFrame" then
		var9 = "ControlInputStroke"
		var10 = "ControlInputBackground"
	end
	if p13 == "ImageButton" then
		var10 = "ImageButton"
	end
	local var11 = create("ImageButton")({
		AutoButtonColor = false,
		ZIndex = 2,
		Name = p8 .. "Button",
		BackgroundColor3 = themeModule.color(var10),
		BackgroundTransparency = themeModule.transparency(var10),
		Size = p9,
		SelectionImageObject = var8
	})
	create("UICorner")({
		CornerRadius = themeModule.DefaultCornerRadius,
		Parent = var11
	})
	local var12 = create("UIStroke")({
		Name = "Border",
		Color = themeModule.color(var9),
		Transparency = themeModule.transparency(var9),
		Thickness = themeModule.DefaultStokeThickness,
		Parent = var11
	})
	local _ = create("BoolValue")({ Name = "Enabled", Value = true, Parent = var11 })
	
	if p10 then
		var11.MouseButton1Click:Connect(function()
			-- upvalues: p10 (ref), t_1 (copy), userInputService (copy)
			p10(t_1[userInputService:GetLastInputType()] or false)
		end)
	elseif var12 then
		var12.Enabled = false
	end
	var11.Selectable = false
	local function _(p14)
		return if p14.UserInputType ~= Enum.UserInputType.MouseMovement then p14.UserInputType == Enum.UserInputType.Touch else true
	end
	
	local var13 = nil
	
	local function setRowRef(value)
		-- upvalues: var13 (write)
		var13 = value
	end
	
	local function selectButton()
		-- upvalues: p12 (ref), p11 (ref), var11 (write), themeModule (copy), var13 (write)
		local var14 = p12
		
		if var14 == nil and p11 then
			var14 = p11.HubRef
		end
		if var14 and var14.Active or var14 == nil then
			var11.BackgroundColor3 = themeModule.color("DefaultButtonHover")
			var11.BackgroundTransparency = themeModule.transparency("DefaultButtonHover")
			local var15 = var13 or var11
			
			if var14 then
				var14:ScrollToFrame(var15)
			end
		end
	end
	
	local _ = function()
		-- upvalues: var11 (write), themeModule (copy), var10 (write)
		var11.BackgroundColor3 = themeModule.color(var10)
		var11.BackgroundTransparency = themeModule.transparency(var10)
	end
	
	var11.InputBegan:Connect(function(p14)
		-- upvalues: var11 (write), selectButton (ref)
		if var11.Selectable then
			if if p14.UserInputType ~= Enum.UserInputType.MouseMovement then p14.UserInputType == Enum.UserInputType.Touch else true then
				selectButton()
			end
		end
	end)
	var11.InputEnded:Connect(function(p14)
		-- upvalues: var11 (write), guiService (copy), themeModule (copy), var10 (write)
		if var11.Selectable and guiService.SelectedCoreObject ~= var11 then
			if if p14.UserInputType ~= Enum.UserInputType.MouseMovement then p14.UserInputType == Enum.UserInputType.Touch else true then
				var11.BackgroundColor3 = themeModule.color(var10)
				var11.BackgroundTransparency = themeModule.transparency(var10)
			end
		end
	end)
	var11.SelectionGained:Connect(function()
		-- upvalues: selectButton (ref)
		selectButton()
	end)
	var11.SelectionLost:Connect(function()
		-- upvalues: var11 (write), themeModule (copy), var10 (write)
		var11.BackgroundColor3 = themeModule.color(var10)
		var11.BackgroundTransparency = themeModule.transparency(var10)
	end)
	local _ = guiService.Changed:Connect(function(p14)
		-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var11 (write), themeModule (copy), var10 (write), selectButton (ref)
		if p14 ~= "SelectedCoreObject" then return end
		if not (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) then return end
		if guiService.SelectedCoreObject == nil or guiService.SelectedCoreObject ~= var11 then
			var11.BackgroundColor3 = themeModule.color(var10)
			var11.BackgroundTransparency = themeModule.transparency(var10)
			
			return
		elseif var11.Selectable then
			selectButton()
		end
	end)
	
	return var11, setRowRef
end

local function MakeButton(p8, p9, p10, p11, p12, p13)
	-- upvalues: MakeDefaultButton (ref), create (ref), themeModule (ref), guiService (ref), userInputService (ref), var2 (ref), enablePreferredTextSizeAccessGuiServiceEngineFeature (ref)
	local var8, var9 = MakeDefaultButton(p8, p10, p11, p12, p13)
	local var10 = create("TextLabel")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		TextScaled = false,
		TextWrapped = true,
		ZIndex = 2,
		Name = p8 .. "TextLabel",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		TextColor3 = themeModule.color("WhiteButtonText", Color3.fromRGB(255, 255, 255)),
		TextTransparency = themeModule.transparency("WhiteButtonText", 0),
		TextYAlignment = Enum.TextYAlignment.Center,
		Font = themeModule.font(Enum.Font.SourceSansBold, "Button"),
		TextSize = themeModule.textSize(24, "Button"),
		Text = p9,
		Parent = var8
	})
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint", var10)
	local var11 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var12 = userInputService.TouchEnabled and (if var11.Y >= 500 then var11.X < 700 else true)
	
	if var12 then
		var10.TextSize = themeModule.textSize(18)
	elseif var2 then
		var12 = if p8 ~= "FriendStatus" then p8 == "BlockButton" else true
		
		if not var12 then
			var10.TextSize = themeModule.textSize(36)
		end
	end
	if enablePreferredTextSizeAccessGuiServiceEngineFeature then
		local var13 = (guiService.PreferredTextSize.Value - 1) * 3
		UITextSizeConstraint.MaxTextSize = var10.TextSize + var13
		local textSize = var10.TextSize
		guiService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
			-- upvalues: var13 (write), guiService (copy), UITextSizeConstraint (ref), textSize (ref)
			var13 = (guiService.PreferredTextSize.Value - 1) * 3
			UITextSizeConstraint.MaxTextSize = textSize + var13
		end)
	else
		UITextSizeConstraint.MaxTextSize = var10.TextSize
	end
	return var8, var10, var9
end

local function MakeImageButton(p8, p9, p10, p11, p12, p13, p14, p15)
	-- upvalues: MakeDefaultButton (ref), migration (ref), themeModule (ref), create (ref), increaseLegacyPeopleRowButtonSize (ref), builderIconsModule (ref)
	if not p15 then
		p15 = "ImageButton"
	end
	local var8, var9 = MakeDefaultButton(p8, p10, p12, p13, p14, p15)
	local imageRectOffset = nil
	local imageRectSize = nil
	local var10 = migration.uiblox[p9] or migration.luaApps[p9]
	
	if not string.match(p9, "^rbxasset://") then
		p9 = themeModule.Images[p9]
	end
	if typeof(p9) == "table" then
		imageRectOffset = p9.ImageRectOffset
		imageRectSize = p9.ImageRectSize
		p9 = p9.Image
	end
	local var11 = if var10 then create("TextLabel")({
		BackgroundTransparency = 1,
		ZIndex = 2,
		Name = p8 .. "TextLabel",
		Size = p11,
		TextSize = if increaseLegacyPeopleRowButtonSize then p11.Y.Offset * 0.857142857143 else p11.Y.Offset * 0.666666666667,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		TextColor3 = Color3.new(1, 1, 1),
		Text = var10.name,
		FontFace = builderIconsModule.Font[var10.variant],
		Parent = var8
	}) else create("ImageLabel")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 2,
		Name = p8 .. "ImageLabel",
		Size = p11,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = p9,
		ImageRectOffset = imageRectOffset,
		ImageRectSize = imageRectSize,
		Parent = var8
	})
	
	if p15 == "ImageButton" then
		var8.Border.Thickness = 0
		var8.Border.Transparency = 1
	end
	return var8, var11, var9
end

local function AddButtonRow(p8, p9, p10, p11, p12, p13)
	-- upvalues: MakeButton (ref), create (ref)
	local var8, var9, var10 = MakeButton(p9, p10, p11, p12, p8, p13)
	local var11 = create("Frame")({
		BackgroundTransparency = 1,
		Name = p9 .. "Row",
		Size = UDim2.new(1, 0, p11.Y.Scale, p11.Y.Offset),
		Parent = p8.Page
	})
	var8.Parent = var11
	var8.AnchorPoint = Vector2.new(1, 0)
	var8.Position = UDim2.new(1, -20, 0, 0)
	
	return var11, var8, var9, var10
end

local function MakeRoundedRectFocusState(value, p8)
	-- upvalues: create (ref), uDim (ref), themeModule (ref), runService (ref), userGameSettingsService (ref)
	local var8 = create("Frame")({
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 12, 1, 12),
		Position = UDim2.fromOffset(-6, -6)
	})
	create("UICorner")({ CornerRadius = uDim, Parent = var8 })
	local var9 = create("UIGradient")({
		Rotation = 0,
		Color = themeModule.selectionCursor.GradientColorSequence,
		Transparency = themeModule.selectionCursor.GradientTransparencySequence,
		Parent = create("UIStroke")({
			Transparency = 0,
			Thickness = 3,
			Color = themeModule.selectionCursor.AnimatedColor,
			Parent = var8
		})
	})
	runService:UnbindFromRenderStep(p8)
	runService:BindToRenderStep(p8, Enum.RenderPriority.Last.Value, function()
		-- upvalues: var9 (ref), themeModule (copy), userGameSettingsService (copy)
		local var10 = var9.Rotation + 2
		local gradientColorSequence = themeModule.selectionCursor.GradientColorSequence
		local gradientTransparencySequence = themeModule.selectionCursor.GradientTransparencySequence
		
		if userGameSettingsService.ReducedMotion then
			local var11 = (math.sin(math.rad(var10)) + 1) / 2
			gradientColorSequence = ColorSequence.new(gradientColorSequence.Keypoints[1].Value:lerp(gradientColorSequence.Keypoints[#gradientColorSequence.Keypoints].Value, var11))
			local value = gradientTransparencySequence.Keypoints[1].Value
			gradientTransparencySequence = NumberSequence.new(value + (gradientTransparencySequence.Keypoints[#gradientTransparencySequence.Keypoints].Value - value) * var11)
		end
		var9.Rotation = var10
		var9.Color = gradientColorSequence
		var9.Transparency = gradientTransparencySequence
	end)
	value.AncestryChanged:Connect(function(_, p9)
		-- upvalues: runService (copy), p8 (ref)
		if not p9 then
			runService:UnbindFromRenderStep(p8)
		end
	end)
	value.SelectionImageObject = var8
end

local function CreateDropDown(p8, p9, p10)
	-- upvalues: themeModule (ref), httpService (ref), guiService (ref), create (ref), repositionDropDownScrim (ref), coreGuiService (ref), VRService (ref), isInExperienceUIVREnabled (ref), corePackagesService_1 (ref), userInputService (ref), contextActionService (ref), fFlagHideShortcutsWhileIemDropdownActive (ref), var1 (ref), robloxTranslatorModule (ref), MakeButton (ref)
	local SELECTION_TEXT_COLOR_NORMAL = themeModule.color("SELECTION_TEXT_COLOR_NORMAL", Color3.fromRGB(178, 178, 178))
	local color = Color3.fromRGB(229, 229, 229)
	local SELECTION_TEXT_COLOR_HIGHLIGHTED = themeModule.color("SELECTION_TEXT_COLOR_HIGHLIGHTED", Color3.fromRGB(255, 255, 255))
	local var8 = nil
	local t = {
		CurrentIndex = nil,
		UpdateDropDownList = nil,
		DropDownFrame = nil,
		Selections = nil
	}
	Instance.new("BindableEvent").Name = "IndexChanged"
	
	if type(p8) == "table" then
		local indexChanged = Instance.new("BindableEvent")
		indexChanged.Name = "IndexChanged"
		local var9 = true
		local var10 = httpService:GenerateGUID(false)
		local enabled = nil
		local var11 = p8
		local guiInset, _ = guiService:GetGuiInset()
		local var12 = create("ImageButton")({
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
		
		local function onVREnabled(p11)
			-- upvalues: VRService (copy), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), var12 (ref), coreGuiService (copy), t (ref), var11 (write)
			if p11 ~= "VREnabled" then return end
			if not VRService.VREnabled then
				var12.Parent = coreGuiService.RobloxGui
				var12.BackgroundTransparency = 0.2
			elseif isInExperienceUIVREnabled then
				local vrSpatialUiModule = require(corePackagesService_1.Workspace.Packages.VrSpatialUi)
				var12.Parent = vrSpatialUiModule.UIManager.getInstance():getPanelObject(vrSpatialUiModule.Constants.PanelType.MoreMenu)
				var12.BackgroundTransparency = 0.2
			else
				var12.Parent = require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):GetGUI()
				var12.BackgroundTransparency = 1
			end
			if t.UpdateDropDownList then
				t:UpdateDropDownList(var11)
			end
		end
		
		VRService.Changed:Connect(onVREnabled)
		onVREnabled("VREnabled")
		local var13 = create("ImageLabel")({
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
			Parent = var12
		})
		create("UICorner")({
			CornerRadius = themeModule.DefaultCornerRadius,
			Parent = var13
		})
		local var14 = create("ScrollingFrame")({
			Name = "DropDownScrollingFrame",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10,
			Size = UDim2.new(1, -20, 1, -25),
			Position = UDim2.new(0, 10, 0, 10),
			ScrollBarThickness = themeModule.DefaultScrollBarThickness,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Parent = var13
		})
		local var15 = nil
		local var16 = false
		
		local var17 = function(p11, p12)
			-- upvalues: t (ref), var9 (write), p10 (ref), var12 (ref), VRService (copy), userInputService (copy), guiService (copy), var8 (write), var15 (write), contextActionService (copy), var10 (ref), enabled (write), var16 (write), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy)
			if p11 ~= nil and p12 ~= Enum.UserInputState.Begin then return end
			t.DropDownFrame.Selectable = var9
			p10:SetActive(true)
			
			if var12.Visible then
				if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
					guiService.SelectedCoreObject = var8
				end
			end
			var12.Visible = false
			
			if var15 then
				var15:Disconnect()
			end
			contextActionService:UnbindCoreAction(var10 .. "Action")
			contextActionService:UnbindCoreAction(var10 .. "FreezeAction")
			enabled.Value = var9
			var16 = false
			
			if VRService.VREnabled and not isInExperienceUIVREnabled then
				require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(var12, 0)
			end
		end
		
		local var18 = function() end
		
		local var19 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.ChooseOne")
		t.DropDownFrame = MakeButton("DropDownFrame", var19, UDim2.new(0.6, 0, 0, 40), function()
			-- upvalues: var9 (write), t (ref), var16 (write), var12 (ref), VRService (copy), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), var8 (write), guiService (copy), var15 (write), SELECTION_TEXT_COLOR_HIGHLIGHTED (ref), color (ref), SELECTION_TEXT_COLOR_NORMAL (ref), var17 (ref), fFlagHideShortcutsWhileIemDropdownActive (copy), var1 (copy), contextActionService (copy), var10 (ref), var18 (ref), p10 (ref), enabled (write)
			if not var9 then return end
			t.DropDownFrame.Selectable = false
			var16 = true
			var12.Visible = true
			
			if VRService.VREnabled and not isInExperienceUIVREnabled then
				require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(var12, 0.5)
			end
			var8 = t.DropDownFrame
			
			if t.CurrentIndex and t.CurrentIndex > 0 then
				guiService.SelectedCoreObject = t.Selections[t.CurrentIndex]
			elseif #t.Selections > 0 then
				guiService.SelectedCoreObject = t.Selections[1]
			end
			var15 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: t (copy), guiService (copy), SELECTION_TEXT_COLOR_HIGHLIGHTED (copy), VRService (copy), color (copy), SELECTION_TEXT_COLOR_NORMAL (copy)
				for i = 1, #t.Selections do
					if guiService.SelectedCoreObject == t.Selections[i] then
						t.Selections[i].TextColor3 = SELECTION_TEXT_COLOR_HIGHLIGHTED
					else
						t.Selections[i].TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL
					end
				end
			end)
			local var20 = var17
			
			if fFlagHideShortcutsWhileIemDropdownActive then
				var1:setHideShortcutBar("InExperienceMenuDropdown", true)
				
				var20 = function(p11, p12)
					-- upvalues: var17 (copy), var1 (copy)
					var17(p11, p12)
					var1:setHideShortcutBar("InExperienceMenuDropdown", false)
				end
			end
			contextActionService:BindCoreAction(var10 .. "FreezeAction", var18, false, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1)
			contextActionService:BindCoreAction(var10 .. "Action", var20, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
			p10:SetActive(false)
			enabled.Value = false
		end, nil, p10)
		t.DropDownFrame.Position = UDim2.new(1, 0, 0.5, 0)
		t.DropDownFrame.AnchorPoint = Vector2.new(1, 0.5)
		enabled = t.DropDownFrame.Enabled
		local dropDownFrameTextLabel = t.DropDownFrame.DropDownFrameTextLabel
		dropDownFrameTextLabel.Position = UDim2.new(0, 15, 0, 0)
		dropDownFrameTextLabel.Size = UDim2.new(1, -50, 1, 0)
		dropDownFrameTextLabel.ClipsDescendants = true
		dropDownFrameTextLabel.TextXAlignment = Enum.TextXAlignment.Left
		local var20 = create("ImageLabel")({
			Name = "DropDownImage",
			Image = "rbxasset://textures/ui/Settings/DropDown/DropDown.png",
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0, 15, 0, 10),
			Position = UDim2.new(1, -12, 0.5, 0),
			Parent = t.DropDownFrame
		})
		t.DropDownImage = var20
		
		local function setSelection(value)
			-- upvalues: t (ref), dropDownFrameTextLabel (ref), indexChanged (ref)
			local var21 = false
			
			for i, v in pairs(t.Selections) do
				if i == value then
					dropDownFrameTextLabel.Text = v.Text
					t.CurrentIndex = i
					var21 = true
				end
			end
			if var21 then
				indexChanged:Fire(value)
			end
		end
		
		local function setSelectionByValue(value)
			-- upvalues: t (ref), dropDownFrameTextLabel (ref), indexChanged (ref)
			local var22 = false
			
			for i, v in pairs(t.Selections) do
				if v.Text == value then
					dropDownFrameTextLabel.Text = v.Text
					t.CurrentIndex = i
					var22 = true
				end
			end
			if var22 then
				indexChanged:Fire(t.CurrentIndex)
			end
			return var22
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
		
		function t.SetSelectionIndex(_, p11)
			-- upvalues: setSelection (ref)
			setSelection(p11)
		end
		
		function t.SetSelectionByValue(_, p11)
			-- upvalues: setSelectionByValue (ref)
			return setSelectionByValue(p11)
		end
		
		function t.ResetSelectionIndex(_)
			-- upvalues: t (ref), dropDownFrameTextLabel (ref), var19 (ref), var17 (ref)
			t.CurrentIndex = nil
			dropDownFrameTextLabel.Text = var19
			var17()
		end
		
		function t.GetSelectedIndex(_)
			-- upvalues: t (ref)
			return t.CurrentIndex
		end
		
		function t.SetZIndex(_, p11)
			-- upvalues: t (ref), var20 (ref), dropDownFrameTextLabel (ref)
			t.DropDownFrame.ZIndex = p11
			var20.ZIndex = p11
			dropDownFrameTextLabel.ZIndex = p11
		end
		
		function t.SetInteractable(_, p11)
			-- upvalues: var9 (write), t (ref), var17 (ref), VRService (copy), enabled (write), var16 (write)
			var9 = p11
			t.DropDownFrame.Selectable = var9
			
			if var9 then
				t.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
				t.DropDownFrame.ImageTransparency = 0
				t.DropDownImage.ImageTransparency = 0
				
				if not VRService.VREnabled then
					t:SetZIndex(2)
				end
			else
				var17()
				
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
			enabled.Value = p11 and not var16
			t.DropDownImage.Visible = p11
			
			if p11 then
				t.DropDownFrame.ImageTransparency = 0
				
				return
			end
			t.DropDownFrame.ImageTransparency = 0.5
		end
		
		function t.SetAutoLocalize(_, p11)
			-- upvalues: var12 (ref)
			var12.AutoLocalize = p11
		end
		
		function t.UpdateDropDownList(_, p11)
			-- upvalues: var11 (write), t (ref), VRService (copy), themeModule (copy), create (copy), color (ref), SELECTION_TEXT_COLOR_NORMAL (ref), var14 (ref), p9 (ref), dropDownFrameTextLabel (ref), SELECTION_TEXT_COLOR_HIGHLIGHTED (ref), var17 (ref), indexChanged (ref), userInputService (copy), guiService (copy), var10 (ref), var12 (ref), var13 (ref)
			var11 = p11
			
			if t.Selections then
				for i = 1, #t.Selections do
					t.Selections[i]:Destroy()
				end
			end
			t.Selections = {}
			t.SelectionInfo = {}
			local VREnabled = VRService.VREnabled
			local sourceSansBold = VREnabled and themeModule.font(Enum.Font.SourceSansBold, "Bold") or themeModule.font(Enum.Font.SourceSans, "UtilityText")
			local var23 = VREnabled and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
			local var24 = if VREnabled then 70 else 50
			local var25 = var24 + 1
			local var26 = if VREnabled then 600 else 400
			local var27 = 0
			
			for i_1, v in pairs(p11) do
				local var28 = create("Frame")({
					BackgroundTransparency = 0.7,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				})
				create("UICorner")({
					CornerRadius = themeModule.DefaultCornerRadius,
					Parent = var28
				})
				local var29 = v
				local var30 = ""
				local isTable = typeof(v) == "table"
				
				if isTable then
					var29 = v.title
					var30 = v.subtitle
					var27 += 10
				end
				local var31
				local _ = nil
				
				if isTable then
					var31 = create("TextButton")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false,
						ZIndex = 10,
						Name = "Selection" .. tostring(i_1),
						TextYAlignment = Enum.TextYAlignment.Top,
						Size = UDim2.new(1, -28, 0, var24 + 10),
						Position = UDim2.new(0, 14, 0, (i_1 - 1) * (var25 + 10)),
						TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL,
						Font = sourceSansBold,
						TextSize = var23,
						Text = var29,
						SelectionImageObject = var28,
						Parent = var14
					})
					local _ = create("TextLabel")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ZIndex = 10,
						Name = "Subtitle" .. tostring(i_1),
						Size = UDim2.new(1, -28, 0, var24 * 0.8),
						Position = UDim2.new(0, 14, 0, 15),
						TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL,
						Font = sourceSansBold,
						TextSize = var23 * 0.8,
						Text = var30,
						Parent = var31
					})
				else
					var31 = create("TextButton")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false,
						ZIndex = 10,
						Name = "Selection" .. tostring(i_1),
						Size = UDim2.new(1, -28, 0, var24),
						Position = UDim2.new(0, 14, 0, (i_1 - 1) * var25),
						TextColor3 = if VRService.VREnabled then color else SELECTION_TEXT_COLOR_NORMAL,
						Font = sourceSansBold,
						TextSize = var23,
						Text = v,
						SelectionImageObject = var28,
						Parent = var14
					})
				end
				if i_1 == p9 then
					t.CurrentIndex = i_1
					dropDownFrameTextLabel.Text = var29
					var31.TextColor3 = SELECTION_TEXT_COLOR_HIGHLIGHTED
				elseif not p9 and i_1 == 1 then
					var31.TextColor3 = SELECTION_TEXT_COLOR_HIGHLIGHTED
				end
				local var32 = function()
					-- upvalues: dropDownFrameTextLabel (copy), var31 (write), var17 (copy), t (copy), i_1 (ref), indexChanged (copy)
					dropDownFrameTextLabel.Text = var31.Text
					var17()
					t.CurrentIndex = i_1
					indexChanged:Fire(i_1)
				end
				
				var31.MouseButton1Click:Connect(var32)
				var31.MouseEnter:Connect(function()
					-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var31 (write)
					if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
						guiService.SelectedCoreObject = var31
					end
				end)
				t.Selections[i_1] = var31
				t.SelectionInfo[var31] = { Clicked = var32 }
			end
			guiService:RemoveSelectionGroup(var10)
			guiService:AddSelectionTuple(var10, unpack(t.Selections))
			var14.CanvasSize = UDim2.new(1, -20, 0, #p11 * var25 + var27)
			
			local function updateDropDownSize()
				-- upvalues: var14 (copy), var12 (copy), var13 (copy), var26 (ref)
				if var14.CanvasSize.Y.Offset < var12.AbsoluteSize.Y - 10 then
					var13.Size = UDim2.new(0, var26, 0, var14.CanvasSize.Y.Offset + 25)
					
					return
				end
				var13.Size = UDim2.new(0, var26, 0.9, 0)
			end
			
			var12.Changed:Connect(function(p12)
				-- upvalues: updateDropDownSize (ref)
				if p12 == "AbsoluteSize" then
					updateDropDownSize()
					
					return
				end
			end)
			updateDropDownSize()
		end
		
		t:UpdateDropDownList(p8)
		var12.MouseButton1Click:Connect(var17)
		p10.PoppedMenu:Connect(function(p12)
			-- upvalues: var12 (ref), var17 (ref)
			if p12 == var12 then
				var17()
			end
		end)
		
		return t
	end
	error("CreateDropDown dropDownStringTable (first arg) is not a table", 2)
	
	return t
end

local function CreateSelector(p11, p12)
	-- upvalues: create (ref), var5 (ref), themeModule (ref), ARROW_COLOR (ref), userInputService (ref), ARROW_COLOR_HOVER (ref), addHoverState (ref), VRService (ref), guiService (ref), EaseOutQuad (ref), ARROW_COLOR_INACTIVE (ref), var2 (ref), var3 (ref), var4 (ref), t (ref)
	local var23 = 0
	local t_1 = { HubRef = nil, SetSelectionIndex = nil }
	
	if type(p11) ~= "table" then
		error("CreateSelector selectionStringTable (first arg) is not a table", 2)
		
		return t_1
	end
	local indexChanged = Instance.new("BindableEvent")
	indexChanged.Name = "IndexChanged"
	local var24 = true
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
		SelectionImageObject = var5
	})
	local var25 = create("ImageButton")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var5,
		Parent = t_1.SelectorFrame
	})
	local var26 = create("ImageButton")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var5,
		Parent = t_1.SelectorFrame
	})
	local var27 = create("ImageLabel")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Left.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 30),
		ImageColor3 = ARROW_COLOR,
		Parent = var25
	})
	local var28 = create("ImageLabel")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Right.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 30),
		ImageColor3 = ARROW_COLOR,
		Parent = var26
	})
	
	if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		local var29 = function(p13)
			-- upvalues: ARROW_COLOR (copy)
			p13.ImageColor3 = ARROW_COLOR
		end
		
		local var30 = function(p13)
			-- upvalues: ARROW_COLOR_HOVER (copy)
			p13.ImageColor3 = ARROW_COLOR_HOVER
		end
		
		addHoverState(var25, var27, var29, var30)
		addHoverState(var26, var28, var29, var30)
	end
	t_1.Selections = {}
	local t_2 = {}
	local t_3 = {}
	local var31 = create("ImageButton")({
		Name = "AutoSelectButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 2,
		Position = UDim2.new(0, var25.Size.X.Offset, 0, 0),
		Size = UDim2.new(1, var25.Size.X.Offset * -2, 1, 0),
		Parent = t_1.SelectorFrame,
		SelectionImageObject = var5
	})
	var31.MouseButton1Click:Connect(function()
		-- upvalues: var24 (write), t_1 (ref), VRService (copy), userInputService (copy), guiService (copy)
		if not var24 then return end
		if #t_1.Selections <= 1 then return end
		local var32 = t_1.CurrentIndex + 1
		
		if #t_1.Selections < var32 then
			var32 = 1
		end
		t_1:SetSelectionIndex(var32)
		
		if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
			guiService.SelectedCoreObject = t_1.SelectorFrame
		end
	end)
	t_3[var31] = true
	
	local function setSelection(value, p13)
		-- upvalues: t_1 (ref), var25 (ref), t_2 (write), EaseOutQuad (copy), indexChanged (ref)
		for i, v in pairs(t_1.Selections) do
			local var32 = i == value
			local uDim2 = UDim2.new(0, var25.Size.X.Offset, 0, 0)
			local var33 = if t_2[v] then UDim2.new(0, var25.Size.X.Offset * -p13 * 3, 0, 0) else UDim2.new(0, var25.Size.X.Offset * p13 * 3, 0, 0)
			
			if var33.X.Offset < 0 then
				var33 = UDim2.new(0, var33.X.Offset + v.AbsoluteSize.X / 4, 0, 0)
			end
			if var32 then
				t_2[v] = true
				v.Position = var33
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
					v:TweenPositionInternal(var33, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true)
				else
					v.Position = var33
				end
			end
		end
	end
	
	local function stepFunc(p14, p15)
		-- upvalues: var24 (write), VRService (copy), userInputService (copy), guiService (copy), t_1 (ref), setSelection (ref)
		if not var24 then return end
		if p14 ~= nil and p14.UserInputType ~= Enum.UserInputType.MouseButton1 and (p14.UserInputType ~= Enum.UserInputType.Gamepad1 and p14.UserInputType ~= Enum.UserInputType.Gamepad2) and (p14.UserInputType ~= Enum.UserInputType.Gamepad3 and p14.UserInputType ~= Enum.UserInputType.Gamepad4 and p14.UserInputType ~= Enum.UserInputType.Keyboard) then return end
		if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
			guiService.SelectedCoreObject = t_1.SelectorFrame
		end
		local var34 = p15 + t_1.CurrentIndex
		local var35 = if t_1.CurrentIndex < var34 then 1 else -1
		
		if #t_1.Selections < var34 then
			var34 = 1
		elseif var34 < 1 then
			var34 = #t_1.Selections
		end
		setSelection(var34, var35)
	end
	
	local var34 = nil
	
	local function _()
		-- upvalues: var34 (write), guiService (copy), t_1 (ref), t_3 (ref), VRService (copy)
		var34 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: t_1 (copy), guiService (copy), t_3 (copy), VRService (copy)
			if #t_1.Selections <= 0 then return end
			if guiService.SelectedCoreObject ~= nil and t_3[guiService.SelectedCoreObject] and not VRService.VREnabled then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
		end)
	end
	
	t_1.IndexChanged = indexChanged.Event
	
	function t_1.SetSelectionIndex(_, p14)
		-- upvalues: setSelection (ref)
		setSelection(p14, 1)
	end
	
	function t_1.GetSelectedIndex(_)
		-- upvalues: t_1 (ref)
		return t_1.CurrentIndex
	end
	
	function t_1.SetZIndex(_, p14)
		-- upvalues: var25 (ref), var26 (ref), var27 (ref), var28 (ref), t_1 (ref)
		var25.ZIndex = p14
		var26.ZIndex = p14
		var27.ZIndex = p14
		var28.ZIndex = p14
		
		for i = 1, #t_1.Selections do
			t_1.Selections[i].ZIndex = p14
		end
	end
	
	function t_1.SetInteractable(_, p15)
		-- upvalues: var24 (write), t_1 (ref), var25 (ref), var26 (ref), themeModule (copy), var27 (ref), ARROW_COLOR_INACTIVE (copy), var28 (ref), ARROW_COLOR (copy)
		var24 = p15
		t_1.SelectorFrame.Selectable = var24
		var25.Active = var24
		var26.Active = var24
		var25.Visible = var24
		var26.Visible = var24
		
		if var24 then
			for i, v in pairs(t_1.Selections) do
				v.TextColor3 = Color3.fromRGB(255, 255, 255)
			end
			var27.ImageColor3 = ARROW_COLOR
			var28.ImageColor3 = ARROW_COLOR
			
			return
		else
			for i, v in pairs(t_1.Selections) do
				v.TextColor3 = themeModule.color("NotInteractableSelection", Color3.fromRGB(255, 255, 255))
			end
			var27.ImageColor3 = ARROW_COLOR_INACTIVE
			var28.ImageColor3 = ARROW_COLOR_INACTIVE
		end
	end
	
	function t_1.UpdateOptions(_, p16)
		-- upvalues: t_1 (ref), t_2 (write), create (copy), var25 (ref), themeModule (copy), var2 (copy), p12 (ref), var26 (ref)
		for i, v in pairs(t_1.Selections) do
			v:Destroy()
		end
		t_2 = {}
		t_1.Selections = {}
		
		for i_1, v_1 in pairs(p16) do
			local var35 = create("TextLabel")({
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextWrapped = true,
				ZIndex = 2,
				Visible = false,
				Name = "Selection" .. tostring(i_1),
				Size = UDim2.new(1, var25.Size.X.Offset * -2, 1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = themeModule.font(Enum.Font.SourceSans, "UtilityText"),
				TextSize = themeModule.textSize(24, "UtilityText"),
				Text = v_1,
				Parent = t_1.SelectorFrame
			})
			
			if var2 then
				var35.TextSize = themeModule.textSize(36)
			end
			if i_1 == p12 then
				t_1.CurrentIndex = i_1
				var35.Position = UDim2.new(0, var25.Size.X.Offset, 0, 0)
				var35.Visible = true
				t_2[var35] = true
			else
				t_2[var35] = false
			end
			t_1.Selections[i_1] = var35
		end
		local var36 = #t_1.Selections > 1
		var25.Visible = var36
		var26.Visible = var36
	end
	
	VRService.Changed:Connect(function(p17)
		-- upvalues: VRService (copy), var25 (ref), var26 (ref), var31 (ref)
		if p17 == "VREnabled" then
			local VREnabled = VRService.VREnabled
			var25.Selectable = VREnabled
			var26.Selectable = VREnabled
			var31.Selectable = VREnabled
			
			return
		end
	end)
	local VREnabled = VRService.VREnabled
	var25.Selectable = VREnabled
	var26.Selectable = VREnabled
	var31.Selectable = VREnabled
	var25.InputBegan:Connect(function(p17)
		-- upvalues: var3 (copy), var4 (copy), var24 (write), VRService (copy), userInputService (copy), guiService (copy), t_1 (ref), setSelection (ref)
		if var3(false) or var4(false) and p17.UserInputType == Enum.UserInputType.MouseButton1 then
			if not var24 then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var37 = -1 + t_1.CurrentIndex
			local var38 = if t_1.CurrentIndex < var37 then 1 else -1
			
			if #t_1.Selections < var37 then
				var37 = 1
			elseif var37 < 1 then
				var37 = #t_1.Selections
			end
			setSelection(var37, var38)
		end
	end)
	var26.InputBegan:Connect(function(p17)
		-- upvalues: var3 (copy), var4 (copy), var24 (write), VRService (copy), userInputService (copy), guiService (copy), t_1 (ref), setSelection (ref)
		if var3(false) or var4(false) and p17.UserInputType == Enum.UserInputType.MouseButton1 then
			if not var24 then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var37 = 1 + t_1.CurrentIndex
			local var38 = if t_1.CurrentIndex < var37 then 1 else -1
			
			if #t_1.Selections < var37 then
				var37 = 1
			elseif var37 < 1 then
				var37 = #t_1.Selections
			end
			setSelection(var37, var38)
		end
	end)
	local var37 = true
	t_1:UpdateOptions(p11)
	userInputService.InputBegan:Connect(function(p17)
		-- upvalues: var24 (write), var37 (write), guiService (copy), t_1 (ref), VRService (copy), userInputService (copy), setSelection (ref)
		if not var24 then return end
		if not var37 then return end
		if p17.UserInputType ~= Enum.UserInputType.Gamepad1 and p17.UserInputType ~= Enum.UserInputType.Keyboard then return end
		if guiService.SelectedCoreObject ~= t_1.SelectorFrame then return end
		if p17.KeyCode == Enum.KeyCode.DPadLeft or p17.KeyCode == Enum.KeyCode.Left or p17.KeyCode == Enum.KeyCode.A then
			if not var24 then return end
			if p17 ~= nil and p17.UserInputType ~= Enum.UserInputType.MouseButton1 and (p17.UserInputType ~= Enum.UserInputType.Gamepad1 and p17.UserInputType ~= Enum.UserInputType.Gamepad2) and (p17.UserInputType ~= Enum.UserInputType.Gamepad3 and p17.UserInputType ~= Enum.UserInputType.Gamepad4 and p17.UserInputType ~= Enum.UserInputType.Keyboard) then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var38 = -1 + t_1.CurrentIndex
			local var39 = if t_1.CurrentIndex < var38 then 1 else -1
			
			if #t_1.Selections < var38 then
				var38 = 1
			elseif var38 < 1 then
				var38 = #t_1.Selections
			end
			setSelection(var38, var39)
			
			return
		elseif p17.KeyCode == Enum.KeyCode.DPadRight or p17.KeyCode == Enum.KeyCode.Right or p17.KeyCode == Enum.KeyCode.D then
			if not var24 then return end
			if p17 ~= nil and p17.UserInputType ~= Enum.UserInputType.MouseButton1 and (p17.UserInputType ~= Enum.UserInputType.Gamepad1 and p17.UserInputType ~= Enum.UserInputType.Gamepad2) and (p17.UserInputType ~= Enum.UserInputType.Gamepad3 and p17.UserInputType ~= Enum.UserInputType.Gamepad4 and p17.UserInputType ~= Enum.UserInputType.Keyboard) then return end
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = t_1.SelectorFrame
			end
			local var40 = 1 + t_1.CurrentIndex
			local var41 = if t_1.CurrentIndex < var40 then 1 else -1
			
			if #t_1.Selections < var40 then
				var40 = 1
			elseif var40 < 1 then
				var40 = #t_1.Selections
			end
			setSelection(var40, var41)
		end
	end)
	userInputService.InputChanged:Connect(function(p17)
		-- upvalues: var24 (write), var37 (write), var23 (write), guiService (copy), t_1 (ref), stepFunc (ref)
		if not var24 then return end
		if not var37 then
			var23 = 0
			
			return
		elseif p17.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t_1.SelectorFrame.Parent) then return end
		if p17.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		if p17.Position.X > 0.8 and p17.Delta.X > 0 and var23 ~= 1 then
			var23 = 1
			stepFunc(p17, var23)
			
			return
		elseif p17.Position.X < -0.8 and p17.Delta.X < 0 and var23 ~= -1 then
			var23 = -1
			stepFunc(p17, var23)
			
			return
		elseif math.abs(p17.Position.X) < 0.8 then
			var23 = 0
		end
	end)
	t_1.SelectorFrame.AncestryChanged:Connect(function(_, p17)
		-- upvalues: var37 (write), var34 (write), guiService (copy), t_1 (ref), t_3 (ref), VRService (copy)
		var37 = p17
		
		if var37 then
			var34 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: t_1 (copy), guiService (copy), t_3 (copy), VRService (copy)
				if #t_1.Selections <= 0 then return end
				if guiService.SelectedCoreObject ~= nil and t_3[guiService.SelectedCoreObject] and not VRService.VREnabled then
					guiService.SelectedCoreObject = t_1.SelectorFrame
				end
			end)
		elseif var34 then
			var34:Disconnect()
			
			return
		end
	end)
	
	local function onResized(_, p17)
		-- upvalues: themeModule (copy), var2 (copy), t_1 (ref)
		local var38 = if p17 then themeModule.textSize(16) else var2 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
		
		for i, v in pairs(t_1.Selections) do
			v.TextSize = var38
		end
	end
	
	t[t_1.SelectorFrame] = onResized
	local var39 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	onResized(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport(), var39.X < var39.Y)
	var34 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
		-- upvalues: t_1 (ref), guiService (copy), t_3 (ref), VRService (copy)
		if #t_1.Selections <= 0 then return end
		if guiService.SelectedCoreObject ~= nil and t_3[guiService.SelectedCoreObject] and not VRService.VREnabled then
			guiService.SelectedCoreObject = t_1.SelectorFrame
		end
	end)
	
	return t_1
end

local function ShowAlert(p17, p18, p19, p20, p21)
	-- upvalues: coreGuiService (ref), VRService (ref), isInExperienceUIVREnabled (ref), corePackagesService_1 (ref), create (ref), themeModule (ref), httpService (ref), contextActionService (ref), guiService (ref), MakeButton (ref), userInputService (ref)
	local robloxGui = coreGuiService.RobloxGui
	
	if robloxGui:FindFirstChild("AlertViewFullScreen") then return end
	local var38 = nil
	
	local function onVREnabled(p22)
		-- upvalues: VRService (copy), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), robloxGui (write), coreGuiService (copy), var38 (write)
		if p22 ~= "VREnabled" then return end
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
		if var38 and var38.Parent ~= nil then
			var38.Parent = robloxGui
			
			if VRService.VREnabled and not isInExperienceUIVREnabled then
				settingsMenu:SetSubpanelDepth(var38, 0.5)
			end
		end
	end
	
	local changedConnection = VRService.Changed:Connect(onVREnabled)
	var38 = create("ImageLabel")({
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
	
	if p21 or (if isInExperienceUIVREnabled then false else VRService.VREnabled) then
		var38.ImageTransparency = 0
	else
		var38.Size = UDim2.new(0.8, 0, 0, 350)
		var38.Position = UDim2.new(0.1, 0, 0.1, 0)
	end
	if coreGuiService.RobloxGui.AbsoluteSize.Y <= var38.Size.Y.Offset then
		var38.Size = UDim2.new(var38.Size.X.Scale, var38.Size.X.Offset, var38.Size.Y.Scale, coreGuiService.RobloxGui.AbsoluteSize.Y)
		var38.Position = UDim2.new(var38.Position.X.Scale, -var38.Size.X.Offset / 2, 0.5, -var38.Size.Y.Offset / 2)
	end
	if not p21 then
		create("UICorner")({
			CornerRadius = themeModule.DefaultCornerRadius,
			Parent = var38
		})
		var38.BackgroundColor3 = themeModule.color("MenuContainer")
		var38.BackgroundTransparency = themeModule.transparency("MenuContainer")
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
		Text = p17,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		Parent = var38
	})
	local _ = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 })
	local var39 = httpService:GenerateGUID(false)
	
	local var40 = function(_, p22)
		-- upvalues: VRService (copy), var38 (write), isInExperienceUIVREnabled (copy), corePackagesService_1 (copy), p20 (ref), contextActionService (copy), var39 (ref), guiService (copy), p19 (ref), changedConnection (ref)
		if VRService.VREnabled and (p22 == Enum.UserInputState.Begin or p22 == Enum.UserInputState.Cancel) then return end
		if not var38 then return end
		if VRService.VREnabled and not isInExperienceUIVREnabled then
			require(corePackagesService_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(var38, 0)
		end
		var38:Destroy()
		var38 = nil
		
		if p20 then
			p20()
		end
		contextActionService:UnbindCoreAction(var39)
		guiService.SelectedCoreObject = nil
		
		if p19 then
			p19:ShowBar()
		end
		if changedConnection then
			changedConnection:Disconnect()
		end
	end
	
	local uDim2 = UDim2.new(1, -20, 0, 60)
	local uDim2_1 = UDim2.new(0, 10, 0.65, 0)
	
	if not p21 then
		uDim2 = UDim2.new(0, 200, 0, 50)
		uDim2_1 = UDim2.new(0.5, -100, 0.65, 0)
	end
	local var41, var42 = MakeButton("AlertViewButton", p18, uDim2, var40)
	var41.Position = uDim2_1
	var41.NextSelectionLeft = var41
	var41.NextSelectionRight = var41
	var41.NextSelectionUp = var41
	var41.NextSelectionDown = var41
	var41.ZIndex = 9
	var42.ZIndex = var41.ZIndex
	var41.Parent = var38
	
	if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
		guiService.SelectedCoreObject = var41
	end
	guiService.SelectedCoreObject = var41
	contextActionService:BindCoreAction(var39, var40, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA)
	
	if p19 and (if isInExperienceUIVREnabled then true else not VRService.VREnabled) then
		p19:HideBar()
		p19.Pages.CurrentPage:Hide(1, 1)
	end
end

local function CreateNewSlider(p17, p18, p19, p20, p21)
	-- upvalues: httpService (ref), signal (ref), create (ref), var5 (ref), robloxGui (ref), themeModule (ref), userInputService (ref), ARROW_COLOR_HOVER (ref), ARROW_COLOR (ref), ARROW_COLOR_HOVER (ref), addHoverState (ref), SELECTED_COLOR (ref), NON_SELECTED_COLOR (ref), VRService (ref), guiService (ref), runService (ref)
	local t = {}
	local var38 = tonumber(p17)
	local var39 = p18
	local var40 = 0
	local var41 = nil
	local var42 = true
	local var43 = httpService:GenerateGUID(false)
	_ = ""
	_ = ""
	
	if var38 <= 0 then
		error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2)
		
		return
	end
	p20 = p20 or p21
	local valueChanged = Instance.new("BindableEvent")
	valueChanged.Name = "ValueChanged"
	local var44 = signal.new()
	t.SliderFrame = create("ImageButton")({
		Name = "Slider",
		Image = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		ZIndex = 2,
		NextSelectionLeft = t.SliderFrame,
		NextSelectionRight = t.SliderFrame,
		Size = UDim2.new(0.6, 0, 0, 50),
		AutomaticSize = if p20 then Enum.AutomaticSize.Y else nil,
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		SelectionImageObject = var5
	})
	local var45 = nil
	
	if p20 then
		var45 = create("Frame")({
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
		local var46 = create("Frame")({
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
			Parent = var46
		})
		
		local function _()
			-- upvalues: robloxGui (copy)
			return robloxGui.AbsoluteSize.X > 460
		end
		
		if p20 then
			t.LeftLabel = create("TextLabel")({
				Name = "LeftLabel",
				TextTransparency = 0.25,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = p20,
				Font = themeModule.font(Enum.Font.SourceSans, "UtilityRow"),
				TextSize = themeModule.textSize(18, "UtilityRow"),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = var46,
				Visible = robloxGui.AbsoluteSize.X > 460
			})
		end
		if p21 then
			t.RightLabel = create("TextLabel")({
				Name = "RightLabel",
				TextTransparency = 0.25,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = p21,
				Font = themeModule.font(Enum.Font.SourceSans, "UtilityRow"),
				TextSize = themeModule.textSize(18, "UtilityRow"),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextXAlignment = Enum.TextXAlignment.Right,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = var46,
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
		Parent = if p20 then var45 else t.SliderFrame
	})
	local var47 = create("ImageButton")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		Active = true,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var5,
		Parent = if p20 then var45 else t.SliderFrame
	})
	local var48 = create("ImageButton")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 3,
		Selectable = false,
		Active = true,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, themeModule.SelectorArrowButtonWidth, 0, 50),
		SelectionImageObject = var5,
		Parent = if p20 then var45 else t.SliderFrame
	})
	local var49 = create("ImageLabel")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/Less.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Parent = var47,
		ImageColor3 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then ARROW_COLOR_HOVER else ARROW_COLOR
	})
	local var50 = create("ImageLabel")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Settings/Slider/More.png",
		ZIndex = 4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Parent = var48,
		ImageColor3 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then ARROW_COLOR_HOVER else ARROW_COLOR
	})
	
	if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		local var51 = function(p22)
			-- upvalues: ARROW_COLOR (copy)
			p22.ImageColor3 = ARROW_COLOR
		end
		
		local var52 = function(p22)
			-- upvalues: ARROW_COLOR_HOVER (copy)
			p22.ImageColor3 = ARROW_COLOR_HOVER
		end
		
		addHoverState(var47, var49, var51, var52)
		addHoverState(var48, var50, var51, var52)
	end
	t.Steps = {}
	local var53 = 1 / var38
	
	for i = 1, var38 do
		local var54 = create("ImageButton")({
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
			Position = UDim2.new((i - 1) * var53, 2, 0.5, 0),
			Size = UDim2.new(var53, -4, 0, 24),
			Parent = t.StepsContainer,
			SelectionImageObject = var5
		})
		
		if var39 < i then
			var54.BackgroundColor3 = NON_SELECTED_COLOR
		end
		if i == 1 or i == var38 then
			create("UICorner")({
				CornerRadius = themeModule.DefaultCornerRadius,
				Parent = var54
			})
			create("Frame")({
				Name = "Filler",
				BorderSizePixel = 0,
				BackgroundColor3 = var54.BackgroundColor3,
				Parent = var54,
				Size = UDim2.new(0.25, 0, 1, 0),
				Position = if i == 1 then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0, 0, 0, 0)
			})
		end
		t.Steps[#t.Steps + 1] = var54
	end
	local function hideSelection()
		-- upvalues: var38 (ref), t (ref), NON_SELECTED_COLOR (copy)
		for i = 1, var38 do
			t.Steps[i].BackgroundColor3 = NON_SELECTED_COLOR
			
			if i == 1 or i == var38 then
				t.Steps[i].Filler.BackgroundColor3 = NON_SELECTED_COLOR
			end
		end
	end
	
	local function showSelection()
		-- upvalues: var38 (ref), var39 (write), t (ref), SELECTED_COLOR (copy)
		for i = 1, var38 do
			if var39 < i then break end
			t.Steps[i].BackgroundColor3 = SELECTED_COLOR
			
			if i == 1 or i == var38 then
				t.Steps[i].Filler.BackgroundColor3 = SELECTED_COLOR
			end
		end
	end
	
	i = function(value)
		-- upvalues: p19 (write), var47 (ref), var48 (ref), var38 (ref), var39 (write), hideSelection (ref), showSelection (ref), var41 (write), var44 (ref), valueChanged (ref)
		if not p19 then
			p19 = 0
		end
		var47.Visible = true
		var48.Visible = true
		
		if value <= p19 then
			value = p19
			var47.Visible = false
		end
		if var38 <= value then
			value = var38
			var48.Visible = false
		end
		if var39 == value then return end
		var39 = value
		hideSelection()
		showSelection()
		var41 = tick()
		
		if var44 then
			var44:fire(var39)
			
			return
		end
		valueChanged:Fire(var39)
	end
	
	local _ = function(p22)
		return if p22 then if p22.UserInputType ~= Enum.UserInputType.MouseButton1 then if p22.UserInputType ~= Enum.UserInputType.Touch then p22.UserInputType == Enum.UserInputType.Gamepad1 and p22.KeyCode == Enum.KeyCode.ButtonA else true else true else false
	end
	
	local function mouseDownFunc(p22, p23, p24)
		-- upvalues: var42 (write), VRService (copy), userInputService (copy), guiService (copy), t (ref), var40 (write), var39 (write), var38 (ref), i (ref)
		if not var42 then return end
		if p22 == nil then return end
		if not (if p22 then if p22.UserInputType ~= Enum.UserInputType.MouseButton1 then if p22.UserInputType ~= Enum.UserInputType.Touch then p22.UserInputType == Enum.UserInputType.Gamepad1 and p22.KeyCode == Enum.KeyCode.ButtonA else true else true else false) then return end
		if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and not VRService.VREnabled then
			guiService.SelectedCoreObject = t.SliderFrame
		end
		if VRService.VREnabled then
			var40 = 0
		elseif p24 then
			var40 = p23 - var39
		else
			var40 = 0
			local _ = nil
			local inputEndedConnection = nil
			local inputChangedConnection = userInputService.InputChanged:Connect(function(p25)
				-- upvalues: var38 (copy), t (copy), i (copy)
				if p25.UserInputType ~= Enum.UserInputType.MouseMovement then return end
				local x = p25.Position.X
				
				for i_1 = 1, var38 do
					local x_1 = t.Steps[i_1].AbsolutePosition.X
					
					if x_1 > x or x > x_1 + t.Steps[i_1].AbsoluteSize.X then
						if i_1 ~= 1 or x >= x_1 then
							if i_1 ~= var38 or x_1 > x then
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
			inputEndedConnection = userInputService.InputEnded:Connect(function(p26)
				-- upvalues: var40 (copy), inputEndedConnection (write), inputChangedConnection (write)
				if if p26 then if p26.UserInputType ~= Enum.UserInputType.MouseButton1 then if p26.UserInputType ~= Enum.UserInputType.Touch then p26.UserInputType == Enum.UserInputType.Gamepad1 and p26.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
					var40 = 0
					inputEndedConnection:Disconnect()
					inputChangedConnection:Disconnect()
					
					return
				end
			end)
		end
		i(p23)
	end
	
	local _ = function(p25)
		-- upvalues: var42 (write), var40 (write)
		if not var42 then return end
		if if p25 then if p25.UserInputType ~= Enum.UserInputType.MouseButton1 then if p25.UserInputType ~= Enum.UserInputType.Touch then p25.UserInputType == Enum.UserInputType.Gamepad1 and p25.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
			var40 = 0
			
			return
		end
	end
	
	t.ValueChanged = valueChanged.Event
	
	if var44 then
		t.ValueChanged = var44
	end
	function t.SetValue(_, p25)
		-- upvalues: i (ref)
		i(p25)
	end
	
	function t.GetValue(_)
		-- upvalues: var39 (write)
		return var39
	end
	
	function t.SetInteractable(_, p25)
		-- upvalues: var40 (write), var42 (write), t (ref), hideSelection (ref), showSelection (ref)
		var40 = 0
		var42 = p25
		t.SliderFrame.Selectable = p25
		
		if var42 then
			showSelection()
			
			return
		end
		hideSelection()
	end
	
	function t.SetZIndex(_, p25)
		-- upvalues: var47 (ref), var48 (ref), var49 (ref), var50 (ref), t (ref)
		var47.ZIndex = p25
		var48.ZIndex = p25
		var49.ZIndex = p25
		var50.ZIndex = p25
		
		for i = 1, #t.Steps do
			t.Steps[i].ZIndex = p25
		end
	end
	
	function t.SetMinStep(_, b)
		-- upvalues: var38 (ref), p19 (write), var39 (write), var47 (ref), var48 (ref)
		if b >= 0 and b <= var38 then
			p19 = b
		end
		if var39 <= p19 then
			var39 = p19
			var47.Visible = false
		end
		if var38 <= var39 then
			var39 = var38
			var48.Visible = false
		end
	end
	
	var47.InputBegan:Connect(function(p26)
		-- upvalues: var39 (write), var42 (write), VRService (copy), userInputService (copy), guiService (copy), t (ref), var40 (write), i (ref)
		local var55 = var39 - 1
		
		if not var42 then return end
		if p26 == nil then return end
		if not (if p26 then if p26.UserInputType ~= Enum.UserInputType.MouseButton1 then if p26.UserInputType ~= Enum.UserInputType.Touch then p26.UserInputType == Enum.UserInputType.Gamepad1 and p26.KeyCode == Enum.KeyCode.ButtonA else true else true else false) then return end
		if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and not VRService.VREnabled then
			guiService.SelectedCoreObject = t.SliderFrame
		end
		var40 = if not VRService.VREnabled then var55 - var39 else 0
		i(var55)
	end)
	var47.InputEnded:Connect(function(p26)
		-- upvalues: var42 (write), var40 (write)
		if not var42 then return end
		if if p26 then if p26.UserInputType ~= Enum.UserInputType.MouseButton1 then if p26.UserInputType ~= Enum.UserInputType.Touch then p26.UserInputType == Enum.UserInputType.Gamepad1 and p26.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
			var40 = 0
			
			return
		end
	end)
	var48.InputBegan:Connect(function(p26)
		-- upvalues: var39 (write), var42 (write), VRService (copy), userInputService (copy), guiService (copy), t (ref), var40 (write), i (ref)
		local var55 = var39 + 1
		
		if not var42 then return end
		if p26 == nil then return end
		if not (if p26 then if p26.UserInputType ~= Enum.UserInputType.MouseButton1 then if p26.UserInputType ~= Enum.UserInputType.Touch then p26.UserInputType == Enum.UserInputType.Gamepad1 and p26.KeyCode == Enum.KeyCode.ButtonA else true else true else false) then return end
		if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and not VRService.VREnabled then
			guiService.SelectedCoreObject = t.SliderFrame
		end
		var40 = if not VRService.VREnabled then var55 - var39 else 0
		i(var55)
	end)
	var48.InputEnded:Connect(function(p26)
		-- upvalues: var42 (write), var40 (write)
		if not var42 then return end
		if if p26 then if p26.UserInputType ~= Enum.UserInputType.MouseButton1 then if p26.UserInputType ~= Enum.UserInputType.Touch then p26.UserInputType == Enum.UserInputType.Gamepad1 and p26.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
			var40 = 0
			
			return
		end
	end)
	
	local function onVREnabled(p26)
		-- upvalues: VRService (copy), var47 (ref), var42 (write), var48 (ref), t (ref), var38 (ref)
		if p26 ~= "VREnabled" then return end
		if VRService.VREnabled then
			var47.Selectable = var42
			var48.Selectable = var42
			t.SliderFrame.Selectable = var42
			
			for i = 1, var38 do
				t.Steps[i].Selectable = var42
				t.Steps[i].Active = var42
			end
			return
		else
			var47.Selectable = false
			var48.Selectable = false
			t.SliderFrame.Selectable = var42
			
			for i_1 = 1, var38 do
				t.Steps[i_1].Selectable = false
				t.Steps[i_1].Active = false
			end
		end
	end
	
	VRService.Changed:Connect(onVREnabled)
	onVREnabled("VREnabled")
	
	for i_1 = 1, var38 do
		t.Steps[i_1].InputBegan:Connect(function(p27)
			-- upvalues: mouseDownFunc (ref), i_1 (ref)
			mouseDownFunc(p27, i_1)
		end)
		t.Steps[i_1].InputEnded:Connect(function(p27)
			-- upvalues: var42 (write), var40 (write)
			if not var42 then return end
			if if p27 then if p27.UserInputType ~= Enum.UserInputType.MouseButton1 then if p27.UserInputType ~= Enum.UserInputType.Touch then p27.UserInputType == Enum.UserInputType.Gamepad1 and p27.KeyCode == Enum.KeyCode.ButtonA else true else true else false then
				var40 = 0
				
				return
			end
		end)
	end
	t.SliderFrame.InputBegan:Connect(function(p27)
		-- upvalues: VRService (copy), guiService (copy), t (ref), mouseDownFunc (ref), var39 (write)
		if VRService.VREnabled then
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject and selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then
				mouseDownFunc(p27, var39)
				
				return
			else
			end
		end
	end)
	t.SliderFrame.InputEnded:Connect(function(p27)
		-- upvalues: VRService (copy), guiService (copy), t (ref), var42 (write), var40 (write)
		local selectedCoreObject
		if VRService.VREnabled then
			selectedCoreObject = guiService.SelectedCoreObject
			
			if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		end
		if not var42 then return end
		selectedCoreObject = if p27 then if p27.UserInputType ~= Enum.UserInputType.MouseButton1 then if p27.UserInputType ~= Enum.UserInputType.Touch then p27.UserInputType == Enum.UserInputType.Gamepad1 and p27.KeyCode == Enum.KeyCode.ButtonA else true else true else false
		
		if selectedCoreObject then
			var40 = 0
			
			return
		end
	end)
	
	local var55 = function()
		-- upvalues: var41 (write), i (ref), var39 (write), var40 (write)
		if var41 == nil then return end
		if tick() - var41 >= 0.2 then
			i(var39 + var40)
		end
	end
	
	local var56 = true
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
	userInputService.InputBegan:Connect(function(p27)
		-- upvalues: var42 (write), var56 (write), guiService (copy), t (ref), t_1 (ref), var40 (write), i (ref), var39 (write)
		if not var42 then return end
		if not var56 then return end
		if p27.UserInputType ~= Enum.UserInputType.Gamepad1 and p27.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if t_1[p27.KeyCode] == -1 then
			var40 = -1
			i(var39 - 1)
			
			return
		elseif t_1[p27.KeyCode] == 1 then
			var40 = 1
			i(var39 + 1)
		end
	end)
	userInputService.InputEnded:Connect(function(p27)
		-- upvalues: var42 (write), guiService (copy), t (ref), t_1 (ref), var40 (write)
		if not var42 then return end
		if p27.UserInputType ~= Enum.UserInputType.Gamepad1 and p27.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if t_1[p27.KeyCode] then
			var40 = 0
		end
	end)
	userInputService.InputChanged:Connect(function(p27)
		-- upvalues: var42 (write), var40 (write), var56 (write), guiService (copy), t (ref), i (ref), var39 (write)
		if not var42 then
			var40 = 0
			
			return
		elseif not var56 then
			var40 = 0
			
			return
		elseif p27.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if not selectedCoreObject or not selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then return end
		if p27.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		if p27.Position.X > 0.8 and p27.Delta.X > 0 and var40 ~= 1 then
			var40 = 1
			i(var39 + 1)
			
			return
		elseif p27.Position.X < -0.8 and p27.Delta.X < 0 and var40 ~= -1 then
			var40 = -1
			i(var39 - 1)
			
			return
		elseif math.abs(p27.Position.X) < 0.8 then
			var40 = 0
		end
	end)
	local var57 = false
	guiService.Changed:Connect(function(p27)
		-- upvalues: guiService (copy), t (ref), var57 (write), var41 (write), runService (copy), var43 (ref), var55 (ref)
		if p27 ~= "SelectedCoreObject" then return end
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject and selectedCoreObject:IsDescendantOf(t.SliderFrame.Parent) then
			if var57 then
				return
			else
				var57 = true
				var41 = tick()
				runService:BindToRenderStep(var43, Enum.RenderPriority.Input.Value + 1, var55)
				
				return
			end
		elseif var57 then
			var57 = false
			runService:UnbindFromRenderStep(var43)
		end
	end)
	t.SliderFrame.AncestryChanged:Connect(function(_, p27)
		-- upvalues: var56 (write)
		var56 = p27
	end)
	i(var39)
	
	return t
end

local var58 = if var2 then 90 else 50
local t_2 = {}

local function AddNewRow(p27, p28, p29, p30, p31, p32, p33, p34, p35, p36)
	-- upvalues: t_2 (ref), create (ref), var58 (write), var5 (ref), themeModule (ref), var2 (ref), guiService (ref), t (ref), CreateNewSlider (ref), CreateSelector (ref), CreateDropDown (ref), VRService (ref), userInputService (ref), coreGuiService (ref)
	local var59 = 0
	local isNotTextBox = p29 ~= "TextBox"
	
	if t_2[p27] then
		var59 = t_2[p27]
	end
	local _ = nil
	local var60 = create("ImageButton")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 1,
		Active = false,
		AutoButtonColor = false,
		ZIndex = 2,
		Selectable = false,
		Name = p28 .. "Frame",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(2, 2, 18, 18),
		Size = UDim2.new(1, 0, 0, var58),
		AutomaticSize = if p33 or p34 or p35 then Enum.AutomaticSize.Y else nil,
		Position = UDim2.new(0, 0, 0, var59),
		SelectionImageObject = var5,
		Parent = p27.Page
	})
	var60.BackgroundColor3 = themeModule.color("RowFrameBackground")
	var60.ImageColor3 = var60.BackgroundColor3
	create("UICorner")({
		CornerRadius = themeModule.DefaultCornerRadius,
		Parent = var60
	})
	
	if var60 and p32 then
		var60.Position = UDim2.new(var60.Position.X.Scale, var60.Position.X.Offset, var60.Position.Y.Scale, var60.Position.Y.Offset + p32)
	end
	local var61
	local _ = nil
	local _ = nil
	
	if p33 then
		local var62 = create("Frame")({
			BackgroundTransparency = 1,
			Name = p28 .. "RowLabelAndDescriptionFrame",
			Position = UDim2.new(0, 10, 0, 0),
			Size = UDim2.new(0.4, -20, 0, 50),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = var60
		})
		var61 = create("TextLabel")({
			BackgroundTransparency = 1,
			TextWrapped = true,
			ZIndex = 2,
			LayoutOrder = 1,
			Name = p28 .. "Label",
			Text = p28,
			Font = themeModule.font(Enum.Font.SourceSansBold, "UtilityRow"),
			TextSize = themeModule.textSize(16, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = var62
		})
		create("TextLabel")({
			TextTransparency = 0.25,
			TextWrapped = true,
			BackgroundTransparency = 1,
			ZIndex = 2,
			LayoutOrder = 2,
			Name = p28 .. "Description",
			Text = p33,
			Font = themeModule.font(Enum.Font.SourceSans, "UtilityRow"),
			TextSize = themeModule.textSize(18, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = var62
		})
		create("UIListLayout")({
			Name = p28 .. "UIListLayout",
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
			Parent = var62
		})
		create("UIPadding")({
			Name = p28 .. "UIListLayout",
			PaddingBottom = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			Parent = var62
		})
	else
		var61 = create("TextLabel")({
			TextWrapped = true,
			BackgroundTransparency = 1,
			ZIndex = 2,
			Name = p28 .. "Label",
			Text = p28,
			Font = themeModule.font(Enum.Font.SourceSansBold, "UtilityRow"),
			TextSize = themeModule.textSize(16, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0.4, -20, 1, 0),
			Position = UDim2.new(0, 10, 0, 0),
			Parent = var60
		})
		create("UIPadding")({
			Name = p28 .. "UIPadding",
			PaddingBottom = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			Parent = var61
		})
	end
	if not isNotTextBox then
		var61.Text = ""
	end
	local function onResized(_, p37)
		-- upvalues: var61 (write), themeModule (copy), var2 (copy)
		if p37 then
			var61.TextSize = themeModule.textSize(16, "UtilityRow")
			
			return
		end
		var61.TextSize = var2 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	
	local _ = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var63 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	if var63.X < var63.Y then
		var61.TextSize = themeModule.textSize(16, "UtilityRow")
	else
		var61.TextSize = var2 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	t[var60] = onResized
	local _ = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var64 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	
	if var64.X < var64.Y then
		var61.TextSize = themeModule.textSize(16, "UtilityRow")
	else
		var61.TextSize = var2 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	local var65 = nil
	local t_1 = nil
	
	if p29 == "Slider" then
		t_1 = CreateNewSlider(p30, p31, nil, p34, p35)
		t_1.SliderFrame.Parent = var60
		var65 = t_1.SliderFrame
	elseif p29 == "Selector" then
		t_1 = CreateSelector(p30, p31)
		t_1.SelectorFrame.Parent = var60
		var65 = t_1.SelectorFrame
	elseif p29 == "DropDown" then
		t_1 = CreateDropDown(p30, p31, p27.HubRef)
		t_1.DropDownFrame.Parent = var60
		var65 = t_1.DropDownFrame
	elseif p29 == "TextBox" then
		t_1 = { HubRef = nil }
		local var66 = create("TextBox")({
			BorderSizePixel = 0,
			TextWrapped = true,
			ZIndex = 2,
			ClearTextOnFocus = false,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0.6, 0, 1, 0),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = p28,
			TextColor3 = Color3.fromRGB(49, 49, 49),
			BackgroundTransparency = themeModule.transparency("ControlInputBackground", 0.5),
			TextYAlignment = Enum.TextYAlignment.Top,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = themeModule.font(Enum.Font.SourceSans, "UtilityText"),
			TextSize = themeModule.textSize(24, "UtilityText"),
			SelectionImageObject = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 }),
			Interactable = p36,
			Parent = var60
		})
		var65 = var66
		var66.Focused:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var66 (ref), p28 (ref)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = var66
			end
			if var66.Text == p28 then
				var66.Text = ""
			end
		end)
		
		if p32 then
			var66.Position = UDim2.new(var66.Position.X.Scale, var66.Position.X.Offset, var66.Position.Y.Scale, var66.Position.Y.Offset + p32)
		end
		var65.SelectionGained:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var66 (ref), themeModule (copy), t_1 (write), var65 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var66.BackgroundTransparency = themeModule.transparency("ControlInputBackground", 0.1)
				
				if t_1.HubRef then
					t_1.HubRef:ScrollToFrame(var65)
				end
			end
		end)
		var65.SelectionLost:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var66 (ref), themeModule (copy)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var66.BackgroundTransparency = themeModule.transparency("ControlInputBackground", 0.5)
			end
		end)
		
		local function processInput(p37)
			-- upvalues: guiService (copy), var65 (write), var66 (ref)
			if p37.UserInputState == Enum.UserInputState.Begin and p37.KeyCode == Enum.KeyCode.Return and guiService.SelectedCoreObject == var65 then
				var66:CaptureFocus()
			end
		end
		
		var66.MouseEnter:Connect(function()
			-- upvalues: coreGuiService (copy), var65 (write), VRService (copy), userInputService (copy), p27 (ref), guiService (copy)
			local dropDownFullscreenFrame = coreGuiService.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if dropDownFullscreenFrame and dropDownFullscreenFrame.Visible then return end
			if var65 and var65.Visible and var65.ZIndex > 1 then
				if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and p27.Active then
					guiService.SelectedCoreObject = var65
				end
			end
		end)
		userInputService.InputBegan:Connect(processInput)
	elseif p29 == "TextEntry" then
		t_1 = { HubRef = nil }
		local var67 = create("TextBox")({
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextWrapped = false,
			ZIndex = 2,
			ClearTextOnFocus = false,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0.4, -10, 0, 40),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = p28,
			TextColor3 = Color3.fromRGB(178, 178, 178),
			TextYAlignment = Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = themeModule.font(Enum.Font.SourceSans, "UtilityText"),
			TextSize = themeModule.textSize(24, "UtilityText"),
			SelectionImageObject = create("ImageLabel")({ Image = "", BackgroundTransparency = 1 }),
			Parent = var60
		})
		var65 = var67
		var67.Focused:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), guiService (copy), var67 (ref), p28 (ref)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				guiService.SelectedCoreObject = var67
			end
			if var67.Text == p28 then
				var67.Text = ""
			end
		end)
		
		if p32 then
			var67.Position = UDim2.new(var67.Position.X.Scale, var67.Position.X.Offset, var67.Position.Y.Scale, var67.Position.Y.Offset + p32)
		end
		var65.SelectionGained:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var67 (ref), t_1 (write), var65 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var67.BackgroundTransparency = 0.8
				
				if t_1.HubRef then
					t_1.HubRef:ScrollToFrame(var65)
				end
			end
		end)
		var65.SelectionLost:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var67 (ref)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var67.BackgroundTransparency = 1
			end
		end)
		
		local function processInput(p37)
			-- upvalues: guiService (copy), var65 (write), var67 (ref)
			if p37.UserInputState == Enum.UserInputState.Begin and p37.KeyCode == Enum.KeyCode.Return and guiService.SelectedCoreObject == var65 then
				var67:CaptureFocus()
			end
		end
		
		var60.MouseEnter:Connect(function()
			-- upvalues: coreGuiService (copy), var65 (write), VRService (copy), userInputService (copy), p27 (ref), guiService (copy)
			local dropDownFullscreenFrame = coreGuiService.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if dropDownFullscreenFrame and dropDownFullscreenFrame.Visible then return end
			if var65 and var65.Visible and var65.ZIndex > 1 then
				if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and p27.Active then
					guiService.SelectedCoreObject = var65
				end
			end
		end)
		
		function t_1.SetZIndex(_, p37)
			-- upvalues: var67 (ref)
			var67.ZIndex = p37
		end
		
		function t_1.SetInteractable(_, p37)
			-- upvalues: var67 (ref)
			var67.Selectable = p37
			
			if p37 then
				var67.TextColor3 = Color3.fromRGB(178, 178, 178)
				var67.ZIndex = 2
				
				return
			end
			var67.TextColor3 = Color3.fromRGB(49, 49, 49)
			var67.ZIndex = 1
		end
		
		function t_1.SetValue(_, p37)
			-- upvalues: var67 (ref)
			var67.Text = p37
		end
		
		local valueChanged = Instance.new("BindableEvent")
		valueChanged.Name = "ValueChanged"
		var67.FocusLost:Connect(function()
			-- upvalues: valueChanged (ref), var67 (ref)
			valueChanged:Fire(var67.Text)
		end)
		t_1.ValueChanged = valueChanged.Event
		userInputService.InputBegan:Connect(processInput)
	end
	t_1.Name = p28 .. "ValueChanger"
	local setAutoLocalize = t_1.SetAutoLocalize
	
	function t_1.SetAutoLocalize(p37, p38)
		-- upvalues: var60 (write), setAutoLocalize (ref)
		var60.AutoLocalize = p38
		
		if setAutoLocalize then
			setAutoLocalize(p37, p38)
		end
	end
	
	var59 += var58
	
	if p32 then
		var59 += p32
	end
	t_2[p27] = var59
	
	if isNotTextBox then
		var60.MouseEnter:Connect(function()
			-- upvalues: coreGuiService (copy), t_1 (write), VRService (copy), userInputService (copy), p27 (ref), guiService (copy)
			local dropDownFullscreenFrame = coreGuiService.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			
			if dropDownFullscreenFrame and dropDownFullscreenFrame.Visible then return end
			local sliderFrame = t_1.SliderFrame or t_1.SliderFrame or t_1.DropDownFrame or t_1.SelectorFrame
			
			if sliderFrame and sliderFrame.Visible and sliderFrame.ZIndex > 1 then
				if (if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true) and p27.Active then
					guiService.SelectedCoreObject = sliderFrame
				end
			end
		end)
		VRService.Changed:Connect(function(p37)
			-- upvalues: VRService (copy), var60 (write), var65 (write), guiService (copy), themeModule (copy)
			if p37 == "VREnabled" then
				if VRService.VREnabled then
					var60.Selectable = true
					var60.Active = true
					var65.Active = true
					guiService.Changed:Connect(function(p38)
						-- upvalues: guiService (copy), var60 (copy), themeModule (copy)
						if p38 == "SelectedCoreObject" then
							local selectedCoreObject = guiService.SelectedCoreObject
							
							if selectedCoreObject and (selectedCoreObject == var60 or selectedCoreObject:IsDescendantOf(var60)) then
								var60.ImageTransparency = themeModule.transparency("RowFrameBackground", 0.5)
								var60.BackgroundTransparency = 1
								
								return
							end
							var60.ImageTransparency = 1
							var60.BackgroundTransparency = 1
						end
					end)
					
					return
				end
				var60.Selectable = false
				var60.Active = false
			end
		end)
		
		if VRService.VREnabled then
			var60.Selectable = true
			var60.Active = true
			var65.Active = true
			guiService.Changed:Connect(function(p37)
				-- upvalues: guiService (copy), var60 (write), themeModule (copy)
				if p37 == "SelectedCoreObject" then
					local selectedCoreObject = guiService.SelectedCoreObject
					
					if selectedCoreObject and (selectedCoreObject == var60 or selectedCoreObject:IsDescendantOf(var60)) then
						var60.ImageTransparency = themeModule.transparency("RowFrameBackground", 0.5)
						var60.BackgroundTransparency = 1
						
						return
					end
					var60.ImageTransparency = 1
					var60.BackgroundTransparency = 1
				end
			end)
		else
			var60.Selectable = false
			var60.Active = false
		end
		var65.SelectionGained:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var60 (write), themeModule (copy), t_1 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				if VRService.VREnabled then
					var60.ImageTransparency = 0.5
					var60.BackgroundTransparency = 1
				else
					var60.ImageTransparency = 1
					var60.BackgroundTransparency = themeModule.transparency("RowFrameBackground", 0.5)
				end
				if t_1.HubRef then
					t_1.HubRef:ScrollToFrame(var60)
				end
			end
		end)
		var65.SelectionLost:Connect(function()
			-- upvalues: VRService (copy), userInputService (copy), var60 (write)
			if if VRService.VREnabled then false elseif userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled then false else true then
				var60.ImageTransparency = 1
				var60.BackgroundTransparency = 1
			end
		end)
	end
	p27:AddRow(var60, var61, t_1, p32, false)
	t_1.Selection = var65
	
	return var60, var61, t_1
end

local function AddNewRowObject(p27, p28, p29, p30, p31)
	-- upvalues: t_2 (ref), create (ref), var58 (write), var5 (ref), themeModule (ref), var2 (ref), t (ref), guiService (ref), VRService (ref)
	local var59 = if t_2[p27] then t_2[p27] else 0
	local var60 = create("ImageButton")({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ImageTransparency = 1,
		Active = false,
		AutoButtonColor = false,
		ZIndex = 2,
		Selectable = false,
		Name = p28 .. "Frame",
		AutomaticSize = Enum.AutomaticSize.Y,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10),
		Size = UDim2.new(1, 0, 0, var58),
		Position = UDim2.new(0, 0, 0, var59),
		SelectionImageObject = var5,
		Parent = p27.Page
	})
	var60.BackgroundColor3 = themeModule.color("RowFrameBackground")
	var60.ImageColor3 = var60.BackgroundColor3
	var60.SelectionGained:Connect(function()
		-- upvalues: var60 (ref), themeModule (copy)
		var60.BackgroundTransparency = themeModule.transparency("RowFrameBackground", 0.5)
	end)
	var60.SelectionLost:Connect(function()
		-- upvalues: var60 (ref)
		var60.BackgroundTransparency = 1
	end)
	create("UICorner")({
		CornerRadius = themeModule.DefaultCornerRadius,
		Parent = var60
	})
	local var61 = create("TextLabel")({
		TextWrapped = true,
		BackgroundTransparency = 1,
		ZIndex = 2,
		Name = p28 .. "Label",
		Text = p28,
		Font = themeModule.font(Enum.Font.SourceSansBold, "UtilityRow"),
		TextSize = themeModule.textSize(16, "UtilityRow"),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(0.4, -20, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		Parent = var60
	})
	create("UIPadding")({
		Name = p28 .. "UIPadding",
		PaddingBottom = UDim.new(0, 10),
		PaddingTop = UDim.new(0, 10),
		Parent = var61
	})
	
	local function onResized(_, p32)
		-- upvalues: p31 (ref), var61 (ref), themeModule (copy), var2 (copy)
		if p31 then
			UDim2.new(0, 200, 1, 0)
		end
		if p32 then
			var61.TextSize = themeModule.textSize(16, "UtilityRow")
			
			return
		end
		var61.TextSize = var2 and themeModule.textSize(36) or themeModule.textSize(24, "UtilityText")
	end
	
	t[var60] = onResized
	local var62 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	onResized(if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport(), var62.X < var62.Y)
	
	if p30 then
		var60.Position = UDim2.new(var60.Position.X.Scale, var60.Position.X.Offset, var60.Position.Y.Scale, var60.Position.Y.Offset + p30)
	end
	var59 += var58
	
	if p30 then
		var59 += p30
	end
	t_2[p27] = var59
	var60.MouseEnter:Connect(function()
		-- upvalues: var60 (ref), guiService (copy)
		if var60.Visible then
			guiService.SelectedCoreObject = var60
		end
	end)
	p29.SelectionImageObject = var5
	p29.SelectionGained:Connect(function()
		-- upvalues: VRService (copy), var60 (ref), themeModule (copy)
		if VRService.VREnabled then
			var60.ImageTransparency = themeModule.transparency("RowFrameBackground", 0.5)
			var60.BackgroundTransparency = 1
			
			return
		end
		var60.ImageTransparency = 1
		var60.BackgroundTransparency = themeModule.transparency("RowFrameBackground", 0.5)
	end)
	p29.SelectionLost:Connect(function()
		-- upvalues: var60 (ref)
		var60.ImageTransparency = 1
		var60.BackgroundTransparency = 1
	end)
	p29.Parent = var60
	p27:AddRow(var60, var61, p29, p30, true)
	
	return var60
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
	CreateNewSlider = function(_, p27, p28, p29, p30, p31)
		-- upvalues: CreateNewSlider (ref)
		return CreateNewSlider(p27, p28, p29, p30, p31)
	end,
	CreateNewSelector = function(_, p27, p28)
		-- upvalues: CreateSelector (ref)
		return CreateSelector(p27, p28)
	end,
	CreateNewDropDown = function(_, p27, p28)
		-- upvalues: CreateDropDown (ref)
		return CreateDropDown(p27, p28, nil)
	end,
	AddNewRow = function(_, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36)
		-- upvalues: AddNewRow (ref)
		return AddNewRow(p27, p28, p29, p30, p31, p32, p33, p34, p35, p36)
	end,
	AddNewRowObject = function(_, p27, p28, p29, p30, p31)
		-- upvalues: AddNewRowObject (ref)
		return AddNewRowObject(p27, p28, p29, p30, p31)
	end,
	ShowAlert = function(_, p27, p28, p29, p30, p31)
		-- upvalues: ShowAlert (ref)
		ShowAlert(p27, p28, p29, p30, p31)
	end,
	IsSmallTouchScreen = function(_)
		-- upvalues: guiService (ref), userInputService (ref)
		local var59 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
		
		return userInputService.TouchEnabled and (if var59.Y >= 500 then var59.X < 700 else true)
	end,
	IsPortrait = function(_)
		-- upvalues: guiService (ref)
		local var59 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
		
		return var59.X < var59.Y
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
function t_3.MakeStyledButton(_, p27, p28, p29, p30, p31, p32)
	-- upvalues: MakeButton (ref)
	return MakeButton(p27, p28, p29, p30, p31, p32)
end

function t_3.MakeStyledImageButton(_, p27, p28, p29, p30, p31, p32, p33, p34)
	-- upvalues: MakeImageButton (ref)
	return MakeImageButton(p27, p28, p29, p30, p31, p32, p33, p34)
end

function t_3.AddButtonRow(_, p27, p28, p29, p30, p31, p32)
	-- upvalues: AddButtonRow (ref)
	return AddButtonRow(p27, p28, p29, p30, p31, p32)
end

function t_3.MakeFocusState(_, p27, p28)
	-- upvalues: MakeRoundedRectFocusState (ref)
	return MakeRoundedRectFocusState(p27, p28)
end

function t_3.CreateSignal(_)
	-- upvalues: CreateSignal (ref)
	return CreateSignal()
end

function t_3.UsesSelectedObject(_)
	-- upvalues: VRService (ref), userInputService (ref)
	return if VRService.VREnabled then false else userInputService.PreferredInput == Enum.PreferredInput.Touch and not userInputService.GamepadEnabled
end

function t_3.TweenProperty(_, p27, p28, p29, p30, p31, p32, p33)
	return PropertyTweener(p27, p28, p29, p30, p31, p32, p33)
end

function t_3.OnResized(_, p27, p28)
	-- upvalues: addOnResizedCallback (ref)
	return addOnResizedCallback(p27, p28)
end

function t_3.FireOnResized(_)
	-- upvalues: guiService (ref), t_3 (ref), t (ref)
	local var59 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else guiService:GetHardwareSafeViewport()
	local var60 = t_3:IsPortrait()
	
	for i, v in pairs(t) do
		v(var59, var60)
	end
end

function t_3.Lerp(_, endValue, alpha, p27)
	return (1 - endValue) * alpha + endValue * p27
end

function t_3.Round(_, p27)
	return p27 % 1 >= 0.5 and math.ceil(p27) or math.floor(p27)
end

function t_3.IsExperienceOlderThanOneWeek(_, p27)
	-- upvalues: workspaceService (ref)
	return p27 == nil or p27.Created == nil or workspaceService:GetServerTimeNow() * 1000 - DateTime.fromIsoDate(p27.Created).UnixTimestampMillis <= 604800000
end

return t_3