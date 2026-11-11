local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local ModalWindow = require(Parent.UIBlox).App.Dialog.Modal.ModalWindow
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local WrapForReactPortalModule = require(script.Parent.Parent.Wrappers.wrapForReactPortal)
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local UseAXPartialPageModalFocusHandlerModule = require(script.Parent.useAXPartialPageModalFocusHandler)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local AXPartialPageModalDockedPadding = game:DefineFastFlag("AXPartialPageModalDockedPadding", false)
local FFlagAXFixAvatarScreenVR = AvatarExperienceFlagsModule.FFlagAXFixAvatarScreenVR
local FFlagAXPartialPageModalBackgroundShim = AvatarExperienceFlagsModule.FFlagAXPartialPageModalBackgroundShim
local AXCatalogPartialPageModalBottomInsetMultiplier = game:DefineFastInt("AXCatalogPartialPageModalBottomInsetMultiplier", 25)

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

local function v16(p1)
	return p1.ScreenSize
end

local function v17(p1)
	return p1.GlobalGuiInset and p1.GlobalGuiInset.bottom or 0
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseSelectorFunction (copy), v16 (copy), ReactModule (copy), FFlagAXFixAvatarScreenVR (copy), v17 (copy), UseIsSpatialFunction (copy), UseAXPartialPageModalFocusHandlerModule (copy), AXPartialPageModalDockedPadding (copy), AXCatalogPartialPageModalBottomInsetMultiplier (copy), selectDeviceOrientation (copy), ResponsiveModule (copy), View (copy), Button (copy), FillBehavior (copy), FFlagAXPartialPageModalBackgroundShim (copy), ModalWindow (copy), WrapForReactPortalModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(v16)
	local Medium = UseTokensResult.Margin.Medium
	local _UDim = UDim.new(0, UseTokensResult.Margin.Medium)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = if FFlagAXFixAvatarScreenVR then ReactModule.useRef(nil) else nil
	local v1 = nil
	local Callback = nil
	
	if FFlagAXFixAvatarScreenVR then
		v1, Callback = ReactModule.useState(Vector2.new(360, 700))
	end
	local UseSelectorResult1 = UseSelectorFunction(v17)
	local UseIsSpatialResult = if FFlagAXFixAvatarScreenVR then UseIsSpatialFunction() else nil
	local UseAXPartialPageModalFocusHandlerModuleResult = UseAXPartialPageModalFocusHandlerModule(UseRefResult)
	
	if FFlagAXFixAvatarScreenVR then
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseIsSpatialResult (copy), UseRefResult1 (copy), Callback (ref)
			if not UseIsSpatialResult then return end
			local Current = UseRefResult1.current
			
			if Current == nil then return end
			local SurfaceGui = Current:FindFirstAncestorOfClass("SurfaceGui")
			
			if SurfaceGui == nil then return end
			local function syncSize()
				-- upvalues: Callback (upval), SurfaceGui (copy)
				Callback(SurfaceGui.AbsoluteSize)
			end
			
			Callback(SurfaceGui.AbsoluteSize)
			local Connection = SurfaceGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(syncSize)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, {
			UseIsSpatialResult,
			UseAXPartialPageModalFocusHandlerModuleResult,
			Callback
		})
	end
	local UseSelectorResult2 = if FFlagAXFixAvatarScreenVR and UseIsSpatialResult then v1 else UseSelectorResult
	
	if AXPartialPageModalDockedPadding then
		if UseSelectorResult2.X < 540 then
			_UDim = UDim.new(0, UseTokensResult.Margin.Large + UseSelectorResult1 * AXCatalogPartialPageModalBottomInsetMultiplier / 100)
		end
	elseif UseSelectorFunction(selectDeviceOrientation) == ResponsiveModule.Keys.Portrait then
		_UDim = UDim.new(0, UseTokensResult.Margin.Large + UseSelectorResult1 * AXCatalogPartialPageModalBottomInsetMultiplier / 100)
	end
	local Position = if p1.position then p1.position else nil
	
	local function v30()
		-- upvalues: p1 (copy), ReactModule (upval), View (upval), Button (upval), FillBehavior (upval)
		local Elements = {}
		
		if p1.buttonStackProps == nil then
			return {}
		end
		local Buttons = p1.buttonStackProps.buttons
		
		for i, _ in ipairs(Buttons) do
			local Props = Buttons[i].props
			Elements[i] = ReactModule.createElement(View, {
				tag = "row gap-small wrap auto-y size-full-0 fill-x",
				key = Props.text or i
			}, ReactModule.createElement(Button, {
				text = Props.text,
				variant = Props.variant,
				onActivated = Props.onActivated,
				LayoutOrder = Props.layoutOrder or i,
				fillBehavior = FillBehavior.Fill,
				size = Props.size
			}))
		end
		return Elements
	end
	
	local function v31()
		-- upvalues: p1 (copy), ReactModule (upval), Button (upval), FillBehavior (upval)
		local Elements = {}
		
		if p1.buttonStackProps == nil then
			return {}
		end
		local Buttons = p1.buttonStackProps.buttons
		
		for i, _ in ipairs(Buttons) do
			local Props = Buttons[i].props
			Elements[i] = ReactModule.createElement(Button, {
				text = Props.text,
				key = Props.text or i,
				variant = Props.variant,
				width = UDim.new(1, 0),
				onActivated = Props.onActivated,
				LayoutOrder = Props.layoutOrder or i,
				fillBehavior = FillBehavior.Fill,
				size = Props.size
			})
		end
		return Elements
	end
	
	local NoVisible = p1.visible == nil or p1.visible
	local Frame = nil
	
	if FFlagAXPartialPageModalBackgroundShim then
		local Element = ReactModule.createElement(ModalWindow, {
			isFullHeight = false,
			screenSize = UseSelectorResult2,
			position = Position,
			anchorPoint = p1.anchorPoint
		}, {
			ContentContainer = ReactModule.createElement(View, {
				tag = "auto-y col size-full-0 align-x-left padding-x-xxlarge padding-top-xxlarge radius-medium",
				Position = UDim2.new(0, 0, 0, Medium),
				backgroundStyle = UseTokensResult.Color.Surface.Surface_100,
				padding = { bottom = _UDim },
				ref = if UseAXPartialPageModalFocusHandlerModuleResult == nil then UseRefResult else nil,
				selectionGroup = if UseAXPartialPageModalFocusHandlerModuleResult == nil then {
					SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
					SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
					SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
					SelectionBehaviorRight = Enum.SelectionBehavior.Stop
				} else nil
			}, {
				Content = ReactModule.createElement(View, { tag = "auto-y size-full-0" }, p1.children),
				Buttons = p1.buttonStackProps and ReactModule.createElement(View, {
					tag = {
						["col gap-medium auto-y size-full-0 fill-x"] = not p1.buttonStackProps.rowLayout,
						["row gap-small auto-y size-full-0 fill-x"] = p1.buttonStackProps.rowLayout
					}
				}, if p1.buttonStackProps.rowLayout then v31() else v30())
			})
		})
		Frame = if p1.hasBackgroundShim == true then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 5,
			Size = UDim2.fromScale(1, 1),
			Visible = NoVisible,
			ref = if FFlagAXFixAvatarScreenVR then UseRefResult1 else nil
		}, {
			Scrim = ReactModule.createElement("TextButton", {
				Text = "",
				AutoButtonColor = false,
				Selectable = false,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 0.45,
				BorderSizePixel = 0,
				ZIndex = 1,
				[ReactModule.Event.Activated] = p1.onBackgroundPress
			}),
			SheetLayer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, { PartialPageModal = Element })
		}) else ReactModule.createElement("TextButton", {
			Text = "",
			AutoButtonColor = false,
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[ReactModule.Event.Activated] = p1.onBackgroundPress,
			ZIndex = 5,
			Visible = NoVisible,
			ref = if FFlagAXFixAvatarScreenVR then UseRefResult1 else nil
		}, { PartialPageModal = Element })
	else
		Frame = ReactModule.createElement("TextButton", {
			Text = "",
			AutoButtonColor = false,
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[ReactModule.Event.Activated] = p1.onBackgroundPress,
			ZIndex = 5,
			Visible = NoVisible,
			ref = if FFlagAXFixAvatarScreenVR then UseRefResult1 else nil
		}, {
			PartialPageModal = ReactModule.createElement(ModalWindow, {
				isFullHeight = false,
				screenSize = UseSelectorResult2,
				position = Position,
				anchorPoint = p1.anchorPoint
			}, {
				ContentContainer = ReactModule.createElement(View, {
					tag = "auto-y col size-full-0 align-x-left padding-x-xxlarge padding-top-xxlarge radius-medium",
					Position = UDim2.new(0, 0, 0, Medium),
					backgroundStyle = UseTokensResult.Color.Surface.Surface_100,
					padding = { bottom = _UDim },
					ref = if UseAXPartialPageModalFocusHandlerModuleResult == nil then UseRefResult else nil,
					selectionGroup = if UseAXPartialPageModalFocusHandlerModuleResult == nil then {
						SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
						SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
						SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
						SelectionBehaviorRight = Enum.SelectionBehavior.Stop
					} else nil
				}, {
					Content = ReactModule.createElement(View, { tag = "auto-y size-full-0" }, p1.children),
					Buttons = p1.buttonStackProps and ReactModule.createElement(View, {
						tag = {
							["col gap-medium auto-y size-full-0 fill-x"] = not p1.buttonStackProps.rowLayout,
							["row gap-small auto-y size-full-0 fill-x"] = p1.buttonStackProps.rowLayout
						}
					}, if p1.buttonStackProps.rowLayout then v31() else v30())
				})
			})
		})
	end
	return if UseAXPartialPageModalFocusHandlerModuleResult == nil then Frame else WrapForReactPortalModule(Frame, UseAXPartialPageModalFocusHandlerModuleResult, UseRefResult)
end