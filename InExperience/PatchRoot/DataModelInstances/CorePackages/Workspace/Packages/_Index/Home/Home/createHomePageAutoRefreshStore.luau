local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local signalsModule = require(parent.Signals)
local getSduiApiStore = require(parent.SduiSharedUtilities).getSduiApiStore
local homeConstantsModule = require(home.HomeConstants)
local refreshHomePageModule = require(home.refreshHomePage)
local sduiHomePageAutoRefreshIntervalSeconds = game:DefineFastInt("SduiHomePageAutoRefreshIntervalSeconds", 10800)

local function _(p1, p2)
	local var1 = true
	local deferredThread = task.defer(function()
		-- upvalues: p1 (ref), var1 (write), p2 (ref)
		local var2 = p1
		while var2 > 0 and var1 do
			var2 -= task.wait(math.min(var2, 300))
		end
		if var1 then
			var1 = false
			p2()
		end
	end)
	
	return function()
		-- upvalues: var1 (write), deferredThread (ref)
		if var1 then
			var1 = false
			task.cancel(deferredThread)
		end
	end
end

return function()
	-- upvalues: refreshHomePageModule (ref), homeConstantsModule (ref), sduiHomePageAutoRefreshIntervalSeconds (ref), signalsModule (ref), getSduiApiStore (ref)
	local var2 = nil
	local var3 = nil
	
	local function _()
		-- upvalues: var2 (write)
		if var2 then
			var2()
			var2 = nil
		end
	end
	
	local function stop()
		-- upvalues: var3 (write), var2 (write)
		if var3 then
			var3()
			var3 = nil
		end
		if var2 then
			var2()
			var2 = nil
		end
	end
	
	local function scheduleRefresh(p3)
		-- upvalues: var2 (write), refreshHomePageModule (copy), homeConstantsModule (copy), sduiHomePageAutoRefreshIntervalSeconds (copy), scheduleRefresh (ref)
		local var4 = function()
			-- upvalues: var2 (copy), refreshHomePageModule (copy), homeConstantsModule (copy), sduiHomePageAutoRefreshIntervalSeconds (copy), scheduleRefresh (copy)
			var2 = nil
			local var5 = refreshHomePageModule(homeConstantsModule.RequestIntent.AutoRefresh, nil, false)
			
			if var5 then
				var5:catch(function(p4)
					-- upvalues: sduiHomePageAutoRefreshIntervalSeconds (copy), scheduleRefresh (copy)
					warn("We failed to auto-refresh SDUI Home!", p4)
					
					if sduiHomePageAutoRefreshIntervalSeconds > 0 then
						scheduleRefresh(sduiHomePageAutoRefreshIntervalSeconds)
					end
				end)
			end
		end
		
		local var5 = true
		local deferredThread = task.defer(function()
			-- upvalues: p3 (ref), var5 (write), var4 (ref)
			local var6 = p3
			while true do
				while var6 > 0 and var5 do
					var6 -= task.wait(math.min(var6, 300))
				end
				if var5 then
					var5 = false
					var4()
				end
			end
		end)
		
		var2 = function()
			-- upvalues: var5 (write), deferredThread (ref)
			if var5 then
				var5 = false
				task.cancel(deferredThread)
			end
		end
	end
	
	return {
		start = function()
			-- upvalues: var3 (write), var2 (write), signalsModule (copy), getSduiApiStore (copy), homeConstantsModule (copy), sduiHomePageAutoRefreshIntervalSeconds (copy), refreshHomePageModule (copy), scheduleRefresh (ref), stop (ref)
			if var3 then
				var3()
				var3 = nil
			end
			if var2 then
				var2()
				var2 = nil
			end
			var3 = signalsModule.createEffect(function(p4)
				-- upvalues: getSduiApiStore (copy), homeConstantsModule (copy), var2 (copy), sduiHomePageAutoRefreshIntervalSeconds (copy), refreshHomePageModule (copy), scheduleRefresh (copy)
				local dataUpdatedTimestamp = getSduiApiStore().getDataUpdatedTimestamp(homeConstantsModule.ConfigKey, p4)
				
				if var2 then
					var2()
					var2 = nil
				end
				if dataUpdatedTimestamp and sduiHomePageAutoRefreshIntervalSeconds > 0 then
					local maxValue = math.max(0, dataUpdatedTimestamp + sduiHomePageAutoRefreshIntervalSeconds - os.clock())
					
					local var7 = function()
						-- upvalues: var2 (copy), refreshHomePageModule (copy), homeConstantsModule (copy), sduiHomePageAutoRefreshIntervalSeconds (copy), scheduleRefresh (copy)
						var2 = nil
						local var8 = refreshHomePageModule(homeConstantsModule.RequestIntent.AutoRefresh, nil, false)
						
						if var8 then
							var8:catch(function(p5)
								-- upvalues: sduiHomePageAutoRefreshIntervalSeconds (copy), scheduleRefresh (copy)
								warn("We failed to auto-refresh SDUI Home!", p5)
								
								if sduiHomePageAutoRefreshIntervalSeconds > 0 then
									scheduleRefresh(sduiHomePageAutoRefreshIntervalSeconds)
								end
							end)
						end
					end
					
					local var8 = true
					local deferredThread = task.defer(function()
						-- upvalues: maxValue (ref), var8 (write), var7 (ref)
						local var9 = maxValue
						while true do
							while var9 > 0 and var8 do
								var9 -= task.wait(math.min(var9, 300))
							end
							if var8 then
								var8 = false
								var7()
							end
						end
					end)
					
					var2 = function()
						-- upvalues: var8 (write), deferredThread (ref)
						if var8 then
							var8 = false
							task.cancel(deferredThread)
						end
					end
				end
			end)
			
			return stop
		end
	}
end