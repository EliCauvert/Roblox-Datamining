local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var0 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p0, _, p1) --[[ line: 21 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var0 (ref), navigateDown (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenSeeAll
		}, p1.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local var3 = tostring(var2.collectionId)
	
	if var3 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "collectionId",
			name = sduiActionType.OpenSeeAll,
			message = `Missing collectionId: {var3}`
		}, p1.appPage)
		
		return
	end
	local collectionPosition = var2.collectionPosition
	local isHome = p1.appPage == "Home"
	p1.dependencies.gameAnalytics.reportSeeAllWithId(var3, var2.gameSetTargetId, collectionPosition)
	local t = {
		name = appPage.GamesList,
		detail = var3,
		extraProps = {
			sortPageId = tostring(var3),
			sortName = var3,
			pageContext = p1.appPage,
			isOmni = isHome,
			sortIndex = if isHome then tonumber(collectionPosition) else nil
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var0.down(var0.fromLegacyPage(t))
		
		return
	end
	p1.dependencies.dispatch(navigateDown(t))
end