local CorePackages = game:GetService("CorePackages")
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local ReactModule = require(CorePackages.Packages.React)
local ProfileTypes = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums).ProfileTypes
local EnableCommunityProfilePageIXPModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local OpenVerifiedBadgeModalModule = require(Modules.LuaApp.Thunks.OpenVerifiedBadgeModal)
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local OpenCentralOverlayForGameDetailMoreModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForGameDetailMore)
local OpenCentralOverlayForGameDetailsPlayWithFriendsModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForGameDetailsPlayWithFriends)
local OpenCentralOverlayForExperienceGuidelinesModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForExperienceGuidelines)
local OpenRefundPolicyLearnMorePageModule = require(Modules.LuaApp.Thunks.OpenRefundPolicyLearnMorePage)
local OpenWebviewModule = require(Modules.LuaApp.Thunks.OpenWebview)
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), OpenCentralOverlayForLeaveRobloxAlertModule (copy), OpenCentralOverlayForGameDetailMoreModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), OpenCentralOverlayForGameDetailsPlayWithFriendsModule (copy), CloseCentralOverlayModule (copy), OpenVerifiedBadgeModalModule (copy), NavigateDownModule (copy), OpenCentralOverlayForExperienceGuidelinesModule (copy), OpenRefundPolicyLearnMorePageModule (copy), OpenWebviewModule (copy), EnableCommunityProfilePageIXPModule (copy), AppPage (copy), ProfileTypes (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return (ReactModule.useMemo(function()
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackModule (upval), OpenCentralOverlayForLeaveRobloxAlertModule (upval), OpenCentralOverlayForGameDetailMoreModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p1 (copy), OpenCentralOverlayForGameDetailsPlayWithFriendsModule (upval), CloseCentralOverlayModule (upval), OpenVerifiedBadgeModalModule (upval), NavigateDownModule (upval), OpenCentralOverlayForExperienceGuidelinesModule (upval), OpenRefundPolicyLearnMorePageModule (upval), OpenWebviewModule (upval), EnableCommunityProfilePageIXPModule (upval), AppPage (upval), ProfileTypes (upval)
		return {
			navigateBack = function()
				-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackModule (upval)
				return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else UseDispatchResult(NavigateBackModule())
			end,
			openLeaveRobloxAlertUIBlox = function(p2)
				-- upvalues: UseDispatchResult (upval), OpenCentralOverlayForLeaveRobloxAlertModule (upval)
				UseDispatchResult(OpenCentralOverlayForLeaveRobloxAlertModule(p2))
			end,
			openMoreContextualMenu = function(p2, p3, p4, p5)
				-- upvalues: UseDispatchResult (upval), OpenCentralOverlayForGameDetailMoreModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p1 (upval)
				UseDispatchResult(OpenCentralOverlayForGameDetailMoreModule(p2, p3, nil, p4, p5, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1 else nil))
			end,
			openShareContextualMenu = function(p2, p3, p4)
				-- upvalues: UseDispatchResult (upval), OpenCentralOverlayForGameDetailsPlayWithFriendsModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p1 (upval)
				UseDispatchResult(OpenCentralOverlayForGameDetailsPlayWithFriendsModule(p2, p3, p4, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1 else nil))
			end,
			closeAlert = function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayModule (upval)
				UseDispatchResult(CloseCentralOverlayModule())
			end,
			openVerifiedBadgeModal = function()
				-- upvalues: UseDispatchResult (upval), OpenVerifiedBadgeModalModule (upval)
				UseDispatchResult(OpenVerifiedBadgeModalModule())
			end,
			openCreatorPage = function(p2)
				-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownModule (upval)
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(p2))
					
					return
				else
					UseDispatchResult(NavigateDownModule(p2))
				end
			end,
			openExperienceGuidelinesExplained = function(p2, p3)
				-- upvalues: UseDispatchResult (upval), OpenCentralOverlayForExperienceGuidelinesModule (upval)
				UseDispatchResult(OpenCentralOverlayForExperienceGuidelinesModule(p2, p3))
			end,
			openRefundPolicyLearnMorePage = function(p2)
				-- upvalues: UseDispatchResult (upval), OpenRefundPolicyLearnMorePageModule (upval)
				UseDispatchResult(OpenRefundPolicyLearnMorePageModule(p2))
			end,
			openWebview = function(p2, p3)
				-- upvalues: UseDispatchResult (upval), OpenWebviewModule (upval)
				UseDispatchResult(OpenWebviewModule(p2, p3))
			end,
			openCommunityProfilePage = if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then function(Detail, Source)
				-- upvalues: AppPage (upval), ProfileTypes (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownModule (upval)
				local config = {
					name = AppPage.ProfilePlatform,
					detail = Detail,
					extraProps = { profileType = ProfileTypes.Community, source = Source }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownModule(config))
				end
			end else nil,
			openUserProfilePage = function(Detail, Source)
				-- upvalues: AppPage (upval), ProfileTypes (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownModule (upval)
				local config = {
					name = AppPage.ProfilePlatform,
					detail = Detail,
					extraProps = { profileType = ProfileTypes.User, source = Source }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownModule(config))
				end
			end
		}
	end, { UseDispatchResult }))
end