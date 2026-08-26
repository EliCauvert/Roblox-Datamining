local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local thirdPartyChatSettingsLoadedModule = require(appChat.Actions.ThirdPartyChatSettingsLoaded)

return function()
	-- upvalues: useDispatch (ref), reactModule (ref), thirdPartyChatSettingsLoadedModule (ref)
	local var1 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), thirdPartyChatSettingsLoadedModule (copy)
		if var1 then
			var1(thirdPartyChatSettingsLoadedModule(Enum.ChatRestrictionStatus.NotRestricted))
		end
	end, { var1 })
	
	return nil
end