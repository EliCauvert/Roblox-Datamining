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
local fFlagLuaAppPlayButtonContextualMessageImpression = require(parent.SharedFlags).FFlagLuaAppPlayButtonContextualMessageImpression
local t = {
	itemPadding = 36,
	trailingWhitespace = 3000,
	animationConfig = { dampingRatio = 1, frequency = 3 },
	safeAreaSize = Vector2.new(96, 144)
}

return function(p0) --[[ line: 161 | named "DetailsPageTenfootTemplate" ]]
	-- upvalues: t (ref), cryoModule (ref), reactModule (ref), getPlatformConfigModule (ref), fFlagLuaAppPlayButtonContextualMessageImpression (ref), signal (ref), useAnimateFullscreenModule (ref), detailsPageHeaderModule (ref), useDetailsPageRenderItemsModule (ref), detailsPageRenderItemModule (ref), fFlagExtendScrollingFramesBySafeInsets (ref), useSignalState (ref), displayModule (ref), fFlagEnableLeftNavOnConsole (ref), fullscreenFrameModule (ref), loadableImage (ref), overlay (ref), animatedFlatList (ref), fixConsoleEDPDirectionalNavigation (ref)
	local var13 = t
	
	if p0.tokens then
		var13 = cryoModule.Dictionary.join(var13, p0.tokens)
	end
	local var14, var15 = reactModule.useState(true)
	local var16 = reactModule.useMemo(function() --[[ line: 172 ]]
		-- upvalues: getPlatformConfigModule (copy), p0 (ref)
		return getPlatformConfigModule(p0.deviceType)
	end, { p0.deviceType })
	local var17 = reactModule.useRef(nil)
	local var18, var19 = reactModule.useState(Vector2.new(0, 0))
	local var20 = reactModule.useCallback(function(p1) --[[ line: 178 ]]
		-- upvalues: var19 (ref)
		var19(p1.AbsoluteSize)
	end, {})
	reactModule.useEffect(function() --[[ line: 181 ]]
		-- upvalues: var17 (ref), var19 (ref)
		if var17.current then
			var19(var17.current.AbsoluteSize)
		end
	end, {})
	local var21 = if p0.thumbnailHeight then p0.thumbnailHeight else var16.thumbnailHeight
	local var22 = if p0.headerBarBackgroundHeight ~= nil then var16.headerBarBackgroundHeight else p0.headerBarBackgroundHeight
	local var23 = if p0.sideMargin then p0.sideMargin else var16.sideMargin
	local var24 = if fFlagLuaAppPlayButtonContextualMessageImpression then reactModule.useMemo(function() --[[ line: 194 ]]
		-- upvalues: signal (copy)
		return signal.new()
	end, {}) else nil
	local renderFullscreenContent = p0.renderFullscreenContent
	local var25, var26 = useAnimateFullscreenModule(if p0.isFullscreen == nil then false else p0.isFullscreen, renderFullscreenContent, var13.animationConfig)
	local var27 = useDetailsPageRenderItemsModule(p0.componentList, reactModule.useMemo(function() --[[ line: 207 ]]
		-- upvalues: reactModule (copy), detailsPageHeaderModule (copy), p0 (ref), var21 (ref), fFlagLuaAppPlayButtonContextualMessageImpression (copy), var24 (ref), var23 (ref), var22 (ref), var13 (write)
		return reactModule.createElement(detailsPageHeaderModule, {
			thumbnailImageUrl = p0.thumbnailImageUrl,
			thumbnailAspectRatio = p0.thumbnailAspectRatio,
			thumbnailHeight = var21,
			titleText = p0.titleText,
			subTitleText = p0.subTitleText,
			actionBarLabelText = p0.actionBarLabelText,
			renderActionBarLabelImpressionsDetector = if fFlagLuaAppPlayButtonContextualMessageImpression then p0.renderActionBarLabelImpressionsDetector else nil,
			scrollViewPositionChangedSignal = if fFlagLuaAppPlayButtonContextualMessageImpression then var24 else nil,
			renderInfoContent = p0.renderInfoContent,
			actionBarProps = p0.actionBarProps,
			sideMargin = var23,
			headerBarBackgroundHeight = var22,
			deviceType = p0.deviceType,
			thumbnailShadowHeight = var13.thumbnailShadowHeight,
			gradientHeight = var13.headerGradientHeight,
			actionBarHeight = var13.actionBarHeight,
			actionBarWidth = var13.actionBarWidth,
			itemPadding = var13.thumbnailMargin,
			bottomMargin = var13.headerBottomMargin
		})
	end, {
		p0.thumbnailImageUrl, p0.thumbnailAspectRatio, var21, p0.titleText,
		p0.subTitleText,
		if fFlagLuaAppPlayButtonContextualMessageImpression then p0.actionBarLabelText else nil,
		p0.renderInfoContent, p0.actionBarProps, var23, var22, p0.deviceType,
		var13.thumbnailShadowHeight, var13.headerGradientHeight, var13.thumbnailMargin,
		var13.headerBottomMargin,
		if fFlagLuaAppPlayButtonContextualMessageImpression then var13.actionBarHeight else nil,
		if fFlagLuaAppPlayButtonContextualMessageImpression then var13.actionBarWidth else nil,
		if fFlagLuaAppPlayButtonContextualMessageImpression then p0.renderActionBarLabelImpressionsDetector else nil,
		if fFlagLuaAppPlayButtonContextualMessageImpression then var24 else nil
	}), var18, var13.safeAreaSize)
	local var28 = if fFlagExtendScrollingFramesBySafeInsets then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return reactModule.createElement(if fFlagEnableLeftNavOnConsole then fullscreenFrameModule else "Frame", {
		[reactModule.Change.AbsoluteSize] = var20,
		Size = if fFlagEnableLeftNavOnConsole then nil else UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ref = var17
	}, {
		BackgroundImage = reactModule.createElement("Frame", {
			ZIndex = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			BackgroundImage = reactModule.createElement(loadableImage, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, 0, 1, 0),
				Image = p0.bannerImageUrl,
				ScaleType = Enum.ScaleType.Crop
			})
		}),
		Overlay = reactModule.createElement(overlay, {
			ZIndex = 2,
			gradientDirection = "topRight",
			showGradient = var14
		}),
		Content = reactModule.createElement(animatedFlatList, {
			animated = true,
			UNSTABLE_forceSiblingLayoutUpdate = true,
			onSelectedIndexChanged = reactModule.useCallback(function(p2) --[[ line: 280 ]]
				-- upvalues: fFlagLuaAppPlayButtonContextualMessageImpression (copy), var24 (ref), var27 (ref), var15 (ref)
				if fFlagLuaAppPlayButtonContextualMessageImpression then
					var24:fire()
				end
				if var27[p2].showCornerGradient == false then
					var15(false)
					
					return
				end
				var15(true)
			end, {
				var27,
				if fFlagLuaAppPlayButtonContextualMessageImpression then var24 else nil
			}),
			initialNumToRender = #var27,
			data = var27,
			renderItem = reactModule.useCallback(function(p3) --[[ line: 263 ]]
				-- upvalues: reactModule (copy), detailsPageRenderItemModule (copy), var13 (write)
				return reactModule.createElement(detailsPageRenderItemModule, {
					item = p3.item,
					itemPadding = var13.itemPadding,
					safeArea = var13.safeAreaSize
				})
			end, { var13.itemPadding, var13.safeAreaSize }),
			ItemSeparatorComponent = reactModule.useCallback(function() --[[ line: 271 ]]
				-- upvalues: reactModule (copy), var13 (write)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, var13.itemPadding)
				})
			end, { var13.itemPadding }),
			ListFooterComponent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, var13.trailingWhitespace)
			}),
			ListHeaderComponent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, var13.safeAreaSize.Y)
			}),
			viewOffset = var13.safeAreaSize.Y,
			contentContainerStyle = { BackgroundTransparency = 1 },
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ScrollingEnabled = true,
				Selectable = false,
				ZIndex = 3,
				Position = if fFlagEnableLeftNavOnConsole then UDim2.fromOffset(0, -var28.top) else nil,
				Size = if fFlagExtendScrollingFramesBySafeInsets or fFlagEnableLeftNavOnConsole then UDim2.new(1, 0, 1, var28.top + var28.bottom) else nil,
				VerticalScrollBarInset = Enum.ScrollBarInset.None
			},
			animationConfig = var13.animationConfig,
			overrideAutomaticCanvasSize = if fFlagEnableLeftNavOnConsole then false else true,
			isSequentiallySelectable = if fixConsoleEDPDirectionalNavigation then true else nil
		}),
		Fullscreen = reactModule.createElement("CanvasGroup", {
			BorderSizePixel = 0,
			ZIndex = 4,
			Size = UDim2.fromScale(1, 1),
			GroupTransparency = var26
		}, {
			FullscreenContent = if var25 then renderFullscreenContent() else nil
		})
	})
end