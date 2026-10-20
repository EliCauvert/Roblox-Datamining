local AnalyticsModule = require(script.Parent.Analytics)
local Delays = { 2, 10 }
local t = {}

local function _(Delay, p1, p2)
	local v1 = false
	task.delay(Delay, function()
		-- upvalues: v1 (ref), p2 (copy), p1 (copy)
		if not v1 then
			p2(p1)
		end
	end)
	
	return function()
		-- upvalues: v1 (ref)
		v1 = true
	end
end

local function cancelTasks()
	-- upvalues: t (ref)
	for _, value in ipairs(t) do
		if value ~= nil then
			value()
		end
	end
	t = {}
end

return {
	onPageChanged = function(p1)
		-- upvalues: cancelTasks (copy), Delays (copy), t (ref), AnalyticsModule (copy)
		cancelTasks()
		
		for i, delay in ipairs(Delays) do
			local t1 = t
			
			local function v7(p2)
				-- upvalues: AnalyticsModule (upval), p1 (copy)
				AnalyticsModule.reportPageHeartbeat(p2, p1)
			end
			
			local v1 = false
			task.delay(delay, function()
				-- upvalues: v1 (ref), v7 (copy), i (copy)
				if not v1 then
					v7(i)
				end
			end)
			
			t1[i] = function()
				-- upvalues: v1 (ref)
				v1 = true
			end
		end
	end
}