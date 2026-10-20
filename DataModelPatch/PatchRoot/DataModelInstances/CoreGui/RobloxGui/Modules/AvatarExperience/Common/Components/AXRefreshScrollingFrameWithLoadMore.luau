local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RefreshScrollingFrameModule = require(Modules.LuaApp.Components.RefreshScrollingFrame)
local DebounceModule = require(Modules.LuaApp.Util.debounce)
local UseAXAnimateScrollFrameFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.AnimatedScrollingFrame.useAXAnimateScrollFrame
local FFlagAXScrollingFramesShouldAnimateOnFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local AXScrollingFramePreloadDistanceProp2 = GetFFlagAXEnableSlotBasedEditorModule() and game:DefineFastFlag("AXScrollingFramePreloadDistanceProp2", false)
local AXScrollingFramePreventInitialLoadMore3 = GetFFlagAXEnableSlotBasedEditorModule() and game:DefineFastFlag("AXScrollingFramePreventInitialLoadMore3", false)
local AXScrollingPreloadDistance = game:DefineFastInt("AXScrollingPreloadDistance", 2000)
local FFlagAXFixGamepadNavigationOnOutfitManagement = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixGamepadNavigationOnOutfitManagement

return ReactModule.forwardRef(function(p1, p2)
	-- upvalues: AXScrollingFramePreventInitialLoadMore3 (copy), ReactModule (copy), DebounceModule (copy), AXScrollingFramePreloadDistanceProp2 (copy), AXScrollingPreloadDistance (copy), FFlagAXScrollingFramesShouldAnimateOnFocus (copy), UseAXAnimateScrollFrameFunction (copy), CryoModule (copy), FFlagAXFixGamepadNavigationOnOutfitManagement (copy), RefreshScrollingFrameModule (copy)
	local UseRefResult = nil
	local Callback = nil
	
	if AXScrollingFramePreventInitialLoadMore3 then
		UseRefResult = ReactModule.useRef(not p1.preventInitialLoadMore)
		Callback = ReactModule.useCallback(DebounceModule(function()
			-- upvalues: UseRefResult (ref)
			UseRefResult.current = true
		end, 0.5), {})
	end
	local function onScrollingFrameChanged(ScrollFrame)
		-- upvalues: p1 (copy), AXScrollingFramePreventInitialLoadMore3 (upval), UseRefResult (ref), AXScrollingFramePreloadDistanceProp2 (upval), AXScrollingPreloadDistance (upval)
		local OnThresholdReachedFunction: () -> () = p1.onThresholdReached
		local NoPreventInitialLoadMore = if AXScrollingFramePreventInitialLoadMore3 then not p1.preventInitialLoadMore or UseRefResult.current else nil
		
		if OnThresholdReachedFunction then
			if AXScrollingFramePreventInitialLoadMore3 and not NoPreventInitialLoadMore then return end
			if ScrollFrame.CanvasPosition.Y > ScrollFrame.CanvasSize.Y.Offset - ScrollFrame.AbsoluteWindowSize.Y - (if AXScrollingFramePreloadDistanceProp2 and p1.preloadDistance then p1.preloadDistance else AXScrollingPreloadDistance) then
				OnThresholdReachedFunction()
			end
		end
	end
	
	local function onCanvasPositionChanged(ScrollFrame)
		-- upvalues: onScrollingFrameChanged (copy), p1 (copy)
		onScrollingFrameChanged(ScrollFrame)
		
		if p1.onCanvasPositionChanged then
			p1.onCanvasPositionChanged(ScrollFrame)
		end
	end
	
	local function onCanvasSizeChanged(ScrollFrame)
		-- upvalues: AXScrollingFramePreventInitialLoadMore3 (upval), UseRefResult (ref), Callback (ref), onScrollingFrameChanged (copy), p1 (copy)
		if AXScrollingFramePreventInitialLoadMore3 and (not UseRefResult or not UseRefResult.current) then
			Callback()
		end
		onScrollingFrameChanged(ScrollFrame)
		
		if p1.onCanvasSizeChanged then
			p1.onCanvasSizeChanged(ScrollFrame)
		end
	end
	
	local function onAbsoluteWindowSizeChanged(ScrollFrame)
		-- upvalues: onScrollingFrameChanged (copy), p1 (copy)
		onScrollingFrameChanged(ScrollFrame)
		
		if p1.onAbsoluteWindowSizeChanged then
			p1.onAbsoluteWindowSizeChanged(ScrollFrame)
		end
	end
	
	local v1 = p2
	
	if FFlagAXScrollingFramesShouldAnimateOnFocus then
		local UseRefResult1 = ReactModule.useRef(nil)
		
		if not v1 then
			v1 = UseRefResult1
		end
		UseAXAnimateScrollFrameFunction(v1)
	end
	return ReactModule.createElement(RefreshScrollingFrameModule, (CryoModule.Dictionary.join(p1, {
		onCanvasPositionChangedCallback = onCanvasPositionChanged,
		onCanvasSizeChangedCallback = onCanvasSizeChanged,
		onAbsoluteWindowSizeChangedCallback = onAbsoluteWindowSizeChanged,
		onThresholdReached = CryoModule.None,
		showLoadingBar = CryoModule.None,
		onCanvasPositionChanged = CryoModule.None,
		onCanvasSizeChanged = CryoModule.None,
		onAbsoluteWindowSizeChanged = CryoModule.None,
		Selectable = if FFlagAXFixGamepadNavigationOnOutfitManagement then p1.Selectable else nil,
		ref = if FFlagAXScrollingFramesShouldAnimateOnFocus then v1 else p2
	})))
end)