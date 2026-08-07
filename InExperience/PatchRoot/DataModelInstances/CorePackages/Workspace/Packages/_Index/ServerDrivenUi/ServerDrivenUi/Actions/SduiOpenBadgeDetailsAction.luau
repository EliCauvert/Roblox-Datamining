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
local var3 = urlBuilder.fromString("www:badges")()

return function(p0, _, p1, _) --[[ line: 32 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagLuaAppBadgeDetailsLogExposure (ref), IXPService (ref), fStringLuaAppBadgeDetailsIxpLayer (ref), fFlagLuaAppBadgeDetailsEnabled (ref), sduiLoadTimer (ref), fetchBadgeDetailsPage (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), var3 (ref)
	local var4 = if p0 then p0.actionParams else nil
	
	if var4 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenBadgeDetails
		}, p1.appPage)
		
		return
	end
	assert(var4, "actionParams must exist")
	
	if var4.badgeId == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: badgeId",
			name = sduiActionType.OpenBadgeDetails
		}, p1.appPage)
		
		return
	elseif fFlagLuaAppBadgeDetailsLogExposure then
		IXPService:LogFlagLinkedUserLayerExposure(fStringLuaAppBadgeDetailsIxpLayer)
	end
	if fFlagLuaAppBadgeDetailsEnabled then
		local badgeDetails = sduiLoadTimer.createLoadTimer("BadgeDetails")
		badgeDetails.start("navigate")
		fetchBadgeDetailsPage(var4.badgeId, badgeDetails)
		local t = {
			name = appPage.BadgeDetails,
			extraProps = { badgeId = var4.badgeId, pageTimer = badgeDetails }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		p1.dependencies.dispatch(navigateDown(t))
		
		return
	else
		local t = {
			name = appPage.GenericWebPage,
			detail = `{var3}/{var4.badgeId}`,
			extraProps = {
				transitionAnimation = "SlideInFromRight",
				title = var4.titleText
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		p1.dependencies.dispatch(navigateDown(t))
	end
end