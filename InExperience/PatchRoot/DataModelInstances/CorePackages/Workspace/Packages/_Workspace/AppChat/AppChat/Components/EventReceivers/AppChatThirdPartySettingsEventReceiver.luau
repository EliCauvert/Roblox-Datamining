local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useProperty = require(parent.GuiObjectUtils).useProperty
local thirdPartyChatSettingsLoadedModule = require(appChat.Actions.ThirdPartyChatSettingsLoaded)
local fFlagAppChatIgnoreUnknownThirdPartyChatStatusModule = require(appChat.Flags.FFlagAppChatIgnoreUnknownThirdPartyChatStatus)
local thirdPartyUserService = game:GetService("ThirdPartyUserService")

return function() --[[ line: 12 | named "AppChatThirdPartySettingsEventReceiver" ]]
	-- upvalues: useDispatch (ref), useProperty (ref), thirdPartyUserService (ref), fFlagAppChatIgnoreUnknownThirdPartyChatStatusModule (ref), responsiveModule (ref), reactModule (ref), thirdPartyChatSettingsLoadedModule (ref)
	local var6 = useDispatch()
	local var7 = useProperty(thirdPartyUserService, "FriendCommunicationRestrictionStatus")
	local var8 = if fFlagAppChatIgnoreUnknownThirdPartyChatStatusModule then responsiveModule.usePreferredInput() else nil
	reactModule.useEffect(function() --[[ line: 16 ]]
		-- upvalues: var6 (ref), var7 (ref), fFlagAppChatIgnoreUnknownThirdPartyChatStatusModule (copy), var8 (ref), responsiveModule (copy), thirdPartyChatSettingsLoadedModule (copy)
		if var6 and var7 then
			var6(thirdPartyChatSettingsLoadedModule(if fFlagAppChatIgnoreUnknownThirdPartyChatStatusModule and var8 ~= responsiveModule.Input.Directional and var7 == Enum.ChatRestrictionStatus.Unknown then Enum.ChatRestrictionStatus.NotRestricted else var7))
		end
	end, { var6, var7, var8 })
	
	return nil
end