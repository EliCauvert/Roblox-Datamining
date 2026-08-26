local promiseModule = require(script:FindFirstAncestor("AppCommonLib").Parent.Promise)
local _ = require(script.Parent.AsyncQueueTypes)
local t = {}
t.__index = t

function t.new()
	-- upvalues: promiseModule (ref), t (ref)
	local t_1 = { head = promiseModule.resolve() }
	setmetatable(t_1, t)
	
	return t_1
end

function t:request(p1)
	-- upvalues: promiseModule (ref)
	local bindableEvent = Instance.new("BindableEvent")
	local var1 = false
	local var2 = false
	self.head = self.head:andThen(function()
		-- upvalues: promiseModule (copy), var1 (write), p1 (ref), var2 (write), bindableEvent (ref)
		return promiseModule.new(function(p2)
			-- upvalues: var1 (copy), p1 (copy), var2 (copy), bindableEvent (copy)
			if not var1 then
				pcall(p1)
			end
			if not var1 then
				var2 = true
				bindableEvent.Event:Wait()
			end
			bindableEvent:Destroy()
			p2()
		end)
	end)
	
	return function()
		-- upvalues: var2 (write), bindableEvent (ref), var1 (write)
		if var2 then
			bindableEvent:Fire()
			
			return
		end
		var1 = true
	end
end

return t