local IXPService = game:GetService("IXPService")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagLuaAppBadgeDetailsEnabled = require(Parent.SharedFlags).FFlagLuaAppBadgeDetailsEnabled
local FetchBadgeDetailsPageFunction = require(Parent.Badges).fetchBadgeDetailsPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local FFlagLuaAppBadgeDetailsLogExposure = require(Parent.SharedFlags).FFlagLuaAppBadgeDetailsLogExposure
local FStringLuaAppBadgeDetailsIxpLayer = require(Parent.SharedFlags).FStringLuaAppBadgeDetailsIxpLayer
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local v1 = require(Parent.UrlBuilder).UrlBuilder.fromString("www:badges")()

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), FFlagLuaAppBadgeDetailsLogExposure (copy), IXPService (copy), FStringLuaAppBadgeDetailsIxpLayer (copy), FFlagLuaAppBadgeDetailsEnabled (copy), SduiLoadTimer (copy), FetchBadgeDetailsPageFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), v1 (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenBadgeDetails
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	
	if ActionParams.badgeId == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: badgeId",
			name = SduiActionType.OpenBadgeDetails
		}, p2.appPage)
		
		return
	end
	if FFlagLuaAppBadgeDetailsLogExposure then
		IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppBadgeDetailsIxpLayer)
	end
	if FFlagLuaAppBadgeDetailsEnabled then
		local BadgeDetails = SduiLoadTimer.createLoadTimer("BadgeDetails")
		BadgeDetails.start("navigate")
		FetchBadgeDetailsPageFunction(ActionParams.badgeId, BadgeDetails)
		local config = {
			name = AppPage.BadgeDetails,
			extraProps = { badgeId = ActionParams.badgeId, pageTimer = BadgeDetails }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p2.dependencies.dispatch(NavigateDownFunction(config))
			
			return
		end
	else
		local config1 = {
			name = AppPage.GenericWebPage,
			detail = `{v1}/{ActionParams.badgeId}`,
			extraProps = {
				transitionAnimation = "SlideInFromRight",
				title = ActionParams.titleText
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config1))
			
			return
		else
			p2.dependencies.dispatch(NavigateDownFunction(config1))
		end
	end
end