local AppBlox = script:FindFirstAncestor("AppBlox")
local Parent = AppBlox.Parent
local UIBloxModule = require(Parent.UIBlox)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local Images = UIBloxModule.App.ImageSet.Images
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local GetIconSizeUDim2Function = UIBloxModule.App.ImageSet.getIconSizeUDim2
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local ActionBar = UIBloxModule.App.Button.ActionBar
local StickyActionBarModule = require(script.Parent.Parent.StickyActionBar)
local DeviceType = require(Parent.RobloxAppEnums).DeviceType
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local Signal = require(Parent.AppCommonLib).Signal
local GetPlatformConfigModule = require(script.Parent.getPlatformConfig)
local DetailsPageHeaderModule = require(script.Parent.DetailsPageHeader)
local DetailsPageBodyModule = require(script.Parent.DetailsPageBody)
local UseAnimateScrollViewToSelectionModule = require(AppBlox.useAnimateScrollViewToSelection)
local GetTestIdFunction = require(Parent.RoactUtils).getTestId
local FFlagLuaAppFixDetailsPageThumbnailRenderInPhone = require(Parent.SharedFlags).FFlagLuaAppFixDetailsPageThumbnailRenderInPhone
local FFlagLuaAppFixSDPLayout = require(Parent.SharedFlags).FFlagLuaAppFixSDPLayout
local LuaAppDisableStickyBarMediaGallery = game:DefineFastFlag("LuaAppDisableStickyBarMediaGallery", false)
local FFlagLuaAppAddTestIdsForArrow = require(Parent.SharedFlags).FFlagLuaAppAddTestIdsForArrow
local FFlagLuaAppEdpConsoleMediaGalleryVideo = require(Parent.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local DetailsPageTemplate = RoactModule.PureComponent:extend("DetailsPageTemplate")

local function _(p1, p2)
	return p1 * p2.Stroke.Standard
end

DetailsPageTemplate.validateProps = TModule.strictInterface({
	foundationTokens = TModule.table,
	thumbnailImageUrl = TModule.optional(TModule.string),
	thumbnailHeight = TModule.optional(TModule.number),
	thumbnailAspectRatio = TModule.optional(TModule.Vector2),
	thumbnailShadowHeight = if FFlagLuaAppFixDetailsPageThumbnailRenderInPhone then TModule.optional(TModule.number) else nil,
	titleText = TModule.optional(TModule.string),
	subTitleText = TModule.optional(TModule.string),
	actionBarLabelText = TModule.optional(TModule.string),
	renderInfoContent = TModule.optional(TModule.callback),
	renderCustomHeader = TModule.optional(TModule.callback),
	actionBarProps = TModule.optional(TModule.table),
	actionBarWidth = TModule.optional(TModule.number),
	actionBarHeight = TModule.optional(TModule.number),
	renderActionBarLabelImpressionsDetector = TModule.optional(TModule.callback),
	componentList = TModule.optional((require(script.Parent.validateDetailsPageComponentList))),
	dualPanelBreakpoint = TModule.optional(TModule.number),
	sideMargin = TModule.optional(TModule.number),
	bodyClipsDescendants = TModule.optional(TModule.boolean),
	maxContentWidth = TModule.optional(TModule.number),
	startingOffsetPosition = TModule.optional(TModule.number),
	headerBarBackgroundHeight = TModule.optional(TModule.number),
	onClose = TModule.callback,
	bannerPlaceholderGradient = TModule.optional(TModule.table),
	bannerImageUrl = TModule.optional(TModule.string),
	isFullscreen = TModule.optional(TModule.boolean),
	renderFullscreenContent = TModule.optional(TModule.callback),
	deviceType = TModule.optional(TModule.string),
	isMobile = TModule.optional(TModule.boolean),
	tokens = TModule.optional(TModule.table),
	containerRef = TModule.optional(TModule.union(TModule.table, TModule.callback)),
	backgroundFrameSize = TModule.optional(TModule.UDim2),
	scrollingFrameRef = TModule.optional(TModule.table),
	disableScrollingForFocusNav = TModule.optional(TModule.boolean),
	gradientHeight = TModule.optional(TModule.number),
	backgroundImageTransparency = TModule.optional(TModule.number),
	disableBackgroundAspectRatio = TModule.optional(TModule.boolean),
	bodyContainerSafeAreaSize = if FFlagLuaAppFixSDPLayout then TModule.optional(TModule.UDim2) else nil,
	backgroundImageSize = if FFlagLuaAppFixSDPLayout then TModule.optional(TModule.UDim2) else nil,
	headerPadding = if FFlagLuaAppFixSDPLayout then TModule.optional(TModule.number) else nil,
	disableStickyActionBar = TModule.optional(TModule.boolean),
	hideCloseButton = TModule.optional(TModule.boolean),
	backgroundContentOverride = if FFlagLuaAppEdpConsoleMediaGalleryVideo then TModule.optional(TModule.table) else nil
})
DetailsPageTemplate.defaultProps = { isFullscreen = false, deviceType = DeviceType.Desktop }

local _ = function(p1, p2)
	-- upvalues: GetPlatformConfigModule (copy)
	local PlatformConfigModule = GetPlatformConfigModule(p1.deviceType)
	
	return p2 - (if p1.headerBarBackgroundHeight then p1.headerBarBackgroundHeight else PlatformConfigModule.headerBarBackgroundHeight * p1.foundationTokens.Stroke.Standard)
end

function DetailsPageTemplate.init(p1)
	-- upvalues: RoactModule (copy), Signal (copy), GetPlatformConfigModule (copy), DeviceType (copy)
	p1.containerRef = RoactModule.createRef()
	p1.scrollingFrameRef = p1.props.scrollingFrameRef
	p1.scrolled = false
	p1.scrollViewPositionChangedSignal = Signal.new()
	p1.state = {
		showStickyActionTopBar = false,
		backgroundHeight = 500,
		backgroundComponentPosition = 250,
		containerSize = Vector2.new(500, 500)
	}
	
	function p1.onContainerSizeChange(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ containerSize = Frame.AbsoluteSize })
	end
	
	function p1.onBackgroundComponentFrameSizeChange(Frame)
		-- upvalues: p1 (copy), GetPlatformConfigModule (upval)
		p1:setState(function(_, p2)
			-- upvalues: Frame (copy), GetPlatformConfigModule (upval)
			local Y = Frame.AbsoluteSize.Y
			local PlatformConfigModule = GetPlatformConfigModule(p2.deviceType)
			
			return {
				backgroundHeight = Y,
				backgroundComponentPosition = math.max(0, Y - (if p2.headerBarBackgroundHeight then p2.headerBarBackgroundHeight else PlatformConfigModule.headerBarBackgroundHeight * p2.foundationTokens.Stroke.Standard)) / 2
			}
		end)
	end
	
	function p1.canvasPositionChange(ScrollFrame)
		-- upvalues: p1 (copy), GetPlatformConfigModule (upval), DeviceType (upval)
		p1.scrollViewPositionChangedSignal:fire()
		p1.scrolled = true
		p1:setState(function(State, p2)
			-- upvalues: GetPlatformConfigModule (upval), ScrollFrame (copy), p1 (upval), DeviceType (upval)
			local BackgroundHeight = State.backgroundHeight
			local PlatformConfigModule = GetPlatformConfigModule(p2.deviceType)
			local BackgroundHeightDelta = BackgroundHeight - (if p2.headerBarBackgroundHeight then p2.headerBarBackgroundHeight else PlatformConfigModule.headerBarBackgroundHeight * p2.foundationTokens.Stroke.Standard)
			local LargestRatio = math.max(0, BackgroundHeightDelta - ScrollFrame.CanvasPosition.Y) / 2
			
			return if BackgroundHeightDelta < ScrollFrame.CanvasPosition.Y then if State.showStickyActionTopBar == false and p1.props.deviceType ~= DeviceType.Phone and not p1.props.disableStickyActionBar then { showStickyActionTopBar = true } else nil elseif State.showStickyActionTopBar == true then {
				showStickyActionTopBar = false,
				backgroundComponentPosition = LargestRatio
			} else { backgroundComponentPosition = LargestRatio }
		end)
	end
end

function DetailsPageTemplate.render(p1)
	-- upvalues: DeviceType (copy), GetPlatformConfigModule (copy), FFlagLuaAppFixSDPLayout (copy), WithStyleFunction (copy), GetIconSizeFunction (copy), IconSize (copy), RoactModule (copy), GetIconSizeUDim2Function (copy), ReactModule (copy), FFlagLuaAppAddTestIdsForArrow (copy), GetTestIdFunction (copy), IconButton (copy), Images (copy), LoadableImage (copy), LuaAppDisableStickyBarMediaGallery (copy), StickyActionBarModule (copy), VerticalScrollView (copy), DetailsPageHeaderModule (copy), FFlagLuaAppFixDetailsPageThumbnailRenderInPhone (copy), DetailsPageBodyModule (copy), ActionBar (copy)
	local IsDeviceTypeMatch = p1.props.deviceType == DeviceType.Phone
	local PlatformConfigModule = GetPlatformConfigModule(p1.props.deviceType)
	local ThumbnailHeight = if p1.props.thumbnailHeight then p1.props.thumbnailHeight else PlatformConfigModule.thumbnailHeight * p1.props.foundationTokens.Stroke.Standard
	local HeaderBarBackgroundHeight = if p1.props.headerBarBackgroundHeight then p1.props.headerBarBackgroundHeight else PlatformConfigModule.headerBarBackgroundHeight * p1.props.foundationTokens.Stroke.Standard
	local SideMargin = if p1.props.sideMargin then p1.props.sideMargin else PlatformConfigModule.sideMargin
	local DualPanelBreakpoint = if p1.props.dualPanelBreakpoint then p1.props.dualPanelBreakpoint else PlatformConfigModule.dualPanelBreakpoint
	local HeaderPadding = nil
	repeat
		if FFlagLuaAppFixSDPLayout then
			HeaderPadding = p1.props.headerPadding
			
			if HeaderPadding then break end
		end
		local Props = p1.props
		local BackgroundHeight = p1.state.backgroundHeight
		local PlatformConfigModule1 = GetPlatformConfigModule(Props.deviceType)
		HeaderPadding = BackgroundHeight - (if Props.headerBarBackgroundHeight then Props.headerBarBackgroundHeight else PlatformConfigModule1.headerBarBackgroundHeight * Props.foundationTokens.Stroke.Standard)
	until true
	local BackgroundComponentPosition = p1.state.backgroundComponentPosition
	local ContainerSize = p1.state.containerSize
	local IsFullscreen = p1.props.isFullscreen
	local RenderFullscreenContentFunction = p1.props.renderFullscreenContent
	local RenderFullscreenContentFunction1 = not IsDeviceTypeMatch and IsFullscreen and RenderFullscreenContentFunction
	
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), IsDeviceTypeMatch (copy), GetIconSizeFunction (upval), IconSize (upval), HeaderBarBackgroundHeight (copy), RoactModule (upval), GetIconSizeUDim2Function (upval), ReactModule (upval), FFlagLuaAppAddTestIdsForArrow (upval), GetTestIdFunction (upval), IconButton (upval), RenderFullscreenContentFunction1 (copy), Images (upval), LoadableImage (upval), BackgroundComponentPosition (copy), FFlagLuaAppFixSDPLayout (upval), ContainerSize (copy), LuaAppDisableStickyBarMediaGallery (upval), StickyActionBarModule (upval), VerticalScrollView (upval), HeaderPadding (copy), DetailsPageHeaderModule (upval), ThumbnailHeight (copy), FFlagLuaAppFixDetailsPageThumbnailRenderInPhone (upval), SideMargin (copy), DetailsPageBodyModule (upval), DualPanelBreakpoint (copy), RenderFullscreenContentFunction (copy), ActionBar (upval)
		local Theme = p2.Theme
		local NoBannerImageUrl = p1.props.bannerImageUrl == nil
		local BannerPlaceholderGradient = p1.props.bannerPlaceholderGradient or {
			Rotation = 90,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Theme.BackgroundMuted.Color),
				ColorSequenceKeypoint.new(1, Theme.BackgroundUIDefault.Color)
			})
		}
		local IconSizeRatio = IsDeviceTypeMatch and (GetIconSizeFunction(IconSize.Large) + 22) / 2 or HeaderBarBackgroundHeight / 2
		local ActionBarProps = IsDeviceTypeMatch and p1.props.actionBarProps
		
		return RoactModule.createElement("TextButton", {
			Text = "",
			Selectable = false,
			AutoButtonColor = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			[RoactModule.Ref] = if p1.props.containerRef then p1.props.containerRef else p1.containerRef,
			[RoactModule.Change.AbsoluteSize] = p1.onContainerSizeChange
		}, {
			CloseButtonFrame = if p1.props.hideCloseButton then nil else RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = GetIconSizeUDim2Function(IconSize.Large),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 22, 0, IconSizeRatio),
				ZIndex = 2,
				[ReactModule.Tag] = if FFlagLuaAppAddTestIdsForArrow then GetTestIdFunction("details-close-button") else nil
			}, {
				CloseButton = RoactModule.createElement(IconButton, {
					size = UDim2.fromScale(1, 1),
					icon = RenderFullscreenContentFunction1 and Images["icons/navigation/pushBack"] or Images["icons/navigation/close"],
					iconColor3 = p2.Theme.UIEmphasis.Color,
					iconSize = IconSize.Medium,
					onActivated = p1.props.onClose,
					showBackground = p1.state.showStickyActionTopBar == false,
					backgroundColor = p2.Theme.BackgroundUIDefault
				})
			}),
			BackgroundDetailsFrame = RoactModule.createElement("Frame", {
				BackgroundColor3 = Theme.BackgroundMuted.Color,
				BackgroundTransparency = Theme.BackgroundMuted.Transparency,
				Size = if p1.props.backgroundFrameSize then p1.props.backgroundFrameSize else UDim2.fromScale(1, 1),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.fromScale(0.5, 0),
				[RoactModule.Change.AbsoluteSize] = p1.onBackgroundComponentFrameSizeChange
			}, {
				GradientPlaceholder = NoBannerImageUrl and RoactModule.createElement("UIGradient", BannerPlaceholderGradient) or nil,
				UIAspectRatioConstraint = if NoBannerImageUrl or p1.props.disableBackgroundAspectRatio then nil else RoactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1.7777777777777777 }),
				BackgroundImage = NoBannerImageUrl == false and RoactModule.createElement(LoadableImage, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0, BackgroundComponentPosition),
					Size = FFlagLuaAppFixSDPLayout and p1.props.backgroundImageSize or UDim2.new(0, ContainerSize.x, 1, 0),
					Image = p1.props.bannerImageUrl,
					ScaleType = Enum.ScaleType.Crop,
					BackgroundTransparency = p1.props.backgroundImageTransparency
				}) or nil
			}),
			StickyActionBarFrame = (if p1.state.showStickyActionTopBar then RoactModule.createElement("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, HeaderBarBackgroundHeight),
				BackgroundColor3 = Theme.BackgroundUIDefault.Color,
				BackgroundTransparency = Theme.BackgroundUIDefault.Transparency
			}, {
				StickyActionBar = RoactModule.createElement(StickyActionBarModule, {
					actionBarProps = p1.props.actionBarProps,
					actionBarWidth = p1.props.actionBarWidth,
					infoProps = {
						icon = p1.props.thumbnailImageUrl,
						title = p1.props.titleText
					}
				})
			}) else (if LuaAppDisableStickyBarMediaGallery then RenderFullscreenContentFunction1 and not p1.props.disableStickyActionBar else RenderFullscreenContentFunction1) and RoactModule.createElement("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, HeaderBarBackgroundHeight),
				BackgroundColor3 = Theme.BackgroundUIDefault.Color,
				BackgroundTransparency = Theme.BackgroundUIDefault.Transparency
			}, {
				StickyActionBar = RoactModule.createElement(StickyActionBarModule, {
					actionBarProps = p1.props.actionBarProps,
					actionBarWidth = p1.props.actionBarWidth,
					infoProps = {
						icon = p1.props.thumbnailImageUrl,
						title = p1.props.titleText
					}
				})
			})) or nil,
			ContentScrollingFrame = RoactModule.createElement(VerticalScrollView, {
				size = UDim2.fromScale(1, 1),
				canvasSizeY = UDim.new(1, 0),
				useAutomaticCanvasSize = true,
				scrollingEnabled = not p1.props.disableScrollingForFocusNav and not RenderFullscreenContentFunction1,
				[RoactModule.Change.CanvasPosition] = p1.canvasPositionChange,
				scrollingFrameRef = p1.scrollingFrameRef,
				isGamepadFocusable = false,
				selectable = false
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				Padding = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, HeaderPadding)
				}),
				MainView = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Layout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical
					}),
					HeaderContainer = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, HeaderBarBackgroundHeight)
					}, {
						DetailsPageHeader = RoactModule.createElement(DetailsPageHeaderModule, {
							thumbnailImageUrl = p1.props.thumbnailImageUrl,
							thumbnailAspectRatio = p1.props.thumbnailAspectRatio,
							thumbnailHeight = ThumbnailHeight,
							thumbnailShadowHeight = if FFlagLuaAppFixDetailsPageThumbnailRenderInPhone then p1.props.thumbnailShadowHeight else nil,
							titleText = p1.props.titleText,
							subTitleText = p1.props.subTitleText,
							actionBarLabelText = p1.props.actionBarLabelText,
							renderInfoContent = p1.props.renderInfoContent,
							renderCustomHeader = p1.props.renderCustomHeader,
							actionBarProps = if p1.state.showStickyActionTopBar then nil elseif if LuaAppDisableStickyBarMediaGallery then not p1.props.disableStickyActionBar and RenderFullscreenContentFunction1 else RenderFullscreenContentFunction1 then nil else p1.props.actionBarProps,
							actionBarWidth = p1.props.actionBarWidth,
							actionBarHeight = p1.props.actionBarHeight,
							headerBarBackgroundHeight = HeaderBarBackgroundHeight,
							sideMargin = SideMargin,
							maxContentWidth = p1.props.maxContentWidth,
							deviceType = p1.props.deviceType,
							gradientHeight = p1.props.gradientHeight,
							renderActionBarLabelImpressionsDetector = p1.props.renderActionBarLabelImpressionsDetector,
							scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
						})
					}),
					BodyContainer = RoactModule.createElement("Frame", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						Size = UDim2.fromScale(1, 0),
						BackgroundColor3 = Theme.BackgroundDefault.Color,
						BackgroundTransparency = Theme.BackgroundDefault.Transparency,
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						BodyContainerSafeArea = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = FFlagLuaAppFixSDPLayout and p1.props.bodyContainerSafeAreaSize or UDim2.fromOffset(math.min(ContainerSize.x, ContainerSize.y * 1.7777777777777777), 0),
							AnchorPoint = Vector2.new(0.5, 0),
							Position = UDim2.fromScale(0.5, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							DetailsPageBody = RoactModule.createElement(DetailsPageBodyModule, {
								bottomPadding = 100,
								titleText = p1.props.titleText,
								subTitleText = p1.props.subTitleText,
								renderInfoContent = p1.props.renderInfoContent,
								bodyClipsDescendants = p1.props.bodyClipsDescendants,
								componentList = p1.props.componentList,
								dualPanelBreakpoint = DualPanelBreakpoint,
								sideMargin = SideMargin,
								maxContentWidth = p1.props.maxContentWidth,
								deviceType = p1.props.deviceType,
								showPageDetails = IsDeviceTypeMatch and p1.props.renderCustomHeader == nil
							})
						})
					})
				}),
				MobileActionViewPadding = ActionBarProps and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 72)
				})
			}),
			FullscreenFrame = RenderFullscreenContentFunction1 and RoactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
				ClipsDescendants = true,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, -HeaderBarBackgroundHeight),
				Position = UDim2.fromOffset(0, HeaderBarBackgroundHeight)
			}, { FullscreenContent = RenderFullscreenContentFunction() }) or nil,
			MobileActionBarFrame = ActionBarProps and RoactModule.createElement("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BorderSizePixel = 0,
				ZIndex = 3,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0, 1),
				Size = UDim2.new(1, 0, 0, 72),
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				BackgroundTransparency = Theme.BackgroundDefault.Transparency
			}, {
				GradientBar = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 24),
					BackgroundColor3 = Theme.BackgroundDefault.Color,
					AnchorPoint = Vector2.new(0, 1)
				}, {
					Gradient = RoactModule.createElement("UIGradient", {
						Rotation = 270,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0.25),
							NumberSequenceKeypoint.new(1, 0.9999)
						})
					})
				}),
				ActionBar = RoactModule.createElement(ActionBar, {
					button = p1.props.actionBarProps.button,
					icons = p1.props.actionBarProps.icons
				})
			})
		})
	end)
end

function DetailsPageTemplate.didMount(p1)
	if p1.containerRef.current then
		p1.onContainerSizeChange(p1.containerRef.current)
	end
end

function DetailsPageTemplate.didUpdate(p1)
	-- upvalues: GetPlatformConfigModule (copy)
	local PlatformConfigModule = GetPlatformConfigModule(p1.props.deviceType)
	
	if p1.scrolled == false and p1.scrollingFrameRef.current then
		local Props = p1.props
		local BackgroundHeight = p1.state.backgroundHeight
		local PlatformConfigModule1 = GetPlatformConfigModule(Props.deviceType)
		p1.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, (math.max(0, BackgroundHeight - (if Props.headerBarBackgroundHeight then Props.headerBarBackgroundHeight else PlatformConfigModule1.headerBarBackgroundHeight * Props.foundationTokens.Stroke.Standard) - (if p1.props.startingOffsetPosition then p1.props.startingOffsetPosition else PlatformConfigModule.startingOffsetPosition))))
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), UseAnimateScrollViewToSelectionModule (copy), UseTokensFunction (copy), UseLastInputModeFunction (copy), DetailsPageTemplate (copy), CryoModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	UseAnimateScrollViewToSelectionModule(UseRefResult, 0.4)
	
	return ReactModule.createElement(DetailsPageTemplate, CryoModule.Dictionary.join(p1, {
		foundationTokens = UseTokensFunction(),
		scrollingFrameRef = UseRefResult,
		disableScrollingForFocusNav = UseLastInputModeFunction() ~= "Cursor"
	}))
end