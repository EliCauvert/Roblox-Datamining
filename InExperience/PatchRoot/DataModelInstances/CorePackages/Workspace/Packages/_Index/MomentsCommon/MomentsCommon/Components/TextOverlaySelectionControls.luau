local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local BuilderIconsModule = if require(MomentsCommon.Flags.FFlagMomentsTextOverlayV2Redesign) then require(Parent.BuilderIcons) else nil
local UseTextOverlayPreviewGesturesModule = require(MomentsCommon.Hooks.useTextOverlayPreviewGestures)
local _Color3 = Color3.fromHex("FFFFFF")
local _Color3_1 = Color3.fromHex("121215")
local Style = { Transparency = 0, Color3 = Color3.fromHex("FFFFFF") }
local _UDim = UDim.new(1, 0)

local function createBorderCornerHandle(p1, OnResizeHandleInputBegan, IsPointerMatch) --[[ Line: 44 ]]
	-- upvalues: ReactModule (copy), _Color3 (copy), _UDim (copy)
	local IsTL: boolean = p1 == "TL" or p1 == "BL"
	local IsTL1: boolean = p1 == "TL" or p1 == "TR"
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 10,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.fromOffset(24, 24)
	}, {
		Horizontal = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 10,
			AnchorPoint = Vector2.new(if IsTL then 0 else 1, 0.5),
			BackgroundColor3 = _Color3,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(14, 3)
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = _UDim })
		}),
		Vertical = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 10,
			AnchorPoint = Vector2.new(0.5, if IsTL1 then 0 else 1),
			BackgroundColor3 = _Color3,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(3, 14)
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = _UDim })
		}),
		HitArea = if IsPointerMatch then ReactModule.createElement("ImageButton", {
			Active = true,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 11,
			[ReactModule.Event.MouseButton1Down] = OnResizeHandleInputBegan
		}) else nil
	})
end

local function createZeroSizeCornerChrome(p1, Handle, Visible) --[[ Line: 99 ]]
	-- upvalues: ReactModule (copy)
	local _Vector2 = nil
	local _UDim2 = nil
	if p1 == "TL" then
		_Vector2 = Vector2.new(0, 0)
		_UDim2 = UDim2.fromScale(0, 0)
	elseif p1 == "TR" then
		_Vector2 = Vector2.new(1, 0)
		_UDim2 = UDim2.fromScale(1, 0)
	elseif p1 == "BL" then
		_Vector2 = Vector2.new(0, 1)
		_UDim2 = UDim2.fromScale(0, 1)
	else
		_Vector2 = Vector2.new(1, 1)
		_UDim2 = UDim2.fromScale(1, 1)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 10,
		AnchorPoint = _Vector2,
		Position = _UDim2,
		Size = UDim2.fromOffset(0, 0),
		Visible = Visible
	}, { Handle = Handle })
end

return function(p1) --[[ Line: 144 | Named "TextOverlaySelectionControls" ]]
	-- upvalues: ResponsiveModule (copy), UseTextOverlayPreviewGesturesModule (copy), createZeroSizeCornerChrome (copy), createBorderCornerHandle (copy), ReactModule (copy), View (copy), _Color3_1 (copy), FoundationModule (copy), Icon (copy), BuilderIconsModule (copy), Style (copy)
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local UseTextOverlayPreviewGesturesModuleResult = UseTextOverlayPreviewGesturesModule({
		enabled = true,
		selected = true,
		preferredInput = UsePreferredInputResult,
		containerRef = p1.containerRef,
		scale = p1.scale,
		rotation = p1.rotation,
		onScaleChanged = p1.onScaleChanged,
		onRotationChanged = p1.onRotationChanged
	})
	local IsUsePreferredInputResultMatch = UsePreferredInputResult == ResponsiveModule.Input.Pointer
	local config = {
		HandleTL = createZeroSizeCornerChrome("TL", createBorderCornerHandle("TL", UseTextOverlayPreviewGesturesModuleResult.onResizeHandleInputBegan, IsUsePreferredInputResultMatch), p1.visible),
		HandleTR = createZeroSizeCornerChrome("TR", createBorderCornerHandle("TR", UseTextOverlayPreviewGesturesModuleResult.onResizeHandleInputBegan, IsUsePreferredInputResultMatch), p1.visible),
		HandleBL = createZeroSizeCornerChrome("BL", createBorderCornerHandle("BL", UseTextOverlayPreviewGesturesModuleResult.onResizeHandleInputBegan, IsUsePreferredInputResultMatch), p1.visible),
		HandleBR = createZeroSizeCornerChrome("BR", createBorderCornerHandle("BR", UseTextOverlayPreviewGesturesModuleResult.onResizeHandleInputBegan, IsUsePreferredInputResultMatch), p1.visible)
	}
	
	if IsUsePreferredInputResultMatch and p1.onRotationChanged ~= nil then
		config.RotateChrome = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -p1.borderGap, 0, p1.borderGap),
			Size = UDim2.fromOffset(0, 0),
			Visible = p1.visible
		}, {
			RotateHandle = ReactModule.createElement(View, {
				tag = "radius-circle",
				ZIndex = 10,
				AnchorPoint = Vector2.new(0.5, 0.5),
				backgroundStyle = { Transparency = 0, Color3 = _Color3_1 },
				Position = UDim2.fromOffset(0, -28),
				Size = UDim2.fromOffset(32, 32),
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				}
			}, {
				Glyph = ReactModule.createElement(Icon, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = BuilderIconsModule.Icon.ArrowSpinClockwise,
					size = FoundationModule.Enums.IconSize.Small,
					style = Style
				}),
				HitArea = ReactModule.createElement("ImageButton", {
					Active = true,
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 11,
					[ReactModule.Event.MouseButton1Down] = UseTextOverlayPreviewGesturesModuleResult.onRotateHandleInputBegan
				})
			})
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, config)
end