local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local chatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local createSystemMenuButtonModule = require(appChat.Components.SelectChatMembers.createSystemMenuButton)
local roactModule = require(parent.Roact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSignalState = require(parent.SignalsReact).useSignalState

return function(p1)
	-- upvalues: getTopBarStoreModule (ref), useSignalState (ref), useLocalization (ref), createSystemMenuButtonModule (ref), roactModule (ref), chatTopBarBaseModule (ref)
	local screenName = p1.screenName
	local navigation = p1.navigation
	local var1 = useSignalState(getTopBarStoreModule(false).getScreenTopBar(screenName))
	local systemButtonEnabled = var1.systemButtonEnabled
	local systemButtonActivated = var1.systemButtonActivated
	local var2 = useLocalization({
		networkErrorText = "Feature.Chat.Response.NetworkError",
		invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected",
		cannotExpandToGroupChatActivePartyText = "Feature.Squads.Description.OneOnOneExpandedChatFeaturesActivePartyError",
		systemButtonText = var1.systemButtonText or "Feature.Chat.Action.Add"
	})
	
	return roactModule.createElement(chatTopBarBaseModule, {
		screenName = screenName,
		navigation = navigation,
		renderRight = function()
			-- upvalues: createSystemMenuButtonModule (copy), var2 (ref), systemButtonEnabled (ref), systemButtonActivated (ref)
			return createSystemMenuButtonModule({
				localizedStrings = var2,
				isDisabled = not systemButtonEnabled,
				onActivated = systemButtonActivated
			})
		end
	})
end