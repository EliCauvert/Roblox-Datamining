local appBlox = script:FindFirstAncestor("AppBlox")
local parent = appBlox.Parent
local UIBloxModule = require(parent.UIBlox)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local useTokens = require(parent.Foundation).Hooks.useTokens
local withStyle = UIBloxModule.Core.Style.withStyle
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local images = UIBloxModule.App.ImageSet.Images
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local getIconSize = UIBloxModule.App.ImageSet.getIconSize
local getIconSizeUDim2 = UIBloxModule.App.ImageSet.getIconSizeUDim2
local verticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local actionBar = UIBloxModule.App.Button.ActionBar
local stickyActionBarModule = require(script.Parent.Parent.StickyActionBar)
local deviceType = require(parent.RobloxAppEnums).DeviceType
local useLastInputMode = require(parent.FocusNavigationUtils).useLastInputMode
local signal = require(parent.AppCommonLib).Signal
local getPlatformConfigModule = require(script.Parent.getPlatformConfig)
local detailsPageHeaderModule = require(script.Parent.DetailsPageHeader)
local detailsPageBodyModule = require(script.Parent.DetailsPageBody)
local validateDetailsPageComponentListModule = require(script.Parent.validateDetailsPageComponentList)
local useAnimateScrollViewToSelectionModule = require(appBlox.useAnimateScrollViewToSelection)
local getTestId = require(parent.RoactUtils).getTestId
local fFlagLuaAppFixDetailsPageThumbnailRenderInPhone = require(parent.SharedFlags).FFlagLuaAppFixDetailsPageThumbnailRenderInPhone
local fFlagLuaAppFixSDPLayout = require(parent.SharedFlags).FFlagLuaAppFixSDPLayout
local luaAppDisableStickyBarMediaGallery = game:DefineFastFlag("LuaAppDisableStickyBarMediaGallery", false)
local fFlagLuaAppAddTestIdsForArrow = require(parent.SharedFlags).FFlagLuaAppAddTestIdsForArrow
local fFlagLuaAppEdpConsoleMediaGalleryVideo = require(parent.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local detailsPageTemplate = roactModule.PureComponent:extend("DetailsPageTemplate")

local function _(p1, p2)
	return p1 * p2.Stroke.Standard
end

detailsPageTemplate.validateProps = tModule.strictInterface({
	foundationTokens = tModule.table,
	thumbnailImageUrl = tModule.optional(tModule.string),
	thumbnailHeight = tModule.optional(tModule.number),
	thumbnailAspectRatio = tModule.optional(tModule.Vector2),
	thumbnailShadowHeight = if fFlagLuaAppFixDetailsPageThumbnailRenderInPhone then tModule.optional(tModule.number) else nil,
	titleText = tModule.optional(tModule.string),
	subTitleText = tModule.optional(tModule.string),
	actionBarLabelText = tModule.optional(tModule.string),
	renderInfoContent = tModule.optional(tModule.callback),
	renderCustomHeader = tModule.optional(tModule.callback),
	actionBarProps = tModule.optional(tModule.table),
	actionBarWidth = tModule.optional(tModule.number),
	actionBarHeight = tModule.optional(tModule.number),
	renderActionBarLabelImpressionsDetector = tModule.optional(tModule.callback),
	componentList = tModule.optional(validateDetailsPageComponentListModule),
	dualPanelBreakpoint = tModule.optional(tModule.number),
	sideMargin = tModule.optional(tModule.number),
	bodyClipsDescendants = tModule.optional(tModule.boolean),
	maxContentWidth = tModule.optional(tModule.number),
	startingOffsetPosition = tModule.optional(tModule.number),
	headerBarBackgroundHeight = tModule.optional(tModule.number),
	onClose = tModule.callback,
	bannerPlaceholderGradient = tModule.optional(tModule.table),
	bannerImageUrl = tModule.optional(tModule.string),
	isFullscreen = tModule.optional(tModule.boolean),
	renderFullscreenContent = tModule.optional(tModule.callback),
	deviceType = tModule.optional(tModule.string),
	isMobile = tModule.optional(tModule.boolean),
	tokens = tModule.optional(tModule.table),
	containerRef = tModule.optional(tModule.union(tModule.table, tModule.callback)),
	backgroundFrameSize = tModule.optional(tModule.UDim2),
	scrollingFrameRef = tModule.optional(tModule.table),
	disableScrollingForFocusNav = tModule.optional(tModule.boolean),
	gradientHeight = tModule.optional(tModule.number),
	backgroundImageTransparency = tModule.optional(tModule.number),
	disableBackgroundAspectRatio = tModule.optional(tModule.boolean),
	bodyContainerSafeAreaSize = if fFlagLuaAppFixSDPLayout then tModule.optional(tModule.UDim2) else nil,
	backgroundImageSize = if fFlagLuaAppFixSDPLayout then tModule.optional(tModule.UDim2) else nil,
	headerPadding = if fFlagLuaAppFixSDPLayout then tModule.optional(tModule.number) else nil,
	disableStickyActionBar = tModule.optional(tModule.boolean),
	hideCloseButton = tModule.optional(tModule.boolean),
	backgroundContentOverride = if fFlagLuaAppEdpConsoleMediaGalleryVideo then tModule.optional(tModule.table) else nil
})
detailsPageTemplate.defaultProps = { isFullscreen = false, deviceType = deviceType.Desktop }

local _ = function(p1, p2)
	-- upvalues: getPlatformConfigModule (ref)
	return p2 - (if p1.headerBarBackgroundHeight then p1.headerBarBackgroundHeight else getPlatformConfigModule(p1.deviceType).headerBarBackgroundHeight * p1.foundationTokens.Stroke.Standard)
end

function detailsPageTemplate.init(p1)
	-- upvalues: roactModule (ref), signal (ref), getPlatformConfigModule (ref), deviceType (ref)
	p1.containerRef = roactModule.createRef()
	p1.scrollingFrameRef = p1.props.scrollingFrameRef
	p1.scrolled = false
	p1.scrollViewPositionChangedSignal = signal.new()
	p1.state = {
		showStickyActionTopBar = false,
		backgroundHeight = 500,
		backgroundComponentPosition = 250,
		containerSize = Vector2.new(500, 500)
	}
	
	function p4.onContainerSizeChange(p2)
		-- upvalues: p1 (ref)
		p1:setState({ containerSize = p2.AbsoluteSize })
	end
	
	function p4.onBackgroundComponentFrameSizeChange(p2)
		-- upvalues: p1 (ref), getPlatformConfigModule (copy)
		p1:setState(function(_, p3)
			-- upvalues: p2 (ref), getPlatformConfigModule (copy)
			local y = p2.AbsoluteSize.Y
			
			return {
				backgroundHeight = y,
				backgroundComponentPosition = math.max(0, y - (if p3.headerBarBackgroundHeight then p3.headerBarBackgroundHeight else getPlatformConfigModule(p3.deviceType).headerBarBackgroundHeight * p3.foundationTokens.Stroke.Standard)) / 2
			}
		end)
	end
	
	function p4.canvasPositionChange(p2)
		-- upvalues: p1 (ref), getPlatformConfigModule (copy), deviceType (copy)
		p1.scrollViewPositionChangedSignal:fire()
		p1.scrolled = true
		p1:setState(function(p3, p4)
			-- upvalues: getPlatformConfigModule (copy), p2 (ref), p1 (copy), deviceType (copy)
			local var1 = p3.backgroundHeight - (if p4.headerBarBackgroundHeight then p4.headerBarBackgroundHeight else getPlatformConfigModule(p4.deviceType).headerBarBackgroundHeight * p4.foundationTokens.Stroke.Standard)
			local var2 = math.max(0, var1 - p2.CanvasPosition.Y) / 2
			
			return if var1 < p2.CanvasPosition.Y then if p3.showStickyActionTopBar == false and p1.props.deviceType ~= deviceType.Phone and not p1.props.disableStickyActionBar then { showStickyActionTopBar = true } else nil elseif p3.showStickyActionTopBar == true then {
				showStickyActionTopBar = false,
				backgroundComponentPosition = var2
			} else { backgroundComponentPosition = var2 }
		end)
	end
end

function detailsPageTemplate.render(p1)
	-- upvalues: deviceType (ref), getPlatformConfigModule (ref), fFlagLuaAppFixSDPLayout (ref), withStyle (ref), getIconSize (ref), iconSize (ref), roactModule (ref), getIconSizeUDim2 (ref), reactModule (ref), fFlagLuaAppAddTestIdsForArrow (ref), getTestId (ref), iconButton (ref), images (ref), loadableImage (ref), luaAppDisableStickyBarMediaGallery (ref), stickyActionBarModule (ref), verticalScrollView (ref), detailsPageHeaderModule (ref), fFlagLuaAppFixDetailsPageThumbnailRenderInPhone (ref), detailsPageBodyModule (ref), actionBar (ref)
	local headerPadding
	local var1 = p1.props.deviceType == deviceType.Phone
	local var2 = getPlatformConfigModule(p1.props.deviceType)
	local var3 = if p1.props.thumbnailHeight then p1.props.thumbnailHeight else var2.thumbnailHeight * p1.props.foundationTokens.Stroke.Standard
	local var4 = if p1.props.headerBarBackgroundHeight then p1.props.headerBarBackgroundHeight else var2.headerBarBackgroundHeight * p1.props.foundationTokens.Stroke.Standard
	local var5 = if p1.props.sideMargin then p1.props.sideMargin else var2.sideMargin
	local var6 = if p1.props.dualPanelBreakpoint then p1.props.dualPanelBreakpoint else var2.dualPanelBreakpoint
	
	if fFlagLuaAppFixSDPLayout then
		headerPadding = p1.props.headerPadding
		
		if not headerPadding then
			local props = p1.props
			headerPadding = p1.state.backgroundHeight - (if props.headerBarBackgroundHeight then props.headerBarBackgroundHeight else getPlatformConfigModule(props.deviceType).headerBarBackgroundHeight * props.foundationTokens.Stroke.Standard)
		end
		local backgroundComponentPosition = p1.state.backgroundComponentPosition
		local containerSize = p1.state.containerSize
		local renderFullscreenContent = p1.props.renderFullscreenContent
		local var7 = if var1 or not p1.props.isFullscreen or not renderFullscreenContent then false else true
		
		return withStyle(function(p2)
			-- upvalues: p1 (ref), var1 (ref), getIconSize (copy), iconSize (copy), var4 (ref), roactModule (copy), getIconSizeUDim2 (copy), reactModule (copy), fFlagLuaAppAddTestIdsForArrow (copy), getTestId (copy), iconButton (copy), var7 (ref), images (copy), loadableImage (copy), backgroundComponentPosition (ref), fFlagLuaAppFixSDPLayout (copy), containerSize (ref), luaAppDisableStickyBarMediaGallery (copy), stickyActionBarModule (copy), verticalScrollView (copy), headerPadding (ref), detailsPageHeaderModule (copy), var3 (ref), fFlagLuaAppFixDetailsPageThumbnailRenderInPhone (copy), var5 (ref), detailsPageBodyModule (copy), var6 (ref), renderFullscreenContent (ref), actionBar (copy)
			local textButton
			local theme = p2.Theme
			local var8 = p1.props.bannerImageUrl == nil
			local bannerPlaceholderGradient = p1.props.bannerPlaceholderGradient or {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, theme.BackgroundMuted.Color),
					ColorSequenceKeypoint.new(1, theme.BackgroundUIDefault.Color)
				})
			}
			local var9 = if var1 then (getIconSize(iconSize.Large) + 22) / 2 else var4 / 2
			local actionBarProps = var1 and p1.props.actionBarProps
			local createElement = roactModule.createElement
			local var10 = "TextButton"
			local t = {
				Text = "",
				Selectable = false,
				AutoButtonColor = false,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = theme.BackgroundDefault.Color,
				BackgroundTransparency = theme.BackgroundDefault.Transparency,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				[roactModule.Ref] = if p1.props.containerRef then p1.props.containerRef else p1.containerRef,
				[roactModule.Change.AbsoluteSize] = p1.onContainerSizeChange
			}
			local t_1 = {
				CloseButtonFrame = if not p1.props.hideCloseButton then roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = getIconSizeUDim2(iconSize.Large),
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 22, 0, var9),
					ZIndex = 2,
					[reactModule.Tag] = if fFlagLuaAppAddTestIdsForArrow then getTestId("details-close-button") else nil
				}, {
					CloseButton = roactModule.createElement(iconButton, {
						size = UDim2.fromScale(1, 1),
						icon = if var7 then images["icons/navigation/pushBack"] else images["icons/navigation/close"],
						iconColor3 = p2.Theme.UIEmphasis.Color,
						iconSize = iconSize.Medium,
						onActivated = p1.props.onClose,
						showBackground = p1.state.showStickyActionTopBar == false,
						backgroundColor = p2.Theme.BackgroundUIDefault
					})
				}) else nil,
				BackgroundDetailsFrame = roactModule.createElement("Frame", {
					BackgroundColor3 = theme.BackgroundMuted.Color,
					BackgroundTransparency = theme.BackgroundMuted.Transparency,
					Size = if p1.props.backgroundFrameSize then p1.props.backgroundFrameSize else UDim2.fromScale(1, 1),
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.fromScale(0.5, 0),
					[roactModule.Change.AbsoluteSize] = p1.onBackgroundComponentFrameSizeChange
				}, {
					GradientPlaceholder = var8 and roactModule.createElement("UIGradient", bannerPlaceholderGradient) or nil,
					UIAspectRatioConstraint = if var8 or p1.props.disableBackgroundAspectRatio then nil else roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1.777777777778 }),
					BackgroundImage = var8 == false and (roactModule.createElement(loadableImage, {
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0, backgroundComponentPosition),
						Size = if fFlagLuaAppFixSDPLayout then p1.props.backgroundImageSize else UDim2.new(0, containerSize.x, 1, 0),
						Image = p1.props.bannerImageUrl,
						ScaleType = Enum.ScaleType.Crop,
						BackgroundTransparency = p1.props.backgroundImageTransparency
					}) or nil)
				})
			}
			
			if not p1.state.showStickyActionTopBar then
				textButton = (if luaAppDisableStickyBarMediaGallery then var7 and not p1.props.disableStickyActionBar else var7) and (roactModule.createElement("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, var4),
					BackgroundColor3 = theme.BackgroundUIDefault.Color,
					BackgroundTransparency = theme.BackgroundUIDefault.Transparency
				}, {
					StickyActionBar = roactModule.createElement(stickyActionBarModule, {
						actionBarProps = p1.props.actionBarProps,
						actionBarWidth = p1.props.actionBarWidth,
						infoProps = {
							icon = p1.props.thumbnailImageUrl,
							title = p1.props.titleText
						}
					})
				}) or nil)
			end
			t_1.StickyActionBarFrame = textButton
			t_1.ContentScrollingFrame = roactModule.createElement(verticalScrollView, {
				size = UDim2.fromScale(1, 1),
				canvasSizeY = UDim.new(1, 0),
				useAutomaticCanvasSize = true,
				scrollingEnabled = not p1.props.disableScrollingForFocusNav and not var7,
				[roactModule.Change.CanvasPosition] = p1.canvasPositionChange,
				scrollingFrameRef = p1.scrollingFrameRef,
				isGamepadFocusable = false,
				selectable = false
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				Padding = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, headerPadding)
				}),
				MainView = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Layout = roactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical
					}),
					HeaderContainer = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, var4)
					}, {
						DetailsPageHeader = roactModule.createElement(detailsPageHeaderModule, {
							thumbnailImageUrl = p1.props.thumbnailImageUrl,
							thumbnailAspectRatio = p1.props.thumbnailAspectRatio,
							thumbnailHeight = var3,
							thumbnailShadowHeight = if fFlagLuaAppFixDetailsPageThumbnailRenderInPhone then p1.props.thumbnailShadowHeight else nil,
							titleText = p1.props.titleText,
							subTitleText = p1.props.subTitleText,
							actionBarLabelText = p1.props.actionBarLabelText,
							renderInfoContent = p1.props.renderInfoContent,
							renderCustomHeader = p1.props.renderCustomHeader,
							actionBarProps = if p1.state.showStickyActionTopBar or (if luaAppDisableStickyBarMediaGallery then not p1.props.disableStickyActionBar and var7 else var7) then nil else p1.props.actionBarProps,
							actionBarWidth = p1.props.actionBarWidth,
							actionBarHeight = p1.props.actionBarHeight,
							headerBarBackgroundHeight = var4,
							sideMargin = var5,
							maxContentWidth = p1.props.maxContentWidth,
							deviceType = p1.props.deviceType,
							gradientHeight = p1.props.gradientHeight,
							renderActionBarLabelImpressionsDetector = p1.props.renderActionBarLabelImpressionsDetector,
							scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
						})
					}),
					BodyContainer = roactModule.createElement("Frame", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						Size = UDim2.fromScale(1, 0),
						BackgroundColor3 = theme.BackgroundDefault.Color,
						BackgroundTransparency = theme.BackgroundDefault.Transparency,
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						BodyContainerSafeArea = roactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = if fFlagLuaAppFixSDPLayout then p1.props.bodyContainerSafeAreaSize else UDim2.fromOffset(math.min(containerSize.x, containerSize.y * 1.777777777778), 0),
							AnchorPoint = Vector2.new(0.5, 0),
							Position = UDim2.fromScale(0.5, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							DetailsPageBody = roactModule.createElement(detailsPageBodyModule, {
								bottomPadding = 100,
								titleText = p1.props.titleText,
								subTitleText = p1.props.subTitleText,
								renderInfoContent = p1.props.renderInfoContent,
								bodyClipsDescendants = p1.props.bodyClipsDescendants,
								componentList = p1.props.componentList,
								dualPanelBreakpoint = var6,
								sideMargin = var5,
								maxContentWidth = p1.props.maxContentWidth,
								deviceType = p1.props.deviceType,
								showPageDetails = var1 and p1.props.renderCustomHeader == nil
							})
						})
					})
				}),
				MobileActionViewPadding = actionBarProps and roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 72)
				})
			})
			t_1.FullscreenFrame = var7 and roactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
				ClipsDescendants = true,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, -var4),
				Position = UDim2.fromOffset(0, var4)
			}, { FullscreenContent = renderFullscreenContent() }) or nil
			t_1.MobileActionBarFrame = actionBarProps and roactModule.createElement("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BorderSizePixel = 0,
				ZIndex = 3,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0, 1),
				Size = UDim2.new(1, 0, 0, 72),
				BackgroundColor3 = theme.BackgroundDefault.Color,
				BackgroundTransparency = theme.BackgroundDefault.Transparency
			}, {
				GradientBar = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 24),
					BackgroundColor3 = theme.BackgroundDefault.Color,
					AnchorPoint = Vector2.new(0, 1)
				}, {
					Gradient = roactModule.createElement("UIGradient", {
						Rotation = 270,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0.25),
							NumberSequenceKeypoint.new(1, 0.9999)
						})
					})
				}),
				ActionBar = roactModule.createElement(actionBar, {
					button = p1.props.actionBarProps.button,
					icons = p1.props.actionBarProps.icons
				})
			})
			
			return createElement(var10, t, t_1)
		end)
	end
end

function detailsPageTemplate.didMount(p1)
	if p1.containerRef.current then
		p1.onContainerSizeChange(p1.containerRef.current)
	end
end

function detailsPageTemplate.didUpdate(p1)
	-- upvalues: getPlatformConfigModule (ref)
	local var1 = getPlatformConfigModule(p1.props.deviceType)
	
	if p1.scrolled == false and p1.scrollingFrameRef.current then
		local props = p1.props
		p1.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, math.max(0, p1.state.backgroundHeight - (if props.headerBarBackgroundHeight then props.headerBarBackgroundHeight else getPlatformConfigModule(props.deviceType).headerBarBackgroundHeight * props.foundationTokens.Stroke.Standard) - (if p1.props.startingOffsetPosition then p1.props.startingOffsetPosition else var1.startingOffsetPosition)))
	end
end

return function(p1)
	-- upvalues: reactModule (ref), useAnimateScrollViewToSelectionModule (ref), useTokens (ref), useLastInputMode (ref), detailsPageTemplate (ref), cryoModule (ref)
	local var1 = reactModule.useRef(nil)
	useAnimateScrollViewToSelectionModule(var1, 0.4)
	
	return reactModule.createElement(detailsPageTemplate, cryoModule.Dictionary.join(p1, {
		foundationTokens = useTokens(),
		scrollingFrameRef = var1,
		disableScrollingForFocusNav = useLastInputMode() ~= "Cursor"
	}))
end