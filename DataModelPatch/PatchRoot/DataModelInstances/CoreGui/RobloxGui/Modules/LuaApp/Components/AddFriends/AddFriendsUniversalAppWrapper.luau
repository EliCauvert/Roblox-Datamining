local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local NavigateDownTo3DQRCodePageModule = require(script:FindFirstAncestor("Modules").LuaApp.Thunks.NavigateDownTo3DQRCodePage)
local AddFriendsScreen = require(CorePackages.Workspace.Packages.AddFriends).AddFriendsScreen

return function()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), NavigateDownTo3DQRCodePageModule (copy), AppPage (copy), AddFriendsScreen (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(...)
		-- upvalues: UseDispatchResult (copy), NavigateDownTo3DQRCodePageModule (upval)
		return UseDispatchResult(NavigateDownTo3DQRCodePageModule(...))
	end, { UseDispatchResult })
	
	return ReactModule.createElement(AddFriendsScreen, {
		navigateToLuaAppPages = ReactModule.useMemo(function()
			-- upvalues: AppPage (upval), UseResult (copy)
			return { [AppPage.ProfileQRCodePage] = UseResult }
		end, { UseResult })
	})
end