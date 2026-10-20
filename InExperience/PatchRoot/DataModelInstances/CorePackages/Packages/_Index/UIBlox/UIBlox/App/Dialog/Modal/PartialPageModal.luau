local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local ButtonStackModule = require(Parent1.Button.ButtonStack)
local CloseButtonIconModule = require(script.Parent.Enum.CloseButtonIcon)
local FitFrameVertical = require(Parent2.FitFrame).FitFrameVertical
local ModalTitleModule = require(Parent.ModalTitle)
local ModalWindowModule = require(Parent.ModalWindow)
local PartialPageModal = RoactModule.PureComponent:extend("PartialPageModal")
PartialPageModal.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	[RoactModule.Children] = TModule.table,
	position = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	title = TModule.optional(TModule.string),
	titleBackgroundImageProps = TModule.optional(TModule.strictInterface({
		image = TModule.string,
		imageHeight = TModule.number,
		text = TModule.optional(TModule.string)
	})),
	bottomPadding = TModule.optional(TModule.number),
	marginSize = TModule.optional(TModule.number),
	buttonStackProps = TModule.optional(ButtonStackModule.validateProps),
	footerContent = TModule.optional(TModule.callback),
	closeButtonIcon = TModule.optional(CloseButtonIconModule.isEnumValue),
	onCloseClicked = TModule.optional(TModule.callback),
	contentPadding = TModule.optional(TModule.UDim)
})
PartialPageModal.defaultProps = {
	marginSize = 24,
	closeButtonIcon = CloseButtonIconModule.Close
}

function PartialPageModal.render(p1)
	-- upvalues: ModalWindowModule (copy), RoactModule (copy), ModalTitleModule (copy), FitFrameVertical (copy), ButtonStackModule (copy)
	local ScreenSize = p1.props.screenSize
	
	return RoactModule.createElement(ModalWindowModule, {
		isFullHeight = false,
		screenSize = ScreenSize,
		position = p1.props.position,
		anchorPoint = p1.props.anchorPoint
	}, {
		TitleContainer = RoactModule.createElement(ModalTitleModule, {
			title = p1.props.title,
			titleBackgroundImageProps = p1.props.titleBackgroundImageProps,
			closeButtonIcon = p1.props.closeButtonIcon,
			onCloseClicked = p1.props.onCloseClicked
		}),
		Content = RoactModule.createElement(FitFrameVertical, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Position = UDim2.new(0, 0, 0, ModalTitleModule.TITLE_HEIGHT),
			width = UDim.new(1, 0),
			margin = {
				top = 0,
				left = 0,
				right = 0,
				bottom = ModalWindowModule:isFullWidth(ScreenSize.X) and p1.props.bottomPadding or 24
			},
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			contentPadding = p1.props.contentPadding
		}, {
			MiddlContent = RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, -2 * p1.props.marginSize)
			}, p1.props[RoactModule.Children]),
			Buttons = p1.props.buttonStackProps and RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				width = UDim.new(1, 0)
			}, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				RoactModule.createElement(ButtonStackModule, p1.props.buttonStackProps)
			}),
			BottomFrame = if p1.props.footerContent then RoactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { FooterContent = p1.props.footerContent() }) else nil
		})
	})
end

return PartialPageModal