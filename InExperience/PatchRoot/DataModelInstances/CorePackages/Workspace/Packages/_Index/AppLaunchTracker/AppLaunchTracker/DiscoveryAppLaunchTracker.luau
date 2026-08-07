local appLaunchTracker = script:FindFirstAncestor("AppLaunchTracker")
local roduxPerfTrackerModule = require(appLaunchTracker.RoduxPerfTracker)
local discoveryAppLaunchEventsModule = require(appLaunchTracker.DiscoveryAppLaunchEvents)
local _ = require(appLaunchTracker.AppLaunchTrackerTypes)
local var3 = math.random(10000) <= require(appLaunchTracker.Flags).FIntAppLaunchTrackerEnableHundredthsPercent
local luaAppShouldTrackTopThunks = game:DefineFastFlag("LuaAppShouldTrackTopThunks", false)
local luaAppLaunchTrackerTimeoutSec = game:DefineFastInt("LuaAppLaunchTrackerTimeoutSec", 60)
local luaAppLaunchTrackerMilestones = game:DefineFastString("LuaAppLaunchTrackerMilestones", "lua_app_starter_script_requires_begin,lua_app_starter_script_requires_end,startup_page_did_mount,fetch_homepage_data_begin,home_page_container_init,fetch_homepage_data_end,home_page_interactive_legacy,home_page_interactive")
local t = {}
t.__index = t

function t.isEnabled() --[[ line: 45 ]]
	-- upvalues: var3 (write)
	return var3
end

function t.disable() --[[ line: 49 ]]
	-- upvalues: var3 (write)
	var3 = false
end

function t.new(p0) --[[ line: 53 ]]
	-- upvalues: luaAppLaunchTrackerMilestones (ref), discoveryAppLaunchEventsModule (ref), roduxPerfTrackerModule (ref), luaAppShouldTrackTopThunks (ref), t (ref), luaAppLaunchTrackerTimeoutSec (ref), var3 (write)
	local ok, status = pcall(function() --[[ line: 54 ]]
		-- upvalues: luaAppLaunchTrackerMilestones (copy)
		local t = {}
		
		for i in luaAppLaunchTrackerMilestones:gmatch("([A-Za-z0-9_]+)") do
			t[i] = true
		end
		return t
	end)
	
	if not ok then
		discoveryAppLaunchEventsModule.reportError(p0, "Failed to parse FStringLuaAppLaunchTrackerMilestones")
	end
	local tbl = setmetatable({
		numTileRenders = 0,
		numTilesInit = 0,
		numFeedRenders = 0,
		numFeedItems = 0,
		totalSduiDuration = 0,
		previousMilestone = "",
		previousMilestoneTime = 0,
		roduxTracker = roduxPerfTrackerModule.new(true, luaAppShouldTrackTopThunks, true),
		loggingProtocol = p0,
		supportedMilestones = if ok then status else {}
	}, t)
	
	if luaAppLaunchTrackerTimeoutSec > 0 then
		task.delay(luaAppLaunchTrackerTimeoutSec, function() --[[ line: 82 ]]
			-- upvalues: var3 (copy), discoveryAppLaunchEventsModule (copy), p0 (ref), tbl (ref), t (copy)
			if var3 then
				discoveryAppLaunchEventsModule.reportError(p0, `Timeout after previousMilestone: {tbl.previousMilestone}`)
				tbl.roduxTracker:stopTracking()
				t.disable()
			end
		end)
	end
	return tbl
end

function t:trackTileRender() --[[ line: 97 ]]
	self.numTileRenders += 1
end

function t:trackTileInit() --[[ line: 100 ]]
	self.numTilesInit += 1
end

function t:trackFeedRender() --[[ line: 103 ]]
	self.numFeedRenders += 1
end

function t:trackNumFeedItems(p1) --[[ line: 106 ]]
	self.numFeedItems = p1
end

function t:trackSduiDuration(p2) --[[ line: 110 ]]
	self.totalSduiDuration += p2
end

function t:onMilestoneChanged(p3) --[[ line: 114 ]]
	-- upvalues: var3 (write), discoveryAppLaunchEventsModule (ref)
	if not var3 then return end
	if not self.supportedMilestones[p3] then return end
	local processTime = os.clock()
	
	if self.previousMilestoneTime > 0 then
		discoveryAppLaunchEventsModule.reportStatsforMilestone(self.loggingProtocol, p3, self.previousMilestone, (processTime - self.previousMilestoneTime) * 1000, self.roduxTracker:getStats(), self.numTilesInit, self.numTileRenders, self.numFeedItems, self.numFeedRenders, self.totalSduiDuration)
	end
	self.roduxTracker:clear()
	self.numFeedRenders = 0
	self.numTilesInit = 0
	self.numTileRenders = 0
	self.totalSduiDuration = 0
	self.previousMilestone = p3
	self.previousMilestoneTime = processTime
end

function t:stopTracking() --[[ line: 152 ]]
	-- upvalues: t (ref)
	self.roduxTracker:stopTracking()
	t.disable()
end

function t.createDefault(...) --[[ line: 157 ]]
	-- upvalues: t (ref)
	t.default = t.new(...)
end

return t