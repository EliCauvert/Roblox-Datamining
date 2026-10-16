local AppLaunchTracker = script:FindFirstAncestor("AppLaunchTracker")
local RoduxPerfTrackerModule = require(AppLaunchTracker.RoduxPerfTracker)
local DiscoveryAppLaunchEventsModule = require(AppLaunchTracker.DiscoveryAppLaunchEvents)
local _ = require(AppLaunchTracker.AppLaunchTrackerTypes)
local IsRandomValueBelow = math.random(10000) <= require(AppLaunchTracker.Flags).FIntAppLaunchTrackerEnableHundredthsPercent
local LuaAppShouldTrackTopThunks = game:DefineFastFlag("LuaAppShouldTrackTopThunks", false)
local LuaAppLaunchTrackerTimeoutSec = game:DefineFastInt("LuaAppLaunchTrackerTimeoutSec", 60)
local LuaAppLaunchTrackerMilestones = game:DefineFastString("LuaAppLaunchTrackerMilestones", "lua_app_starter_script_requires_begin,lua_app_starter_script_requires_end,startup_page_did_mount,fetch_homepage_data_begin,home_page_container_init,fetch_homepage_data_end,home_page_interactive_legacy,home_page_interactive")
local DiscoveryAppLaunchTrackerModule = {}
DiscoveryAppLaunchTrackerModule.__index = DiscoveryAppLaunchTrackerModule

function DiscoveryAppLaunchTrackerModule.isEnabled() --[[ Line: 45 ]]
	-- upvalues: IsRandomValueBelow (ref)
	return IsRandomValueBelow
end

function DiscoveryAppLaunchTrackerModule.disable() --[[ Line: 49 ]]
	-- upvalues: IsRandomValueBelow (ref)
	IsRandomValueBelow = false
end

function DiscoveryAppLaunchTrackerModule.new(LoggingProtocol) --[[ Line: 53 ]]
	-- upvalues: LuaAppLaunchTrackerMilestones (copy), DiscoveryAppLaunchEventsModule (copy), RoduxPerfTrackerModule (copy), LuaAppShouldTrackTopThunks (copy), DiscoveryAppLaunchTrackerModule (copy), LuaAppLaunchTrackerTimeoutSec (copy), IsRandomValueBelow (ref)
	local Success, Result = pcall(function() --[[ Line: 54 ]]
		-- upvalues: LuaAppLaunchTrackerMilestones (upval)
		local t = {}
		
		for i in LuaAppLaunchTrackerMilestones:gmatch("([A-Za-z0-9_]+)") do
			t[i] = true
		end
		return t
	end)
	
	if not Success then
		DiscoveryAppLaunchEventsModule.reportError(LoggingProtocol, "Failed to parse FStringLuaAppLaunchTrackerMilestones")
	end
	local self = setmetatable({
		numTileRenders = 0,
		numTilesInit = 0,
		numFeedRenders = 0,
		numFeedItems = 0,
		totalSduiDuration = 0,
		previousMilestone = "",
		previousMilestoneTime = 0,
		roduxTracker = RoduxPerfTrackerModule.new(true, LuaAppShouldTrackTopThunks, true),
		loggingProtocol = LoggingProtocol,
		supportedMilestones = if Success then Result else {}
	}, DiscoveryAppLaunchTrackerModule)
	
	if LuaAppLaunchTrackerTimeoutSec > 0 then
		task.delay(LuaAppLaunchTrackerTimeoutSec, function() --[[ Line: 82 ]]
			-- upvalues: IsRandomValueBelow (upval), DiscoveryAppLaunchEventsModule (upval), LoggingProtocol (copy), self (copy), DiscoveryAppLaunchTrackerModule (upval)
			if IsRandomValueBelow then
				DiscoveryAppLaunchEventsModule.reportError(LoggingProtocol, `Timeout after previousMilestone: {self.previousMilestone}`)
				self.roduxTracker:stopTracking()
				DiscoveryAppLaunchTrackerModule.disable()
			end
		end)
	end
	return self
end

function DiscoveryAppLaunchTrackerModule:trackTileRender() --[[ Line: 97 ]]
	self.numTileRenders += 1
end

function DiscoveryAppLaunchTrackerModule:trackTileInit() --[[ Line: 100 ]]
	self.numTilesInit += 1
end

function DiscoveryAppLaunchTrackerModule:trackFeedRender() --[[ Line: 103 ]]
	self.numFeedRenders += 1
end

function DiscoveryAppLaunchTrackerModule:trackNumFeedItems(NumFeedItems) --[[ Line: 106 ]]
	self.numFeedItems = NumFeedItems
end

function DiscoveryAppLaunchTrackerModule:trackSduiDuration(p1) --[[ Line: 110 ]]
	self.totalSduiDuration += p1
end

function DiscoveryAppLaunchTrackerModule:onMilestoneChanged(PreviousMilestone) --[[ Line: 114 ]]
	-- upvalues: IsRandomValueBelow (ref), DiscoveryAppLaunchEventsModule (copy)
	if not IsRandomValueBelow then return end
	if not self.supportedMilestones[PreviousMilestone] then return end
	local ClockTime = os.clock()
	
	if self.previousMilestoneTime > 0 then
		DiscoveryAppLaunchEventsModule.reportStatsforMilestone(self.loggingProtocol, PreviousMilestone, self.previousMilestone, (ClockTime - self.previousMilestoneTime) * 1000, self.roduxTracker:getStats(), self.numTilesInit, self.numTileRenders, self.numFeedItems, self.numFeedRenders, self.totalSduiDuration)
	end
	self.roduxTracker:clear()
	self.numFeedRenders = 0
	self.numTilesInit = 0
	self.numTileRenders = 0
	self.totalSduiDuration = 0
	self.previousMilestone = PreviousMilestone
	self.previousMilestoneTime = ClockTime
end

function DiscoveryAppLaunchTrackerModule:stopTracking() --[[ Line: 152 ]]
	-- upvalues: DiscoveryAppLaunchTrackerModule (copy)
	self.roduxTracker:stopTracking()
	DiscoveryAppLaunchTrackerModule.disable()
end

function DiscoveryAppLaunchTrackerModule.createDefault(...) --[[ Line: 157 ]]
	-- upvalues: DiscoveryAppLaunchTrackerModule (copy)
	DiscoveryAppLaunchTrackerModule.default = DiscoveryAppLaunchTrackerModule.new(...)
end

return DiscoveryAppLaunchTrackerModule