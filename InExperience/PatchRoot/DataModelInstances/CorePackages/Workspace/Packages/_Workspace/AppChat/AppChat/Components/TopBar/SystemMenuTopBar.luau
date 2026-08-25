local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local chatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local createSystemMenuButtonModule = require(appChat.Components.SelectChatMembers.createSystemMenuButton)
local roactModule = require(parent.Roact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSignalState = require(parent.SignalsReact).useSignalState

return function(p0)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), useSignalState (ref), useLocalization (ref), createSystemMenuButtonModule (ref), roactModule (ref), chatTopBarBaseModule (ref)
	if fFlagAppChatTopBarConfigDrivenModule() then
		local screenName = p0.screenName
		local navigation = p0.navigation
		local var6 = useSignalState(getTopBarStoreModule(false).getScreenTopBar(screenName))
		local systemButtonEnabled = var6.systemButtonEnabled
		local systemButtonActivated = var6.systemButtonActivated
		local var7 = useLocalization({
			networkErrorText = "Feature.Chat.Response.NetworkError",
			invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected",
			cannotExpandToGroupChatActivePartyText = "Feature.Squads.Description.OneOnOneExpandedChatFeaturesActivePartyError",
			systemButtonText = var6.systemButtonText or "Feature.Chat.Action.Add"
		})
		
		return roactModule.createElement(chatTopBarBaseModule, {
			screenName = screenName,
			navigation = navigation,
			renderRight = function()
				-- upvalues: createSystemMenuButtonModule (copy), var7 (ref), systemButtonEnabled (ref), systemButtonActivated (ref)
				return createSystemMenuButtonModule({
					localizedStrings = var7,
					isDisabled = not systemButtonEnabled,
					onActivated = systemButtonActivated
				})
			end
		})
	end
	return nil
end