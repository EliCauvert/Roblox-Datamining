local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, _, p2) --[[ Line: 23 | Named "SduiOpenTrustedFriendsUpsellModalAction" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), Sources (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenTrustedFriendsUpsellModal
		}, p2.appPage)
		
		return
	end
	local TargetUserId = ActionParams.targetUserId
	
	if TargetUserId == nil or TargetUserId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: targetUserId",
			propName = "targetUserId",
			name = SduiActionType.OpenTrustedFriendsUpsellModal
		}, p2.appPage)
		
		return
	end
	local Source = ActionParams.source
	local config = {
		name = AppPage.TrustedContactsModal,
		props = {
			userId = TargetUserId,
			source = if typeof(Source) == "string" and Source ~= "" then Source else Sources.PartyChatConversationUpsell
		}
	}
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		
		return
	else
		p2.dependencies.dispatch(NavigateDownFunction(config))
	end
end