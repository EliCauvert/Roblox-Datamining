local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ChatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local CreateSystemMenuButtonModule = require(AppChat.Components.SelectChatMembers.createSystemMenuButton)
local RoactModule = require(Parent.Roact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return function(p1)
	-- upvalues: GetTopBarStoreModule (copy), UseSignalStateFunction (copy), UseLocalizationFunction (copy), CreateSystemMenuButtonModule (copy), RoactModule (copy), ChatTopBarBaseModule (copy)
	local ScreenName = p1.screenName
	local Navigation = p1.navigation
	local UseSignalStateResult = UseSignalStateFunction((GetTopBarStoreModule(false).getScreenTopBar(ScreenName)))
	local SystemButtonEnabled = UseSignalStateResult.systemButtonEnabled
	local SystemButtonActivated = UseSignalStateResult.systemButtonActivated
	local UseLocalizationResult = UseLocalizationFunction({
		networkErrorText = "Feature.Chat.Response.NetworkError",
		invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected",
		cannotExpandToGroupChatActivePartyText = "Feature.Squads.Description.OneOnOneExpandedChatFeaturesActivePartyError",
		systemButtonText = UseSignalStateResult.systemButtonText or "Feature.Chat.Action.Add"
	})
	
	return RoactModule.createElement(ChatTopBarBaseModule, {
		screenName = ScreenName,
		navigation = Navigation,
		renderRight = function()
			-- upvalues: CreateSystemMenuButtonModule (upval), UseLocalizationResult (copy), SystemButtonEnabled (copy), SystemButtonActivated (copy)
			return CreateSystemMenuButtonModule({
				localizedStrings = UseLocalizationResult,
				isDisabled = not SystemButtonEnabled,
				onActivated = SystemButtonActivated
			})
		end
	})
end