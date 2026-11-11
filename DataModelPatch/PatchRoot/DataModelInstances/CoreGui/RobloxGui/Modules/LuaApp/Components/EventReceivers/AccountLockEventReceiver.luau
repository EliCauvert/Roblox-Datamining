local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SetCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(CorePackages.Workspace.Packages.RobloxAppEnums).CentralOverlayType
local FFlagAccountLockReceiverClosesModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAccountLockReceiverClosesModal
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RestrictionSourceModule = require(Modules.LuaApp.Models.UserModerationApi.RestrictionSource)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local ApiFetchAccessStatusModule = require(Modules.LuaApp.Thunks.Moderation.ApiFetchAccessStatus)
local ChallengeErrorModule = require(Modules.LuaApp.Util.ChallengeError)

return function()
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), FFlagAccountLockReceiverClosesModal (copy), ReactModule (copy), RestrictionSourceModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), LogoutModule (copy), ResetNavigationHistoryModule (copy), ApiFetchAccessStatusModule (copy), ChallengeErrorModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.UserAccess
	end)
	local UseSelectorResult1 = if FFlagAccountLockReceiverClosesModal then UseSelectorFunction(function(p1)
		return p1.CentralOverlay and p1.CentralOverlay.OverlayType
	end) else nil
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), RestrictionSourceModule (upval), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), LogoutModule (upval), ResetNavigationHistoryModule (upval), ApiFetchAccessStatusModule (upval), ChallengeErrorModule (upval)
		if UseSelectorResult and UseSelectorResult.restrictionDetail and UseSelectorResult.restrictionDetail.source == RestrictionSourceModule.AccountLock then
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.AccountLockModal, {
				Logout = LogoutModule,
				ResetNavigationHistory = ResetNavigationHistoryModule,
				ApiFetchAccessStatus = ApiFetchAccessStatusModule,
				ChallengeError = ChallengeErrorModule
			}))
			
			return
		end
	end, { UseSelectorResult })
	
	if FFlagAccountLockReceiverClosesModal then
		ReactModule.useEffect(function()
			-- upvalues: UseSelectorResult (copy), RestrictionSourceModule (upval), UseSelectorResult1 (ref), CentralOverlayType (upval), UseDispatchResult (copy), SetCentralOverlayFunction (upval)
			local RestrictionDetail = UseSelectorResult and UseSelectorResult.restrictionDetail
			
			if (not RestrictionDetail or RestrictionDetail.source ~= RestrictionSourceModule.AccountLock) and UseSelectorResult1 == CentralOverlayType.AccountLockModal then
				UseDispatchResult(SetCentralOverlayFunction())
			end
		end, { UseSelectorResult, UseSelectorResult1, UseDispatchResult })
	end
	return nil
end