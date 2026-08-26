local analyticsModule = require(script.Parent.Analytics)
local list = { 2, 10 }
local t = {}
local t_1 = {}

local function _(p1, p2, p3)
	local var1 = false
	task.delay(p1, function()
		-- upvalues: var1 (write), p3 (ref), p2 (ref)
		if not var1 then
			p3(p2)
		end
	end)
	
	return function()
		-- upvalues: var1 (write)
		var1 = true
	end
end

local function cancelTasks()
	-- upvalues: t (write)
	for i, v in ipairs(t) do
		if v ~= nil then
			v()
		end
	end
	t = {}
end

function t_1.onPageChanged(p1)
	-- upvalues: cancelTasks (ref), list (ref), t (write), analyticsModule (ref)
	cancelTasks()
	
	for i, v in ipairs(list) do
		local var1 = t
		
		local var2 = function(p2)
			-- upvalues: analyticsModule (copy), p1 (ref)
			analyticsModule.reportPageHeartbeat(p2, p1)
		end
		
		local var3 = false
		task.delay(v, function()
			-- upvalues: var3 (write), var2 (ref), i (ref)
			if not var3 then
				var2(i)
			end
		end)
		
		var1[i] = function()
			-- upvalues: var3 (write)
			var5 = true
		end
	end
end

return t_1