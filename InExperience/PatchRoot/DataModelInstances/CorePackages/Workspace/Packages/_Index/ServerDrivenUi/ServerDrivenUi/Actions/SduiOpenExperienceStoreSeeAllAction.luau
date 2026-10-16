local IXPService = game:GetService("IXPService")
local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local NavigateToDevStoreSeeAllFunction = require(Parent.ExperienceStoreServerDrivenUi).navigateToDevStoreSeeAll
local DisplayModule = require(Parent.Display)
local ResponsiveModule = require(Parent.Responsive)
local OpenSduiWebLinkModule = require(ServerDrivenUi.Actions.openSduiWebLink)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppDevStoreSeeAllSduiEnabled = SharedFlagsModule.FFlagLuaAppDevStoreSeeAllSduiEnabled
local FFlagLuaAppDevStoreSeeAllSduiLogExposure = SharedFlagsModule.FFlagLuaAppDevStoreSeeAllSduiLogExposure
local FStringLuaAppDevStoreSeeAllSduiIxpLayer = SharedFlagsModule.FStringLuaAppDevStoreSeeAllSduiIxpLayer
local FFlagSduiCapabilityDevStoreSeeAllWebviewFallback = SharedFlagsModule.FFlagSduiCapabilityDevStoreSeeAllWebviewFallback
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

local function _() --[[ Line: 38 | Named "getIsCompactTouch" ]]
	-- upvalues: DisplayModule (copy), ResponsiveModule (copy)
	return ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(false).getViewportSize(false), (ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false)))
end

return function(p1, _, p2, _) --[[ Line: 51 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), FFlagLuaAppDevStoreSeeAllSduiLogExposure (copy), IXPService (copy), FStringLuaAppDevStoreSeeAllSduiIxpLayer (copy), FFlagLuaAppDevStoreSeeAllSduiEnabled (copy), NavigateToDevStoreSeeAllFunction (copy), FFlagSduiCapabilityDevStoreSeeAllWebviewFallback (copy), DisplayModule (copy), ResponsiveModule (copy), OpenSduiWebLinkModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenExperienceStoreSeeAll
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if typeof(UniverseId) ~= "string" or UniverseId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = SduiActionType.OpenExperienceStoreSeeAll,
			message = `Invalid or missing universeId: {tostring(UniverseId)}`
		}, p2.appPage)
		
		return
	end
	if FFlagLuaAppDevStoreSeeAllSduiLogExposure then
		IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppDevStoreSeeAllSduiIxpLayer)
	end
	if FFlagLuaAppDevStoreSeeAllSduiEnabled then
		NavigateToDevStoreSeeAllFunction(p2.dependencies.getNavigation(), UniverseId)
		
		return
	end
	if FFlagSduiCapabilityDevStoreSeeAllWebviewFallback and not ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(false).getViewportSize(false), (ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false))) then
		OpenSduiWebLinkModule(p2, string.format("https://www.roblox.com/games/store-section/%s", UniverseId), "Feature.GameDetails.Label.Store")
		
		return
	end
	local config = { name = AppPage.PassesPage, detail = UniverseId }
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		
		return
	else
		p2.dependencies.dispatch(NavigateDownFunction(config))
	end
end