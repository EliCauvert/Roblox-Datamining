local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local appChatVisibleModule = require(appChat.App.AppChatVisible)
local useExternalEvent = require(parent.RoactUtils).Hooks.useExternalEvent
local useState = reactModule.useState
local useCallback = reactModule.useCallback

return function(p0)
	-- upvalues: useState (ref), useExternalEvent (ref), appChatVisibleModule (ref), useCallback (ref)
	local var3, var4 = useState(p0 or false)
	useExternalEvent(appChatVisibleModule.BindableEvent.Event, function(p1)
		-- upvalues: var3 (ref), var4 (ref)
		if p1 ~= var3 then
			var4(p1)
		end
	end, { var3 })
	
	return var3, useCallback(function()
		-- upvalues: var4 (ref)
		var4(false)
	end, { var4 })
end