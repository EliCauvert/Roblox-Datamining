local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRouteNameFunction = require(CorePackages.Workspace.Packages.Navigation).useRouteName
local RoactAnalyticsTopBarModule = require(Modules.LuaApp.Services.RoactAnalyticsTopBar)
local NavigateDownToAddFriendsPageModule = require(Modules.LuaApp.Thunks.NavigateDownToAddFriendsPage)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UtilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local IconsActionsFriendsFriendAdd = UIBloxModule.App.ImageSet.Images["icons/actions/friends/friendAdd"]

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRouteNameFunction (copy), UseRoactServiceModule (copy), RoactAnalyticsTopBarModule (copy), NavigateDownToAddFriendsPageModule (copy), ReactModule (copy), UtilityActionIcon (copy), IconsActionsFriendsFriendAdd (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRouteNameResult = UseRouteNameFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactAnalyticsTopBarModule)
	
	local function OnActivated()
		-- upvalues: p1 (copy), UseDispatchResult (copy), NavigateDownToAddFriendsPageModule (upval), UseRoactServiceModuleResult (copy), UseRouteNameResult (copy)
		if not p1.isSearching then
			UseDispatchResult(NavigateDownToAddFriendsPageModule())
			UseRoactServiceModuleResult.reportAddFriendsButtonClick(UseRouteNameResult)
			
			return
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		p1.setVisible(not p1.isSearching)
	end, { p1.isSearching, p1.setVisible })
	
	return ReactModule.createElement(UtilityActionIcon, {
		icon = IconsActionsFriendsFriendAdd,
		onActivated = OnActivated,
		ref = p1.buttonRef
	})
end