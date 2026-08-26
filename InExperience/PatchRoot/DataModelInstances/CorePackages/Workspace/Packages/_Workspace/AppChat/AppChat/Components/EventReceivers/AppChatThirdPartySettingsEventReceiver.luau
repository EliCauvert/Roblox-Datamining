local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useProperty = require(parent.GuiObjectUtils).useProperty
local thirdPartyChatSettingsLoadedModule = require(appChat.Actions.ThirdPartyChatSettingsLoaded)
local fFlagAppChatIgnoreUnknownThirdPartyChatStatusModule = require(appChat.Flags.FFlagAppChatIgnoreUnknownThirdPartyChatStatus)
local thirdPartyUserService = game:GetService("ThirdPartyUserService")

return function()
	-- upvalues: useDispatch (ref), useProperty (ref), thirdPartyUserService (ref), fFlagAppChatIgnoreUnknownThirdPartyChatStatusModule (ref), responsiveModule (ref), reactModule (ref), thirdPartyChatSettingsLoadedModule (ref)
	local var1 = useDispatch()
	local var2 = useProperty(thirdPartyUserService, "FriendCommunicationRestrictionStatus")
	local var3 = if fFlagAppChatIgnoreUnknownThirdPartyChatStatusModule then responsiveModule.usePreferredInput() else nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), fFlagAppChatIgnoreUnknownThirdPartyChatStatusModule (copy), var3 (ref), responsiveModule (copy), thirdPartyChatSettingsLoadedModule (copy)
		if var1 and var2 then
			var1(thirdPartyChatSettingsLoadedModule(if fFlagAppChatIgnoreUnknownThirdPartyChatStatusModule and var3 ~= responsiveModule.Input.Directional and var2 == Enum.ChatRestrictionStatus.Unknown then Enum.ChatRestrictionStatus.NotRestricted else var2))
		end
	end, { var1, var2, var3 })
	
	return nil
end