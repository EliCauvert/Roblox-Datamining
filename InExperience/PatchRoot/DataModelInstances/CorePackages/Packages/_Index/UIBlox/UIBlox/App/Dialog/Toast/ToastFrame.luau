local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local CryoModule = require(Parent3.Cryo)
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local ToastIconModule = require(Parent.ToastIcon)
local ToastTextModule = require(Parent.ToastText)
local ButtonModule = require(Parent1.Button.Button)
local ButtonTypeModule = require(Parent1.Button.Enum.ButtonType)
local StandardButtonSizeModule = require(Parent2.Core.Button.Enum.StandardButtonSize)
local UIBloxConfigModule = require(Parent2.UIBloxConfig)
local ToastFrame = RoactModule.PureComponent:extend("ToastFrame")
ToastFrame.validateProps = TModule.strictInterface({
	anchorPoint = TModule.optional(TModule.Vector2),
	buttonProps = TModule.optional(TModule.strictInterface({
		buttonDimensions = TModule.Vector2,
		buttonText = TModule.string,
		onActivated = TModule.callback
	})),
	iconProps = TModule.optional(ToastIconModule.validateProps),
	iconChildren = TModule.optional(TModule.table),
	isCompact = TModule.optional(TModule.boolean),
	layoutOrder = TModule.optional(TModule.integer),
	padding = TModule.numberMin(0),
	position = TModule.optional(TModule.UDim2),
	size = TModule.UDim2,
	subtitleTextProps = TModule.optional(ToastTextModule.validateProps),
	textFrameSize = TModule.UDim2,
	titleTextProps = ToastTextModule.validateProps,
	buttonType = TModule.optional(ButtonTypeModule.isEnumValue)
})
ToastFrame.defaultProps = {
	padding = 0,
	size = UDim2.new(1, 0, 1, 0),
	textFrameSize = UDim2.new(1, 0, 1, 0)
}

local function renderToastIcon(IconProps, IconChildren)
	-- upvalues: RoactModule (copy), ToastIconModule (copy), CryoModule (copy)
	return if IconProps then if type(IconProps.Image) == "function" then IconProps.Image(IconProps) else RoactModule.createElement(ToastIconModule, CryoModule.Dictionary.join(IconProps, { LayoutOrder = 1 }), IconChildren) else nil
end

function ToastFrame.render(p1)
	-- upvalues: ButtonTypeModule (copy), UIBloxConfigModule (copy), RoactModule (copy), renderToastIcon (copy), ToastTextModule (copy), CryoModule (copy), ButtonModule (copy), StandardButtonSizeModule (copy)
	local ButtonProps = p1.props.buttonProps
	local ButtonText = ButtonProps and ButtonProps.buttonText
	local Y = ButtonProps and ButtonProps.buttonDimensions.Y
	local X = ButtonProps and ButtonProps.buttonDimensions.X
	local ButtonType = if ButtonProps then ButtonProps.buttonType or ButtonTypeModule.PrimarySystem else nil
	local IsCompact = p1.props.isCompact
	local OnActivated = ButtonProps and ButtonProps.onActivated
	local Padding: number = p1.props.padding
	local SubtitleTextProps = p1.props.subtitleTextProps
	local Padding1 = if UIBloxConfigModule.useFoundationToastButtonSizing then Padding else 0
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		AnchorPoint = p1.props.anchorPoint,
		LayoutOrder = p1.props.layoutOrder,
		Position = p1.props.position,
		Size = p1.props.size
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = if IsCompact then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, Padding),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = if IsCompact then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = Padding > 0 and RoactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, Padding),
			PaddingLeft = UDim.new(0, Padding),
			PaddingRight = UDim.new(0, Padding),
			PaddingTop = UDim.new(0, Padding)
		}),
		ToastMessageFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			LayoutOrder = 1,
			AnchorPoint = p1.props.anchorPoint,
			Position = p1.props.position,
			Size = if ButtonProps then if IsCompact then UDim2.new(1, 0, 1, -Y - Padding1) else UDim2.new(1, -X - Padding1, 1, 0) else p1.props.size
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, Padding),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = (if SubtitleTextProps and IsCompact then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center) or (if IsCompact then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center)
			}),
			ToastIcon = renderToastIcon(p1.props.iconProps, p1.props.iconChildren),
			ToastTextFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = p1.props.textFrameSize
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				ToastTitle = RoactModule.createElement(ToastTextModule, CryoModule.Dictionary.join(p1.props.titleTextProps, { LayoutOrder = 1 })),
				ToastSubtitle = SubtitleTextProps and RoactModule.createElement(ToastTextModule, CryoModule.Dictionary.join(SubtitleTextProps, { LayoutOrder = 2 }))
			})
		}),
		ToastButton = ButtonProps and RoactModule.createElement(ButtonModule, {
			layoutOrder = 2,
			buttonType = ButtonType,
			fitContent = not IsCompact,
			maxWidth = if IsCompact then nil else ButtonProps.buttonDimensions.X,
			onActivated = OnActivated,
			standardSize = StandardButtonSizeModule.Small,
			text = ButtonText
		})
	})
end

return ToastFrame