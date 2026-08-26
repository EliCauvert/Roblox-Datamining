local IXPService = game:GetService("IXPService")
local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local navigateToDevStoreSeeAll = require(parent.DevStore).navigateToDevStoreSeeAll
local displayModule = require(parent.Display)
local responsiveModule = require(parent.Responsive)
local openSduiWebLinkModule = require(serverDrivenUi.Actions.openSduiWebLink)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppDevStoreSeeAllSduiEnabled = sharedFlagsModule.FFlagLuaAppDevStoreSeeAllSduiEnabled
local fFlagLuaAppDevStoreSeeAllSduiLogExposure = sharedFlagsModule.FFlagLuaAppDevStoreSeeAllSduiLogExposure
local fStringLuaAppDevStoreSeeAllSduiIxpLayer = sharedFlagsModule.FStringLuaAppDevStoreSeeAllSduiIxpLayer
local fFlagSduiCapabilityDevStoreSeeAllWebviewFallback = sharedFlagsModule.FFlagSduiCapabilityDevStoreSeeAllWebviewFallback
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

local function _()
	-- upvalues: displayModule (ref), responsiveModule (ref)
	return responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(false).getViewportSize(false), responsiveModule.GetInputModeStore(false).getPreferredInputType(false))
end

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagLuaAppDevStoreSeeAllSduiLogExposure (ref), IXPService (ref), fStringLuaAppDevStoreSeeAllSduiIxpLayer (ref), fFlagLuaAppDevStoreSeeAllSduiEnabled (ref), navigateToDevStoreSeeAll (ref), fFlagSduiCapabilityDevStoreSeeAllWebviewFallback (ref), displayModule (ref), responsiveModule (ref), openSduiWebLinkModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var2 = if p1 then p1.actionParams else nil
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenExperienceStoreSeeAll
		}, p2.appPage)
		
		return
	end
	local universeId = var2.universeId
	
	if typeof(universeId) ~= "string" or universeId == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = sduiActionType.OpenExperienceStoreSeeAll,
			message = `Invalid or missing universeId: {tostring(universeId)}`
		}, p2.appPage)
		
		return
	elseif fFlagLuaAppDevStoreSeeAllSduiLogExposure then
		IXPService:LogFlagLinkedUserLayerExposure(fStringLuaAppDevStoreSeeAllSduiIxpLayer)
	end
	if fFlagLuaAppDevStoreSeeAllSduiEnabled then
		navigateToDevStoreSeeAll(p2.dependencies.getNavigation(), universeId)
		
		return
	elseif fFlagSduiCapabilityDevStoreSeeAllWebviewFallback and not responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(false).getViewportSize(false), responsiveModule.GetInputModeStore(false).getPreferredInputType(false)) then
		openSduiWebLinkModule(p2, string.format("https://www.roblox.com/games/store-section/%s", universeId), "Feature.GameDetails.Label.Store")
		
		return
	end
	local t = { name = appPage.PassesPage, detail = universeId }
	
	if fFlagSignalsNavP3Dispatch then
		var1.down(var1.fromLegacyPage(t))
		
		return
	end
	p2.dependencies.dispatch(navigateDown(t))
end