local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local SignalsModule = require(Parent.Signals)
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore
local HomeConstantsModule = require(Home.HomeConstants)
local RefreshHomePageModule = require(Home.refreshHomePage)
local SduiHomePageAutoRefreshIntervalSeconds = game:DefineFastInt("SduiHomePageAutoRefreshIntervalSeconds", 10800)

local function _(p1, p2)
	local v1 = true
	local DeferredThread = task.defer(function()
		-- upvalues: p1 (copy), v1 (ref), p2 (copy)
		local Largest: number = p1
		while Largest > 0 and v1 do
			Largest -= task.wait((math.min(Largest, 300)))
		end
		if v1 then
			v1 = false
			p2()
		end
	end)
	
	return function()
		-- upvalues: v1 (ref), DeferredThread (copy)
		if v1 then
			v1 = false
			task.cancel(DeferredThread)
		end
	end
end

return function()
	-- upvalues: RefreshHomePageModule (copy), HomeConstantsModule (copy), SduiHomePageAutoRefreshIntervalSeconds (copy), SignalsModule (copy), GetSduiApiStoreFunction (copy)
	local Callback: (() -> ())? = nil
	local Effect: (() -> ())? = nil
	
	local function _()
		-- upvalues: Callback (ref)
		if Callback then
			Callback()
			Callback = nil
		end
	end
	
	local function stop()
		-- upvalues: Effect (ref), Callback (ref)
		if Effect then
			Effect()
			Effect = nil
		end
		if Callback then
			Callback()
			Callback = nil
		end
	end
	
	local function scheduleRefresh(SduiHomePageAutoRefreshIntervalSeconds1)
		-- upvalues: Callback (ref), RefreshHomePageModule (upval), HomeConstantsModule (upval), SduiHomePageAutoRefreshIntervalSeconds (upval), scheduleRefresh (copy)
		local function v14()
			-- upvalues: Callback (upval), RefreshHomePageModule (upval), HomeConstantsModule (upval), SduiHomePageAutoRefreshIntervalSeconds (upval), scheduleRefresh (upval)
			Callback = nil
			local Promise = RefreshHomePageModule(HomeConstantsModule.RequestIntent.AutoRefresh, nil, false)
			
			if Promise then
				Promise:catch(function(Err)
					-- upvalues: SduiHomePageAutoRefreshIntervalSeconds (upval), scheduleRefresh (upval)
					warn("We failed to auto-refresh SDUI Home!", Err)
					
					if SduiHomePageAutoRefreshIntervalSeconds > 0 then
						scheduleRefresh(SduiHomePageAutoRefreshIntervalSeconds)
					end
				end)
			end
		end
		
		local v2 = true
		local DeferredThread = task.defer(function()
			-- upvalues: SduiHomePageAutoRefreshIntervalSeconds1 (copy), v2 (ref), v14 (copy)
			local Largest: number = SduiHomePageAutoRefreshIntervalSeconds1
			while Largest > 0 and v2 do
				Largest -= task.wait((math.min(Largest, 300)))
			end
			if v2 then
				v2 = false
				v14()
			end
		end)
		
		Callback = function()
			-- upvalues: v2 (ref), DeferredThread (copy)
			if v2 then
				v2 = false
				task.cancel(DeferredThread)
			end
		end
	end
	
	return {
		start = function()
			-- upvalues: Effect (ref), Callback (ref), SignalsModule (upval), GetSduiApiStoreFunction (upval), HomeConstantsModule (upval), SduiHomePageAutoRefreshIntervalSeconds (upval), RefreshHomePageModule (upval), scheduleRefresh (copy), stop (copy)
			if Effect then
				Effect()
				Effect = nil
			end
			if Callback then
				Callback()
				Callback = nil
			end
			Effect = SignalsModule.createEffect(function(p3)
				-- upvalues: GetSduiApiStoreFunction (upval), HomeConstantsModule (upval), Callback (upval), SduiHomePageAutoRefreshIntervalSeconds (upval), RefreshHomePageModule (upval), scheduleRefresh (upval)
				local DataUpdatedTimestamp: number = GetSduiApiStoreFunction().getDataUpdatedTimestamp(HomeConstantsModule.ConfigKey, p3)
				
				if Callback then
					Callback()
					Callback = nil
				end
				if DataUpdatedTimestamp and SduiHomePageAutoRefreshIntervalSeconds > 0 then
					local Largest = math.max(0, DataUpdatedTimestamp + SduiHomePageAutoRefreshIntervalSeconds - os.clock())
					
					local function v20()
						-- upvalues: Callback (upval), RefreshHomePageModule (upval), HomeConstantsModule (upval), SduiHomePageAutoRefreshIntervalSeconds (upval), scheduleRefresh (upval)
						Callback = nil
						local Promise = RefreshHomePageModule(HomeConstantsModule.RequestIntent.AutoRefresh, nil, false)
						
						if Promise then
							Promise:catch(function(Err)
								-- upvalues: SduiHomePageAutoRefreshIntervalSeconds (upval), scheduleRefresh (upval)
								warn("We failed to auto-refresh SDUI Home!", Err)
								
								if SduiHomePageAutoRefreshIntervalSeconds > 0 then
									scheduleRefresh(SduiHomePageAutoRefreshIntervalSeconds)
								end
							end)
						end
					end
					
					local v3 = true
					local DeferredThread = task.defer(function()
						-- upvalues: Largest (copy), v3 (ref), v20 (copy)
						local Largest: number = Largest
						while Largest > 0 and v3 do
							Largest -= task.wait((math.min(Largest, 300)))
						end
						if v3 then
							v3 = false
							v20()
						end
					end)
					
					Callback = function()
						-- upvalues: v3 (ref), DeferredThread (copy)
						if v3 then
							v3 = false
							task.cancel(DeferredThread)
						end
					end
				end
			end)
			
			return stop
		end
	}
end