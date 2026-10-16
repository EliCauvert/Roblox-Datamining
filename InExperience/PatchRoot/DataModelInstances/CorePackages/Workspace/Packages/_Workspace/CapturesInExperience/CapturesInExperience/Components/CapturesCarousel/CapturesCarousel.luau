local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local UserInputService = game:GetService("UserInputService")
local _ = require(Parent1.AppCommonLib)
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseSignalFunction = RoactUtilsModule.Hooks.useSignal
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local CarouselItemModule = require(Parent.Components.CapturesCarousel.CarouselItem)
local CarouselNavArrowModule = require(Parent.Components.CapturesCarousel.CarouselNavArrow)
local CarouselScrolledModule = require(Parent.Thunks.CarouselScrolled)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local GetClosestItemToCenterModule = require(Parent.Utils.getClosestItemToCenter)
local _ = require(Parent.Types)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseCarouselControllerModule = require(Parent.Hooks.useCarouselController)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

local function _(p1, p2) --[[ Line: 40 | Named "getMargins" ]]
	local X: number = (p2 - p1).X
	
	if X % 2 == 0 then
		local XRatio = X / 2
		
		return XRatio, XRatio
	else
		local Floored = math.floor(X / 2)
		
		return Floored + 1, Floored
	end
end

local _ = function(): boolean --[[ Line: 54 | Named "getTouchScrollingEnabled" ]]
	-- upvalues: UserInputService (copy), UserGameSettings (copy)
	local Platform = UserInputService:GetPlatform()
	local TouchEnabled = UserInputService.TouchEnabled
	local ReducedMotion = UserGameSettings.ReducedMotion
	
	return (Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android) and (TouchEnabled and not ReducedMotion)
end

return function(Frame) --[[ Line: 70 ]]
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), EventNamesModule (copy), CarouselScrolledModule (copy), UseCarouselControllerModule (copy), UseSignalFunction (copy), GetClosestItemToCenterModule (copy), CarouselItemModule (copy), FFlagUseRbxstorageInGalleryModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), UserInputService (copy), UserGameSettings (copy), CarouselNavArrowModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 77 ]]
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Captures
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1) --[[ Line: 81 ]]
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Carousel.SelectedCaptureIndex
	end)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(UseSelectorResult1)
	local IsXAbove = UseScreenSizeResult.X / UseScreenSizeResult.Y > 1
	local ClampedValue = math.clamp(math.floor(UseScreenSizeResult.X * (if IsXAbove then 0.15 else 0.075)), 50, 200)
	local Floored = math.floor(ClampedValue * 0.2)
	local _Vector2 = Vector2.new(math.floor(UseScreenSizeResult.X - ClampedValue * 2), (math.floor(Frame.maxHeight)))
	local ScaledX = _Vector2.X * #UseSelectorResult
	local X: number = (UseScreenSizeResult - _Vector2).X
	local XOffset = nil
	local XRatio1 = nil
	
	if X % 2 == 0 then
		local XRatio = X / 2
		XOffset = XRatio
		XRatio1 = XRatio
	else
		local Floored1 = math.floor(X / 2)
		XOffset = Floored1 + 1
		XRatio1 = Floored1
	end
	local UseCarouselControllerModuleResult = UseCarouselControllerModule(_Vector2, UseSelectorResult1, (ReactModule.useCallback(function(p1: number) --[[ Line: 102 ]]
		-- upvalues: UseSelectorResult (copy), UseSelectorResult1 (copy), ConstantsModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), CarouselScrolledModule (upval)
		if p1 >= 1 and #UseSelectorResult >= p1 then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselScrolled, {
				direction = p1 < UseSelectorResult1 and ConstantsModule.CarouselDirection.Left or ConstantsModule.CarouselDirection.Right
			})
			UseDispatchResult(CarouselScrolledModule(p1))
			
			return
		end
	end, { UseSelectorResult, UseSelectorResult1 })))
	local CarouselRef = UseCarouselControllerModuleResult.carouselRef
	local CarouselInputBegan = UseCarouselControllerModuleResult.carouselInputBegan
	local CarouselInputEnded = UseCarouselControllerModuleResult.carouselInputEnded
	local DeleteSelectedItemFunction = UseCarouselControllerModuleResult.deleteSelectedItem
	local SelectedItemFadeOutBinding = UseCarouselControllerModuleResult.selectedItemFadeOutBinding
	local PostDeletionItemBinding = UseCarouselControllerModuleResult.postDeletionItemBinding
	local SelectedItemRef = UseCarouselControllerModuleResult.selectedItemRef
	local SetIsNavigationLockedFunction = UseCarouselControllerModuleResult.setIsNavigationLocked
	local IsUseStateResultAbove = UseStateResult3 > 1
	local IsUseStateResultBelow = UseStateResult3 < #UseSelectorResult
	local NoIsDisabled: boolean = if IsUseStateResultAbove then not Frame.isDisabled else IsUseStateResultBelow and not Frame.isDisabled
	ReactModule.useEffect(function() --[[ Line: 130 ]]
		-- upvalues: SetIsNavigationLockedFunction (copy), NoIsDisabled (copy)
		SetIsNavigationLockedFunction(not NoIsDisabled)
	end, { NoIsDisabled, SetIsNavigationLockedFunction })
	UseSignalFunction(Frame.deleteItemSignal, (ReactModule.useCallback(function(p1) --[[ Line: 134 ]]
		-- upvalues: DeleteSelectedItemFunction (copy)
		DeleteSelectedItemFunction(p1)
	end, { DeleteSelectedItemFunction })))
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 139 ]]
		-- upvalues: GetClosestItemToCenterModule (upval), _Vector2 (copy), UseStateResult3 (copy), UseStateResult2_2 (copy)
		local ClosestItemToCenterModule = GetClosestItemToCenterModule(_Vector2, p1)
		
		if ClosestItemToCenterModule ~= UseStateResult3 then
			UseStateResult2_2(ClosestItemToCenterModule)
		end
	end, { _Vector2, UseStateResult3, UseStateResult2_2 })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 146 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselVideoMuteButtonActivated)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p1) --[[ Line: 150 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult (copy), UseStateResult2_1 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		UseStateResult2(not UseStateResult)
		UseStateResult2_1(p1)
		
		if UseStateResult then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselVideoShrank)
			
			return
		else
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselVideoExpanded)
		end
	end, { UseStateResult })
	local UseResult3 = ReactModule.useCallback(function(Capture, ItemIndex) --[[ Line: 161 ]]
		-- upvalues: UseStateResult3 (copy), ReactModule (upval), CarouselItemModule (upval), UseSelectorResult1 (copy), SelectedItemFadeOutBinding (copy), PostDeletionItemBinding (copy), Floored (copy), FFlagUseRbxstorageInGalleryModule (upval), Frame (copy), _Vector2 (copy), UseResult2 (copy), UseResult1 (copy)
		if UseStateResult3 + 3 < ItemIndex or ItemIndex < UseStateResult3 - 3 then
			return nil
		else
			local IsItemIndexMatch: boolean = ItemIndex == UseStateResult3 - 1 or UseStateResult3 == 1 and ItemIndex == 2
			
			return ReactModule.createElement(CarouselItemModule, {
				unfocusedSizeMultiplier = 0.8,
				capture = Capture,
				fadeOutBinding = if ItemIndex == UseSelectorResult1 then SelectedItemFadeOutBinding else nil,
				transitionBinding = if ItemIndex == UseSelectorResult1 then SelectedItemFadeOutBinding elseif IsItemIndexMatch then PostDeletionItemBinding else nil,
				imagePadding = Floored,
				isDisabled = if FFlagUseRbxstorageInGalleryModule then Frame.isDisabled and UseSelectorResult1 == ItemIndex else nil,
				isSelected = UseSelectorResult1 == ItemIndex,
				itemIndex = ItemIndex,
				itemSize = _Vector2,
				onExpandCallback = UseResult2,
				onMuteCallback = UseResult1
			})
		end
	end, {
		_Vector2, UseStateResult3, Floored, Frame.isDisabled, UseResult2, UseResult1,
		PostDeletionItemBinding, UseSelectorResult1, SelectedItemFadeOutBinding
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 201 ]]
		-- upvalues: ReactModule (upval), UseSelectorResult (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), FFlagUseRbxstorageInGalleryModule (upval), CaptureTypeModule (upval), _Vector2 (copy), UseSelectorResult1 (copy), SelectedItemRef (copy), UseStateResult (copy), UseStateResult1 (copy), UseResult3 (copy)
		local config = {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		
		for LayoutOrder, value in UseSelectorResult do
			config[if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then tostring(value.CaptureTime.UnixTimestampMillis) elseif FFlagUseRbxstorageInGalleryModule and value.type == CaptureTypeModule.Video then value.thumbnailKey else value.contentId] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y),
				ref = if LayoutOrder == UseSelectorResult1 then SelectedItemRef else nil,
				ZIndex = if UseStateResult and UseStateResult1 == LayoutOrder then 2 else 1
			}, { Item = UseResult3(value, LayoutOrder) })
		end
		return config
	end, {
		UseSelectorResult, _Vector2, UseStateResult1, UseStateResult, UseResult3,
		UseSelectorResult1
	})
	local Floored2 = math.floor(_Vector2.Y * 0.8)
	local CreateElementFunction1 = ReactModule.createElement
	local v1 = "Frame"
	local config = {
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, Frame.maxHeight),
		ZIndex = Frame.ZIndex
	}
	local t = {}
	local CreateElementFunction = ReactModule.createElement
	local v2 = "ScrollingFrame"
	local config1 = {
		BackgroundTransparency = 1,
		CanvasSize = UDim2.new(0, ScaledX, 1, 0),
		ClipsDescendants = false,
		Position = UDim2.fromOffset(XOffset, 0),
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.X
	}
	local NoUseStateResult = not UseStateResult
	
	if NoUseStateResult then
		NoUseStateResult = NoIsDisabled
		
		if NoUseStateResult then
			local Platform = UserInputService:GetPlatform()
			local TouchEnabled = UserInputService.TouchEnabled
			local ReducedMotion = UserGameSettings.ReducedMotion
			NoUseStateResult = (Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android) and (TouchEnabled and not ReducedMotion)
		end
	end
	config1.ScrollingEnabled = NoUseStateResult
	config1.Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y)
	config1[ReactModule.Change.CanvasPosition] = UseResult
	config1[ReactModule.Event.InputBegan] = CarouselInputBegan
	config1[ReactModule.Event.InputEnded] = CarouselInputEnded
	config1.ref = CarouselRef
	t.AnimatedCarousel = CreateElementFunction(v2, config1, UseMemoResult)
	t.LeftArrow = not UseStateResult and (IsUseStateResultAbove and ReactModule.createElement(CarouselNavArrowModule, {
		ZIndex = 2,
		direction = ConstantsModule.CarouselDirection.Left,
		isDisabled = Frame.isDisabled,
		Size = UDim2.fromOffset(XOffset - Floored, Floored2)
	}))
	t.RightArrow = not UseStateResult and (IsUseStateResultBelow and ReactModule.createElement(CarouselNavArrowModule, {
		ZIndex = 2,
		direction = ConstantsModule.CarouselDirection.Right,
		isDisabled = Frame.isDisabled,
		Size = UDim2.fromOffset(XRatio1 - Floored, Floored2)
	}))
	
	return CreateElementFunction1(v1, config, t)
end