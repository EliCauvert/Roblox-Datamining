local AnalyticsModule = require(script.Parent.Analytics)
local Delays = { 2, 10 }
local t = {}

local function _(Delay, p1, p2) --[[ Line: 11 | Named "createDelayedTask" ]]
	local v1 = false
	task.delay(Delay, function() --[[ Line: 14 ]]
		-- upvalues: v1 (ref), p2 (copy), p1 (copy)
		if not v1 then
			p2(p1)
		end
	end)
	
	return function() --[[ Line: 19 ]]
		-- upvalues: v1 (ref)
		v1 = true
	end
end

local function cancelTasks() --[[ Line: 24 ]]
	-- upvalues: t (ref)
	for _, value in ipairs(t) do
		if value ~= nil then
			value()
		end
	end
	t = {}
end

return {
	onPageChanged = function(p1) --[[ Line: 33 ]]
		-- upvalues: cancelTasks (copy), Delays (copy), t (ref), AnalyticsModule (copy)
		cancelTasks()
		
		for i, delay in ipairs(Delays) do
			local t1 = t
			
			local function v7(p2) --[[ Line: 39 ]]
				-- upvalues: AnalyticsModule (upval), p1 (copy)
				AnalyticsModule.reportPageHeartbeat(p2, p1)
			end
			
			local v1 = false
			task.delay(delay, function() --[[ Line: 14 ]]
				-- upvalues: v1 (ref), v7 (copy), i (copy)
				if not v1 then
					v7(i)
				end
			end)
			
			t1[i] = function() --[[ Line: 19 ]]
				-- upvalues: v1 (ref)
				v1 = true
			end
		end
	end
}