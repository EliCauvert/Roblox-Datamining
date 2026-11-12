local _ = require(script:FindFirstAncestor("DataHydration").Moments.MomentsStoreTypes)

local function _(p1, p2)
	return if type(p1) == "number" then p1 else p2
end

return function(p1)
	local T = if type(p1) == "table" then p1 else {}
	local LimitSeconds = T.limitSeconds
	local LimitSeconds1 = if type(LimitSeconds) == "number" then LimitSeconds else -1
	local UsedSeconds = T.usedSeconds
	local UsedSeconds1 = if type(UsedSeconds) == "number" then UsedSeconds else 0
	local RemainingSeconds = nil
	
	if LimitSeconds1 < 0 then
		RemainingSeconds = -1
	else
		local RemainingSeconds1 = T.remainingSeconds
		local Largest = math.max(0, LimitSeconds1 - UsedSeconds1)
		RemainingSeconds = if type(RemainingSeconds1) == "number" then RemainingSeconds1 else Largest
	end
	return {
		limitSeconds = LimitSeconds1,
		usedSeconds = UsedSeconds1,
		remainingSeconds = RemainingSeconds,
		resetsAt = if type(T.resetsAt) == "string" then T.resetsAt else nil
	}
end