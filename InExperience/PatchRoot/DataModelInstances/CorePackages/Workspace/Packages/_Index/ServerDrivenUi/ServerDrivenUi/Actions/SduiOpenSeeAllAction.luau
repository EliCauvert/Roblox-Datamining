local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2) --[[ Line: 21 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenSeeAll
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local Text = tostring(ActionParams.collectionId)
	
	if Text == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "collectionId",
			name = SduiActionType.OpenSeeAll,
			message = `Missing collectionId: {Text}`
		}, p2.appPage)
		
		return
	end
	local CollectionPosition = ActionParams.collectionPosition
	local IsHome = p2.appPage == "Home"
	p2.dependencies.gameAnalytics.reportSeeAllWithId(Text, ActionParams.gameSetTargetId, CollectionPosition)
	local config = {
		name = AppPage.GamesList,
		detail = Text,
		extraProps = {
			sortPageId = tostring(Text),
			sortName = Text,
			pageContext = p2.appPage,
			isOmni = IsHome,
			sortIndex = if IsHome then tonumber(CollectionPosition) else nil
		}
	}
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		
		return
	else
		p2.dependencies.dispatch(NavigateDownFunction(config))
	end
end