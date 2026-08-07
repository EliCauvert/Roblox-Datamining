local analyticsModule = require(script.Parent.Analytics)
local list = { 2, 10 }
local t = {}
local t_1 = {}

local function _(p0, p1, p2) --[[ line: 11 | named "createDelayedTask" ]]
	local var5 = false
	task.delay(p0, function() --[[ line: 14 ]]
		-- upvalues: var5 (write), p2 (ref), p1 (ref)
		if not var5 then
			p2(p1)
		end
	end)
	
	return function() --[[ line: 19 ]]
		-- upvalues: var5 (write)
		var5 = true
	end
end

local function cancelTasks() --[[ line: 24 ]]
	-- upvalues: t (write)
	for i, v in ipairs(t) do
		if v ~= nil then
			v()
		end
	end
	t = {}
end

function t_1.onPageChanged(p3) --[[ line: 33 ]]
	-- upvalues: cancelTasks (ref), list (ref), t (write), analyticsModule (ref)
	cancelTasks()
	
	for i, v in ipairs(list) do
		local var6 = t
		
		local var7 = function(p4) --[[ line: 39 ]]
			-- upvalues: analyticsModule (copy), p3 (ref)
			analyticsModule.reportPageHeartbeat(p4, p3)
		end
		
		local var8 = false
		task.delay(v, function() --[[ line: 14 ]]
			-- upvalues: var8 (write), var7 (ref), i (ref)
			if not var8 then
				var7(i)
			end
		end)
		
		var6[i] = function() --[[ line: 19 ]]
			-- upvalues: var8 (write)
			var5 = true
		end
	end
end

return t_1