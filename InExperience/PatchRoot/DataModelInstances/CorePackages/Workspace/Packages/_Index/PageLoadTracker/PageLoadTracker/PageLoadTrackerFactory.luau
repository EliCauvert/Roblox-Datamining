local CreatePageTrackerModule = require(script.Parent.createPageTracker)

local function getTracker(p1, p2)
	-- upvalues: CreatePageTrackerModule (copy)
	if p1.trackers[p2] == nil then
		p1.trackers[p2] = CreatePageTrackerModule()
	end
	return p1.trackers[p2]
end

local function removeTracker(p1, p2)
	local Tracker = p1.trackers[p2]
	
	if Tracker then
		Tracker:stop()
		p1.trackers[p2] = nil
	end
end

local function _()
	-- upvalues: getTracker (copy), removeTracker (copy)
	return {
		trackers = {},
		getTracker = getTracker,
		removeTracker = removeTracker
	}
end

local Config = nil

return {
	getInstance = function()
		-- upvalues: Config (ref), getTracker (copy), removeTracker (copy)
		if not Config then
			Config = {
				trackers = {},
				getTracker = getTracker,
				removeTracker = removeTracker
			}
		end
		return Config
	end
}