local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetFFlagAXEnableCategoryPillsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills)
local ConstantsModule = require(Modules.LuaApp.Constants)
local GradientFrameModule = require(Modules.AvatarExperience.Common.Components.NavBar.GradientFrame)
local ArrowFrameModule = require(Modules.AvatarExperience.Common.Components.NavBar.ArrowFrame)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local IntroScrollModule = require(Modules.AvatarExperience.Common.Components.NavBar.IntroScroll)
local WithLastInputGroupModule = require(Modules.AvatarExperience.Common.Components.withLastInputGroup)
local ScrollingListWithArrowsAndGradient = RoactModule.PureComponent:extend("ScrollingListWithArrowsAndGradient")
local GetFFlagAXEnableAutomaticSizeGradientFrameModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableAutomaticSizeGradientFrame)
local FilterButtonModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterButton)
local FFlagAXMoveCatalogFilterToL1Navigation = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXEnableEditorCategoryDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableEditorCategoryDeepLink
ScrollingListWithArrowsAndGradient.validateProps = TModule.strictInterface({
	getScollingListContent = TModule.callback,
	listHeight = if GetFFlagAXEnableAutomaticSizeGradientFrameModule() then TModule.optional(TModule.number) else TModule.number,
	scrollingFrameRef = TModule.table,
	buttonRefs = TModule.optional(TModule.table),
	buttonWidth = TModule.optional(TModule.number),
	numButtons = TModule.optional(TModule.number),
	padOutsideEdges = TModule.optional(TModule.boolean),
	childWidgetIndex = TModule.optional(TModule.string),
	useIntroScroll = TModule.optional(TModule.boolean),
	buttonPadding = TModule.number,
	filterButtonRef = if GetFFlagAXEnableCategoryPillsModule() then TModule.optional(TModule.table) else nil,
	backgroundColor = if GetFFlagAXEnableCategoryPillsModule() or FFlagAXMoveCatalogFilterToL1Navigation then TModule.optional(TModule.Color3) else nil,
	supportFilterButton = if FFlagAXMoveCatalogFilterToL1Navigation then TModule.optional(TModule.boolean) else nil,
	hideFilterButton = if FFlagAXMoveCatalogFilterToL1Navigation then TModule.optional(TModule.boolean) else nil,
	filterButtonWidth = if FFlagAXMoveCatalogFilterToL1Navigation then TModule.optional(TModule.number) else nil,
	filterButtonGradientWidth = if FFlagAXMoveCatalogFilterToL1Navigation then TModule.optional(TModule.number) else nil,
	onSizeChanged = if FFlagAXEnableEditorCategoryDeepLink then TModule.optional(TModule.callback) else nil,
	lastInputGroup = TModule.string
})

function ScrollingListWithArrowsAndGradient.init(p1)
	-- upvalues: RoactModule (copy), UtilsModule (copy), FFlagAXEnableEditorCategoryDeepLink (copy)
	p1.gradientFrameRef = RoactModule.createRef()
	p1.arrowLeftVisible, p1.updateArrowLeftVisible = RoactModule.createBinding(false)
	p1.arrowRightVisible, p1.updateArrowRightVisible = RoactModule.createBinding(false)
	p1.canvasPosition, p1.updateCanvasPosition = RoactModule.createBinding(Vector2.new(0, 0))
	
	function p1.onCanvasPositionChange(ScrollFrame)
		-- upvalues: p1 (copy)
		p1.checkShowGradient(ScrollFrame)
		p1.updateCanvasPosition(ScrollFrame.CanvasPosition)
	end
	
	function p1.checkShowGradient(ScrollFrame)
		-- upvalues: p1 (copy), UtilsModule (upval)
		local Value = p1.gradientFrameRef:getValue()
		
		if not Value then return end
		local ShouldShowGradientForScrollingFrame2, ShouldShowGradientForScrollingFrame3
		Value.Visible, ShouldShowGradientForScrollingFrame2, ShouldShowGradientForScrollingFrame3 = UtilsModule.shouldShowGradientForScrollingFrame(ScrollFrame)
		local Left = Value:FindFirstChild("Left")
		local Right = Value:FindFirstChild("Right")
		
		if Left and Right then
			Left.Visible = ShouldShowGradientForScrollingFrame2
			Right.Visible = ShouldShowGradientForScrollingFrame3
		end
		p1.updateArrowLeftVisible(ShouldShowGradientForScrollingFrame2)
		p1.updateArrowRightVisible(ShouldShowGradientForScrollingFrame3)
	end
	
	if FFlagAXEnableEditorCategoryDeepLink then
		function p1.onAbsoluteSizeChange(p2)
			-- upvalues: p1 (copy)
			p1.checkShowGradient(p2)
			
			if p1.props.onSizeChanged then
				p1.props.onSizeChanged(p2)
			end
		end
	end
end

function ScrollingListWithArrowsAndGradient.didUpdate(p1)
	local Value = p1.props.scrollingFrameRef:getValue()
	
	if Value then
		p1.checkShowGradient(Value)
	end
end

function ScrollingListWithArrowsAndGradient.render(p1)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), FFlagAXEnableEditorCategoryDeepLink (copy), GradientFrameModule (copy), GetFFlagAXEnableAutomaticSizeGradientFrameModule (copy), ArrowFrameModule (copy), FFlagAXMoveCatalogFilterToL1Navigation (copy), IntroScrollModule (copy), FilterButtonModule (copy)
	local ListHeight = p1.props.listHeight
	local ChildWidgetIndex = p1.props.childWidgetIndex
	local FilterButtonWidth = p1.props.filterButtonWidth
	local FilterButtonGradientWidth = p1.props.filterButtonGradientWidth
	
	return RoactModule.createFragment({
		ScrollingList = RoactModule.createElement("ScrollingFrame", {
			ClipsDescendants = false,
			Size = UDim2.new(1, 0, 1, 0),
			Selectable = false,
			CanvasSize = nil,
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			CanvasPosition = p1.canvasPosition,
			ScrollBarThickness = 0,
			BackgroundTransparency = 1,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ZIndex = 2,
			[RoactModule.Change.AbsoluteSize] = if FFlagAXEnableEditorCategoryDeepLink then p1.onAbsoluteSizeChange else p1.checkShowGradient,
			[RoactModule.Change.CanvasSize] = p1.checkShowGradient,
			[RoactModule.Change.CanvasPosition] = p1.onCanvasPositionChange,
			[RoactModule.Ref] = p1.props.scrollingFrameRef
		}, p1.props.getScollingListContent()),
		GradientFrame = RoactModule.createElement(GradientFrameModule, {
			ZIndex = 3,
			height = if GetFFlagAXEnableAutomaticSizeGradientFrameModule() then nil else ListHeight,
			frameRef = p1.gradientFrameRef
		}),
		ArrowFrame = p1.props.lastInputGroup == ConstantsModule.InputType.MouseAndKeyboard and RoactModule.createElement(ArrowFrameModule, {
			isVisibleLeft = p1.arrowLeftVisible,
			isVisibleRight = p1.arrowRightVisible,
			supportFilterButton = if FFlagAXMoveCatalogFilterToL1Navigation then p1.props.supportFilterButton else nil,
			isFilterButtonVisible = if FFlagAXMoveCatalogFilterToL1Navigation and p1.props.supportFilterButton then not p1.props.hideFilterButton else nil,
			filterButtonWidth = if p1.props.supportFilterButton then FilterButtonWidth else nil,
			defaultUseProps = {
				scrollingFrameRef = p1.props.scrollingFrameRef,
				buttonRefs = p1.props.buttonRefs,
				buttonWidth = p1.props.buttonWidth,
				padOutsideEdges = p1.props.padOutsideEdges,
				numButtons = p1.props.numButtons,
				buttonPadding = p1.props.buttonPadding,
				updateCanvasPosition = p1.updateCanvasPosition
			},
			ZIndex = if FFlagAXMoveCatalogFilterToL1Navigation and p1.props.supportFilterButton then 5 else 4
		}),
		IntroScroll = p1.props.useIntroScroll and RoactModule.createElement(IntroScrollModule, {
			childWidgetIndex = ChildWidgetIndex,
			scrollingFrameRef = p1.props.scrollingFrameRef,
			updateCanvasPosition = p1.updateCanvasPosition
		}) or nil,
		FilterButton = FFlagAXMoveCatalogFilterToL1Navigation and (p1.props.supportFilterButton and (not p1.props.hideFilterButton and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 4,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.new(0, FilterButtonWidth, 1, 0)
		}, {
			GradientFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, -FilterButtonGradientWidth, 0.5, 0),
				Size = UDim2.new(0, FilterButtonGradientWidth, 1, 0),
				BackgroundColor3 = p1.props.backgroundColor
			}, {
				UIGradient = RoactModule.createElement("UIGradient", {
					Rotation = 0,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.9, 0),
						NumberSequenceKeypoint.new(1, 0)
					})
				})
			}),
			InnerFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				Size = UDim2.new(0, FilterButtonWidth, 1, 0),
				BackgroundColor3 = p1.props.backgroundColor
			}, {
				FilterButton = RoactModule.createElement(FilterButtonModule, { buttonRef = p1.props.filterButtonRef })
			})
		})))
	})
end

return (WithLastInputGroupModule(ScrollingListWithArrowsAndGradient))