local ReactRobloxModule = require(script.Parent.Parent.ReactRoblox)

local function noAct(Callback: () -> ())
	Callback()
end

local function createActWrapper(Callback)
	-- upvalues: ReactRobloxModule (copy), noAct (copy)
	return (setmetatable({
		act = function(...)
			-- upvalues: Callback (copy), ReactRobloxModule (upval)
			return Callback(ReactRobloxModule.act, ...)
		end
	}, {
		__call = function(_, ...)
			-- upvalues: Callback (copy), noAct (upval)
			return Callback(noAct, ...)
		end
	}))
end

return {
	forceUpdateGuiObject = createActWrapper(function(Callback: (any) -> (), ...)
		for i = 1, select("#", ...) do
			local Selected = select(i, ...)
			local _ = if Selected:IsA("ScrollingFrame") then Selected.AbsoluteCanvasSize.Y else Selected.AbsoluteSize.Y
		end
		Callback(function()
			task.wait()
		end)
	end),
	waitForEvents = createActWrapper(function(Callback: (any) -> ())
		Callback(function()
			task.defer(coroutine.running())
			coroutine.yield()
		end)
	end),
	waitForEventsTimes = createActWrapper(function(Callback: (any) -> (), p1)
		for _ = 1, p1 do
			Callback(function()
				task.defer(coroutine.running())
				coroutine.yield()
			end)
		end
	end)
}