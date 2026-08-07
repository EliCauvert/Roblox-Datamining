local createPageTrackerModule = require(script.Parent.createPageTracker)

local function getTracker(p0, p1) --[[ line: 10 ]]
	-- upvalues: createPageTrackerModule (ref)
	if p0.trackers[p1] == nil then
		p0.trackers[p1] = createPageTrackerModule()
	end
	return p0.trackers[p1]
end

local function removeTracker(p2, p3) --[[ line: 18 ]]
	local var4 = p2.trackers[p3]
	
	if var4 then
		var4:stop()
		p2.trackers[p3] = nil
	end
end

local function _() --[[ line: 27 | named "createFactory" ]]
	-- upvalues: getTracker (ref), removeTracker (ref)
	return {
		trackers = {},
		getTracker = getTracker,
		removeTracker = removeTracker
	}
end

local var3 = nil

return {
	getInstance = function() --[[ line: 39 ]]
		-- upvalues: var3 (write), getTracker (ref), removeTracker (ref)
		if not var3 then
			var3 = {
				trackers = {},
				getTracker = getTracker,
				removeTracker = removeTracker
			}
		end
		return var3
	end
}