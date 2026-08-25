local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local thirdPartyChatSettingsLoadedModule = require(appChat.Actions.ThirdPartyChatSettingsLoaded)

return function()
	-- upvalues: useDispatch (ref), reactModule (ref), thirdPartyChatSettingsLoadedModule (ref)
	local var3 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), thirdPartyChatSettingsLoadedModule (copy)
		if var3 then
			var3(thirdPartyChatSettingsLoadedModule(Enum.ChatRestrictionStatus.NotRestricted))
		end
	end, { var3 })
	
	return nil
end