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

local function _(p1, p2)
	local x = (p2 - p1).X
	
	if x % 2 == 0 then
		local var1 = x / 2
		
		return var1, var1
	end
	local floored = math.floor(x / 2)
	
	return floored + 1, floored
end

local _ = function()
	-- upvalues: userInputService (ref), userGameSettingsService (ref)
	local platform = userInputService:GetPlatform()
	
	return (if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true) and (userInputService.TouchEnabled and not userGameSettingsService.ReducedMotion)
end

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useScreenSize (ref), reactModule (ref), useSelector (ref), constantsModule (ref), eventNamesModule (ref), carouselScrolledModule (ref), useCarouselControllerModule (ref), useSignal (ref), getClosestItemToCenterModule (ref), carouselItemModule (ref), fFlagUseRbxstorageInGalleryModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), userInputService (ref), userGameSettingsService (ref), carouselNavArrowModule (ref)
	local var1, var2
	local var3 = useAnalyticsModule()
	local var4 = useDispatch()
	local var5 = useScreenSize()
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(0)
	local var10 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].Captures
	end)
	local var11 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].Carousel.SelectedCaptureIndex
	end)
	local var12, var13 = reactModule.useState(var11)
	local clampedValue = math.clamp(math.floor(var5.X * (if var5.X / var5.Y > 1 then 0.15 else 0.075)), 50, 200)
	clampedValue = math.floor(clampedValue * 0.2)
	local vector2 = Vector2.new(math.floor(var5.X - clampedValue * 2), math.floor(p1.maxHeight))
	local var14 = vector2.X * #var10
	local x = (var5 - vector2).X
	
	if x % 2 == 0 then
		local var15 = x / 2
		var1 = var15
		var2 = var15
	else
		local floored = math.floor(x / 2)
		var1 = floored + 1
		var2 = floored
	end
	local var16
	local var17 = useCarouselControllerModule(vector2, var11, reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref), var11 (ref), constantsModule (copy), var3 (ref), eventNamesModule (copy), var4 (ref), carouselScrolledModule (copy)
		if p2 < 1 or #var10 < p2 then
			return
		end
		var3.fireEvent(eventNamesModule.CapturesCarouselScrolled, {
			direction = if p2 < var11 then constantsModule.CarouselDirection.Left else constantsModule.CarouselDirection.Right
		})
		var4(carouselScrolledModule(p2))
	end, { var10, var11 }))
	local carouselRef = var17.carouselRef
	local carouselInputBegan = var17.carouselInputBegan
	local carouselInputEnded = var17.carouselInputEnded
	local deleteSelectedItem = var17.deleteSelectedItem
	local selectedItemFadeOutBinding = var17.selectedItemFadeOutBinding
	local postDeletionItemBinding = var17.postDeletionItemBinding
	local selectedItemRef = var17.selectedItemRef
	local setIsNavigationLocked = var17.setIsNavigationLocked
	local var18 = var12 > 1
	local var19 = var12 < #var10
	
	if not var18 then
		var16 = var19 and not p1.isDisabled
	end
	reactModule.useEffect(function()
		-- upvalues: setIsNavigationLocked (ref), var16 (ref)
		setIsNavigationLocked(not var16)
	end, { var16, setIsNavigationLocked })
	useSignal(p1.deleteItemSignal, reactModule.useCallback(function(p2)
		-- upvalues: deleteSelectedItem (ref)
		deleteSelectedItem(p2)
	end, { deleteSelectedItem }))
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: getClosestItemToCenterModule (copy), vector2 (ref), var12 (ref), var13 (ref)
		local var21 = getClosestItemToCenterModule(vector2, p2)
		
		if var21 ~= var12 then
			var13(var21)
		end
	end, { vector2, var12, var13 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), eventNamesModule (copy)
		var3.fireEvent(eventNamesModule.CapturesCarouselVideoMuteButtonActivated)
	end, {})
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), var6 (ref), var9 (ref), var3 (ref), eventNamesModule (copy)
		var7(not var6)
		var9(p2)
		
		if var6 then
			var3.fireEvent(eventNamesModule.CapturesCarouselVideoShrank)
			
			return
		end
		var3.fireEvent(eventNamesModule.CapturesCarouselVideoExpanded)
	end, { var6 })
	local var23 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var12 (ref), reactModule (copy), carouselItemModule (copy), var11 (ref), selectedItemFadeOutBinding (ref), postDeletionItemBinding (ref), clampedValue (ref), fFlagUseRbxstorageInGalleryModule (copy), p1 (ref), vector2 (ref), var22 (ref), var21 (ref)
		if var12 + 3 < p3 or p3 < var12 - 3 then
			return nil
		end
		local var24
		local createElement = reactModule.createElement
		local t = {
			unfocusedSizeMultiplier = 0.8,
			capture = p2,
			fadeOutBinding = if p3 == var11 then selectedItemFadeOutBinding else nil,
			transitionBinding = if p3 == var11 then selectedItemFadeOutBinding elseif if p3 ~= var12 - 1 then var12 == 1 and p3 == 2 else true then postDeletionItemBinding else nil,
			imagePadding = clampedValue
		}
		
		if fFlagUseRbxstorageInGalleryModule then
			var24 = p1.isDisabled
			
			if var24 then
				var24 = var11 == p3
				var24 = nil
			end
		else
			var24 = nil
		end
		t.isDisabled = var24
		t.isSelected = var11 == p3
		t.itemIndex = p3
		t.itemSize = vector2
		t.onExpandCallback = var22
		t.onMuteCallback = var21
		
		return createElement(carouselItemModule, t)
	end, {
		vector2, var12, clampedValue, p1.isDisabled, var22, var21,
		postDeletionItemBinding, var11, selectedItemFadeOutBinding
	})
	local var24 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var10 (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), fFlagUseRbxstorageInGalleryModule (copy), captureTypeModule (copy), vector2 (ref), var11 (ref), selectedItemRef (ref), var6 (ref), var8 (ref), var23 (ref)
		local t = {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		
		for i, v in var10 do
			t[if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then tostring(v.CaptureTime.UnixTimestampMillis) elseif fFlagUseRbxstorageInGalleryModule and v.type == captureTypeModule.Video then v.thumbnailKey else v.contentId] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = i,
				Size = UDim2.fromOffset(vector2.X, vector2.Y),
				ref = if i == var11 then selectedItemRef else nil,
				ZIndex = if var6 and var8 == i then 2 else 1
			}, { Item = var23(v, i) })
		end
		return t
	end, {
		var10, vector2, var8, var6, var23, var11
	})
	local floored = math.floor(vector2.Y * 0.8)
	local createElement = reactModule.createElement
	local var25 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p1.maxHeight),
		ZIndex = p1.ZIndex
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var26 = "ScrollingFrame"
	local t_2 = {
		BackgroundTransparency = 1,
		CanvasSize = UDim2.new(0, var14, 1, 0),
		ClipsDescendants = false,
		Position = UDim2.fromOffset(var1, 0),
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.X
	}
	local var27 = not var6
	
	if var27 then
		var27 = var16
		
		if var27 then
			local platform = userInputService:GetPlatform()
			var27 = (if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true) and (userInputService.TouchEnabled and not userGameSettingsService.ReducedMotion)
		end
	end
	t_2.ScrollingEnabled = var27
	t_2.Size = UDim2.fromOffset(vector2.X, vector2.Y)
	t_2[reactModule.Change.CanvasPosition] = var20
	t_2[reactModule.Event.InputBegan] = carouselInputBegan
	t_2[reactModule.Event.InputEnded] = carouselInputEnded
	t_2.ref = carouselRef
	t_1.AnimatedCarousel = createElement_1(var26, t_2, var24)
	t_1.LeftArrow = not var6 and (var18 and reactModule.createElement(carouselNavArrowModule, {
		ZIndex = 2,
		direction = constantsModule.CarouselDirection.Left,
		isDisabled = p1.isDisabled,
		Size = UDim2.fromOffset(var1 - clampedValue, floored)
	}))
	t_1.RightArrow = not var6 and (var19 and reactModule.createElement(carouselNavArrowModule, {
		ZIndex = 2,
		direction = constantsModule.CarouselDirection.Right,
		isDisabled = p1.isDisabled,
		Size = UDim2.fromOffset(var2 - clampedValue, floored)
	}))
	
	return createElement(var25, t, t_1)
end