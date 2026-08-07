local parent = script:FindFirstAncestor("PageLoadTracker").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local sharedFlagsModule = require(parent.SharedFlags)
local createPageTrackerModule = require(script.Parent.Parent.createPageTracker)
local pageTrackerContextModule = require(script.Parent.Parent.PageTrackerContext)
local isElementInScreenBoundsModule = require(script.Parent.Parent.isElementInScreenBounds)
local pageLoadConfigModule = require(script.Parent.Parent.PageLoadConfig)
local visualDebugManagerModule = require(script.Parent.Parent.VisualDebugManager)
local experienceService = require(parent.ExperienceService).ExperienceService

local function usePageTracker(p0, p1) --[[ line: 16 ]]
	-- upvalues: reactModule (ref), createPageTrackerModule (ref), sharedFlagsModule (ref), experienceService (ref)
	local var8 = reactModule.useMemo(function() --[[ line: 17 ]]
		-- upvalues: createPageTrackerModule (copy)
		return createPageTrackerModule()
	end, {})
	
	if p0 then
		var8:start(p1)
	else
		var8:stop()
	end
	reactModule.useEffect(function() --[[ line: 27 ]]
		-- upvalues: var8 (ref), sharedFlagsModule (copy), experienceService (copy)
		var8:sendMilestone("first_react_frame_rendered")
		local var9 = if sharedFlagsModule.FFlagLuaAppPageLoadTrackerJoinExperienceFix then experienceService:RegisterForExperienceJoin(function() --[[ line: 35 ]]
			-- upvalues: var8 (copy)
			var8:stop()
		end) else nil
		
		return function() --[[ line: 40 ]]
			-- upvalues: var8 (copy), sharedFlagsModule (copy), var9 (write)
			var8:stop()
			
			if sharedFlagsModule.FFlagLuaAppPageLoadTrackerJoinExperienceFix and var9 then
				var9:Disconnect()
			end
		end
	end, {})
	
	return var8
end

return function(p2) --[[ line: 57 | named "ComponentTracker" ]]
	-- upvalues: usePageTracker (ref), reactModule (ref), sharedFlagsModule (ref), visualDebugManagerModule (ref), useSelector (ref), pageLoadConfigModule (ref), isElementInScreenBoundsModule (ref), pageTrackerContextModule (ref)
	local var10 = usePageTracker(p2.isActive, p2.componentName)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(nil)
	
	if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer and var11.current == nil then
		var11.current = visualDebugManagerModule.new()
	end
	local var13 = useSelector(function(p3) --[[ line: 69 ]]
		-- upvalues: pageLoadConfigModule (copy)
		return p3.ScreenSize or pageLoadConfigModule.SCREEN_BOUNDS.DEFAULT_SCREEN_SIZE
	end)
	local var14 = useSelector(function(p4) --[[ line: 73 ]]
		-- upvalues: pageLoadConfigModule (copy)
		return if p4.TopBar then p4.TopBar.topBarHeight else pageLoadConfigModule.SCREEN_BOUNDS.DEFAULT_TOP_BAR_HEIGHT
	end)
	
	local function _(p5) --[[ line: 77 | named "addTrackingToChild" ]]
		-- upvalues: isElementInScreenBoundsModule (copy), var13 (ref), var14 (ref), var10 (ref), sharedFlagsModule (copy), var11 (ref)
		if not p5:IsA("GuiObject") then return end
		if isElementInScreenBoundsModule(p5, var13, var14) then
			var10:onComponentAdded(p5)
			
			if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
				var11.current:highlightComponent(p5)
			end
		end
	end
	
	local function setupChildTracking(value) --[[ line: 90 ]]
		-- upvalues: sharedFlagsModule (copy), isElementInScreenBoundsModule (copy), var13 (ref), var14 (ref), var10 (ref), var11 (ref)
		for i, v in value:GetDescendants() do
			if sharedFlagsModule.FFlagLuaAppImproveComponentTrackingTiming then
				task.defer(function() --[[ line: 93 ]]
					-- upvalues: v (ref), isElementInScreenBoundsModule (copy), var13 (copy), var14 (copy), var10 (copy), sharedFlagsModule (copy), var11 (copy)
					if not v:IsA("GuiObject") then return end
					if isElementInScreenBoundsModule(v, var13, var14) then
						var10:onComponentAdded(v)
						
						if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
							var11.current:highlightComponent(v)
						end
					end
				end)
			elseif v:IsA("GuiObject") and isElementInScreenBoundsModule(v, var13, var14) then
				var10:onComponentAdded(v)
				
				if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
					var11.current:highlightComponent(v)
				end
			end
		end
		return value.DescendantAdded:Connect(function(p6) --[[ line: 100 ]]
			-- upvalues: sharedFlagsModule (copy), isElementInScreenBoundsModule (copy), var13 (copy), var14 (copy), var10 (copy), var11 (copy)
			if sharedFlagsModule.FFlagLuaAppImproveComponentTrackingTiming then
				task.defer(function() --[[ line: 106 ]]
					-- upvalues: p6 (ref), isElementInScreenBoundsModule (copy), var13 (copy), var14 (copy), var10 (copy), sharedFlagsModule (copy), var11 (copy)
					if not p6:IsA("GuiObject") then return end
					if isElementInScreenBoundsModule(p6, var13, var14) then
						var10:onComponentAdded(p6)
						
						if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
							var11.current:highlightComponent(p6)
						end
					end
				end)
				
				return
			elseif not p6:IsA("GuiObject") then return end
			if isElementInScreenBoundsModule(p6, var13, var14) then
				var10:onComponentAdded(p6)
				
				if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
					var11.current:highlightComponent(p6)
				end
			end
		end)
	end
	
	if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
		reactModule.useEffect(function() --[[ line: 117 ]]
			-- upvalues: var11 (ref)
			return function() --[[ line: 118 ]]
				-- upvalues: var11 (copy)
				var11.current:destroy()
			end
		end, {})
	end
	reactModule.useLayoutEffect(function() --[[ line: 124 ]]
		-- upvalues: p2 (ref), var12 (ref), setupChildTracking (ref), sharedFlagsModule (copy), var10 (ref)
		if not p2.isActive then return end
		local var16 = setupChildTracking(var12.current)
		
		if sharedFlagsModule.FFlagPageLoadAllowImprovedDisconnectTiming then
			var10.onCompleteSignal:connect(function() --[[ line: 129 ]]
				-- upvalues: var16 (ref)
				var16:Disconnect()
			end)
			
			return
		end
		return function() --[[ line: 134 ]]
			-- upvalues: var16 (ref)
			var16:Disconnect()
		end
	end, { p2.isActive })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = var12,
		Size = UDim2.fromScale(1, 1)
	}, {
		PageTrackerContext = reactModule.createElement(pageTrackerContextModule.Provider, { value = var10 }, p2.children)
	})
end