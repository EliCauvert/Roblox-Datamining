local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local AdaptiveScrollingContext = AvatarExperienceCommonModule.Hooks.AdaptiveScrollingContext
local AdaptiveScrollingViewPeekHeaderBackgroundContextModule = require(script.Parent.AdaptiveScrollingViewPeekHeaderBackgroundContext)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local UseFullViewModule = require(Modules.AvatarExperience.Common.Hooks.useFullView)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local OtterModule = require(CorePackages.Packages.Otter)
local UseAnimatedVisibilityFunction = AvatarExperienceCommonModule.Stores.AnimatedVisibilityStore.useAnimatedVisibility
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXEnableSlotBasedEditorModule = game:DefineFastFlag("AXAdaptiveScrollingEnableViewModeTransitionProp2", false) and GetFFlagAXEnableSlotBasedEditorModule()
local AXAdaptiveScrollingOverscrollThreshold = game:DefineFastInt("AXAdaptiveScrollingOverscrollThreshold", 20)
local AXFixAdaptiveScrollingDraggerColor = game:DefineFastFlag("AXFixAdaptiveScrollingDraggerColor", false)
local FFlagAXExpandPeekViewOnFirstScroll = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXExpandPeekViewOnFirstScroll
local FFlagAXSlotsPeekViewScrollFix = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix
local AXMaxScrollDirectionChangeAttempts = game:DefineFastInt("AXMaxScrollDirectionChangeAttempts", 2)
local FFlagAXHideMenuOnScroll = AvatarExperienceFlagsModule.FFlagAXHideMenuOnScroll
local FFlagAXAdaptiveScrollingViewBanner = AvatarExperienceFlagsModule.FFlagAXAdaptiveScrollingViewBanner
local FFlagAXCatalogOffersBannerEnabled = AvatarExperienceFlagsModule.FFlagAXCatalogOffersBannerEnabled
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScopedScrollAway = SharedFlagsModule.FFlagAppIaScopedScrollAway
local FFlagEnableBottomNavOnMarketplace = SharedFlagsModule.FFlagEnableBottomNavOnMarketplace
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local config = { dampingRatio = 1, frequency = 5 }
local AXAdaptiveScrollingJustSelectedMillisRatio = game:DefineFastInt("AXAdaptiveScrollingJustSelectedMillis", 500) / 1000

local function blendShiftFillForOpaqueGuiObject(Shift, Color): Color3
	local v1 = 1 - math.clamp(Shift.Transparency, 0, 1)
	
	return Color3.new(Shift.Color3.R * v1 + Color.R * (1 - v1), Shift.Color3.G * v1 + Color.G * (1 - v1), Shift.Color3.B * v1 + Color.B * (1 - v1))
end

local SceneFullView = FullView.SceneFullView
local None = FullView.None
local UIFullView = FullView.UIFullView

local function _(p1, p2): boolean
	return math.abs(p1 - p2) < 0.0001
end

local _ = function(p1, p2, p3): boolean
	return math.abs(p1 - p2) < p3
end

return function(p1)
	-- upvalues: ReactModule (copy), FFlagAXHideMenuOnScroll (copy), UseAnimatedVisibilityFunction (copy), FoundationModule (copy), UIFullView (copy), None (copy), FFlagAXExpandPeekViewOnFirstScroll (copy), UseStyleFunction (copy), FFlagAXCatalogOffersBannerEnabled (copy), blendShiftFillForOpaqueGuiObject (copy), SceneFullView (copy), UseFullViewModule (copy), AXAdaptiveScrollingJustSelectedMillisRatio (copy), ConstantsModule (copy), OtterModule (copy), config (copy), AXAdaptiveScrollingOverscrollThreshold (copy), FFlagAppIaScopedScrollAway (copy), FFlagEnableBottomNavOnMarketplace (copy), AXMaxScrollDirectionChangeAttempts (copy), FFlagAXAdaptiveScrollingViewBanner (copy), FFlagAXSlotsPeekViewScrollFix (copy), FFlagAXEnableSlotBasedEditorModule (copy), AXFixAdaptiveScrollingDraggerColor (copy), FFlagRenameDeprecatedUIBloxTokens (copy), AdaptiveScrollingContext (copy), AdaptiveScrollingViewPeekHeaderBackgroundContextModule (copy), ExternalEventConnection (copy), UserInputService (copy)
	local FullHeight = p1.fullHeight
	local MidHeight = p1.midHeight
	local AlwaysShowingHeight = p1.alwaysShowingHeight
	local YOffset = FullHeight - AlwaysShowingHeight
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local AnimatedMenusStore = nil
	local UseRefResult2 = nil
	local UseRefResult3 = nil
	local UseRefResult4 = nil
	
	if FFlagAXHideMenuOnScroll then
		local UseAnimatedVisibilityResult = UseAnimatedVisibilityFunction()
		
		if UseAnimatedVisibilityResult then
			AnimatedMenusStore = UseAnimatedVisibilityResult.animatedMenusStore
		end
		UseRefResult2 = ReactModule.useRef(0)
		UseRefResult3 = ReactModule.useRef(nil)
		UseRefResult4 = ReactModule.useRef(false)
	end
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local TopBarHeight = p1.topBarHeight or 0
	local Size900 = UseTokensResult.Size.Size_900
	local Size100 = UseTokensResult.Size.Size_100
	local FullHeightOptions = p1.fullHeightOptions or {}
	local UseStateResult, UseStateResult2 = ReactModule.useState({ instance = nil, time = 0 })
	local UseResult = ReactModule.useCallback(function(None1): boolean
		-- upvalues: UIFullView (upval), None (upval)
		return None1 == UIFullView or None1 == None
	end, {})
	local UseResult1 = nil
	UseResult1 = if FFlagAXExpandPeekViewOnFirstScroll then ReactModule.useCallback(function()
		-- upvalues: UseRefResult5 (copy)
		if UseRefResult5.current then
			UseRefResult5.current:destroy()
			UseRefResult5.current = nil
		end
	end, {}) else function()
		-- upvalues: UseRefResult5 (copy)
		if UseRefResult5.current then
			UseRefResult5.current:destroy()
			UseRefResult5.current = nil
		end
	end
	
	local function _()
		-- upvalues: UseRefResult6 (copy)
		if UseRefResult6 and UseRefResult6.current then
			UseRefResult6.current:destroy()
			UseRefResult6.current = nil
		end
	end
	
	local UseResult2 = if FFlagAXHideMenuOnScroll then ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (ref)
		if UseRefResult3.current then
			task.cancel(UseRefResult3.current)
			UseRefResult3.current = nil
		end
	end, {}) else nil
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (ref), UseRefResult6 (copy), FFlagAXHideMenuOnScroll (upval), UseResult2 (ref)
		return function()
			-- upvalues: UseResult1 (upval), UseRefResult6 (upval), FFlagAXHideMenuOnScroll (upval), UseResult2 (upval)
			UseResult1()
			
			if UseRefResult6 and UseRefResult6.current then
				UseRefResult6.current:destroy()
				UseRefResult6.current = nil
			end
			if FFlagAXHideMenuOnScroll then
				UseResult2()
			end
		end
	end, {})
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseMemoResult = nil
	local HasPeekHeaderUsesElevatedBackground: boolean? = nil
	local Color = nil
	local Transparency = nil
	
	if FFlagAXCatalogOffersBannerEnabled then
		local IsNotPeekHeaderBackgroundActive = p1.peekHeaderBackgroundActive == false
		HasPeekHeaderUsesElevatedBackground = p1.peekHeaderUsesElevatedBackground ~= nil
		local NoIsNotPeekHeaderBackgroundActive: boolean = p1.peekHeaderUsesElevatedBackground == true and not IsNotPeekHeaderBackgroundActive
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			return {
				onPeekHeaderBackgroundActiveChanged = p1.onPeekHeaderBackgroundActiveChanged
			}
		end, { p1.onPeekHeaderBackgroundActiveChanged })
		Color = if NoIsNotPeekHeaderBackgroundActive then blendShiftFillForOpaqueGuiObject(UseTokensResult.Color.Shift.Shift_200, Theme.BackgroundDefault.Color) else Theme.BackgroundDefault.Color
		Transparency = if NoIsNotPeekHeaderBackgroundActive then 0 else Theme.BackgroundDefault.Transparency
	end
	local _ = function(SceneFullView1)
		-- upvalues: UIFullView (upval), FullHeight (copy), SceneFullView (upval), AlwaysShowingHeight (copy), MidHeight (copy)
		return if SceneFullView1 == UIFullView then FullHeight elseif SceneFullView1 == SceneFullView then AlwaysShowingHeight else MidHeight
	end
	
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseFullViewModuleResult, UseFullViewModuleResult2 = UseFullViewModule()
	local UseRefResult7 = ReactModule.useRef(UseFullViewModuleResult)
	UseRefResult7.current = UseFullViewModuleResult
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(UseResult(UseFullViewModuleResult))
	local v1 = nil
	local Callback = nil
	local UseRefResult8 = nil
	local UseRefResult9 = nil
	local UseRefResult10 = nil
	
	if FFlagAXExpandPeekViewOnFirstScroll then
		v1, Callback = ReactModule.useBinding(true)
		UseRefResult8 = ReactModule.useRef(0)
		UseRefResult9 = ReactModule.useRef(0)
		UseRefResult10 = ReactModule.useRef(0)
	end
	local _ = function(): boolean
		-- upvalues: UseRefResult5 (copy)
		return UseRefResult5.current ~= nil
	end
	
	local function adjustScrollingFramePosition()
		-- upvalues: UseFullViewModuleResult (copy), None (upval), UseStateResult (copy), AXAdaptiveScrollingJustSelectedMillisRatio (upval), UseRefResult1 (copy), ConstantsModule (upval), FFlagAXExpandPeekViewOnFirstScroll (upval), UseRefResult6 (copy), FFlagAXHideMenuOnScroll (upval), UseRefResult4 (ref), p1 (copy), AnimatedMenusStore (ref), OtterModule (upval), config (upval)
		if UseFullViewModuleResult ~= None then return end
		if AXAdaptiveScrollingJustSelectedMillisRatio < tick() - UseStateResult.time then return end
		local UseStateResultInstance = UseStateResult.instance
		
		if not UseStateResultInstance then return end
		assert(UseStateResultInstance, "")
		local RCTScrollView = nil
		RCTScrollView = UseStateResultInstance:FindFirstAncestor("RCTScrollView") or (UseStateResultInstance:FindFirstAncestor("scrollingFrame") or UseStateResultInstance:FindFirstAncestorWhichIsA("ScrollingFrame"))
		
		if not RCTScrollView or RCTScrollView == UseRefResult1.current then return end
		assert(RCTScrollView, "")
		local Y = RCTScrollView.CanvasPosition.Y
		local YDelta = UseStateResultInstance.AbsolutePosition.Y - RCTScrollView.AbsolutePosition.Y
		
		if math.abs(YDelta) > 5 then
			Y += YDelta - ConstantsModule.WidgetListVerticalMargin
		end
		if not FFlagAXExpandPeekViewOnFirstScroll then
			Y = math.clamp(Y, 0, RCTScrollView.AbsoluteCanvasSize.Y - RCTScrollView.AbsoluteWindowSize.Y)
		end
		if UseRefResult6 then
			if FFlagAXHideMenuOnScroll then
				UseRefResult4.current = true
				
				if p1.enableAnimatedVisibility and AnimatedMenusStore then
					AnimatedMenusStore.show()
				end
			end
			local SingleMotor = OtterModule.createSingleMotor(RCTScrollView.CanvasPosition.Y)
			UseRefResult6.current = SingleMotor
			SingleMotor:onStep(function(Y)
				-- upvalues: RCTScrollView (ref)
				RCTScrollView.ScrollVelocity = Vector2.new(0, 0)
				RCTScrollView.CanvasPosition = Vector2.new(0, Y)
			end)
			SingleMotor:onComplete(function()
				-- upvalues: UseRefResult6 (upval), FFlagAXHideMenuOnScroll (upval), UseRefResult4 (upval)
				if UseRefResult6 and UseRefResult6.current then
					UseRefResult6.current:destroy()
					UseRefResult6.current = nil
				end
				if FFlagAXHideMenuOnScroll then
					UseRefResult4.current = false
				end
			end)
			SingleMotor:setGoal(OtterModule.spring(Y, config))
		end
	end
	
	local UseResult3 = ReactModule.useCallback(function(Current, p2)
		-- upvalues: UseRefResult1 (copy), UIFullView (upval), FullHeight (copy), SceneFullView (upval), AlwaysShowingHeight (copy), MidHeight (copy), UseRefResult5 (copy), UseBindingResult2_2 (copy), UseResult (copy), UseFullViewModuleResult (copy), UseFullViewModuleResult2 (copy), FFlagAXExpandPeekViewOnFirstScroll (upval), None (upval), adjustScrollingFramePosition (copy), FFlagAXHideMenuOnScroll (upval), p1 (copy), AnimatedMenusStore (ref), OtterModule (upval), UseResult1 (ref), config (upval)
		local Current1 = UseRefResult1.current
		
		if not Current1 then return end
		assert(Current1, "")
		local Y = Current1.CanvasPosition.Y
		local v2 = (if Current == UIFullView then FullHeight elseif Current == SceneFullView then AlwaysShowingHeight else MidHeight) - AlwaysShowingHeight
		
		if UseRefResult5.current ~= nil then return end
		UseBindingResult2_2(UseResult(Current))
		
		if Current == UseFullViewModuleResult and math.abs(v2 - Y) < 0.0001 then return end
		UseFullViewModuleResult2(Current)
		
		if FFlagAXExpandPeekViewOnFirstScroll and Current == None then
			adjustScrollingFramePosition()
		end
		if FFlagAXHideMenuOnScroll and p1.enableAnimatedVisibility and AnimatedMenusStore then
			AnimatedMenusStore.show()
		end
		local SingleMotor = OtterModule.createSingleMotor(Y)
		UseRefResult5.current = SingleMotor
		SingleMotor:onStep(function(Y)
			-- upvalues: Current1 (copy)
			Current1.ScrollVelocity = Vector2.new(0, 0)
			Current1.CanvasPosition = Vector2.new(0, Y)
		end)
		SingleMotor:onComplete(function(_)
			-- upvalues: UseResult1 (upval), FFlagAXExpandPeekViewOnFirstScroll (upval), adjustScrollingFramePosition (upval)
			UseResult1()
			
			if not FFlagAXExpandPeekViewOnFirstScroll then
				adjustScrollingFramePosition()
			end
		end)
		
		if p2 then
			SingleMotor:setGoal(OtterModule.spring(v2, config))
			
			return
		else
			SingleMotor:setGoal(OtterModule.instant(v2))
		end
	end, {
		UseFullViewModuleResult, UseFullViewModuleResult2, AlwaysShowingHeight,
		MidHeight, FullHeight,
		if FFlagAXHideMenuOnScroll then p1.enableAnimatedVisibility else nil,
		if FFlagAXHideMenuOnScroll then AnimatedMenusStore else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult3 (copy), UseRefResult7 (copy)
		UseResult3(UseRefResult7.current, false)
	end, { AlwaysShowingHeight, MidHeight, FullHeight })
	ReactModule.useEffect(function()
		-- upvalues: UseResult3 (copy), UseFullViewModuleResult (copy)
		UseResult3(UseFullViewModuleResult, true)
	end, { UseFullViewModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseFullViewModuleResult (copy), None (upval), UseRefResult5 (copy), adjustScrollingFramePosition (copy)
		if UseStateResult.instance and UseFullViewModuleResult == None and UseRefResult5.current == nil then
			adjustScrollingFramePosition()
		end
	end, { UseStateResult.instance, UseFullViewModuleResult })
	local UseResult4 = if FFlagAXHideMenuOnScroll then ReactModule.useCallback(function(Current)
		-- upvalues: p1 (copy), AnimatedMenusStore (ref), UseRefResult2 (ref), UseResult2 (ref), UseRefResult4 (ref), UseBindingResult (copy), UseRefResult3 (ref)
		if not p1.enableAnimatedVisibility or not AnimatedMenusStore then return end
		local Value = Current - UseRefResult2.current
		UseResult2()
		
		if math.abs(Value) > 1 then
			local IsValueAbove = Value > 0
			local IsVisible = AnimatedMenusStore.getIsVisible(false)
			local Current1 = UseRefResult4.current
			local Value1 = UseBindingResult:getValue()
			
			if IsValueAbove and IsVisible and not Current1 and Value1 then
				AnimatedMenusStore.hide()
			elseif not IsValueAbove and not IsVisible and not Current1 and Value1 then
				AnimatedMenusStore.show()
			end
		end
		UseRefResult3.current = task.delay(0.5, function()
			-- upvalues: AnimatedMenusStore (upval), UseRefResult3 (upval)
			AnimatedMenusStore.show()
			UseRefResult3.current = nil
		end)
		UseRefResult2.current = Current
	end, {
		AnimatedMenusStore,
		p1.enableAnimatedVisibility,
		UseResult2,
		UseBindingResult
	}) else nil
	local UseResult5 = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult (copy), AXAdaptiveScrollingOverscrollThreshold (upval), UseBindingResult2_2 (copy), FFlagAXHideMenuOnScroll (upval), p1 (copy), UseResult4 (ref)
		local Value = UseBindingResult:getValue()
		
		if p2 < -AXAdaptiveScrollingOverscrollThreshold and Value then
			UseBindingResult2_2(false)
		end
		if FFlagAXHideMenuOnScroll and p1.enableAnimatedVisibility then
			UseResult4(p2)
		end
	end, {
		UseBindingResult,
		if FFlagAXHideMenuOnScroll then p1.enableAnimatedVisibility else nil,
		if FFlagAXHideMenuOnScroll then UseResult4 else nil
	})
	local UseRefResult11 = if FFlagAppIaScopedScrollAway and FFlagEnableBottomNavOnMarketplace then ReactModule.useRef(0) else nil
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult3 (copy), FFlagAppIaScopedScrollAway (upval), FFlagEnableBottomNavOnMarketplace (upval), UseRefResult11 (copy), UseBindingResult (copy), p1 (copy), UseResult5 (copy), UseStateResult2 (copy)
		return {
			scrollingEnabledBinding = UseBindingResult3,
			onCanvasYChanged = if FFlagAppIaScopedScrollAway and FFlagEnableBottomNavOnMarketplace then function(Current)
				-- upvalues: UseRefResult11 (upval), UseBindingResult (upval), p1 (upval), UseResult5 (upval)
				if not UseRefResult11 then return end
				local Value = UseBindingResult:getValue()
				
				if p1.onCanvasYDelta and Value then
					local CurrentDelta = Current - UseRefResult11.current
					
					if CurrentDelta ~= 0 then
						p1.onCanvasYDelta(CurrentDelta)
					end
				end
				UseRefResult11.current = Current
				
				if UseResult5 then
					UseResult5(Current)
				end
			end else UseResult5,
			onCanvasPositionChanged = function(ScrollFrame)
				-- upvalues: UseResult5 (upval)
				if UseResult5 then
					UseResult5(ScrollFrame.CanvasPosition.Y)
				end
			end,
			setSelectedItemInstance = function(p2)
				-- upvalues: UseStateResult2 (upval)
				if p2 then
					UseStateResult2({ instance = p2, time = tick() })
					
					return
				else
					UseStateResult2({ instance = nil, time = 0 })
				end
			end
		}
	end, {
		UseBindingResult3,
		UseResult5,
		if FFlagAppIaScopedScrollAway and FFlagEnableBottomNavOnMarketplace then p1.onCanvasYDelta else nil
	})
	
	local function onCanvasPositionChanged(ScrollFrame)
		-- upvalues: UseBindingResult2_1 (copy)
		UseBindingResult2_1(ScrollFrame.CanvasPosition.Y)
	end
	
	local _ = function(p2, SceneFullView1, Current, p3: number)
		-- upvalues: UIFullView (upval), FullHeight (copy), SceneFullView (upval), AlwaysShowingHeight (copy), MidHeight (copy), UseFullViewModuleResult (copy)
		local FullHeight1 = if SceneFullView1 == UIFullView then FullHeight elseif SceneFullView1 == SceneFullView then AlwaysShowingHeight else MidHeight
		local v2 = (if Current == UIFullView then FullHeight elseif Current == SceneFullView then AlwaysShowingHeight else MidHeight) - FullHeight1
		local v3 = p3 < 0
		local v4 = p3 > 0
		
		return if UseFullViewModuleResult == Current then if v4 or p2 < FullHeight1 + v2 * 0.8 then SceneFullView1 else Current elseif v3 or FullHeight1 + v2 * 0.2 < p2 then Current else SceneFullView1
	end
	
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), AlwaysShowingHeight (copy), UseFullViewModuleResult (copy), SceneFullView (upval), UIFullView (upval), FullHeight (copy), None (upval), MidHeight (copy)
		local Current = UseRefResult1.current
		
		if not Current then
			return nil
		end
		assert(Current, "")
		local NewAlwaysShowingHeight = AlwaysShowingHeight + Current.CanvasPosition.Y
		local Y: number = Current.ScrollVelocity.Y
		local IsMagnitudeBelow: boolean = UseFullViewModuleResult == UIFullView and math.abs(NewAlwaysShowingHeight - FullHeight) < 1
		local IsMagnitudeBelow1: boolean = UseFullViewModuleResult == None and math.abs(NewAlwaysShowingHeight - MidHeight) < 1
		
		if (UseFullViewModuleResult == SceneFullView and math.abs(NewAlwaysShowingHeight - AlwaysShowingHeight) < 1 or IsMagnitudeBelow or IsMagnitudeBelow1) and Y == 0 then
			return nil
		elseif MidHeight < NewAlwaysShowingHeight then
			local FullHeight1 = if None == UIFullView then FullHeight elseif None == SceneFullView then AlwaysShowingHeight else MidHeight
			local v2 = (if UIFullView == UIFullView then FullHeight elseif UIFullView == SceneFullView then AlwaysShowingHeight else MidHeight) - FullHeight1
			local IsYBelow = Y < 0
			local IsYAbove = Y > 0
			
			return if UseFullViewModuleResult == UIFullView then if IsYAbove or NewAlwaysShowingHeight < FullHeight1 + v2 * 0.8 then None else UIFullView elseif IsYBelow or FullHeight1 + v2 * 0.2 < NewAlwaysShowingHeight then UIFullView else None
		else
			local FullHeight2 = if SceneFullView == UIFullView then FullHeight elseif SceneFullView == SceneFullView then AlwaysShowingHeight else MidHeight
			local v3 = (if None == UIFullView then FullHeight elseif None == SceneFullView then AlwaysShowingHeight else MidHeight) - FullHeight2
			local IsYBelow = Y < 0
			local IsYAbove = Y > 0
			
			return if UseFullViewModuleResult == None then if IsYAbove or NewAlwaysShowingHeight < FullHeight2 + v3 * 0.8 then SceneFullView else None elseif IsYBelow or FullHeight2 + v3 * 0.2 < NewAlwaysShowingHeight then None else SceneFullView
		end
	end, {
		UseFullViewModuleResult,
		FullHeight,
		MidHeight,
		AlwaysShowingHeight
	})
	local UseResult7 = if FFlagAXExpandPeekViewOnFirstScroll then ReactModule.useCallback(function()
		-- upvalues: UseRefResult10 (ref), UseRefResult8 (ref), Callback (ref), UseBindingResult2_2 (copy), UseResult (copy), UseFullViewModuleResult (copy)
		UseRefResult10.current = 0
		UseRefResult8.current = 0
		Callback(true)
		UseBindingResult2_2(UseResult(UseFullViewModuleResult))
	end, {
		UseFullViewModuleResult,
		Callback,
		UseBindingResult2_2,
		UseResult
	}) else nil
	local UseResult8 = ReactModule.useCallback(function(Input)
		-- upvalues: UseBindingResult2 (copy), FFlagAXExpandPeekViewOnFirstScroll (upval), p1 (copy), UseResult7 (ref), UseRefResult9 (ref), UseResult1 (ref)
		if Input.UserInputType ~= Enum.UserInputType.Touch then return end
		UseBindingResult2(true)
		
		if FFlagAXExpandPeekViewOnFirstScroll and p1.enableExpandPeekViewOnUpwardScroll then
			UseResult7()
			UseRefResult9.current = Input.Position.Y
		end
		UseResult1()
	end, {
		if FFlagAXExpandPeekViewOnFirstScroll then UseBindingResult2 else nil,
		if FFlagAXExpandPeekViewOnFirstScroll then UseResult1 else nil,
		if FFlagAXExpandPeekViewOnFirstScroll then p1.enableExpandPeekViewOnUpwardScroll else nil,
		if FFlagAXExpandPeekViewOnFirstScroll then UseResult7 else nil
	})
	local UseResult9 = if FFlagAXExpandPeekViewOnFirstScroll then ReactModule.useCallback(function(Input)
		-- upvalues: p1 (copy), UseFullViewModuleResult (copy), None (upval), UseRefResult9 (ref), UseRefResult8 (ref), UseRefResult10 (ref), AXMaxScrollDirectionChangeAttempts (upval), UseResult6 (copy), UseResult3 (copy), Callback (ref), UseBindingResult2_2 (copy)
		if not p1.enableExpandPeekViewOnUpwardScroll then return end
		if Input.UserInputType ~= Enum.UserInputType.Touch then return end
		if UseFullViewModuleResult ~= None then return end
		local YDelta = Input.Position.Y - UseRefResult9.current
		
		if math.abs(YDelta) > 5 then
			local Current: number = if YDelta > 0 then -1 else 1
			UseRefResult9.current = Input.Position.Y
			
			if UseRefResult8.current ~= Current then
				local UseRefResult = UseRefResult10
				UseRefResult.current += 1
				
				if AXMaxScrollDirectionChangeAttempts < UseRefResult10.current then
					local UseResultResult = UseResult6()
					
					if UseResultResult then
						UseResult3(UseResultResult, true)
					end
					return
				else
					UseRefResult8.current = Current
					
					if Current == -1 then
						Callback(false)
						
						return
					end
					UseBindingResult2_2(false)
					Callback(true)
				end
			end
		end
	end, {
		UseFullViewModuleResult, UseResult3, UseResult6, Callback, UseBindingResult2_2,
		UseResult, UseBindingResult2, UseResult7, p1.enableExpandPeekViewOnUpwardScroll
	}) else nil
	local UseResult10 = ReactModule.useCallback(function(Input)
		-- upvalues: FFlagAppIaScopedScrollAway (upval), FFlagEnableBottomNavOnMarketplace (upval), p1 (copy), FFlagAXExpandPeekViewOnFirstScroll (upval), UseResult7 (ref), UseBindingResult2 (copy), UseResult6 (copy), UseResult3 (copy), UseBindingResult2_2 (copy), UseResult (copy), UseRefResult7 (copy)
		if Input.UserInputType ~= Enum.UserInputType.Touch then return end
		if FFlagAppIaScopedScrollAway and FFlagEnableBottomNavOnMarketplace and p1.onScrollTouchEnded then
			p1.onScrollTouchEnded()
		end
		if FFlagAXExpandPeekViewOnFirstScroll and p1.enableExpandPeekViewOnUpwardScroll then
			UseResult7()
		end
		UseBindingResult2(false)
		local UseResultResult = UseResult6()
		
		if UseResultResult then
			UseResult3(UseResultResult, true)
			
			return
		else
			UseBindingResult2_2(UseResult(UseRefResult7.current))
		end
	end, {
		UseResult3,
		UseResult6,
		if FFlagAppIaScopedScrollAway and FFlagEnableBottomNavOnMarketplace then p1.onScrollTouchEnded else nil
	})
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseFullViewModuleResult (copy), UIFullView (upval), SceneFullView (upval), UseResult3 (copy), None (upval)
		if UseFullViewModuleResult == UIFullView or UseFullViewModuleResult == SceneFullView then
			UseResult3(None, true)
			
			return
		else
			UseResult3(UIFullView, true)
		end
	end, { UseFullViewModuleResult, UseResult3 })
	local UseResult12 = ReactModule.useCallback(function(p2): number
		-- upvalues: YOffset (copy)
		local YOffsetDelta = YOffset - p2
		
		return if YOffsetDelta > 100 then 1 else YOffsetDelta / 80
	end, {})
	local UseResult13 = ReactModule.useCallback(function(p2): UDim2
		-- upvalues: YOffset (copy), Size900 (copy), Size100 (copy)
		local YOffsetDelta = YOffset - p2
		
		if YOffsetDelta > 50 then
			return UDim2.new(0, Size900, 0, Size100)
		else
			local YOffsetDeltaRatio = YOffsetDelta / 50
			
			return UDim2.new(1 - YOffsetDeltaRatio, Size900 * YOffsetDeltaRatio, 0, (math.clamp(Size100 * YOffsetDeltaRatio, 1, Size100)))
		end
	end, {})
	local Callback1 = nil
	local Callback2 = nil
	
	if FFlagAXHideMenuOnScroll then
		Callback2 = ReactModule.useCallback(function(p2): number
			-- upvalues: FullHeight (copy), AlwaysShowingHeight (copy), MidHeight (copy)
			return math.clamp((FullHeight - (p2 + AlwaysShowingHeight)) / (FullHeight - MidHeight), 0, 1) * 12
		end, { FullHeight, AlwaysShowingHeight, MidHeight })
		Callback1 = ReactModule.useCallback(function(p2)
			-- upvalues: YOffset (copy), ConstantsModule (upval)
			local YOffsetDelta = YOffset - p2
			
			return if YOffsetDelta > 50 then ConstantsModule.PeekHeaderHeight else ConstantsModule.PeekHeaderMinHeight + (ConstantsModule.PeekHeaderHeight - ConstantsModule.PeekHeaderMinHeight) * (YOffsetDelta / 50)
		end, { YOffset })
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 1, 1, 0),
		ref = UseRefResult
	}, {
		DropShadowBackground = ReactModule.createElement("Frame", {
			ZIndex = 0,
			Size = UDim2.new(1, 0, 0, 36),
			Position = UseBindingResult1:map(function(p2): UDim2
				-- upvalues: AlwaysShowingHeight (copy)
				return UDim2.new(0, 0, 1, -p2 - AlwaysShowingHeight - 30)
			end)
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, UseStyleResult.Theme.DropShadow.Color),
					ColorSequenceKeypoint.new(1, UseStyleResult.Theme.DropShadow.Color)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0.7)
				})
			})
		}),
		AdaptiveScrollingViewOpaqueBackground = if FullHeightOptions and FullHeightOptions.opaqueBackground then ReactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromOffset(0, -TopBarHeight),
			BackgroundTransparency = UseBindingResult1:map(UseResult12),
			BackgroundColor3 = Theme.BackgroundDefault.Color
		}) else nil,
		ClipFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.fromScale(0.5, 1),
			Size = UseBindingResult1:map(function(p2): UDim2
				-- upvalues: AlwaysShowingHeight (copy)
				return UDim2.new(1, 0, 0, p2 + AlwaysShowingHeight)
			end),
			ZIndex = if FFlagAXAdaptiveScrollingViewBanner then 2 else nil
		}, {
			ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
				ref = UseRefResult1,
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.fromScale(0.5, 1),
				Size = UDim2.new(1, 0, 0, FullHeight),
				CanvasSize = UDim2.new(1, 0, 0, FullHeight + YOffset),
				BackgroundTransparency = 1,
				ScrollingDirection = if FFlagAXSlotsPeekViewScrollFix and p1.disableViewChangeByScroll then p1.disableViewChangeByScroll:map(function(p2)
					return if p2 then Enum.ScrollingDirection.X else Enum.ScrollingDirection.Y
				end) else Enum.ScrollingDirection.Y,
				ScrollBarThickness = 0,
				ScrollingEnabled = if FFlagAXEnableSlotBasedEditorModule then if p1.enableViewModeTransition == nil then not FFlagAXExpandPeekViewOnFirstScroll or v1 else p1.enableViewModeTransition else nil,
				ElasticBehavior = Enum.ElasticBehavior.Never,
				[ReactModule.Change.CanvasPosition] = onCanvasPositionChanged
			}, {
				VerticalLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Spacer = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Active = false,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, YOffset)
				}),
				PeekHeader = ReactModule.createElement("TextButton", {
					Text = "",
					LayoutOrder = 2,
					ZIndex = 2,
					BackgroundTransparency = 1,
					Size = if FFlagAXHideMenuOnScroll and (FullHeightOptions and FullHeightOptions.draggerToDivider) then UseBindingResult1:map(function(p2): UDim2
						-- upvalues: Callback1 (ref)
						return UDim2.new(1, 0, 0, Callback1(p2))
					end) else UDim2.new(1, 0, 0, ConstantsModule.PeekHeaderHeight),
					BorderSizePixel = 0,
					[ReactModule.Event.Activated] = UseResult11
				}, {
					PeekHeaderBackground = ReactModule.createElement("Frame", {
						LayoutOrder = 2,
						ZIndex = 1,
						BorderSizePixel = 0,
						Active = false,
						Size = if FFlagAXHideMenuOnScroll and (FullHeightOptions and FullHeightOptions.draggerToDivider) then UseBindingResult1:map(function(p2): UDim2
							-- upvalues: Callback2 (ref), Callback1 (ref)
							return UDim2.new(1, 0, 0, Callback1(p2) + Callback2(p2))
						end) else UDim2.new(1, 0, 0, ConstantsModule.PeekHeaderHeight + 12),
						BackgroundTransparency = if FFlagAXCatalogOffersBannerEnabled and HasPeekHeaderUsesElevatedBackground then Transparency else Theme.BackgroundDefault.Transparency,
						BackgroundColor3 = if FFlagAXCatalogOffersBannerEnabled and HasPeekHeaderUsesElevatedBackground then Color elseif FFlagAXAdaptiveScrollingViewBanner and p1.banner then Theme.BackgroundContrast.Color else Theme.BackgroundDefault.Color
					}, {
						UICorner = ReactModule.createElement("UICorner", {
							CornerRadius = if FFlagAXHideMenuOnScroll and FullHeightOptions and FullHeightOptions.draggerToDivider then UseBindingResult1:map(function(p2): UDim
								-- upvalues: Callback2 (ref)
								return UDim.new(0, Callback2(p2))
							end) else UDim.new(0, 12)
						})
					}),
					Dragger = ReactModule.createElement("Frame", {
						ZIndex = 2,
						BorderSizePixel = 0,
						Active = false,
						BackgroundColor3 = if AXFixAdaptiveScrollingDraggerColor then (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Stroke.Emphasis else UseTokensResult.Semantic.Color.Common.Divider).Color3 else UseTokensResult.Color.Extended.White.White_10.Color3,
						BackgroundTransparency = if AXFixAdaptiveScrollingDraggerColor then (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Stroke.Emphasis else UseTokensResult.Semantic.Color.Common.Divider).Transparency else UseTokensResult.Color.Extended.White.White_10.Transparency,
						Size = if FullHeightOptions and FullHeightOptions.draggerToDivider then UseBindingResult1:map(UseResult13) else UDim2.new(0, Size900, 0, Size100),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					}, {
						DraggerUICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) })
					})
				}),
				Banner = if FFlagAXAdaptiveScrollingViewBanner and p1.banner then ReactModule.createElement("Frame", {
					LayoutOrder = 3,
					ZIndex = 3,
					BorderSizePixel = 0,
					BackgroundTransparency = if FFlagAXCatalogOffersBannerEnabled and HasPeekHeaderUsesElevatedBackground then Transparency else nil,
					BackgroundColor3 = if FFlagAXCatalogOffersBannerEnabled and HasPeekHeaderUsesElevatedBackground then Color else Theme.BackgroundContrast.Color,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, { Content = p1.banner }) else nil,
				ExpandingContent = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Size = UseBindingResult1:map(function(p2): UDim2
						-- upvalues: AlwaysShowingHeight (copy)
						return UDim2.new(1, 0, 0, p2 + AlwaysShowingHeight)
					end),
					LayoutOrder = if FFlagAXAdaptiveScrollingViewBanner then 4 else 3
				}, {
					AdaptiveScrollingProvider = if FFlagAXCatalogOffersBannerEnabled then ReactModule.createElement(AdaptiveScrollingContext.Provider, { value = UseMemoResult1 }, {
						PeekHeaderBackground = ReactModule.createElement(AdaptiveScrollingViewPeekHeaderBackgroundContextModule.Provider, { value = UseMemoResult }, p1.children)
					}) else ReactModule.createElement(AdaptiveScrollingContext.Provider, { value = UseMemoResult1 }, p1.children)
				}),
				OnInputBegan = ReactModule.createElement(ExternalEventConnection, {
					event = UserInputService.InputBegan,
					callback = UseResult8
				}),
				OnInputChanged = if FFlagAXExpandPeekViewOnFirstScroll then ReactModule.createElement(ExternalEventConnection, {
					event = UserInputService.InputChanged,
					callback = UseResult9
				}) else nil,
				OnInputEnded = ReactModule.createElement(ExternalEventConnection, {
					event = UserInputService.InputEnded,
					callback = UseResult10
				})
			})
		})
	})
end