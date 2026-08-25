local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local userInputService = game:GetService("UserInputService")
local _ = require(parent_1.AppCommonLib)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useScreenSize = require(parent_1.RobloxAppHooks).useScreenSize
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useSignal = roactUtilsModule.Hooks.useSignal
local captureTypeModule = require(parent.Enums.CaptureType)
local carouselItemModule = require(parent.Components.CapturesCarousel.CarouselItem)
local carouselNavArrowModule = require(parent.Components.CapturesCarousel.CarouselNavArrow)
local carouselScrolledModule = require(parent.Thunks.CarouselScrolled)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local getClosestItemToCenterModule = require(parent.Utils.getClosestItemToCenter)
local _ = require(parent.Types)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useCarouselControllerModule = require(parent.Hooks.useCarouselController)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

local function _(p0, p1)
	local x = (p1 - p0).X
	
	if x % 2 == 0 then
		local var15 = x / 2
		
		return var15, var15
	end
	local floored = math.floor(x / 2)
	
	return floored + 1, floored
end

local _ = function()
	-- upvalues: userInputService (ref), userGameSettingsService (ref)
	local platform = userInputService:GetPlatform()
	
	return (if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true) and (userInputService.TouchEnabled and not userGameSettingsService.ReducedMotion)
end

return function(p2)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useScreenSize (ref), reactModule (ref), useSelector (ref), constantsModule (ref), eventNamesModule (ref), carouselScrolledModule (ref), useCarouselControllerModule (ref), useSignal (ref), getClosestItemToCenterModule (ref), carouselItemModule (ref), fFlagUseRbxstorageInGalleryModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), userInputService (ref), userGameSettingsService (ref), carouselNavArrowModule (ref)
	local var33, var34
	local var18 = useAnalyticsModule()
	local var19 = useDispatch()
	local var20 = useScreenSize()
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(0)
	local var25 = useSelector(function(p3)
		-- upvalues: constantsModule (copy)
		return p3[constantsModule.RoduxKey].Captures
	end)
	local var26 = useSelector(function(p4)
		-- upvalues: constantsModule (copy)
		return p4[constantsModule.RoduxKey].Carousel.SelectedCaptureIndex
	end)
	local var27, var28 = reactModule.useState(var26)
	local clampedValue = math.clamp(math.floor(var20.X * (if var20.X / var20.Y > 1 then 0.15 else 0.075)), 50, 200)
	clampedValue = math.floor(clampedValue * 0.2)
	local vector2 = Vector2.new(math.floor(var20.X - clampedValue * 2), math.floor(p2.maxHeight))
	local var31 = vector2.X * #var25
	local x = (var20 - vector2).X
	
	if x % 2 == 0 then
		local var32 = x / 2
		var33 = var32
		var34 = var32
	else
		local floored = math.floor(x / 2)
		var33 = floored + 1
		var34 = floored
	end
	local var39
	local var36 = useCarouselControllerModule(vector2, var26, reactModule.useCallback(function(p5)
		-- upvalues: var25 (ref), var26 (ref), constantsModule (copy), var18 (ref), eventNamesModule (copy), var19 (ref), carouselScrolledModule (copy)
		if p5 < 1 or #var25 < p5 then
			return
		end
		var18.fireEvent(eventNamesModule.CapturesCarouselScrolled, {
			direction = if p5 < var26 then constantsModule.CarouselDirection.Left else constantsModule.CarouselDirection.Right
		})
		var19(carouselScrolledModule(p5))
	end, { var25, var26 }))
	local carouselRef = var36.carouselRef
	local carouselInputBegan = var36.carouselInputBegan
	local carouselInputEnded = var36.carouselInputEnded
	local deleteSelectedItem = var36.deleteSelectedItem
	local selectedItemFadeOutBinding = var36.selectedItemFadeOutBinding
	local postDeletionItemBinding = var36.postDeletionItemBinding
	local selectedItemRef = var36.selectedItemRef
	local setIsNavigationLocked = var36.setIsNavigationLocked
	local var37 = var27 > 1
	local var38 = var27 < #var25
	
	if not var37 then
		var39 = var38 and not p2.isDisabled
	end
	reactModule.useEffect(function()
		-- upvalues: setIsNavigationLocked (ref), var39 (ref)
		setIsNavigationLocked(not var39)
	end, { var39, setIsNavigationLocked })
	useSignal(p2.deleteItemSignal, reactModule.useCallback(function(p6)
		-- upvalues: deleteSelectedItem (ref)
		deleteSelectedItem(p6)
	end, { deleteSelectedItem }))
	local var40 = reactModule.useCallback(function(p7)
		-- upvalues: getClosestItemToCenterModule (copy), vector2 (ref), var27 (ref), var28 (ref)
		local var53 = getClosestItemToCenterModule(vector2, p7)
		
		if var53 ~= var27 then
			var28(var53)
		end
	end, { vector2, var27, var28 })
	local var41 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), eventNamesModule (copy)
		var18.fireEvent(eventNamesModule.CapturesCarouselVideoMuteButtonActivated)
	end, {})
	local var42 = reactModule.useCallback(function(p8)
		-- upvalues: var22 (ref), var21 (ref), var24 (ref), var18 (ref), eventNamesModule (copy)
		var22(not var21)
		var24(p8)
		
		if var21 then
			var18.fireEvent(eventNamesModule.CapturesCarouselVideoShrank)
			
			return
		end
		var18.fireEvent(eventNamesModule.CapturesCarouselVideoExpanded)
	end, { var21 })
	local var43 = reactModule.useCallback(function(p9, p10)
		-- upvalues: var27 (ref), reactModule (copy), carouselItemModule (copy), var26 (ref), selectedItemFadeOutBinding (ref), postDeletionItemBinding (ref), clampedValue (ref), fFlagUseRbxstorageInGalleryModule (copy), p2 (ref), vector2 (ref), var42 (ref), var41 (ref)
		if var27 + 3 < p10 or p10 < var27 - 3 then
			return nil
		end
		local var55
		local createElement = reactModule.createElement
		local t = {
			unfocusedSizeMultiplier = 0.8,
			capture = p9,
			fadeOutBinding = if p10 == var26 then selectedItemFadeOutBinding else nil,
			transitionBinding = if p10 == var26 then selectedItemFadeOutBinding elseif if p10 ~= var27 - 1 then var27 == 1 and p10 == 2 else true then postDeletionItemBinding else nil,
			imagePadding = clampedValue
		}
		
		if fFlagUseRbxstorageInGalleryModule then
			var55 = p2.isDisabled
			
			if var55 then
				var55 = var26 == p10
				var55 = nil
			end
		else
			var55 = nil
		end
		t.isDisabled = var55
		t.isSelected = var26 == p10
		t.itemIndex = p10
		t.itemSize = vector2
		t.onExpandCallback = var42
		t.onMuteCallback = var41
		
		return createElement(carouselItemModule, t)
	end, {
		vector2, var27, clampedValue, p2.isDisabled, var42, var41,
		postDeletionItemBinding, var26, selectedItemFadeOutBinding
	})
	local var44 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var25 (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), fFlagUseRbxstorageInGalleryModule (copy), captureTypeModule (copy), vector2 (ref), var26 (ref), selectedItemRef (ref), var21 (ref), var23 (ref), var43 (ref)
		local t = {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		
		for i, v in var25 do
			t[if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then tostring(v.CaptureTime.UnixTimestampMillis) elseif fFlagUseRbxstorageInGalleryModule and v.type == captureTypeModule.Video then v.thumbnailKey else v.contentId] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = i,
				Size = UDim2.fromOffset(vector2.X, vector2.Y),
				ref = if i == var26 then selectedItemRef else nil,
				ZIndex = if var21 and var23 == i then 2 else 1
			}, { Item = var43(v, i) })
		end
		return t
	end, {
		var25, vector2, var23, var21, var43, var26
	})
	local floored = math.floor(vector2.Y * 0.8)
	local createElement = reactModule.createElement
	local var46 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		LayoutOrder = p2.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p2.maxHeight),
		ZIndex = p2.ZIndex
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var49 = "ScrollingFrame"
	local t_2 = {
		BackgroundTransparency = 1,
		CanvasSize = UDim2.new(0, var31, 1, 0),
		ClipsDescendants = false,
		Position = UDim2.fromOffset(var33, 0),
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.X
	}
	local var51 = not var21
	
	if var51 then
		var51 = var39
		
		if var51 then
			local platform = userInputService:GetPlatform()
			var51 = (if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true) and (userInputService.TouchEnabled and not userGameSettingsService.ReducedMotion)
		end
	end
	t_2.ScrollingEnabled = var51
	t_2.Size = UDim2.fromOffset(vector2.X, vector2.Y)
	t_2[reactModule.Change.CanvasPosition] = var40
	t_2[reactModule.Event.InputBegan] = carouselInputBegan
	t_2[reactModule.Event.InputEnded] = carouselInputEnded
	t_2.ref = carouselRef
	t_1.AnimatedCarousel = createElement_1(var49, t_2, var44)
	t_1.LeftArrow = not var21 and (var37 and reactModule.createElement(carouselNavArrowModule, {
		ZIndex = 2,
		direction = constantsModule.CarouselDirection.Left,
		isDisabled = p2.isDisabled,
		Size = UDim2.fromOffset(var33 - clampedValue, floored)
	}))
	t_1.RightArrow = not var21 and (var38 and reactModule.createElement(carouselNavArrowModule, {
		ZIndex = 2,
		direction = constantsModule.CarouselDirection.Right,
		isDisabled = p2.isDisabled,
		Size = UDim2.fromOffset(var34 - clampedValue, floored)
	}))
	
	return createElement(var46, t, t_1)
end