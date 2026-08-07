local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local thirdPartyChatSettingsLoadedModule = require(appChat.Actions.ThirdPartyChatSettingsLoaded)

return function() --[[ line: 7 | named "AppChatRemoveThirdPartyRestriction" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), thirdPartyChatSettingsLoadedModule (ref)
	local var3 = useDispatch()
	reactModule.useEffect(function() --[[ line: 9 ]]
		-- upvalues: var3 (ref), thirdPartyChatSettingsLoadedModule (copy)
		if var3 then
			var3(thirdPartyChatSettingsLoadedModule(Enum.ChatRestrictionStatus.NotRestricted))
		end
	end, { var3 })
	
	return nil
end