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
local var7 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

local function _() --[[ line: 38 | named "getIsCompactTouch" ]]
	-- upvalues: displayModule (ref), responsiveModule (ref)
	return responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(false).getViewportSize(false), responsiveModule.GetInputModeStore(false).getPreferredInputType(false))
end

return function(p0, _, p1, _) --[[ line: 51 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagLuaAppDevStoreSeeAllSduiLogExposure (ref), IXPService (ref), fStringLuaAppDevStoreSeeAllSduiIxpLayer (ref), fFlagLuaAppDevStoreSeeAllSduiEnabled (ref), navigateToDevStoreSeeAll (ref), fFlagSduiCapabilityDevStoreSeeAllWebviewFallback (ref), displayModule (ref), responsiveModule (ref), openSduiWebLinkModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var7 (ref), navigateDown (ref)
	local var8 = if p0 then p0.actionParams else nil
	
	if var8 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenExperienceStoreSeeAll
		}, p1.appPage)
		
		return
	end
	local universeId = var8.universeId
	
	if typeof(universeId) ~= "string" or universeId == "" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = sduiActionType.OpenExperienceStoreSeeAll,
			message = `Invalid or missing universeId: {tostring(universeId)}`
		}, p1.appPage)
		
		return
	elseif fFlagLuaAppDevStoreSeeAllSduiLogExposure then
		IXPService:LogFlagLinkedUserLayerExposure(fStringLuaAppDevStoreSeeAllSduiIxpLayer)
	end
	if fFlagLuaAppDevStoreSeeAllSduiEnabled then
		navigateToDevStoreSeeAll(p1.dependencies.getNavigation(), universeId)
		
		return
	elseif fFlagSduiCapabilityDevStoreSeeAllWebviewFallback and not responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(false).getViewportSize(false), responsiveModule.GetInputModeStore(false).getPreferredInputType(false)) then
		openSduiWebLinkModule(p1, string.format("https://www.roblox.com/games/store-section/%s", universeId), "Feature.GameDetails.Label.Store")
		
		return
	end
	local t = { name = appPage.PassesPage, detail = universeId }
	
	if fFlagSignalsNavP3Dispatch then
		var7.down(var7.fromLegacyPage(t))
		
		return
	end
	p1.dependencies.dispatch(navigateDown(t))
end