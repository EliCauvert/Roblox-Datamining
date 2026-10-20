local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty
local ThirdPartyChatSettingsLoadedModule = require(AppChat.Actions.ThirdPartyChatSettingsLoaded)
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")

return function()
	-- upvalues: UseDispatchFunction (copy), UsePropertyFunction (copy), ThirdPartyUserService (copy), ResponsiveModule (copy), ReactModule (copy), ThirdPartyChatSettingsLoadedModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local FriendCommunicationRestrictionStatus = UsePropertyFunction(ThirdPartyUserService, "FriendCommunicationRestrictionStatus")
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), FriendCommunicationRestrictionStatus (copy), UsePreferredInputResult (copy), ResponsiveModule (upval), ThirdPartyChatSettingsLoadedModule (upval)
		if UseDispatchResult and FriendCommunicationRestrictionStatus then
			UseDispatchResult(ThirdPartyChatSettingsLoadedModule(if UsePreferredInputResult == ResponsiveModule.Input.Directional or FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.Unknown then FriendCommunicationRestrictionStatus else Enum.ChatRestrictionStatus.NotRestricted))
		end
	end, {
		UseDispatchResult,
		FriendCommunicationRestrictionStatus,
		UsePreferredInputResult
	})
	
	return nil
end