local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local UIBloxConfigModule = require(parent_2.UIBloxConfig)
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local fitFrameVertical = require(parent_3.FitFrame).FitFrameVertical
local buttonStackModule = require(parent_1.Button.ButtonStack)
local modalTitleModule = require(parent.ModalTitle)
local modalWindowModule = require(parent.ModalWindow)
local fullPageModal = roactModule.PureComponent:extend("FullPageModal")
fullPageModal.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	[roactModule.Children] = tModule.table,
	position = tModule.optional(tModule.UDim2),
	title = tModule.optional(tModule.string),
	marginSize = tModule.optional(tModule.number),
	buttonStackProps = tModule.optional(tModule.table),
	footerContent = tModule.optional(tModule.callback),
	onCloseClicked = tModule.optional(tModule.callback),
	distanceFromTop = tModule.optional(tModule.number)
})
fullPageModal.defaultProps = { marginSize = 24, distanceFromTop = 0 }

function fullPageModal.init(p1)
	-- upvalues: modalTitleModule (ref), UIBloxConfigModule (ref), roactModule (ref)
	p1.state = {
		buttonFrameSize = Vector2.new(0, 0),
		footerContentSize = Vector2.new(0, 0),
		titleContainerSize = Vector2.new(0, modalTitleModule:GetHeight())
	}
	p1.buttonFrameRef = if UIBloxConfigModule.didMountUpdateFullPageModal then roactModule.createRef() else nil
	
	function p0.changeButtonFrameSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.buttonFrameSize ~= p2.AbsoluteSize then
			p1:setState({ buttonFrameSize = p2.AbsoluteSize })
		end
	end
	
	p1.footerContentRef = if UIBloxConfigModule.didMountUpdateFullPageModal then roactModule.createRef() else nil
	
	function p0.changeFooterContentSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.footerContentSize ~= p2.AbsoluteSize then
			p1:setState({ footerContentSize = p2.AbsoluteSize })
		end
	end
	
	function p0.changeTitleContainerSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.titleContainerSize ~= p2.AbsoluteSize then
			p1:setState({ titleContainerSize = p2.AbsoluteSize })
		end
	end
end

if UIBloxConfigModule.didMountUpdateFullPageModal then
	function fullPageModal.didMount(p1)
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
function fullPageModal.render(p1)
	-- upvalues: roactModule (ref), modalWindowModule (ref), modalTitleModule (ref), fitFrameVertical (ref), UIBloxConfigModule (ref), buttonStackModule (ref)
	return roactModule.createElement(modalWindowModule, {
		isFullHeight = true,
		screenSize = p1.props.screenSize,
		position = p1.props.position,
		distanceFromTop = p1.props.distanceFromTop
	}, {
		TitleContainer = roactModule.createElement(modalTitleModule, {
			title = p1.props.title,
			onCloseClicked = p1.props.onCloseClicked,
			onTitleSizeChanged = p1.changeTitleContainerSize
		}),
		Content = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -p1.state.titleContainerSize.Y),
			Position = UDim2.new(0, 0, 0, p1.state.titleContainerSize.Y)
		}, {
			roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 0),
				PaddingRight = UDim.new(0, 0),
				PaddingBottom = UDim.new(0, 24)
			}),
			MiddleContent = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				ZIndex = 2,
				Size = UDim2.new(1, -2 * p1.props.marginSize, 1, -(p1.state.buttonFrameSize.Y + p1.state.footerContentSize.Y))
			}, p1.props[roactModule.Children]),
			Buttons = p1.props.buttonStackProps and roactModule.createElement(fitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				LayoutOrder = 2,
				[roactModule.Change.AbsoluteSize] = p1.changeButtonFrameSize,
				[roactModule.Ref] = if UIBloxConfigModule.didMountUpdateFullPageModal then p1.buttonFrameRef else nil
			}, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				roactModule.createElement(buttonStackModule, p1.props.buttonStackProps)
			}),
			BottomFrame = if p1.props.footerContent then roactModule.createElement("Frame", {
				Size = UDim2.new(1, -2 * p1.props.marginSize, 0, 0),
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				[roactModule.Change.AbsoluteSize] = p1.changeFooterContentSize,
				[roactModule.Ref] = if UIBloxConfigModule.didMountUpdateFullPageModal then p1.footerContentRef else nil
			}, {
				ContentPadding = roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 24) }),
				ListLayout = roactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				FooterContent = p1.props.footerContent()
			}) else nil
		})
	})
end

return fullPageModal