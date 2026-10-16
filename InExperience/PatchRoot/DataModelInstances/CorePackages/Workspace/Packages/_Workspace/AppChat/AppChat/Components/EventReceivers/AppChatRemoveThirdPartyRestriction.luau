local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ThirdPartyChatSettingsLoadedModule = require(AppChat.Actions.ThirdPartyChatSettingsLoaded)

return function() --[[ Line: 7 | Named "AppChatRemoveThirdPartyRestriction" ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), ThirdPartyChatSettingsLoadedModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function() --[[ Line: 9 ]]
		-- upvalues: UseDispatchResult (copy), ThirdPartyChatSettingsLoadedModule (upval)
		if UseDispatchResult then
			UseDispatchResult(ThirdPartyChatSettingsLoadedModule(Enum.ChatRestrictionStatus.NotRestricted))
		end
	end, { UseDispatchResult })
	
	return nil
end