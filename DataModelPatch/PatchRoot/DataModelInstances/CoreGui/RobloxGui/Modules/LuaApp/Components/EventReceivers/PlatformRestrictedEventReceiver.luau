local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local RestrictionSourceModule = require(Modules.LuaApp.Models.UserModerationApi.RestrictionSource)

return function()
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), RestrictionSourceModule (copy), ReactModule (copy), ResetNavigationHistoryModule (copy), AppPage (copy), LogoutModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1): boolean
		-- upvalues: RestrictionSourceModule (upval)
		return p1.UserAccess and (p1.UserAccess.restrictionDetail and p1.UserAccess.restrictionDetail.source == RestrictionSourceModule.PlatformAccess)
	end)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseRefResult (copy), UseDispatchResult (copy), ResetNavigationHistoryModule (upval), AppPage (upval), LogoutModule (upval)
		if UseSelectorResult and not UseRefResult.current then
			UseRefResult.current = true
			UseDispatchResult(ResetNavigationHistoryModule({
				{
					name = AppPage.PlatformLockedPage,
					extraProps = { LogoutThunk = LogoutModule }
				}
			}))
		end
	end, { UseSelectorResult, UseDispatchResult })
	
	return nil
end