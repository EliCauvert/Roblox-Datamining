local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local SetCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(CorePackages.Workspace.Packages.RobloxAppEnums).CentralOverlayType
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local SetModerationStatusFunction = require(CorePackages.Workspace.Packages.NotApprovedPageShared).SetModerationStatus
local Constants = require(CorePackages.Workspace.Packages.NotApprovedPageShared).Constants

return function()
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), ReactModule (copy), Constants (copy), ArgCheckModule (copy), MutedErrorFunction (copy), SetModerationStatusFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), LogoutModule (copy), ResetNavigationHistoryModule (copy), AppPage (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.Moderation
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), Constants (upval), ArgCheckModule (upval), MutedErrorFunction (upval), UseDispatchResult (copy), SetModerationStatusFunction (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), LogoutModule (upval), ResetNavigationHistoryModule (upval), AppPage (upval)
		if not UseSelectorResult or not UseSelectorResult.userModerated or not UseSelectorResult.moderationDetail then return end
		local ModerationDetail = UseSelectorResult.moderationDetail
		local PunishmentTypeDescription = ModerationDetail.punishmentTypeDescription
		local PUNISHMENTTYPETOINTERVENTION = Constants.PUNISHMENT_TYPE_TO_INTERVENTION_MAP[PunishmentTypeDescription]
		ArgCheckModule.isNotNil(PUNISHMENTTYPETOINTERVENTION, "interventionType should not be nil")
		
		if PUNISHMENTTYPETOINTERVENTION == nil then
			MutedErrorFunction("ModerationEventReceiver Got Invalid Moderation Type: `" .. tostring(PunishmentTypeDescription) .. "`")
			PUNISHMENTTYPETOINTERVENTION = Constants.INTERVENTION_TYPES.None
		end
		if PUNISHMENTTYPETOINTERVENTION == Constants.INTERVENTION_TYPES.None then
			UseDispatchResult(SetModerationStatusFunction(false))
			
			return
		end
		if ModerationDetail.selfServiceDeactivated == true then
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.AccountReactivationPrompt, {
				moderationDetail = ModerationDetail,
				interventionType = PUNISHMENTTYPETOINTERVENTION,
				LogoutThunk = LogoutModule
			}))
			
			return
		else
			UseDispatchResult(ResetNavigationHistoryModule({
				{
					name = AppPage.NotApprovedPage,
					extraProps = {
						moderationDetail = ModerationDetail,
						interventionType = PUNISHMENTTYPETOINTERVENTION,
						LogoutThunk = LogoutModule
					}
				}
			}))
		end
	end, { UseSelectorResult })
	
	return nil
end