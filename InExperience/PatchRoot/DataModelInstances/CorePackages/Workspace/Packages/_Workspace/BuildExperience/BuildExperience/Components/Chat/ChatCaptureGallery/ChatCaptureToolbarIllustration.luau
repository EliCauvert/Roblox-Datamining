local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local list = {
	{ key = "Chat", icon = IconName.Nebula },
	{ key = "Select", icon = IconName.CursorStars },
	{
		key = "Capture",
		isHighlighted = true,
		icon = IconName.FrameCameraCenter
	},
	{ key = "Publish", icon = IconName.ArrowUpRightFromSquare }
}
local config = {
	bottomBar = Vector2.new(124, 220),
	sideRail = Vector2.new(220, 124),
	floating = Vector2.new(240, 170)
}

local function renderButtons()
	-- upvalues: list (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy)
	local Elements = {}
	
	for LayoutOrder, value in list do
		Elements[value.key] = ReactModule.createElement(View, {
			LayoutOrder = LayoutOrder,
			tag = {
				["row align-x-center align-y-center size-600-600 radius-small"] = true,
				["bg-action-emphasis"] = value.isHighlighted == true
			},
			testId = `ChatCaptureToolbarIllustration.{value.key}`
		}, {
			Icon = ReactModule.createElement(Icon, {
				name = value.icon,
				size = IconSize.XSmall,
				tag = {
					["auto-xy"] = true,
					["content-action-emphasis"] = value.isHighlighted == true,
					["content-default"] = value.isHighlighted ~= true
				}
			})
		})
	end
	return Elements
end

local function renderEdgeBar(Layout)
	-- upvalues: ReactModule (copy), View (copy), renderButtons (copy)
	local IsBottomBar = Layout == "bottomBar"
	
	return ReactModule.createElement(View, {
		tag = {
			["position-bottom-center anchor-bottom-center size-full-0 auto-y"] = IsBottomBar,
			["position-center-right anchor-center-right size-0-full auto-x"] = not IsBottomBar
		},
		testId = if IsBottomBar then "ChatCaptureToolbarIllustration.BottomBar" else "ChatCaptureToolbarIllustration.SideRail"
	}, {
		RoundedBackground = ReactModule.createElement(View, { tag = "size-full radius-large bg-surface-100" }),
		SquareBackground = ReactModule.createElement(View, {
			tag = "position-top-left anchor-top-left bg-surface-100",
			Size = if IsBottomBar then UDim2.fromScale(1, 0.5) else UDim2.fromScale(0.5, 1)
		}),
		Buttons = ReactModule.createElement(View, {
			ZIndex = 2,
			tag = {
				["align-x-center align-y-center gap-xxsmall padding-xsmall"] = true,
				["row size-full-0 auto-y"] = IsBottomBar,
				["col size-0-full auto-x"] = not IsBottomBar
			}
		}, (renderButtons()))
	})
end

local function _(p1)
	-- upvalues: renderEdgeBar (copy), ReactModule (copy), View (copy), renderButtons (copy)
	return if p1 == "floating" then ReactModule.createElement(View, {
		tag = "col align-x-center gap-xxsmall position-center-right anchor-center-right auto-xy padding-xxsmall radius-small bg-surface-100",
		testId = "ChatCaptureToolbarIllustration.Floating"
	}, (renderButtons())) else renderEdgeBar(p1)
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), config (copy), ReactModule (copy), View (copy), renderEdgeBar (copy), renderButtons (copy)
	local ScaledEntry = config[Frame.layout] * UseTokensFunction().Config.UI.Scale
	local Layout = Frame.layout
	
	return ReactModule.createElement(View, {
		tag = "row align-x-center size-full-0 auto-y",
		testId = "ChatCaptureToolbarIllustration",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Device = ReactModule.createElement(View, {
			tag = "stroke-thick stroke-emphasis radius-large clip bg-shift-200",
			testId = "ChatCaptureToolbarIllustration.Device",
			Size = UDim2.fromOffset(ScaledEntry.X, ScaledEntry.Y)
		}, {
			ToolbarArea = ReactModule.createElement(View, {
				tag = {
					["size-full"] = true,
					["padding-small"] = Frame.layout == "floating"
				}
			}, {
				Toolbar = if Layout == "floating" then ReactModule.createElement(View, {
					tag = "col align-x-center gap-xxsmall position-center-right anchor-center-right auto-xy padding-xxsmall radius-small bg-surface-100",
					testId = "ChatCaptureToolbarIllustration.Floating"
				}, (renderButtons())) else renderEdgeBar(Layout)
			})
		})
	})
end