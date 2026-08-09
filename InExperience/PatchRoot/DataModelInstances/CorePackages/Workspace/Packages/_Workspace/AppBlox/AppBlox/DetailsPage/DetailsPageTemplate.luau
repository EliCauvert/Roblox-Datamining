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
local fFlagLuaAppPlayButtonContextualMessageImpression = require(parent.SharedFlags).FFlagLuaAppPlayButtonContextualMessageImpression
local detailsPageTemplate = roactModule.PureComponent:extend("DetailsPageTemplate")

local function _(p0, p1) --[[ line: 61 | named "applyTokenScaling" ]]
	return p0 * p1.Stroke.Standard
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
	renderActionBarLabelImpressionsDetector = if fFlagLuaAppPlayButtonContextualMessageImpression then tModule.optional(tModule.callback) else nil,
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
	hideCloseButton = tModule.optional(tModule.boolean)
})
detailsPageTemplate.defaultProps = { isFullscreen = false, deviceType = deviceType.Desktop }

local _ = function(p2, p3) --[[ line: 174 | named "getHeaderPaddingHeight" ]]
	-- upvalues: getPlatformConfigModule (ref)
	return p3 - (if p2.headerBarBackgroundHeight then p2.headerBarBackgroundHeight else getPlatformConfigModule(p2.deviceType).headerBarBackgroundHeight * p2.foundationTokens.Stroke.Standard)
end

function detailsPageTemplate.init(p4) --[[ line: 183 ]]
	-- upvalues: roactModule (ref), fFlagLuaAppPlayButtonContextualMessageImpression (ref), signal (ref), getPlatformConfigModule (ref), deviceType (ref)
	p4.containerRef = roactModule.createRef()
	p4.scrollingFrameRef = p4.props.scrollingFrameRef
	p4.scrolled = false
	p4.scrollViewPositionChangedSignal = if fFlagLuaAppPlayButtonContextualMessageImpression then signal.new() else nil
	p4.state = {
		showStickyActionTopBar = false,
		backgroundHeight = 500,
		backgroundComponentPosition = 250,
		containerSize = Vector2.new(500, 500)
	}
	
	function p4.onContainerSizeChange(p5) --[[ line: 197 ]]
		-- upvalues: p4 (ref)
		p4:setState({ containerSize = p5.AbsoluteSize })
	end
	
	function p4.onBackgroundComponentFrameSizeChange(p6) --[[ line: 203 ]]
		-- upvalues: p4 (ref), getPlatformConfigModule (copy)
		p4:setState(function(_, p7) --[[ line: 205 ]]
			-- upvalues: p6 (ref), getPlatformConfigModule (copy)
			local y = p6.AbsoluteSize.Y
			
			return {
				backgroundHeight = y,
				backgroundComponentPosition = math.max(0, y - (if p7.headerBarBackgroundHeight then p7.headerBarBackgroundHeight else getPlatformConfigModule(p7.deviceType).headerBarBackgroundHeight * p7.foundationTokens.Stroke.Standard)) / 2
			}
		end)
	end
	
	function p4.canvasPositionChange(p8) --[[ line: 216 ]]
		-- upvalues: fFlagLuaAppPlayButtonContextualMessageImpression (copy), p4 (ref), getPlatformConfigModule (copy), deviceType (copy)
		if fFlagLuaAppPlayButtonContextualMessageImpression then
			p4.scrollViewPositionChangedSignal:fire()
		end
		p4.scrolled = true
		p4:setState(function(p9, p10) --[[ line: 222 ]]
			-- upvalues: getPlatformConfigModule (copy), p8 (ref), p4 (copy), deviceType (copy)
			local var14 = p9.backgroundHeight - (if p10.headerBarBackgroundHeight then p10.headerBarBackgroundHeight else getPlatformConfigModule(p10.deviceType).headerBarBackgroundHeight * p10.foundationTokens.Stroke.Standard)
			local var15 = math.max(0, var14 - p8.CanvasPosition.Y) / 2
			
			return if var14 < p8.CanvasPosition.Y then if p9.showStickyActionTopBar == false and p4.props.deviceType ~= deviceType.Phone and not p4.props.disableStickyActionBar then { showStickyActionTopBar = true } else nil elseif p9.showStickyActionTopBar == true then {
				showStickyActionTopBar = false,
				backgroundComponentPosition = var15
			} else { backgroundComponentPosition = var15 }
		end)
	end
end

function detailsPageTemplate.render(p11) --[[ line: 259 ]]
	-- upvalues: deviceType (ref), getPlatformConfigModule (ref), fFlagLuaAppFixSDPLayout (ref), withStyle (ref), getIconSize (ref), iconSize (ref), roactModule (ref), getIconSizeUDim2 (ref), reactModule (ref), fFlagLuaAppAddTestIdsForArrow (ref), getTestId (ref), iconButton (ref), images (ref), loadableImage (ref), luaAppDisableStickyBarMediaGallery (ref), stickyActionBarModule (ref), verticalScrollView (ref), detailsPageHeaderModule (ref), fFlagLuaAppFixDetailsPageThumbnailRenderInPhone (ref), fFlagLuaAppPlayButtonContextualMessageImpression (ref), detailsPageBodyModule (ref), actionBar (ref)
	local headerPadding
	local var16 = p11.props.deviceType == deviceType.Phone
	local var17 = getPlatformConfigModule(p11.props.deviceType)
	local var18 = if p11.props.thumbnailHeight then p11.props.thumbnailHeight else var17.thumbnailHeight * p11.props.foundationTokens.Stroke.Standard
	local var19 = if p11.props.headerBarBackgroundHeight then p11.props.headerBarBackgroundHeight else var17.headerBarBackgroundHeight * p11.props.foundationTokens.Stroke.Standard
	local var20 = if p11.props.sideMargin then p11.props.sideMargin else var17.sideMargin
	local var21 = if p11.props.dualPanelBreakpoint then p11.props.dualPanelBreakpoint else var17.dualPanelBreakpoint
	
	if fFlagLuaAppFixSDPLayout then
		headerPadding = p11.props.headerPadding
		
		if not headerPadding then
			local props = p11.props
			headerPadding = p11.state.backgroundHeight - (if props.headerBarBackgroundHeight then props.headerBarBackgroundHeight else getPlatformConfigModule(props.deviceType).headerBarBackgroundHeight * props.foundationTokens.Stroke.Standard)
		end
		local backgroundComponentPosition = p11.state.backgroundComponentPosition
		local containerSize = p11.state.containerSize
		local renderFullscreenContent = p11.props.renderFullscreenContent
		local var22 = if var16 or not p11.props.isFullscreen or not renderFullscreenContent then false else true
		
		return withStyle(function(p12) --[[ line: 283 ]]
			-- upvalues: p11 (ref), var16 (ref), getIconSize (copy), iconSize (copy), var19 (ref), roactModule (copy), getIconSizeUDim2 (copy), reactModule (copy), fFlagLuaAppAddTestIdsForArrow (copy), getTestId (copy), iconButton (copy), var22 (ref), images (copy), loadableImage (copy), backgroundComponentPosition (ref), fFlagLuaAppFixSDPLayout (copy), containerSize (ref), luaAppDisableStickyBarMediaGallery (copy), stickyActionBarModule (copy), verticalScrollView (copy), headerPadding (ref), detailsPageHeaderModule (copy), var18 (ref), fFlagLuaAppFixDetailsPageThumbnailRenderInPhone (copy), var20 (ref), fFlagLuaAppPlayButtonContextualMessageImpression (copy), detailsPageBodyModule (copy), var21 (ref), renderFullscreenContent (ref), actionBar (copy)
			local textButton
			local theme = p12.Theme
			local var23 = p11.props.bannerImageUrl == nil
			local bannerPlaceholderGradient = p11.props.bannerPlaceholderGradient or {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, theme.BackgroundMuted.Color),
					ColorSequenceKeypoint.new(1, theme.BackgroundUIDefault.Color)
				})
			}
			local var25 = if var16 then (getIconSize(iconSize.Large) + 22) / 2 else var19 / 2
			local actionBarProps = var16 and p11.props.actionBarProps
			local createElement = roactModule.createElement
			local var27 = "TextButton"
			local t = {
				Text = "",
				Selectable = false,
				AutoButtonColor = false,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = theme.BackgroundDefault.Color,
				BackgroundTransparency = theme.BackgroundDefault.Transparency,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				[roactModule.Ref] = if p11.props.containerRef then p11.props.containerRef else p11.containerRef,
				[roactModule.Change.AbsoluteSize] = p11.onContainerSizeChange
			}
			local t_1 = {
				CloseButtonFrame = if not p11.props.hideCloseButton then roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = getIconSizeUDim2(iconSize.Large),
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 22, 0, var25),
					ZIndex = 2,
					[reactModule.Tag] = if fFlagLuaAppAddTestIdsForArrow then getTestId("details-close-button") else nil
				}, {
					CloseButton = roactModule.createElement(iconButton, {
						size = UDim2.fromScale(1, 1),
						icon = if var22 then images["icons/navigation/pushBack"] else images["icons/navigation/close"],
						iconColor3 = p12.Theme.UIEmphasis.Color,
						iconSize = iconSize.Medium,
						onActivated = p11.props.onClose,
						showBackground = p11.state.showStickyActionTopBar == false,
						backgroundColor = p12.Theme.BackgroundUIDefault
					})
				}) else nil,
				BackgroundDetailsFrame = roactModule.createElement("Frame", {
					BackgroundColor3 = theme.BackgroundMuted.Color,
					BackgroundTransparency = theme.BackgroundMuted.Transparency,
					Size = if p11.props.backgroundFrameSize then p11.props.backgroundFrameSize else UDim2.fromScale(1, 1),
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.fromScale(0.5, 0),
					[roactModule.Change.AbsoluteSize] = p11.onBackgroundComponentFrameSizeChange
				}, {
					GradientPlaceholder = var23 and roactModule.createElement("UIGradient", bannerPlaceholderGradient) or nil,
					UIAspectRatioConstraint = if var23 or p11.props.disableBackgroundAspectRatio then nil else roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1.777777777778 }),
					BackgroundImage = var23 == false and (roactModule.createElement(loadableImage, {
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0, backgroundComponentPosition),
						Size = if fFlagLuaAppFixSDPLayout then p11.props.backgroundImageSize else UDim2.new(0, containerSize.x, 1, 0),
						Image = p11.props.bannerImageUrl,
						ScaleType = Enum.ScaleType.Crop,
						BackgroundTransparency = p11.props.backgroundImageTransparency
					}) or nil)
				})
			}
			
			if not p11.state.showStickyActionTopBar then
				textButton = (if luaAppDisableStickyBarMediaGallery then var22 and not p11.props.disableStickyActionBar else var22) and (roactModule.createElement("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, var19),
					BackgroundColor3 = theme.BackgroundUIDefault.Color,
					BackgroundTransparency = theme.BackgroundUIDefault.Transparency
				}, {
					StickyActionBar = roactModule.createElement(stickyActionBarModule, {
						actionBarProps = p11.props.actionBarProps,
						actionBarWidth = p11.props.actionBarWidth,
						infoProps = {
							icon = p11.props.thumbnailImageUrl,
							title = p11.props.titleText
						}
					})
				}) or nil)
			end
			t_1.StickyActionBarFrame = textButton
			t_1.ContentScrollingFrame = roactModule.createElement(verticalScrollView, {
				size = UDim2.fromScale(1, 1),
				canvasSizeY = UDim.new(1, 0),
				useAutomaticCanvasSize = true,
				scrollingEnabled = not p11.props.disableScrollingForFocusNav and not var22,
				[roactModule.Change.CanvasPosition] = p11.canvasPositionChange,
				scrollingFrameRef = p11.scrollingFrameRef,
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
						Size = UDim2.new(1, 0, 0, var19)
					}, {
						DetailsPageHeader = roactModule.createElement(detailsPageHeaderModule, {
							thumbnailImageUrl = p11.props.thumbnailImageUrl,
							thumbnailAspectRatio = p11.props.thumbnailAspectRatio,
							thumbnailHeight = var18,
							thumbnailShadowHeight = if fFlagLuaAppFixDetailsPageThumbnailRenderInPhone then p11.props.thumbnailShadowHeight else nil,
							titleText = p11.props.titleText,
							subTitleText = p11.props.subTitleText,
							actionBarLabelText = p11.props.actionBarLabelText,
							renderInfoContent = p11.props.renderInfoContent,
							renderCustomHeader = p11.props.renderCustomHeader,
							actionBarProps = if p11.state.showStickyActionTopBar or (if luaAppDisableStickyBarMediaGallery then not p11.props.disableStickyActionBar and var22 else var22) then nil else p11.props.actionBarProps,
							actionBarWidth = p11.props.actionBarWidth,
							actionBarHeight = p11.props.actionBarHeight,
							headerBarBackgroundHeight = var19,
							sideMargin = var20,
							maxContentWidth = p11.props.maxContentWidth,
							deviceType = p11.props.deviceType,
							gradientHeight = p11.props.gradientHeight,
							renderActionBarLabelImpressionsDetector = if fFlagLuaAppPlayButtonContextualMessageImpression then p11.props.renderActionBarLabelImpressionsDetector else nil,
							scrollViewPositionChangedSignal = if fFlagLuaAppPlayButtonContextualMessageImpression then p11.scrollViewPositionChangedSignal else nil
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
							Size = if fFlagLuaAppFixSDPLayout then p11.props.bodyContainerSafeAreaSize else UDim2.fromOffset(math.min(containerSize.x, containerSize.y * 1.777777777778), 0),
							AnchorPoint = Vector2.new(0.5, 0),
							Position = UDim2.fromScale(0.5, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							DetailsPageBody = roactModule.createElement(detailsPageBodyModule, {
								bottomPadding = 100,
								titleText = p11.props.titleText,
								subTitleText = p11.props.subTitleText,
								renderInfoContent = p11.props.renderInfoContent,
								bodyClipsDescendants = p11.props.bodyClipsDescendants,
								componentList = p11.props.componentList,
								dualPanelBreakpoint = var21,
								sideMargin = var20,
								maxContentWidth = p11.props.maxContentWidth,
								deviceType = p11.props.deviceType,
								showPageDetails = var16 and p11.props.renderCustomHeader == nil
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
			t_1.FullscreenFrame = var22 and roactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
				ClipsDescendants = true,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, -var19),
				Position = UDim2.fromOffset(0, var19)
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
					button = p11.props.actionBarProps.button,
					icons = p11.props.actionBarProps.icons
				})
			})
			
			return createElement(var27, t, t_1)
		end)
	end
end

function detailsPageTemplate.didMount(p13) --[[ line: 539 ]]
	if p13.containerRef.current then
		p13.onContainerSizeChange(p13.containerRef.current)
	end
end

function detailsPageTemplate.didUpdate(p14) --[[ line: 545 ]]
	-- upvalues: getPlatformConfigModule (ref)
	local var31 = getPlatformConfigModule(p14.props.deviceType)
	
	if p14.scrolled == false and p14.scrollingFrameRef.current then
		local props = p14.props
		p14.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, math.max(0, p14.state.backgroundHeight - (if props.headerBarBackgroundHeight then props.headerBarBackgroundHeight else getPlatformConfigModule(props.deviceType).headerBarBackgroundHeight * props.foundationTokens.Stroke.Standard) - (if p14.props.startingOffsetPosition then p14.props.startingOffsetPosition else var31.startingOffsetPosition)))
	end
end

return function(p15) --[[ line: 559 ]]
	-- upvalues: reactModule (ref), useAnimateScrollViewToSelectionModule (ref), useTokens (ref), useLastInputMode (ref), detailsPageTemplate (ref), cryoModule (ref)
	local var32 = reactModule.useRef(nil)
	useAnimateScrollViewToSelectionModule(var32, 0.4)
	
	return reactModule.createElement(detailsPageTemplate, cryoModule.Dictionary.join(p15, {
		foundationTokens = useTokens(),
		scrollingFrameRef = var32,
		disableScrollingForFocusNav = useLastInputMode() ~= "Cursor"
	}))
end