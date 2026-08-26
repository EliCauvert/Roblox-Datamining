local IXPService = game:GetService("IXPService")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local fFlagLuaAppBadgeDetailsEnabled = require(parent.SharedFlags).FFlagLuaAppBadgeDetailsEnabled
local fetchBadgeDetailsPage = require(parent.Badges).fetchBadgeDetailsPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local fFlagLuaAppBadgeDetailsLogExposure = require(parent.SharedFlags).FFlagLuaAppBadgeDetailsLogExposure
local fStringLuaAppBadgeDetailsIxpLayer = require(parent.SharedFlags).FStringLuaAppBadgeDetailsIxpLayer
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local var2 = urlBuilder.fromString("www:badges")()

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagLuaAppBadgeDetailsLogExposure (ref), IXPService (ref), fStringLuaAppBadgeDetailsIxpLayer (ref), fFlagLuaAppBadgeDetailsEnabled (ref), sduiLoadTimer (ref), fetchBadgeDetailsPage (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), var2 (ref)
	local var3 = if p1 then p1.actionParams else nil
	
	if var3 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenBadgeDetails
		}, p2.appPage)
		
		return
	end
	assert(var3, "actionParams must exist")
	
	if var3.badgeId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: badgeId",
			name = sduiActionType.OpenBadgeDetails
		}, p2.appPage)
		
		return
	elseif fFlagLuaAppBadgeDetailsLogExposure then
		IXPService:LogFlagLinkedUserLayerExposure(fStringLuaAppBadgeDetailsIxpLayer)
	end
	if fFlagLuaAppBadgeDetailsEnabled then
		local badgeDetails = sduiLoadTimer.createLoadTimer("BadgeDetails")
		badgeDetails.start("navigate")
		fetchBadgeDetailsPage(var3.badgeId, badgeDetails)
		local t = {
			name = appPage.BadgeDetails,
			extraProps = { badgeId = var3.badgeId, pageTimer = badgeDetails }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		p2.dependencies.dispatch(navigateDown(t))
		
		return
	else
		local t = {
			name = appPage.GenericWebPage,
			detail = `{var2}/{var3.badgeId}`,
			extraProps = {
				transitionAnimation = "SlideInFromRight",
				title = var3.titleText
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		p2.dependencies.dispatch(navigateDown(t))
	end
end