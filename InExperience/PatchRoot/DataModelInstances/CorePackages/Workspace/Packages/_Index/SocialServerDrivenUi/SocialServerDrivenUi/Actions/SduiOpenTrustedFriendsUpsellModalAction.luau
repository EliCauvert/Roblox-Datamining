local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local appPage = require(parent.RobloxAppEnums).AppPage
local sources = require(parent.SocialLuaAnalytics).Analytics.Enums.Sources
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sources (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var2 = if p1 then p1.actionParams else nil
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenTrustedFriendsUpsellModal
		}, p2.appPage)
		
		return
	end
	local targetUserId = var2.targetUserId
	
	if targetUserId == nil or targetUserId == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: targetUserId",
			propName = "targetUserId",
			name = sduiActionType.OpenTrustedFriendsUpsellModal
		}, p2.appPage)
		
		return
	end
	local source = var2.source
	local t = {
		name = appPage.TrustedContactsModal,
		props = {
			userId = targetUserId,
			source = if typeof(source) == "string" and source ~= "" then source else sources.PartyChatConversationUpsell
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var1.down(var1.fromLegacyPage(t))
		
		return
	end
	p2.dependencies.dispatch(navigateDown(t))
end