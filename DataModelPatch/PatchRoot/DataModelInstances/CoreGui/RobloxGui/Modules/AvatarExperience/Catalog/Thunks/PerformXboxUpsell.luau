local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Shell = Modules:FindFirstChild("Shell")
local Callback = nil
local EventHubModule = nil

if Shell then
	Callback = require(Modules.Shell.Actions.RemoveScreen)
	EventHubModule = require(Modules.Shell.EventHub)
end
return function(_)
	-- upvalues: Shell (copy), Callback (ref), EventHubModule (ref)
	return function(p1)
		-- upvalues: Shell (upval), Callback (upval), EventHubModule (upval)
		if not Shell then return end
		local ScreenList = p1:getState().ScreenList
		
		if ScreenList then
			spawn(function()
				-- upvalues: ScreenList (copy), p1 (copy), Callback (upval), EventHubModule (upval)
				p1:dispatch(Callback(ScreenList[1]))
				EventHubModule:dispatchEvent(EventHubModule.Notifications.NavigateToRobuxScreen)
			end)
		end
	end
end