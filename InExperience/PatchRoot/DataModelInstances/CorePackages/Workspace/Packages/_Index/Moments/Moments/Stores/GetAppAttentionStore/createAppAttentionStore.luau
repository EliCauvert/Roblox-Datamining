local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

local function defaultLifecycleObserver()
	local Success, Result = pcall(function()
		return game:GetService("AppLifecycleObserverService")
	end)
	
	return if Success then { OnHide = Result.OnHide, OnUnhide = Result.OnUnhide } else nil
end

local function _()
	local UserInputService = game:GetService("UserInputService")
	
	return {
		WindowFocusReleased = UserInputService.WindowFocusReleased,
		WindowFocused = UserInputService.WindowFocused
	}
end

return function(p1)
	-- upvalues: defaultLifecycleObserver (copy), SignalsModule (copy)
	local P0 = p1 or {}
	local LifecycleObserver = P0.lifecycleObserver or defaultLifecycleObserver()
	local WindowFocus = P0.windowFocus
	
	if not WindowFocus then
		local UserInputService = game:GetService("UserInputService")
		WindowFocus = {
			WindowFocusReleased = UserInputService.WindowFocusReleased,
			WindowFocused = UserInputService.WindowFocused
		}
	end
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local List = {}
	
	if LifecycleObserver ~= nil then
		table.insert(List, LifecycleObserver.OnHide:Connect(function()
			-- upvalues: Signal2 (copy)
			Signal2(true)
		end))
		table.insert(List, LifecycleObserver.OnUnhide:Connect(function()
			-- upvalues: Signal2 (copy)
			Signal2(false)
		end))
	end
	table.insert(List, WindowFocus.WindowFocusReleased:Connect(function()
		-- upvalues: Signal2_1 (copy)
		Signal2_1(true)
	end))
	table.insert(List, WindowFocus.WindowFocused:Connect(function()
		-- upvalues: Signal2_1 (copy)
		Signal2_1(false)
	end))
	
	return {
		getIsHidden = Signal,
		getIsUnfocused = Signal1,
		getIsAway = function(p2)
			-- upvalues: Signal (copy), Signal1 (copy)
			return Signal(p2) or Signal1(p2)
		end,
		dispose = function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	}
end