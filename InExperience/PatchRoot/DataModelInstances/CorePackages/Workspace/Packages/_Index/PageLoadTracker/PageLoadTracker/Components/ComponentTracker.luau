local Parent = script:FindFirstAncestor("PageLoadTracker").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local SharedFlagsModule = require(Parent.SharedFlags)
local CreatePageTrackerModule = require(script.Parent.Parent.createPageTracker)
local PageTrackerContextModule = require(script.Parent.Parent.PageTrackerContext)
local IsElementInScreenBoundsModule = require(script.Parent.Parent.isElementInScreenBounds)
local PageLoadConfigModule = require(script.Parent.Parent.PageLoadConfig)
local VisualDebugManagerModule = require(script.Parent.Parent.VisualDebugManager)
local ExperienceService = require(Parent.ExperienceService).ExperienceService

local function usePageTracker(IsActive, ComponentName) --[[ Line: 16 ]]
	-- upvalues: ReactModule (copy), CreatePageTrackerModule (copy), SharedFlagsModule (copy), ExperienceService (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 17 ]]
		-- upvalues: CreatePageTrackerModule (upval)
		return CreatePageTrackerModule()
	end, {})
	
	if IsActive then
		UseMemoResult:start(ComponentName)
	else
		UseMemoResult:stop()
	end
	ReactModule.useEffect(function() --[[ Line: 27 ]]
		-- upvalues: UseMemoResult (copy), SharedFlagsModule (upval), ExperienceService (upval)
		UseMemoResult:sendMilestone("first_react_frame_rendered")
		local RegisterForExperienceJoinResult = if SharedFlagsModule.FFlagLuaAppPageLoadTrackerJoinExperienceFix then ExperienceService:RegisterForExperienceJoin(function() --[[ Line: 35 ]]
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:stop()
		end) else nil
		
		return function() --[[ Line: 40 ]]
			-- upvalues: UseMemoResult (upval), SharedFlagsModule (upval), RegisterForExperienceJoinResult (ref)
			UseMemoResult:stop()
			
			if SharedFlagsModule.FFlagLuaAppPageLoadTrackerJoinExperienceFix and RegisterForExperienceJoinResult then
				RegisterForExperienceJoinResult:Disconnect()
			end
		end
	end, {})
	
	return UseMemoResult
end

return function(p1) --[[ Line: 57 | Named "ComponentTracker" ]]
	-- upvalues: usePageTracker (copy), ReactModule (copy), SharedFlagsModule (copy), VisualDebugManagerModule (copy), UseSelectorFunction (copy), PageLoadConfigModule (copy), IsElementInScreenBoundsModule (copy), PageTrackerContextModule (copy)
	local UsePageTrackerResult = usePageTracker(p1.isActive, p1.componentName)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	
	if SharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer and UseRefResult.current == nil then
		UseRefResult.current = VisualDebugManagerModule.new()
	end
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 69 ]]
		-- upvalues: PageLoadConfigModule (upval)
		return p2.ScreenSize or PageLoadConfigModule.SCREEN_BOUNDS.DEFAULT_SCREEN_SIZE
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2) --[[ Line: 73 ]]
		-- upvalues: PageLoadConfigModule (upval)
		return p2.TopBar and p2.TopBar.topBarHeight or PageLoadConfigModule.SCREEN_BOUNDS.DEFAULT_TOP_BAR_HEIGHT
	end)
	
	local function _(Gui) --[[ Line: 77 | Named "addTrackingToChild" ]]
		-- upvalues: IsElementInScreenBoundsModule (upval), UseSelectorResult (copy), UseSelectorResult1 (copy), UsePageTrackerResult (copy), SharedFlagsModule (upval), UseRefResult (copy)
		if not Gui:IsA("GuiObject") then return end
		if IsElementInScreenBoundsModule(Gui, UseSelectorResult, UseSelectorResult1) then
			UsePageTrackerResult:onComponentAdded(Gui)
			
			if SharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
				UseRefResult.current:highlightComponent(Gui)
			end
		end
	end
	
	local function setupChildTracking(Current) --[[ Line: 90 ]]
		-- upvalues: SharedFlagsModule (upval), IsElementInScreenBoundsModule (upval), UseSelectorResult (copy), UseSelectorResult1 (copy), UsePageTrackerResult (copy), UseRefResult (copy)
		for _, Gui in Current:GetDescendants() do
			if SharedFlagsModule.FFlagLuaAppImproveComponentTrackingTiming then
				task.defer(function() --[[ Line: 93 ]]
					-- upvalues: Gui (copy), IsElementInScreenBoundsModule (upval), UseSelectorResult (upval), UseSelectorResult1 (upval), UsePageTrackerResult (upval), SharedFlagsModule (upval), UseRefResult (upval)
					if not Gui:IsA("GuiObject") then return end
					if IsElementInScreenBoundsModule(Gui, UseSelectorResult, UseSelectorResult1) then
						UsePageTrackerResult:onComponentAdded(Gui)
						
						if SharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
							UseRefResult.current:highlightComponent(Gui)
						end
					end
				end)
			elseif Gui:IsA("GuiObject") and IsElementInScreenBoundsModule(Gui, UseSelectorResult, UseSelectorResult1) then
				UsePageTrackerResult:onComponentAdded(Gui)
				
				if SharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
					UseRefResult.current:highlightComponent(Gui)
				end
			end
		end
		return (Current.DescendantAdded:Connect(function(Descendant) --[[ Line: 100 ]]
			-- upvalues: SharedFlagsModule (upval), IsElementInScreenBoundsModule (upval), UseSelectorResult (upval), UseSelectorResult1 (upval), UsePageTrackerResult (upval), UseRefResult (upval)
			if SharedFlagsModule.FFlagLuaAppImproveComponentTrackingTiming then
				task.defer(function() --[[ Line: 106 ]]
					-- upvalues: Descendant (copy), IsElementInScreenBoundsModule (upval), UseSelectorResult (upval), UseSelectorResult1 (upval), UsePageTrackerResult (upval), SharedFlagsModule (upval), UseRefResult (upval)
					if not Descendant:IsA("GuiObject") then return end
					if IsElementInScreenBoundsModule(Descendant, UseSelectorResult, UseSelectorResult1) then
						UsePageTrackerResult:onComponentAdded(Descendant)
						
						if SharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
							UseRefResult.current:highlightComponent(Descendant)
						end
					end
				end)
				
				return
			end
			if not Descendant:IsA("GuiObject") then return end
			if IsElementInScreenBoundsModule(Descendant, UseSelectorResult, UseSelectorResult1) then
				UsePageTrackerResult:onComponentAdded(Descendant)
				
				if SharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
					UseRefResult.current:highlightComponent(Descendant)
				end
			end
		end))
	end
	
	if SharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
		ReactModule.useEffect(function() --[[ Line: 117 ]]
			-- upvalues: UseRefResult (copy)
			return function() --[[ Line: 118 ]]
				-- upvalues: UseRefResult (upval)
				UseRefResult.current:destroy()
			end
		end, {})
	end
	ReactModule.useLayoutEffect(function() --[[ Line: 124 ]]
		-- upvalues: p1 (copy), UseRefResult1 (copy), setupChildTracking (copy), SharedFlagsModule (upval), UsePageTrackerResult (copy)
		if not p1.isActive then return end
		local SetupChildTrackingResult = setupChildTracking(UseRefResult1.current)
		
		if SharedFlagsModule.FFlagPageLoadAllowImprovedDisconnectTiming then
			UsePageTrackerResult.onCompleteSignal:connect(function() --[[ Line: 129 ]]
				-- upvalues: SetupChildTrackingResult (copy)
				SetupChildTrackingResult:Disconnect()
			end)
			
			return
		else
			return function() --[[ Line: 134 ]]
				-- upvalues: SetupChildTrackingResult (copy)
				SetupChildTrackingResult:Disconnect()
			end
		end
	end, { p1.isActive })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = UseRefResult1,
		Size = UDim2.fromScale(1, 1)
	}, {
		PageTrackerContext = ReactModule.createElement(PageTrackerContextModule.Provider, { value = UsePageTrackerResult }, p1.children)
	})
end