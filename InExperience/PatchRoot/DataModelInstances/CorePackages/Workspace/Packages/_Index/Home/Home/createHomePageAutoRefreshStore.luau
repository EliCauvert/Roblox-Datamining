local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local SignalsModule = require(Parent.Signals)
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore
local HomeConstantsModule = require(Home.HomeConstants)
local RefreshHomePageModule = require(Home.refreshHomePage)
local SduiHomePageAutoRefreshIntervalSeconds = game:DefineFastInt("SduiHomePageAutoRefreshIntervalSeconds", 10800)

local function _(p1, p2) --[[ Line: 19 | Named "defaultSchedule" ]]
	local v1 = true
	local DeferredThread = task.defer(function() --[[ Line: 21 ]]
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
	
	return function() --[[ Line: 32 ]]
		-- upvalues: v1 (ref), DeferredThread (copy)
		if v1 then
			v1 = false
			task.cancel(DeferredThread)
		end
	end
end

return function() --[[ Line: 40 | Named "createHomePageAutoRefreshStore" ]]
	-- upvalues: RefreshHomePageModule (copy), HomeConstantsModule (copy), SduiHomePageAutoRefreshIntervalSeconds (copy), SignalsModule (copy), GetSduiApiStoreFunction (copy)
	local Callback: (() -> ())? = nil
	local Effect: (() -> ())? = nil
	
	local function _() --[[ Line: 44 | Named "clearTimer" ]]
		-- upvalues: Callback (ref)
		if Callback then
			Callback()
			Callback = nil
		end
	end
	
	local function stop() --[[ Line: 51 ]]
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
	
	local function scheduleRefresh(SduiHomePageAutoRefreshIntervalSeconds1) --[[ Line: 59 ]]
		-- upvalues: Callback (ref), RefreshHomePageModule (upval), HomeConstantsModule (upval), SduiHomePageAutoRefreshIntervalSeconds (upval), scheduleRefresh (copy)
		local function v14() --[[ Line: 60 ]]
			-- upvalues: Callback (upval), RefreshHomePageModule (upval), HomeConstantsModule (upval), SduiHomePageAutoRefreshIntervalSeconds (upval), scheduleRefresh (upval)
			Callback = nil
			local Promise = RefreshHomePageModule(HomeConstantsModule.RequestIntent.AutoRefresh, nil, false)
			
			if Promise then
				Promise:catch(function(Err) --[[ Line: 64 ]]
					-- upvalues: SduiHomePageAutoRefreshIntervalSeconds (upval), scheduleRefresh (upval)
					warn("We failed to auto-refresh SDUI Home!", Err)
					
					if SduiHomePageAutoRefreshIntervalSeconds > 0 then
						scheduleRefresh(SduiHomePageAutoRefreshIntervalSeconds)
					end
				end)
			end
		end
		
		local v2 = true
		local DeferredThread = task.defer(function() --[[ Line: 21 ]]
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
		
		Callback = function() --[[ Line: 32 ]]
			-- upvalues: v2 (ref), DeferredThread (copy)
			if v2 then
				v2 = false
				task.cancel(DeferredThread)
			end
		end
	end
	
	return {
		start = function() --[[ Line: 74 ]]
			-- upvalues: Effect (ref), Callback (ref), SignalsModule (upval), GetSduiApiStoreFunction (upval), HomeConstantsModule (upval), SduiHomePageAutoRefreshIntervalSeconds (upval), RefreshHomePageModule (upval), scheduleRefresh (copy), stop (copy)
			if Effect then
				Effect()
				Effect = nil
			end
			if Callback then
				Callback()
				Callback = nil
			end
			Effect = SignalsModule.createEffect(function(p3) --[[ Line: 76 ]]
				-- upvalues: GetSduiApiStoreFunction (upval), HomeConstantsModule (upval), Callback (upval), SduiHomePageAutoRefreshIntervalSeconds (upval), RefreshHomePageModule (upval), scheduleRefresh (upval)
				local DataUpdatedTimestamp: number = GetSduiApiStoreFunction().getDataUpdatedTimestamp(HomeConstantsModule.ConfigKey, p3)
				
				if Callback then
					Callback()
					Callback = nil
				end
				if DataUpdatedTimestamp and SduiHomePageAutoRefreshIntervalSeconds > 0 then
					local Largest = math.max(0, DataUpdatedTimestamp + SduiHomePageAutoRefreshIntervalSeconds - os.clock())
					
					local function v20() --[[ Line: 60 ]]
						-- upvalues: Callback (upval), RefreshHomePageModule (upval), HomeConstantsModule (upval), SduiHomePageAutoRefreshIntervalSeconds (upval), scheduleRefresh (upval)
						Callback = nil
						local Promise = RefreshHomePageModule(HomeConstantsModule.RequestIntent.AutoRefresh, nil, false)
						
						if Promise then
							Promise:catch(function(Err) --[[ Line: 64 ]]
								-- upvalues: SduiHomePageAutoRefreshIntervalSeconds (upval), scheduleRefresh (upval)
								warn("We failed to auto-refresh SDUI Home!", Err)
								
								if SduiHomePageAutoRefreshIntervalSeconds > 0 then
									scheduleRefresh(SduiHomePageAutoRefreshIntervalSeconds)
								end
							end)
						end
					end
					
					local v3 = true
					local DeferredThread = task.defer(function() --[[ Line: 21 ]]
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
					
					Callback = function() --[[ Line: 32 ]]
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