local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local ChatDetailsNavigationOptionsModule = {
	getHeaderText = function()
		-- upvalues: GetFFlagIsSquadEnabledFunction (copy)
		return {
			shouldLocalize = true,
			raw = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Label.Details" else "Feature.Chat.Label.ChatDetails"
		}
	end,
	getIsRooted = function(Navigation)
		return Navigation and Navigation.getParam and Navigation.getParam("isRooted", false) or false
	end
}

function ChatDetailsNavigationOptionsModule.getNavigationOptions(p1, p2)
	-- upvalues: ChatDetailsNavigationOptionsModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), CryoModule (copy)
	return CryoModule.Dictionary.join({
		backButtonEnabled = true,
		headerText = ChatDetailsNavigationOptionsModule.getHeaderText(),
		backButtonTestId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatDetailsTopBarActionButton("back") else nil,
		isRoot = ChatDetailsNavigationOptionsModule.getIsRooted(p1 and p1.navigation)
	}, p2 or {})
end

function ChatDetailsNavigationOptionsModule.getTopBarConfig(p1)
	-- upvalues: ChatDetailsNavigationOptionsModule (copy)
	return {
		backButtonEnabled = true,
		headerText = ChatDetailsNavigationOptionsModule.getHeaderText(),
		isRoot = ChatDetailsNavigationOptionsModule.getIsRooted(p1)
	}
end

return ChatDetailsNavigationOptionsModule