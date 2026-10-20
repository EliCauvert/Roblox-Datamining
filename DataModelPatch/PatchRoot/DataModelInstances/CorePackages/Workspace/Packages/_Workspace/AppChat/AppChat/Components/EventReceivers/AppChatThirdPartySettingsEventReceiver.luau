local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty
local ThirdPartyChatSettingsLoadedModule = require(AppChat.Actions.ThirdPartyChatSettingsLoaded)
local FFlagAppChatIgnoreUnknownThirdPartyChatStatusModule = require(AppChat.Flags.FFlagAppChatIgnoreUnknownThirdPartyChatStatus)
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")

return function()
	-- upvalues: UseDispatchFunction (copy), UsePropertyFunction (copy), ThirdPartyUserService (copy), FFlagAppChatIgnoreUnknownThirdPartyChatStatusModule (copy), ResponsiveModule (copy), ReactModule (copy), ThirdPartyChatSettingsLoadedModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local FriendCommunicationRestrictionStatus = UsePropertyFunction(ThirdPartyUserService, "FriendCommunicationRestrictionStatus")
	local UsePreferredInputResult = if FFlagAppChatIgnoreUnknownThirdPartyChatStatusModule then ResponsiveModule.usePreferredInput() else nil
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), FriendCommunicationRestrictionStatus (copy), FFlagAppChatIgnoreUnknownThirdPartyChatStatusModule (upval), UsePreferredInputResult (copy), ResponsiveModule (upval), ThirdPartyChatSettingsLoadedModule (upval)
		if UseDispatchResult and FriendCommunicationRestrictionStatus then
			UseDispatchResult(ThirdPartyChatSettingsLoadedModule(if FFlagAppChatIgnoreUnknownThirdPartyChatStatusModule and UsePreferredInputResult ~= ResponsiveModule.Input.Directional and FriendCommunicationRestrictionStatus == Enum.ChatRestrictionStatus.Unknown then Enum.ChatRestrictionStatus.NotRestricted else FriendCommunicationRestrictionStatus))
		end
	end, {
		UseDispatchResult,
		FriendCommunicationRestrictionStatus,
		UsePreferredInputResult
	})
	
	return nil
end