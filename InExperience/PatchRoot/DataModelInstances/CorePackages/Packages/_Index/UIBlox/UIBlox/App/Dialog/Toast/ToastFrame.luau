local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local cryoModule = require(parent_3.Cryo)
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local toastIconModule = require(parent.ToastIcon)
local toastTextModule = require(parent.ToastText)
local buttonModule = require(parent_1.Button.Button)
local buttonTypeModule = require(parent_1.Button.Enum.ButtonType)
local standardButtonSizeModule = require(parent_2.Core.Button.Enum.StandardButtonSize)
local toastFrame = roactModule.PureComponent:extend("ToastFrame")
toastFrame.validateProps = tModule.strictInterface({
	anchorPoint = tModule.optional(tModule.Vector2),
	buttonProps = tModule.optional(tModule.strictInterface({
		buttonDimensions = tModule.Vector2,
		buttonText = tModule.string,
		onActivated = tModule.callback
	})),
	iconProps = tModule.optional(toastIconModule.validateProps),
	iconChildren = tModule.optional(tModule.table),
	isCompact = tModule.optional(tModule.boolean),
	layoutOrder = tModule.optional(tModule.integer),
	padding = tModule.numberMin(0),
	position = tModule.optional(tModule.UDim2),
	size = tModule.UDim2,
	subtitleTextProps = tModule.optional(toastTextModule.validateProps),
	textFrameSize = tModule.UDim2,
	titleTextProps = toastTextModule.validateProps,
	buttonType = tModule.optional(buttonTypeModule.isEnumValue)
})
toastFrame.defaultProps = {
	padding = 0,
	size = UDim2.new(1, 0, 1, 0),
	textFrameSize = UDim2.new(1, 0, 1, 0)
}

local function renderToastIcon(p0, p1) --[[ line: 47 ]]
	-- upvalues: roactModule (ref), toastIconModule (ref), cryoModule (ref)
	return if p0 then if type(p0.Image) == "function" then p0:Image() else roactModule.createElement(toastIconModule, cryoModule.Dictionary.join(p0, { LayoutOrder = 1 }), p1) else nil
end

function toastFrame.render(p2) --[[ line: 64 ]]
	-- upvalues: buttonTypeModule (ref), roactModule (ref), renderToastIcon (ref), toastTextModule (ref), cryoModule (ref), buttonModule (ref), standardButtonSizeModule (ref)
	local buttonProps = p2.props.buttonProps
	local buttonText = buttonProps and buttonProps.buttonText
	local y = buttonProps and buttonProps.buttonDimensions.Y
	local x = buttonProps and buttonProps.buttonDimensions.X
	local var13 = nil
	
	if buttonProps then
		var13 = buttonProps.buttonType or buttonTypeModule.PrimarySystem
	end
	local isCompact = p2.props.isCompact
	local iconProps = p2.props.iconProps
	local onActivated = buttonProps and buttonProps.onActivated
	local padding = p2.props.padding
	local subtitleTextProps = p2.props.subtitleTextProps
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		AnchorPoint = p2.props.anchorPoint,
		LayoutOrder = p2.props.layoutOrder,
		Position = p2.props.position,
		Size = p2.props.size
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = if isCompact then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, padding),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = if isCompact then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = padding > 0 and roactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, padding),
			PaddingLeft = UDim.new(0, padding),
			PaddingRight = UDim.new(0, padding),
			PaddingTop = UDim.new(0, padding)
		}),
		ToastMessageFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			LayoutOrder = 1,
			AnchorPoint = p2.props.anchorPoint,
			Position = p2.props.position,
			Size = if not buttonProps then p2.props.size elseif isCompact then UDim2.new(1, 0, 1, -y) else UDim2.new(1, -x, 1, 0)
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, padding),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = (if not subtitleTextProps then Enum.VerticalAlignment.Center elseif isCompact then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center) or (if isCompact then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center)
			}),
			ToastIcon = renderToastIcon(iconProps, p2.props.iconChildren),
			ToastTextFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = p2.props.textFrameSize
			}, {
				UIListLayout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				ToastTitle = roactModule.createElement(toastTextModule, cryoModule.Dictionary.join(p2.props.titleTextProps, { LayoutOrder = 1 })),
				ToastSubtitle = subtitleTextProps and roactModule.createElement(toastTextModule, cryoModule.Dictionary.join(subtitleTextProps, { LayoutOrder = 2 }))
			})
		}),
		ToastButton = buttonProps and roactModule.createElement(buttonModule, {
			layoutOrder = 2,
			buttonType = var13,
			fitContent = not isCompact,
			maxWidth = if not isCompact then buttonProps.buttonDimensions.X else nil,
			onActivated = onActivated,
			standardSize = standardButtonSizeModule.Small,
			text = buttonText
		})
	})
end

return toastFrame