local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local fFlagMomentsTextOverlayPreviewTransformModule = require(momentsCommon.Flags.FFlagMomentsTextOverlayPreviewTransform)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local view = foundationModule.View
local icon = foundationModule.Icon
local var1 = if fFlagMomentsTextOverlayPreviewTransformModule then require(parent.BuilderIcons) else nil
local useTextOverlayPreviewGesturesModule = require(momentsCommon.Hooks.useTextOverlayPreviewGestures)
local hexColor = Color3.fromHex("FFFFFF")
local hexColor_1 = Color3.fromHex("121215")
local t = { Transparency = 0, Color3 = Color3.fromHex("FFFFFF") }
local uDim = UDim.new(1, 0)

local function createBorderCornerHandle(p1, p2, p3)
	-- upvalues: reactModule (ref), hexColor (ref), uDim (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 10,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.fromOffset(24, 24)
	}, {
		Horizontal = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 10,
			AnchorPoint = Vector2.new(if if p1 ~= "TL" then p1 == "BL" else true then 0 else 1, 0.5),
			BackgroundColor3 = hexColor,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(14, 3)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = uDim })
		}),
		Vertical = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 10,
			AnchorPoint = Vector2.new(0.5, if if p1 ~= "TL" then p1 == "TR" else true then 0 else 1),
			BackgroundColor3 = hexColor,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(3, 14)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = uDim })
		}),
		HitArea = if p3 then reactModule.createElement("ImageButton", {
			Active = true,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 11,
			[reactModule.Event.MouseButton1Down] = p2
		}) else nil
	})
end

local function createZeroSizeCornerChrome(p1, p2, p3)
	-- upvalues: reactModule (ref)
	local vector2, uDim2
	local _ = nil
	local _ = nil
	
	if p1 == "TL" then
		vector2 = Vector2.new(0, 0)
		uDim2 = UDim2.fromScale(0, 0)
	elseif p1 == "TR" then
		vector2 = Vector2.new(1, 0)
		uDim2 = UDim2.fromScale(1, 0)
	elseif p1 == "BL" then
		vector2 = Vector2.new(0, 1)
		uDim2 = UDim2.fromScale(0, 1)
	else
		vector2 = Vector2.new(1, 1)
		uDim2 = UDim2.fromScale(1, 1)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 10,
		AnchorPoint = vector2,
		Position = uDim2,
		Size = UDim2.fromOffset(0, 0),
		Visible = p3
	}, { Handle = p2 })
end

return function(p1)
	-- upvalues: responsiveModule (ref), useTextOverlayPreviewGesturesModule (ref), createZeroSizeCornerChrome (ref), createBorderCornerHandle (ref), reactModule (ref), view (ref), hexColor_1 (ref), foundationModule (ref), icon (ref), var1 (ref), t (ref)
	local var2 = responsiveModule.usePreferredInput()
	local var3 = useTextOverlayPreviewGesturesModule({
		enabled = true,
		selected = true,
		preferredInput = var2,
		containerRef = p1.containerRef,
		scale = p1.scale,
		rotation = p1.rotation,
		onScaleChanged = p1.onScaleChanged,
		onRotationChanged = p1.onRotationChanged
	})
	local var4 = var2 == responsiveModule.Input.Pointer
	local t_1 = {
		HandleTL = createZeroSizeCornerChrome("TL", createBorderCornerHandle("TL", var3.onResizeHandleInputBegan, var4), p1.visible),
		HandleTR = createZeroSizeCornerChrome("TR", createBorderCornerHandle("TR", var3.onResizeHandleInputBegan, var4), p1.visible),
		HandleBL = createZeroSizeCornerChrome("BL", createBorderCornerHandle("BL", var3.onResizeHandleInputBegan, var4), p1.visible),
		HandleBR = createZeroSizeCornerChrome("BR", createBorderCornerHandle("BR", var3.onResizeHandleInputBegan, var4), p1.visible)
	}
	
	if var4 and p1.onRotationChanged ~= nil then
		t_1.RotateChrome = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -p1.borderGap, 0, p1.borderGap),
			Size = UDim2.fromOffset(0, 0),
			Visible = p1.visible
		}, {
			RotateHandle = reactModule.createElement(view, {
				tag = "radius-circle",
				ZIndex = 10,
				AnchorPoint = Vector2.new(0.5, 0.5),
				backgroundStyle = { Transparency = 0, Color3 = hexColor_1 },
				Position = UDim2.fromOffset(0, -28),
				Size = UDim2.fromOffset(32, 32),
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				}
			}, {
				Glyph = reactModule.createElement(icon, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = var1.Icon.ArrowSpinClockwise,
					size = foundationModule.Enums.IconSize.Small,
					style = t
				}),
				HitArea = reactModule.createElement("ImageButton", {
					Active = true,
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 11,
					[reactModule.Event.MouseButton1Down] = var3.onRotateHandleInputBegan
				})
			})
		})
	end
	return reactModule.createElement(reactModule.Fragment, nil, t_1)
end