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

return function(p1)
	-- upvalues: t (ref), cryoModule (ref), reactModule (ref), getPlatformConfigModule (ref), signal (ref), useAnimateFullscreenModule (ref), detailsPageHeaderModule (ref), useDetailsPageRenderItemsModule (ref), detailsPageRenderItemModule (ref), fixDeviceSafePaddingAccess (ref), fFlagEnableLeftNavOnConsole (ref), fFlagExtendScrollingFramesBySafeInsets (ref), useSignalState (ref), displayModule (ref), fullscreenFrameModule (ref), fFlagLuaAppEdpConsoleMediaGalleryVideo (ref), loadableImage (ref), overlay (ref), animatedFlatList (ref), fixConsoleEDPDirectionalNavigation (ref)
	local var1 = t
	
	if p1.tokens then
		var1 = cryoModule.Dictionary.join(var1, p1.tokens)
	end
	local var2, var3 = reactModule.useState(true)
	local var4 = reactModule.useMemo(function()
		-- upvalues: getPlatformConfigModule (copy), p1 (ref)
		return getPlatformConfigModule(p1.deviceType)
	end, { p1.deviceType })
	local var5 = reactModule.useRef(nil)
	local var6, var7 = reactModule.useState(Vector2.new(0, 0))
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7(p2.AbsoluteSize)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var7 (ref)
		if var5.current then
			var7(var5.current.AbsoluteSize)
		end
	end, {})
	local var9 = if p1.thumbnailHeight then p1.thumbnailHeight else var4.thumbnailHeight
	local var10 = if p1.headerBarBackgroundHeight ~= nil then var4.headerBarBackgroundHeight else p1.headerBarBackgroundHeight
	local var11 = if p1.sideMargin then p1.sideMargin else var4.sideMargin
	local var12 = reactModule.useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local renderFullscreenContent = p1.renderFullscreenContent
	local var13, var14 = useAnimateFullscreenModule(if p1.isFullscreen == nil then false else p1.isFullscreen, renderFullscreenContent, var1.animationConfig)
	local var15 = useDetailsPageRenderItemsModule(p1.componentList, reactModule.useMemo(function()
		-- upvalues: reactModule (copy), detailsPageHeaderModule (copy), p1 (ref), var9 (ref), var12 (ref), var11 (ref), var10 (ref), var1 (write)
		return reactModule.createElement(detailsPageHeaderModule, {
			thumbnailImageUrl = p1.thumbnailImageUrl,
			thumbnailAspectRatio = p1.thumbnailAspectRatio,
			thumbnailHeight = var9,
			titleText = p1.titleText,
			subTitleText = p1.subTitleText,
			actionBarLabelText = p1.actionBarLabelText,
			renderActionBarLabelImpressionsDetector = p1.renderActionBarLabelImpressionsDetector,
			scrollViewPositionChangedSignal = var12,
			renderInfoContent = p1.renderInfoContent,
			actionBarProps = p1.actionBarProps,
			sideMargin = var11,
			headerBarBackgroundHeight = var10,
			deviceType = p1.deviceType,
			thumbnailShadowHeight = var1.thumbnailShadowHeight,
			gradientHeight = var1.headerGradientHeight,
			actionBarHeight = var1.actionBarHeight,
			actionBarWidth = p1.actionBarWidth or var1.actionBarWidth,
			itemPadding = var1.thumbnailMargin,
			bottomMargin = var1.headerBottomMargin
		})
	end, {
		p1.thumbnailImageUrl, p1.thumbnailAspectRatio, var9, p1.titleText,
		p1.subTitleText, p1.actionBarLabelText, p1.renderInfoContent,
		p1.actionBarProps, var11, var10, p1.deviceType, var1.thumbnailShadowHeight,
		var1.headerGradientHeight, var1.thumbnailMargin, var1.headerBottomMargin,
		var1.actionBarHeight, var1.actionBarWidth, p1.actionBarWidth,
		p1.renderActionBarLabelImpressionsDetector, var12
	}), var6, var1.safeAreaSize)
	local var16 = if not fixDeviceSafePaddingAccess then if fFlagEnableLeftNavOnConsole or fFlagExtendScrollingFramesBySafeInsets then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil elseif fFlagExtendScrollingFramesBySafeInsets then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return reactModule.createElement(if fFlagEnableLeftNavOnConsole then fullscreenFrameModule else "Frame", {
		[reactModule.Change.AbsoluteSize] = var8,
		Size = if fFlagEnableLeftNavOnConsole then nil else UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ref = var5
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
				Image = p1.bannerImageUrl,
				ScaleType = Enum.ScaleType.Crop
			}),
			BackgroundContent = if fFlagLuaAppEdpConsoleMediaGalleryVideo then if p1.backgroundContentOverride then p1.backgroundContentOverride else reactModule.createElement(loadableImage, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, 0, 1, 0),
				Image = p1.bannerImageUrl,
				ScaleType = Enum.ScaleType.Crop
			}) else nil
		}),
		Overlay = reactModule.createElement(overlay, {
			ZIndex = 2,
			gradientDirection = "topRight",
			showGradient = var2
		}),
		Content = reactModule.createElement(animatedFlatList, {
			animated = true,
			UNSTABLE_forceSiblingLayoutUpdate = true,
			onSelectedIndexChanged = reactModule.useCallback(function(p2)
				-- upvalues: var12 (ref), var15 (ref), var3 (ref)
				var12:fire()
				
				if var15[p2].showCornerGradient == false then
					var3(false)
					
					return
				end
				var3(true)
			end, { var15, var12 }),
			initialNumToRender = #var15,
			data = var15,
			renderItem = reactModule.useCallback(function(p2)
				-- upvalues: reactModule (copy), detailsPageRenderItemModule (copy), var1 (write)
				return reactModule.createElement(detailsPageRenderItemModule, {
					item = p2.item,
					itemPadding = var1.itemPadding,
					safeArea = var1.safeAreaSize
				})
			end, { var1.itemPadding, var1.safeAreaSize }),
			ItemSeparatorComponent = reactModule.useCallback(function()
				-- upvalues: reactModule (copy), var1 (write)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, var1.itemPadding)
				})
			end, { var1.itemPadding }),
			ListFooterComponent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, var1.trailingWhitespace)
			}),
			ListHeaderComponent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, var1.safeAreaSize.Y)
			}),
			viewOffset = var1.safeAreaSize.Y,
			contentContainerStyle = { BackgroundTransparency = 1 },
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ScrollingEnabled = true,
				Selectable = false,
				ZIndex = 3,
				Position = if fFlagEnableLeftNavOnConsole then UDim2.fromOffset(0, -var16.top) else nil,
				Size = if fFlagExtendScrollingFramesBySafeInsets or fFlagEnableLeftNavOnConsole then UDim2.new(1, 0, 1, var16.top + var16.bottom) else nil,
				VerticalScrollBarInset = Enum.ScrollBarInset.None
			},
			animationConfig = var1.animationConfig,
			overrideAutomaticCanvasSize = if fFlagEnableLeftNavOnConsole then false else true,
			isSequentiallySelectable = if fixConsoleEDPDirectionalNavigation then true else nil
		}),
		Fullscreen = reactModule.createElement("CanvasGroup", {
			BorderSizePixel = 0,
			ZIndex = 4,
			Size = UDim2.fromScale(1, 1),
			GroupTransparency = var14
		}, {
			FullscreenContent = if var13 then renderFullscreenContent() else nil
		})
	})
end