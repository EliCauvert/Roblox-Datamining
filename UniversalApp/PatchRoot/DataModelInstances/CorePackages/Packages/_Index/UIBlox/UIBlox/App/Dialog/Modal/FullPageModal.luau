local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local UIBloxConfigModule = require(Parent2.UIBloxConfig)
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local FitFrameVertical = require(Parent3.FitFrame).FitFrameVertical
local ButtonStackModule = require(Parent1.Button.ButtonStack)
local ModalTitleModule = require(Parent.ModalTitle)
local ModalWindowModule = require(Parent.ModalWindow)
local FullPageModal = RoactModule.PureComponent:extend("FullPageModal")
FullPageModal.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	[RoactModule.Children] = TModule.table,
	position = TModule.optional(TModule.UDim2),
	title = TModule.optional(TModule.string),
	marginSize = TModule.optional(TModule.number),
	buttonStackProps = TModule.optional(TModule.table),
	footerContent = TModule.optional(TModule.callback),
	onCloseClicked = TModule.optional(TModule.callback),
	distanceFromTop = TModule.optional(TModule.number)
})
FullPageModal.defaultProps = { marginSize = 24, distanceFromTop = 0 }

function FullPageModal.init(p1) --[[ Line: 55 ]]
	-- upvalues: ModalTitleModule (copy), UIBloxConfigModule (copy), RoactModule (copy)
	p1.state = {
		buttonFrameSize = Vector2.new(0, 0),
		footerContentSize = Vector2.new(0, 0),
		titleContainerSize = Vector2.new(0, ModalTitleModule:GetHeight())
	}
	p1.buttonFrameRef = if UIBloxConfigModule.didMountUpdateFullPageModal then RoactModule.createRef() else nil
	
	function p1.changeButtonFrameSize(Frame: Frame) --[[ Line: 63 ]]
		-- upvalues: p1 (copy)
		if p1.state.buttonFrameSize ~= Frame.AbsoluteSize then
			p1:setState({ buttonFrameSize = Frame.AbsoluteSize })
		end
	end
	
	p1.footerContentRef = if UIBloxConfigModule.didMountUpdateFullPageModal then RoactModule.createRef() else nil
	
	function p1.changeFooterContentSize(Frame: Frame) --[[ Line: 72 ]]
		-- upvalues: p1 (copy)
		if p1.state.footerContentSize ~= Frame.AbsoluteSize then
			p1:setState({ footerContentSize = Frame.AbsoluteSize })
		end
	end
	
	function p1.changeTitleContainerSize(Frame: Frame) --[[ Line: 80 ]]
		-- upvalues: p1 (copy)
		if p1.state.titleContainerSize ~= Frame.AbsoluteSize then
			p1:setState({ titleContainerSize = Frame.AbsoluteSize })
		end
	end
end

if UIBloxConfigModule.didMountUpdateFullPageModal then
	function FullPageModal.didMount(p1) --[[ Line: 90 ]]
		if p1.buttonFrameRef.current then
			p1:setState({ buttonFrameSize = p1.buttonFrameRef.current.AbsoluteSize })
		end
		if p1.footerContentRef.current then
			p1:setState({
				footerContentSize = p1.footerContentRef.current.AbsoluteSize
			})
		end
	end
end
function FullPageModal.render(p1) --[[ Line: 104 ]]
	-- upvalues: RoactModule (copy), ModalWindowModule (copy), ModalTitleModule (copy), FitFrameVertical (copy), UIBloxConfigModule (copy), ButtonStackModule (copy)
	return RoactModule.createElement(ModalWindowModule, {
		isFullHeight = true,
		screenSize = p1.props.screenSize,
		position = p1.props.position,
		distanceFromTop = p1.props.distanceFromTop
	}, {
		TitleContainer = RoactModule.createElement(ModalTitleModule, {
			title = p1.props.title,
			onCloseClicked = p1.props.onCloseClicked,
			onTitleSizeChanged = p1.changeTitleContainerSize
		}),
		Content = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -p1.state.titleContainerSize.Y),
			Position = UDim2.new(0, 0, 0, p1.state.titleContainerSize.Y)
		}, {
			RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 0),
				PaddingRight = UDim.new(0, 0),
				PaddingBottom = UDim.new(0, 24)
			}),
			MiddleContent = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				ZIndex = 2,
				Size = UDim2.new(1, -2 * p1.props.marginSize, 1, -(p1.state.buttonFrameSize.Y + p1.state.footerContentSize.Y))
			}, p1.props[RoactModule.Children]),
			Buttons = p1.props.buttonStackProps and RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				LayoutOrder = 2,
				[RoactModule.Change.AbsoluteSize] = p1.changeButtonFrameSize,
				[RoactModule.Ref] = if UIBloxConfigModule.didMountUpdateFullPageModal then p1.buttonFrameRef else nil
			}, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				RoactModule.createElement(ButtonStackModule, p1.props.buttonStackProps)
			}),
			BottomFrame = if p1.props.footerContent then RoactModule.createElement("Frame", {
				Size = UDim2.new(1, -2 * p1.props.marginSize, 0, 0),
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				[RoactModule.Change.AbsoluteSize] = p1.changeFooterContentSize,
				[RoactModule.Ref] = if UIBloxConfigModule.didMountUpdateFullPageModal then p1.footerContentRef else nil
			}, {
				ContentPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 24) }),
				ListLayout = RoactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				FooterContent = p1.props.footerContent()
			}) else nil
		})
	})
end

return FullPageModal