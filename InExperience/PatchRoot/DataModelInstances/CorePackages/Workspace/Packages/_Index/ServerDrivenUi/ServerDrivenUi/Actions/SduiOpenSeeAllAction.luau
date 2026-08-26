local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var2 = if p1 then p1.actionParams else nil
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenSeeAll
		}, p2.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local var3 = tostring(var2.collectionId)
	
	if var3 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "collectionId",
			name = sduiActionType.OpenSeeAll,
			message = `Missing collectionId: {var3}`
		}, p2.appPage)
		
		return
	end
	local collectionPosition = var2.collectionPosition
	local isHome = p2.appPage == "Home"
	p2.dependencies.gameAnalytics.reportSeeAllWithId(var3, var2.gameSetTargetId, collectionPosition)
	local t = {
		name = appPage.GamesList,
		detail = var3,
		extraProps = {
			sortPageId = tostring(var3),
			sortName = var3,
			pageContext = p2.appPage,
			isOmni = isHome,
			sortIndex = if isHome then tonumber(collectionPosition) else nil
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var1.down(var1.fromLegacyPage(t))
		
		return
	end
	p2.dependencies.dispatch(navigateDown(t))
end