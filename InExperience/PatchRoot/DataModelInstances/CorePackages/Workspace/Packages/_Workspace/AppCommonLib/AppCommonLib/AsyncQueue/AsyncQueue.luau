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

function t:request(p0)
	-- upvalues: promiseModule (ref)
	local bindableEvent = Instance.new("BindableEvent")
	local var4 = false
	local var5 = false
	self.head = self.head:andThen(function()
		-- upvalues: promiseModule (copy), var4 (write), p0 (ref), var5 (write), bindableEvent (ref)
		return promiseModule.new(function(p1)
			-- upvalues: var4 (copy), p0 (copy), var5 (copy), bindableEvent (copy)
			if not var4 then
				pcall(p0)
			end
			if not var4 then
				var5 = true
				bindableEvent.Event:Wait()
			end
			bindableEvent:Destroy()
			p1()
		end)
	end)
	
	return function()
		-- upvalues: var5 (write), bindableEvent (ref), var4 (write)
		if var5 then
			bindableEvent:Fire()
			
			return
		end
		var4 = true
	end
end

return t