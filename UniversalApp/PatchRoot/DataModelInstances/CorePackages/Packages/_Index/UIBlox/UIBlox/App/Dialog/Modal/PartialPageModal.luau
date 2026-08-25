local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local buttonStackModule = require(parent_1.Button.ButtonStack)
local closeButtonIconModule = require(script.Parent.Enum.CloseButtonIcon)
local fitFrameVertical = require(parent_2.FitFrame).FitFrameVertical
local modalTitleModule = require(parent.ModalTitle)
local modalWindowModule = require(parent.ModalWindow)
local partialPageModal = roactModule.PureComponent:extend("PartialPageModal")
partialPageModal.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	[roactModule.Children] = tModule.table,
	position = tModule.optional(tModule.UDim2),
	anchorPoint = tModule.optional(tModule.Vector2),
	title = tModule.optional(tModule.string),
	titleBackgroundImageProps = tModule.optional(tModule.strictInterface({
		image = tModule.string,
		imageHeight = tModule.number,
		text = tModule.optional(tModule.string)
	})),
	bottomPadding = tModule.optional(tModule.number),
	marginSize = tModule.optional(tModule.number),
	buttonStackProps = tModule.optional(buttonStackModule.validateProps),
	footerContent = tModule.optional(tModule.callback),
	closeButtonIcon = tModule.optional(closeButtonIconModule.isEnumValue),
	onCloseClicked = tModule.optional(tModule.callback),
	contentPadding = tModule.optional(tModule.UDim)
})
partialPageModal.defaultProps = {
	marginSize = 24,
	closeButtonIcon = closeButtonIconModule.Close
}

function partialPageModal.render(p0)
	-- upvalues: modalWindowModule (ref), roactModule (ref), modalTitleModule (ref), fitFrameVertical (ref), buttonStackModule (ref)
	local screenSize = p0.props.screenSize
	
	return roactModule.createElement(modalWindowModule, {
		isFullHeight = false,
		screenSize = screenSize,
		position = p0.props.position,
		anchorPoint = p0.props.anchorPoint
	}, {
		TitleContainer = roactModule.createElement(modalTitleModule, {
			title = p0.props.title,
			titleBackgroundImageProps = p0.props.titleBackgroundImageProps,
			closeButtonIcon = p0.props.closeButtonIcon,
			onCloseClicked = p0.props.onCloseClicked
		}),
		Content = roactModule.createElement(fitFrameVertical, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Position = UDim2.new(0, 0, 0, modalTitleModule.TITLE_HEIGHT),
			width = UDim.new(1, 0),
			margin = {
				top = 0,
				left = 0,
				right = 0,
				bottom = if not modalWindowModule:isFullWidth(screenSize.X) then 24 else p0.props.bottomPadding or 24
			},
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			contentPadding = p0.props.contentPadding
		}, {
			MiddlContent = roactModule.createElement(fitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, -2 * p0.props.marginSize)
			}, p0.props[roactModule.Children]),
			Buttons = p0.props.buttonStackProps and roactModule.createElement(fitFrameVertical, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				width = UDim.new(1, 0)
			}, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				roactModule.createElement(buttonStackModule, p0.props.buttonStackProps)
			}),
			BottomFrame = if p0.props.footerContent then roactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { FooterContent = p0.props.footerContent() }) else nil
		})
	})
end

return partialPageModal