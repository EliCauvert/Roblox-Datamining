local appBlox = script:FindFirstAncestor("AppBlox")
local parent = appBlox.Parent
local cryoModule = require(parent.Cryo)
local animatedFlatList = require(parent.VirtualizedList).AnimatedFlatList
local detailsPageHeaderModule = require(script.Parent.DetailsPageHeader)
local getPlatformConfigModule = require(script.Parent.getPlatformConfig)
local useDetailsPageRenderItemsModule = require(script.Parent.Hooks.useDetailsPageRenderItems)
local useAnimateFullscreenModule = require(script.Parent.Hooks.useAnimateFullscreen)
local detailsPageRenderItemModule = require(script.Parent.DetailsPageRenderItem)
local displayModule = require(parent.Display)
local useSignalState = require(parent.SignalsReact).useSignalState
local fullscreenFrameModule = require(appBlox.FullscreenFrame)
local signal = require(parent.AppCommonLib).Signal
local UIBloxModule = require(parent.UIBlox)
local overlay = UIBloxModule.App.Dialog.Overlay
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local _ = require(parent.RobloxAppEnums)
local _ = require(parent.ReactOtter)
local _ = require(script.Parent.Types)
local reactModule = require(parent.React)
local fFlagExtendScrollingFramesBySafeInsets = require(parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets
local fFlagEnableLeftNavOnConsole = require(parent.SharedFlags).FFlagEnableLeftNavOnConsole
local fixConsoleEDPDirectionalNavigation = game:DefineFastFlag("FixConsoleEDPDirectionalNavigation", false)
local fFlagLuaAppEdpConsoleMediaGalleryVideo = require(parent.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local fixDeviceSafePaddingAccess = game:DefineFastFlag("FixDeviceSafePaddingAccess", false)
local t = {
	itemPadding = 36,
	trailingWhitespace = 3000,
	animationConfig = { dampingRatio = 1, frequency = 3 },
	safeAreaSize = Vector2.new(96, 144)
}

return function(p0)
	-- upvalues: t (ref), cryoModule (ref), reactModule (ref), getPlatformConfigModule (ref), signal (ref), useAnimateFullscreenModule (ref), detailsPageHeaderModule (ref), useDetailsPageRenderItemsModule (ref), detailsPageRenderItemModule (ref), fixDeviceSafePaddingAccess (ref), fFlagEnableLeftNavOnConsole (ref), fFlagExtendScrollingFramesBySafeInsets (ref), useSignalState (ref), displayModule (ref), fullscreenFrameModule (ref), fFlagLuaAppEdpConsoleMediaGalleryVideo (ref), loadableImage (ref), overlay (ref), animatedFlatList (ref), fixConsoleEDPDirectionalNavigation (ref)
	local var14 = t
	
	if p0.tokens then
		var14 = cryoModule.Dictionary.join(var14, p0.tokens)
	end
	local var15, var16 = reactModule.useState(true)
	local var17 = reactModule.useMemo(function()
		-- upvalues: getPlatformConfigModule (copy), p0 (ref)
		return getPlatformConfigModule(p0.deviceType)
	end, { p0.deviceType })
	local var18 = reactModule.useRef(nil)
	local var19, var20 = reactModule.useState(Vector2.new(0, 0))
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: var20 (ref)
		var20(p1.AbsoluteSize)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var20 (ref)
		if var18.current then
			var20(var18.current.AbsoluteSize)
		end
	end, {})
	local var22 = if p0.thumbnailHeight then p0.thumbnailHeight else var17.thumbnailHeight
	local var23 = if p0.headerBarBackgroundHeight ~= nil then var17.headerBarBackgroundHeight else p0.headerBarBackgroundHeight
	local var24 = if p0.sideMargin then p0.sideMargin else var17.sideMargin
	local var25 = reactModule.useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local renderFullscreenContent = p0.renderFullscreenContent
	local var26, var27 = useAnimateFullscreenModule(if p0.isFullscreen == nil then false else p0.isFullscreen, renderFullscreenContent, var14.animationConfig)
	local var28 = useDetailsPageRenderItemsModule(p0.componentList, reactModule.useMemo(function()
		-- upvalues: reactModule (copy), detailsPageHeaderModule (copy), p0 (ref), var22 (ref), var25 (ref), var24 (ref), var23 (ref), var14 (write)
		return reactModule.createElement(detailsPageHeaderModule, {
			thumbnailImageUrl = p0.thumbnailImageUrl,
			thumbnailAspectRatio = p0.thumbnailAspectRatio,
			thumbnailHeight = var22,
			titleText = p0.titleText,
			subTitleText = p0.subTitleText,
			actionBarLabelText = p0.actionBarLabelText,
			renderActionBarLabelImpressionsDetector = p0.renderActionBarLabelImpressionsDetector,
			scrollViewPositionChangedSignal = var25,
			renderInfoContent = p0.renderInfoContent,
			actionBarProps = p0.actionBarProps,
			sideMargin = var24,
			headerBarBackgroundHeight = var23,
			deviceType = p0.deviceType,
			thumbnailShadowHeight = var14.thumbnailShadowHeight,
			gradientHeight = var14.headerGradientHeight,
			actionBarHeight = var14.actionBarHeight,
			actionBarWidth = p0.actionBarWidth or var14.actionBarWidth,
			itemPadding = var14.thumbnailMargin,
			bottomMargin = var14.headerBottomMargin
		})
	end, {
		p0.thumbnailImageUrl, p0.thumbnailAspectRatio, var22, p0.titleText,
		p0.subTitleText, p0.actionBarLabelText, p0.renderInfoContent,
		p0.actionBarProps, var24, var23, p0.deviceType, var14.thumbnailShadowHeight,
		var14.headerGradientHeight, var14.thumbnailMargin, var14.headerBottomMargin,
		var14.actionBarHeight, var14.actionBarWidth, p0.actionBarWidth,
		p0.renderActionBarLabelImpressionsDetector, var25
	}), var19, var14.safeAreaSize)
	local var29 = if not fixDeviceSafePaddingAccess then if fFlagEnableLeftNavOnConsole or fFlagExtendScrollingFramesBySafeInsets then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil elseif fFlagExtendScrollingFramesBySafeInsets then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return reactModule.createElement(if fFlagEnableLeftNavOnConsole then fullscreenFrameModule else "Frame", {
		[reactModule.Change.AbsoluteSize] = var21,
		Size = if fFlagEnableLeftNavOnConsole then nil else UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ref = var18
	}, {
		BackgroundImage = reactModule.createElement("Frame", {
			ZIndex = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			BackgroundImage = if fFlagLuaAppEdpConsoleMediaGalleryVideo then nil else reactModule.createElement(loadableImage, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, 0, 1, 0),
				Image = p0.bannerImageUrl,
				ScaleType = Enum.ScaleType.Crop
			}),
			BackgroundContent = if fFlagLuaAppEdpConsoleMediaGalleryVideo then if p0.backgroundContentOverride then p0.backgroundContentOverride else reactModule.createElement(loadableImage, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, 0, 1, 0),
				Image = p0.bannerImageUrl,
				ScaleType = Enum.ScaleType.Crop
			}) else nil
		}),
		Overlay = reactModule.createElement(overlay, {
			ZIndex = 2,
			gradientDirection = "topRight",
			showGradient = var15
		}),
		Content = reactModule.createElement(animatedFlatList, {
			animated = true,
			UNSTABLE_forceSiblingLayoutUpdate = true,
			onSelectedIndexChanged = reactModule.useCallback(function(p2)
				-- upvalues: var25 (ref), var28 (ref), var16 (ref)
				var25:fire()
				
				if var28[p2].showCornerGradient == false then
					var16(false)
					
					return
				end
				var16(true)
			end, { var28, var25 }),
			initialNumToRender = #var28,
			data = var28,
			renderItem = reactModule.useCallback(function(p3)
				-- upvalues: reactModule (copy), detailsPageRenderItemModule (copy), var14 (write)
				return reactModule.createElement(detailsPageRenderItemModule, {
					item = p3.item,
					itemPadding = var14.itemPadding,
					safeArea = var14.safeAreaSize
				})
			end, { var14.itemPadding, var14.safeAreaSize }),
			ItemSeparatorComponent = reactModule.useCallback(function()
				-- upvalues: reactModule (copy), var14 (write)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, var14.itemPadding)
				})
			end, { var14.itemPadding }),
			ListFooterComponent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, var14.trailingWhitespace)
			}),
			ListHeaderComponent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, var14.safeAreaSize.Y)
			}),
			viewOffset = var14.safeAreaSize.Y,
			contentContainerStyle = { BackgroundTransparency = 1 },
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ScrollingEnabled = true,
				Selectable = false,
				ZIndex = 3,
				Position = if fFlagEnableLeftNavOnConsole then UDim2.fromOffset(0, -var29.top) else nil,
				Size = if fFlagExtendScrollingFramesBySafeInsets or fFlagEnableLeftNavOnConsole then UDim2.new(1, 0, 1, var29.top + var29.bottom) else nil,
				VerticalScrollBarInset = Enum.ScrollBarInset.None
			},
			animationConfig = var14.animationConfig,
			overrideAutomaticCanvasSize = if fFlagEnableLeftNavOnConsole then false else true,
			isSequentiallySelectable = if fixConsoleEDPDirectionalNavigation then true else nil
		}),
		Fullscreen = reactModule.createElement("CanvasGroup", {
			BorderSizePixel = 0,
			ZIndex = 4,
			Size = UDim2.fromScale(1, 1),
			GroupTransparency = var27
		}, {
			FullscreenContent = if var26 then renderFullscreenContent() else nil
		})
	})
end