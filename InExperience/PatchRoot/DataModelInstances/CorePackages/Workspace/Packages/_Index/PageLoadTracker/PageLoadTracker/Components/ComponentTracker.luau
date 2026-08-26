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

local function usePageTracker(p1, p2)
	-- upvalues: reactModule (ref), createPageTrackerModule (ref), sharedFlagsModule (ref), experienceService (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: createPageTrackerModule (copy)
		return createPageTrackerModule()
	end, {})
	
	if p1 then
		var1:start(p2)
	else
		var1:stop()
	end
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), sharedFlagsModule (copy), experienceService (copy)
		var1:sendMilestone("first_react_frame_rendered")
		local var2 = if sharedFlagsModule.FFlagLuaAppPageLoadTrackerJoinExperienceFix then experienceService:RegisterForExperienceJoin(function()
			-- upvalues: var1 (copy)
			var1:stop()
		end) else nil
		
		return function()
			-- upvalues: var1 (copy), sharedFlagsModule (copy), var2 (write)
			var1:stop()
			
			if sharedFlagsModule.FFlagLuaAppPageLoadTrackerJoinExperienceFix and var2 then
				var2:Disconnect()
			end
		end
	end, {})
	
	return var1
end

return function(p1)
	-- upvalues: usePageTracker (ref), reactModule (ref), sharedFlagsModule (ref), visualDebugManagerModule (ref), useSelector (ref), pageLoadConfigModule (ref), isElementInScreenBoundsModule (ref), pageTrackerContextModule (ref)
	local var1 = usePageTracker(p1.isActive, p1.componentName)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	
	if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer and var2.current == nil then
		var2.current = visualDebugManagerModule.new()
	end
	local var4 = useSelector(function(p2)
		-- upvalues: pageLoadConfigModule (copy)
		return p2.ScreenSize or pageLoadConfigModule.SCREEN_BOUNDS.DEFAULT_SCREEN_SIZE
	end)
	local var5 = useSelector(function(p2)
		-- upvalues: pageLoadConfigModule (copy)
		return if p2.TopBar then p2.TopBar.topBarHeight else pageLoadConfigModule.SCREEN_BOUNDS.DEFAULT_TOP_BAR_HEIGHT
	end)
	
	local function _(p2)
		-- upvalues: isElementInScreenBoundsModule (copy), var4 (ref), var5 (ref), var1 (ref), sharedFlagsModule (copy), var2 (ref)
		if not p2:IsA("GuiObject") then return end
		if isElementInScreenBoundsModule(p2, var4, var5) then
			var1:onComponentAdded(p2)
			
			if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
				var2.current:highlightComponent(p2)
			end
		end
	end
	
	local function setupChildTracking(value)
		-- upvalues: sharedFlagsModule (copy), isElementInScreenBoundsModule (copy), var4 (ref), var5 (ref), var1 (ref), var2 (ref)
		for i, v in value:GetDescendants() do
			if sharedFlagsModule.FFlagLuaAppImproveComponentTrackingTiming then
				task.defer(function()
					-- upvalues: v (ref), isElementInScreenBoundsModule (copy), var4 (copy), var5 (copy), var1 (copy), sharedFlagsModule (copy), var2 (copy)
					if not v:IsA("GuiObject") then return end
					if isElementInScreenBoundsModule(v, var4, var5) then
						var1:onComponentAdded(v)
						
						if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
							var2.current:highlightComponent(v)
						end
					end
				end)
			elseif v:IsA("GuiObject") and isElementInScreenBoundsModule(v, var4, var5) then
				var1:onComponentAdded(v)
				
				if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
					var2.current:highlightComponent(v)
				end
			end
		end
		return value.DescendantAdded:Connect(function(p2)
			-- upvalues: sharedFlagsModule (copy), isElementInScreenBoundsModule (copy), var4 (copy), var5 (copy), var1 (copy), var2 (copy)
			if sharedFlagsModule.FFlagLuaAppImproveComponentTrackingTiming then
				task.defer(function()
					-- upvalues: p2 (ref), isElementInScreenBoundsModule (copy), var4 (copy), var5 (copy), var1 (copy), sharedFlagsModule (copy), var2 (copy)
					if not p2:IsA("GuiObject") then return end
					if isElementInScreenBoundsModule(p2, var4, var5) then
						var1:onComponentAdded(p2)
						
						if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
							var2.current:highlightComponent(p2)
						end
					end
				end)
				
				return
			elseif not p2:IsA("GuiObject") then return end
			if isElementInScreenBoundsModule(p2, var4, var5) then
				var1:onComponentAdded(p2)
				
				if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
					var2.current:highlightComponent(p2)
				end
			end
		end)
	end
	
	if sharedFlagsModule.FFlagDebugEnablePageLoadTrackerVisualizer then
		reactModule.useEffect(function()
			-- upvalues: var2 (ref)
			return function()
				-- upvalues: var2 (copy)
				var2.current:destroy()
			end
		end, {})
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var3 (ref), setupChildTracking (ref), sharedFlagsModule (copy), var1 (ref)
		if not p1.isActive then return end
		local var6 = setupChildTracking(var3.current)
		
		if sharedFlagsModule.FFlagPageLoadAllowImprovedDisconnectTiming then
			var1.onCompleteSignal:connect(function()
				-- upvalues: var6 (ref)
				var6:Disconnect()
			end)
			
			return
		end
		return function()
			-- upvalues: var6 (ref)
			var6:Disconnect()
		end
	end, { p1.isActive })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = var3,
		Size = UDim2.fromScale(1, 1)
	}, {
		PageTrackerContext = reactModule.createElement(pageTrackerContextModule.Provider, { value = var1 }, p1.children)
	})
end