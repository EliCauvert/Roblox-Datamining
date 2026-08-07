local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var0 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p0, _, p1, _) --[[ line: 19 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var0 (ref), navigateDown (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenProfile
		}, p1.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local profileId = var2.profileId
	
	if profileId == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: profileId",
			propName = "profileId",
			name = sduiActionType.OpenProfile
		}, p1.appPage)
		
		return
	end
	local profileType = var2.profileType
	
	if profileType == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: profileType",
			propName = "profileType",
			name = sduiActionType.OpenProfile
		}, p1.appPage)
		
		return
	end
	local t = {
		name = appPage.ProfilePlatform,
		detail = profileId,
		extraProps = {
			profileType = if profileType == "Group" then "Community" else profileType,
			source = var2.source
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var0.down(var0.fromLegacyPage(t))
		
		return
	end
	p1.dependencies.dispatch(navigateDown(t))
end