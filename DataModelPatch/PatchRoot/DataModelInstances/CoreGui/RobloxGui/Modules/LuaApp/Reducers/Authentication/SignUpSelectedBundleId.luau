local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).createReducer("", {
	[require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Authentication.SetSignUpSelectedBundleId).name] = function(_, p1)
		-- upvalues: ArgCheckModule (copy)
		local BundleId = p1.bundleId
		ArgCheckModule.isTypeOrNil(BundleId, "string", "action.bundleId from SetSignUpSelectedBundleId")
		
		return BundleId
	end
})