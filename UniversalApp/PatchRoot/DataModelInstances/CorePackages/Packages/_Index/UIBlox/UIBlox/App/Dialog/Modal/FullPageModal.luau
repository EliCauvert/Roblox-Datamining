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

function fullPageModal.init(p0)
	-- upvalues: modalTitleModule (ref), UIBloxConfigModule (ref), roactModule (ref)
	p0.state = {
		buttonFrameSize = Vector2.new(0, 0),
		footerContentSize = Vector2.new(0, 0),
		titleContainerSize = Vector2.new(0, modalTitleModule:GetHeight())
	}
	p0.buttonFrameRef = if UIBloxConfigModule.didMountUpdateFullPageModal then roactModule.createRef() else nil
	
	function p0.changeButtonFrameSize(p1)
		-- upvalues: p0 (ref)
		if p0.state.buttonFrameSize ~= p1.AbsoluteSize then
			p0:setState({ buttonFrameSize = p1.AbsoluteSize })
		end
	end
	
	p0.footerContentRef = if UIBloxConfigModule.didMountUpdateFullPageModal then roactModule.createRef() else nil
	
	function p0.changeFooterContentSize(p2)
		-- upvalues: p0 (ref)
		if p0.state.footerContentSize ~= p2.AbsoluteSize then
			p0:setState({ footerContentSize = p2.AbsoluteSize })
		end
	end
	
	function p0.changeTitleContainerSize(p3)
		-- upvalues: p0 (ref)
		if p0.state.titleContainerSize ~= p3.AbsoluteSize then
			p0:setState({ titleContainerSize = p3.AbsoluteSize })
		end
	end
end

if UIBloxConfigModule.didMountUpdateFullPageModal then
	function fullPageModal.didMount(p4)
		if p4.buttonFrameRef.current then
			p4:setState({ buttonFrameSize = p4.buttonFrameRef.current.AbsoluteSize })
		end
		if p4.footerContentRef.current then
			p4:setState({
				footerContentSize = p4.footerContentRef.current.AbsoluteSize
			})
		end
	end
end
function fullPageModal.render(p5)
	-- upvalues: roactModule (ref), modalWindowModule (ref), modalTitleModule (ref), fitFrameVertical (ref), UIBloxConfigModule (ref), buttonStackModule (ref)
	return roactModule.createElement(modalWindowModule, {
		isFullHeight = true,
		screenSize = p5.props.screenSize,
		position = p5.props.position,
		distanceFromTop = p5.props.distanceFromTop
	}, {
		TitleContainer = roactModule.createElement(modalTitleModule, {
			title = p5.props.title,
			onCloseClicked = p5.props.onCloseClicked,
			onTitleSizeChanged = p5.changeTitleContainerSize
		}),
		Content = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -p5.state.titleContainerSize.Y),
			Position = UDim2.new(0, 0, 0, p5.state.titleContainerSize.Y)
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
				Size = UDim2.new(1, -2 * p5.props.marginSize, 1, -(p5.state.buttonFrameSize.Y + p5.state.footerContentSize.Y))
			}, p5.props[roactModule.Children]),
			Buttons = p5.props.buttonStackProps and roactModule.createElement(fitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				LayoutOrder = 2,
				[roactModule.Change.AbsoluteSize] = p5.changeButtonFrameSize,
				[roactModule.Ref] = if UIBloxConfigModule.didMountUpdateFullPageModal then p5.buttonFrameRef else nil
			}, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				roactModule.createElement(buttonStackModule, p5.props.buttonStackProps)
			}),
			BottomFrame = if p5.props.footerContent then roactModule.createElement("Frame", {
				Size = UDim2.new(1, -2 * p5.props.marginSize, 0, 0),
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				[roactModule.Change.AbsoluteSize] = p5.changeFooterContentSize,
				[roactModule.Ref] = if UIBloxConfigModule.didMountUpdateFullPageModal then p5.footerContentRef else nil
			}, {
				ContentPadding = roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 24) }),
				ListLayout = roactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				FooterContent = p5.props.footerContent()
			}) else nil
		})
	})
end

return fullPageModal