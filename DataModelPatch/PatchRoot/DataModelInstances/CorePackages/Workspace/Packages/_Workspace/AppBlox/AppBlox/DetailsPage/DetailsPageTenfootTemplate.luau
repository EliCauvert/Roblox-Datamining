local AppBlox = script:FindFirstAncestor("AppBlox")
local Parent = AppBlox.Parent
local CryoModule = require(Parent.Cryo)
local AnimatedFlatList = require(Parent.VirtualizedList).AnimatedFlatList
local DetailsPageHeaderModule = require(script.Parent.DetailsPageHeader)
local GetPlatformConfigModule = require(script.Parent.getPlatformConfig)
local UseDetailsPageRenderItemsModule = require(script.Parent.Hooks.useDetailsPageRenderItems)
local UseAnimateFullscreenModule = require(script.Parent.Hooks.useAnimateFullscreen)
local DetailsPageRenderItemModule = require(script.Parent.DetailsPageRenderItem)
local DisplayModule = require(Parent.Display)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FullscreenFrameModule = require(AppBlox.FullscreenFrame)
local Signal = require(Parent.AppCommonLib).Signal
local UIBloxModule = require(Parent.UIBlox)
local Overlay = UIBloxModule.App.Dialog.Overlay
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local _ = require(Parent.RobloxAppEnums)
local _ = require(Parent.ReactOtter)
local _ = require(script.Parent.Types)
local ReactModule = require(Parent.React)
local FFlagExtendScrollingFramesBySafeInsets = require(Parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets
local FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole
local FixConsoleEDPDirectionalNavigation = game:DefineFastFlag("FixConsoleEDPDirectionalNavigation", false)
local FFlagLuaAppEdpConsoleMediaGalleryVideo = require(Parent.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local config = {
	itemPadding = 36,
	trailingWhitespace = 3000,
	animationConfig = { dampingRatio = 1, frequency = 3 },
	safeAreaSize = Vector2.new(96, 144)
}

return function(p1)
	-- upvalues: config (copy), CryoModule (copy), ReactModule (copy), GetPlatformConfigModule (copy), Signal (copy), UseAnimateFullscreenModule (copy), DetailsPageHeaderModule (copy), UseDetailsPageRenderItemsModule (copy), DetailsPageRenderItemModule (copy), FFlagExtendScrollingFramesBySafeInsets (copy), UseSignalStateFunction (copy), DisplayModule (copy), FFlagEnableLeftNavOnConsole (copy), FullscreenFrameModule (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), LoadableImage (copy), Overlay (copy), AnimatedFlatList (copy), FixConsoleEDPDirectionalNavigation (copy)
	local JoinResult = config
	
	if p1.tokens then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p1.tokens)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetPlatformConfigModule (upval), p1 (copy)
		return GetPlatformConfigModule(p1.deviceType)
	end, { p1.deviceType })
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
		if UseRefResult.current then
			UseStateResult2_1(UseRefResult.current.AbsoluteSize)
		end
	end, {})
	local ThumbnailHeight = if p1.thumbnailHeight then p1.thumbnailHeight else UseMemoResult.thumbnailHeight
	local HeaderBarBackgroundHeight = if p1.headerBarBackgroundHeight == nil then UseMemoResult.headerBarBackgroundHeight else p1.headerBarBackgroundHeight
	local SideMargin = if p1.sideMargin then p1.sideMargin else UseMemoResult.sideMargin
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local RenderFullscreenContentFunction = p1.renderFullscreenContent
	local UseAnimateFullscreenModuleResult, UseAnimateFullscreenModuleResult2 = UseAnimateFullscreenModule(p1.isFullscreen ~= nil and p1.isFullscreen, RenderFullscreenContentFunction, JoinResult.animationConfig)
	local UseDetailsPageRenderItemsModuleResult = UseDetailsPageRenderItemsModule(p1.componentList, ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), DetailsPageHeaderModule (upval), p1 (copy), ThumbnailHeight (copy), UseMemoResult1 (copy), SideMargin (copy), HeaderBarBackgroundHeight (copy), JoinResult (ref)
		return ReactModule.createElement(DetailsPageHeaderModule, {
			thumbnailImageUrl = p1.thumbnailImageUrl,
			thumbnailAspectRatio = p1.thumbnailAspectRatio,
			thumbnailHeight = ThumbnailHeight,
			titleText = p1.titleText,
			subTitleText = p1.subTitleText,
			actionBarLabelText = p1.actionBarLabelText,
			renderActionBarLabelImpressionsDetector = p1.renderActionBarLabelImpressionsDetector,
			scrollViewPositionChangedSignal = UseMemoResult1,
			renderInfoContent = p1.renderInfoContent,
			actionBarProps = p1.actionBarProps,
			sideMargin = SideMargin,
			headerBarBackgroundHeight = HeaderBarBackgroundHeight,
			deviceType = p1.deviceType,
			thumbnailShadowHeight = JoinResult.thumbnailShadowHeight,
			gradientHeight = JoinResult.headerGradientHeight,
			actionBarHeight = JoinResult.actionBarHeight,
			actionBarWidth = JoinResult.actionBarWidth,
			itemPadding = JoinResult.thumbnailMargin,
			bottomMargin = JoinResult.headerBottomMargin
		})
	end, {
		p1.thumbnailImageUrl, p1.thumbnailAspectRatio, ThumbnailHeight, p1.titleText,
		p1.subTitleText, p1.actionBarLabelText, p1.renderInfoContent,
		p1.actionBarProps, SideMargin, HeaderBarBackgroundHeight, p1.deviceType,
		JoinResult.thumbnailShadowHeight, JoinResult.headerGradientHeight,
		JoinResult.thumbnailMargin, JoinResult.headerBottomMargin,
		JoinResult.actionBarHeight, JoinResult.actionBarWidth,
		p1.renderActionBarLabelImpressionsDetector, UseMemoResult1
	}), UseStateResult1, JoinResult.safeAreaSize)
	local UseSignalStateResult = if FFlagExtendScrollingFramesBySafeInsets then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return ReactModule.createElement(if FFlagEnableLeftNavOnConsole then FullscreenFrameModule else "Frame", {
		[ReactModule.Change.AbsoluteSize] = UseResult,
		Size = if FFlagEnableLeftNavOnConsole then nil else UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ref = UseRefResult
	}, {
		BackgroundImage = ReactModule.createElement("Frame", {
			ZIndex = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			BackgroundImage = if FFlagLuaAppEdpConsoleMediaGalleryVideo then nil else ReactModule.createElement(LoadableImage, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, 0, 1, 0),
				Image = p1.bannerImageUrl,
				ScaleType = Enum.ScaleType.Crop
			}),
			BackgroundContent = if FFlagLuaAppEdpConsoleMediaGalleryVideo then if p1.backgroundContentOverride then p1.backgroundContentOverride else ReactModule.createElement(LoadableImage, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, 0, 1, 0),
				Image = p1.bannerImageUrl,
				ScaleType = Enum.ScaleType.Crop
			}) else nil
		}),
		Overlay = ReactModule.createElement(Overlay, {
			ZIndex = 2,
			gradientDirection = "topRight",
			showGradient = UseStateResult
		}),
		Content = ReactModule.createElement(AnimatedFlatList, {
			animated = true,
			UNSTABLE_forceSiblingLayoutUpdate = true,
			onSelectedIndexChanged = ReactModule.useCallback(function(p2)
				-- upvalues: UseMemoResult1 (copy), UseDetailsPageRenderItemsModuleResult (copy), UseStateResult2 (copy)
				UseMemoResult1:fire()
				
				if UseDetailsPageRenderItemsModuleResult[p2].showCornerGradient == false then
					UseStateResult2(false)
					
					return
				else
					UseStateResult2(true)
				end
			end, { UseDetailsPageRenderItemsModuleResult, UseMemoResult1 }),
			initialNumToRender = #UseDetailsPageRenderItemsModuleResult,
			data = UseDetailsPageRenderItemsModuleResult,
			renderItem = ReactModule.useCallback(function(p2)
				-- upvalues: ReactModule (upval), DetailsPageRenderItemModule (upval), JoinResult (ref)
				return ReactModule.createElement(DetailsPageRenderItemModule, {
					item = p2.item,
					itemPadding = JoinResult.itemPadding,
					safeArea = JoinResult.safeAreaSize
				})
			end, { JoinResult.itemPadding, JoinResult.safeAreaSize }),
			ItemSeparatorComponent = ReactModule.useCallback(function()
				-- upvalues: ReactModule (upval), JoinResult (ref)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, JoinResult.itemPadding)
				})
			end, { JoinResult.itemPadding }),
			ListFooterComponent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, JoinResult.trailingWhitespace)
			}),
			ListHeaderComponent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, JoinResult.safeAreaSize.Y)
			}),
			viewOffset = JoinResult.safeAreaSize.Y,
			contentContainerStyle = { BackgroundTransparency = 1 },
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ScrollingEnabled = true,
				Selectable = false,
				ZIndex = 3,
				Position = if FFlagEnableLeftNavOnConsole then UDim2.fromOffset(0, -UseSignalStateResult.top) else nil,
				Size = if FFlagExtendScrollingFramesBySafeInsets or FFlagEnableLeftNavOnConsole then UDim2.new(1, 0, 1, UseSignalStateResult.top + UseSignalStateResult.bottom) else nil,
				VerticalScrollBarInset = Enum.ScrollBarInset.None
			},
			animationConfig = JoinResult.animationConfig,
			overrideAutomaticCanvasSize = not FFlagEnableLeftNavOnConsole,
			isSequentiallySelectable = if FixConsoleEDPDirectionalNavigation then true else nil
		}),
		Fullscreen = ReactModule.createElement("CanvasGroup", {
			BorderSizePixel = 0,
			ZIndex = 4,
			Size = UDim2.fromScale(1, 1),
			GroupTransparency = UseAnimateFullscreenModuleResult2
		}, {
			FullscreenContent = if UseAnimateFullscreenModuleResult then RenderFullscreenContentFunction() else nil
		})
	})
end