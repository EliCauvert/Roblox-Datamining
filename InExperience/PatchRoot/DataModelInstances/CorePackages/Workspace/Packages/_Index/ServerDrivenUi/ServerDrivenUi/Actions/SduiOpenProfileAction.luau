local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType

return function(p1, _, p2, _) --[[ Line: 19 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenProfile
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local ProfileId = ActionParams.profileId
	
	if ProfileId == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: profileId",
			propName = "profileId",
			name = SduiActionType.OpenProfile
		}, p2.appPage)
		
		return
	end
	local ProfileType = ActionParams.profileType
	
	if ProfileType == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: profileType",
			propName = "profileType",
			name = SduiActionType.OpenProfile
		}, p2.appPage)
		
		return
	end
	local config = {
		name = AppPage.ProfilePlatform,
		detail = ProfileId,
		extraProps = {
			profileType = if ProfileType == "Group" then "Community" else ProfileType,
			source = ActionParams.source
		}
	}
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		
		return
	else
		p2.dependencies.dispatch(NavigateDownFunction(config))
	end
end