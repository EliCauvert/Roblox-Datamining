local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local appChatVisibleModule = require(appChat.App.AppChatVisible)
local useExternalEvent = require(parent.RoactUtils).Hooks.useExternalEvent
local useState = reactModule.useState
local useCallback = reactModule.useCallback

return function(p1)
	-- upvalues: useState (ref), useExternalEvent (ref), appChatVisibleModule (ref), useCallback (ref)
	local var1, var2 = useState(p1 or false)
	useExternalEvent(appChatVisibleModule.BindableEvent.Event, function(p2)
		-- upvalues: var1 (ref), var2 (ref)
		if p2 ~= var1 then
			var2(p2)
		end
	end, { var1 })
	
	return var1, useCallback(function()
		-- upvalues: var2 (ref)
		var2(false)
	end, { var2 })
end