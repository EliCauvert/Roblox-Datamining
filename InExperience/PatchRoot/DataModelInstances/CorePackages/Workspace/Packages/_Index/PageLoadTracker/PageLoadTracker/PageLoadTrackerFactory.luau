local CreatePageTrackerModule = require(script.Parent.createPageTracker)

local function getTracker(p1, p2) --[[ Line: 10 ]]
	-- upvalues: CreatePageTrackerModule (copy)
	if p1.trackers[p2] == nil then
		p1.trackers[p2] = CreatePageTrackerModule()
	end
	return p1.trackers[p2]
end

local function removeTracker(p1, p2) --[[ Line: 18 ]]
	local Tracker = p1.trackers[p2]
	
	if Tracker then
		Tracker:stop()
		p1.trackers[p2] = nil
	end
end

local function _() --[[ Line: 27 | Named "createFactory" ]]
	-- upvalues: getTracker (copy), removeTracker (copy)
	return {
		trackers = {},
		getTracker = getTracker,
		removeTracker = removeTracker
	}
end

local Config = nil

return {
	getInstance = function() --[[ Line: 39 ]]
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