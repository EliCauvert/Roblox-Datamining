local createPageTrackerModule = require(script.Parent.createPageTracker)

local function getTracker(p1, p2)
	-- upvalues: createPageTrackerModule (ref)
	if p1.trackers[p2] == nil then
		p1.trackers[p2] = createPageTrackerModule()
	end
	return p1.trackers[p2]
end

local function removeTracker(p1, p2)
	local var1 = p1.trackers[p2]
	
	if var1 then
		var1:stop()
		p1.trackers[p2] = nil
	end
end

local function _()
	-- upvalues: getTracker (ref), removeTracker (ref)
	return {
		trackers = {},
		getTracker = getTracker,
		removeTracker = removeTracker
	}
end

local var1 = nil

return {
	getInstance = function()
		-- upvalues: var1 (write), getTracker (ref), removeTracker (ref)
		if not var1 then
			var1 = {
				trackers = {},
				getTracker = getTracker,
				removeTracker = removeTracker
			}
		end
		return var1
	end
}