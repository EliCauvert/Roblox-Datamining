local PromiseModule = require(script:FindFirstAncestor("AppCommonLib").Parent.Promise)
local _ = require(script.Parent.AsyncQueueTypes)
local AsyncQueueModule = {}
AsyncQueueModule.__index = AsyncQueueModule

function AsyncQueueModule.new()
	-- upvalues: PromiseModule (copy), AsyncQueueModule (copy)
	local config = { head = PromiseModule.resolve() }
	setmetatable(config, AsyncQueueModule)
	
	return config
end

function AsyncQueueModule:request(p1)
	-- upvalues: PromiseModule (copy)
	local BindableEvent = Instance.new("BindableEvent")
	local Flag = false
	local Flag1 = false
	self.head = self.head:andThen(function()
		-- upvalues: PromiseModule (upval), Flag (ref), p1 (copy), Flag1 (ref), BindableEvent (copy)
		return PromiseModule.new(function(Callback: () -> ())
			-- upvalues: Flag (upval), p1 (upval), Flag1 (upval), BindableEvent (upval)
			if not Flag then
				pcall(p1)
			end
			if not Flag then
				Flag1 = true
				BindableEvent.Event:Wait()
			end
			BindableEvent:Destroy()
			Callback()
		end)
	end)
	
	return function()
		-- upvalues: Flag1 (ref), BindableEvent (copy), Flag (ref)
		if Flag1 then
			BindableEvent:Fire()
			
			return
		else
			Flag = true
		end
	end
end

return AsyncQueueModule