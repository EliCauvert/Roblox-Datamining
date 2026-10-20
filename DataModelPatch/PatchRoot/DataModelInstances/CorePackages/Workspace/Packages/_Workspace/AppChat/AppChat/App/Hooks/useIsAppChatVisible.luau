local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local AppChatVisibleModule = require(AppChat.App.AppChatVisible)
local UseExternalEventFunction = require(Parent.RoactUtils).Hooks.useExternalEvent
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback

return function(p1)
	-- upvalues: UseStateFunction (copy), UseExternalEventFunction (copy), AppChatVisibleModule (copy), UseCallbackFunction (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(p1 or false)
	UseExternalEventFunction(AppChatVisibleModule.BindableEvent.Event, function(p2)
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		if p2 ~= UseStateResult then
			UseStateResult2(p2)
		end
	end, { UseStateResult })
	
	return UseStateResult, (UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { UseStateResult2 }))
end