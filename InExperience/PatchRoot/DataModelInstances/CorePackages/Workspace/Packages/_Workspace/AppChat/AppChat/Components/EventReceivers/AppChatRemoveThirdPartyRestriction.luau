local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ThirdPartyChatSettingsLoadedModule = require(AppChat.Actions.ThirdPartyChatSettingsLoaded)

return function()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), ThirdPartyChatSettingsLoadedModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), ThirdPartyChatSettingsLoadedModule (upval)
		if UseDispatchResult then
			UseDispatchResult(ThirdPartyChatSettingsLoadedModule(Enum.ChatRestrictionStatus.NotRestricted))
		end
	end, { UseDispatchResult })
	
	return nil
end