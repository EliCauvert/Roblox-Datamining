local parent = script:FindFirstAncestor("BuildExperience").Parent
local runService = game:GetService("RunService")
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local isGetThrottleFramerateEnabledAvailableEngineFeature = game:GetEngineFeature("IsGetThrottleFramerateEnabledAvailable")
local var1 = 0
local var2 = false

return function(p1, p2)
	-- upvalues: runService (ref), isGetThrottleFramerateEnabledAvailableEngineFeature (ref), appLifecycleObserverService (ref), navigationModule (ref), reactModule (ref), var1 (write), var2 (write), roactNavigationModule (ref)
	local var3 = if p2 ~= nil then runService else p2.runService
	local var4 = if p2 ~= nil then isGetThrottleFramerateEnabledAvailableEngineFeature else p2.canControlThrottle
	local var5 = if p2 == nil or p2.appLifecycleObserverService == nil then appLifecycleObserverService else p2.appLifecycleObserverService
	local var6 = navigationModule.useNavigation()
	local var7 = reactModule.useRef(true)
	local var8 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var7 (ref), var8 (ref), var5 (ref)
		if var4 then
			local function _(value)
				-- upvalues: var7 (copy), var8 (copy)
				var7.current = value
				local current = var8.current
				
				if current ~= nil then
					current()
				end
			end
			
			local onHideConnection = var5.OnHide:Connect(function()
				-- upvalues: var7 (copy), var8 (copy)
				var7.current = false
				local current = var8.current
				
				if current ~= nil then
					current()
				end
			end)
			local onUnhideConnection = var5.OnUnhide:Connect(function()
				-- upvalues: var7 (copy), var8 (copy)
				var7.current = true
				local current = var8.current
				
				if current ~= nil then
					current()
				end
			end)
			
			return function()
				-- upvalues: onHideConnection (ref), onUnhideConnection (ref)
				onHideConnection:Disconnect()
				onUnhideConnection:Disconnect()
			end
		end
		return nil
	end, { var4, var5 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var6 (ref), var7 (ref), var1 (copy), var2 (copy), var3 (ref), var8 (ref), roactNavigationModule (copy)
		if not p1 or not var4 then
			return nil
		end
		local var9 = false
		local var10 = if var6 ~= nil then var6.isFocused() else true
		
		local function _()
			-- upvalues: var9 (write), var7 (copy), var10 (write), var1 (copy), var2 (copy), var3 (copy)
			if var9 or not var7.current or not var10 then return end
			if var1 == 0 then
				var2 = var3:getThrottleFramerateEnabled()
				var3:setThrottleFramerateEnabled(false)
			end
			var1 += 1
			var9 = true
		end
		
		local _ = function()
			-- upvalues: var9 (write), var1 (copy), var3 (copy), var2 (copy)
			if not var9 then return end
			var9 = false
			var1 -= 1
			
			if var1 == 0 then
				var3:setThrottleFramerateEnabled(var2)
			end
		end
		
		function var13.current()
			-- upvalues: var7 (copy), var9 (write), var10 (write), var1 (copy), var2 (copy), var3 (copy)
			if var7.current then
				if var9 or not var7.current then return end
				if not var10 then return end
				if var1 == 0 then
					var2 = var3:getThrottleFramerateEnabled()
					var3:setThrottleFramerateEnabled(false)
				end
				var1 += 1
				var9 = true
				
				return
			elseif not var9 then return end
			var9 = false
			var1 -= 1
			
			if var1 == 0 then
				var3:setThrottleFramerateEnabled(var2)
			end
		end
		
		local var11 = if var6 ~= nil then nil else var6.addListener(roactNavigationModule.Events.WillFocus, function()
			-- upvalues: var10 (write), var9 (write), var7 (copy), var1 (copy), var2 (copy), var3 (copy)
			var10 = true
			
			if not var9 and var7.current then
				if var1 == 0 then
					var2 = var3:getThrottleFramerateEnabled()
					var3:setThrottleFramerateEnabled(false)
				end
				var1 += 1
				var9 = true
			end
		end)
		local var12 = if var6 ~= nil then nil else var6.addListener(roactNavigationModule.Events.WillBlur, function()
			-- upvalues: var10 (write), var9 (write), var1 (copy), var3 (copy), var2 (copy)
			var10 = false
			
			if not var9 then return end
			var9 = false
			var1 -= 1
			
			if var1 == 0 then
				var3:setThrottleFramerateEnabled(var2)
			end
		end)
		
		if var7.current and var10 then
			if var1 == 0 then
				var2 = var3:getThrottleFramerateEnabled()
				var3:setThrottleFramerateEnabled(false)
			end
			var1 += 1
			var9 = true
		end
		return function()
			-- upvalues: var8 (copy), var11 (ref), var12 (ref), var9 (write), var1 (copy), var3 (copy), var2 (copy)
			var8.current = nil
			
			if var11 ~= nil and var12 ~= nil then
				var11.remove()
				var12.remove()
			end
			if not var9 then return end
			var9 = false
			var1 -= 1
			
			if var1 == 0 then
				var3:setThrottleFramerateEnabled(var2)
			end
		end
	end, { p1, var4, var6 or false, var3 })
end