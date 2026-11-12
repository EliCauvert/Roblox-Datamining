local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)
local ChatDetailsNavigationOptionsModule = {
	getHeaderText = function()
		-- upvalues: GetFFlagIsSquadEnabledFunction (copy)
		return {
			shouldLocalize = true,
			raw = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Label.Details" else "Feature.Chat.Label.ChatDetails"
		}
	end,
	getIsRooted = function(Navigation)
		-- upvalues: GetFFlagAppChatEnableRootedNavigationModule (copy)
		return GetFFlagAppChatEnableRootedNavigationModule() and Navigation and Navigation.getParam and Navigation.getParam("isRooted", false) or false
	end
}

function ChatDetailsNavigationOptionsModule.getNavigationOptions(p1, p2)
	-- upvalues: ChatDetailsNavigationOptionsModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), CryoModule (copy)
	local Navigation = p1 and p1.navigation
	local JoinResult = {
		headerText = ChatDetailsNavigationOptionsModule.getHeaderText(),
		backButtonTestId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatDetailsTopBarActionButton("back") else nil
	}
	
	if GetFFlagAppChatEnableRootedNavigationModule() then
		JoinResult = CryoModule.Dictionary.join(JoinResult, {
			backButtonEnabled = true,
			isRoot = ChatDetailsNavigationOptionsModule.getIsRooted(Navigation)
		})
	end
	return CryoModule.Dictionary.join(JoinResult, p2 or {})
end

function ChatDetailsNavigationOptionsModule.getTopBarConfig(p1)
	-- upvalues: ChatDetailsNavigationOptionsModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), CryoModule (copy)
	local JoinResult = {
		backButtonEnabled = true,
		headerText = ChatDetailsNavigationOptionsModule.getHeaderText()
	}
	
	if GetFFlagAppChatEnableRootedNavigationModule() then
		JoinResult = CryoModule.Dictionary.join(JoinResult, {
			isRoot = ChatDetailsNavigationOptionsModule.getIsRooted(p1)
		})
	end
	return JoinResult
end

return ChatDetailsNavigationOptionsModule