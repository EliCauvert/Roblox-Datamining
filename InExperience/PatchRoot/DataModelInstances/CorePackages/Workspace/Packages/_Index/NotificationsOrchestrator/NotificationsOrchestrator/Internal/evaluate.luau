local _ = require(script:FindFirstAncestor("NotificationsOrchestrator").Types)

local function _(List, p1, p2): number
	local v1 = p1 - p2
	local Count = 0
	
	for _, value in List do
		if v1 <= value then
			Count += 1
		end
	end
	return Count
end

return function(p3, p4, Callback, p5): boolean
	if p3 == nil then
		return true
	end
	local HasMaxImpressions = p3.maxImpressions ~= nil
	
	if p3.cooldownSeconds == nil and not HasMaxImpressions then
		return true
	end
	local CallbackResult = Callback()
	local CooldownSeconds = p3.cooldownSeconds
	
	if CooldownSeconds ~= nil and CallbackResult.lastShownAt > 0 and p5 - CallbackResult.lastShownAt < CooldownSeconds then
		return false
	end
	if p3.maxImpressions == nil then
		return true
	end
	local Count = nil
	if typeof(p4) == "table" and p4.kind == "rolling" then
		local v2 = p5 - p4.seconds
		local Count1 = 0
		
		for _, value in CallbackResult.shownAt do
			if v2 <= value then
				Count1 += 1
			end
		end
		Count = Count1
	else
		Count = CallbackResult.count
	end
	return Count < p3.maxImpressions
end