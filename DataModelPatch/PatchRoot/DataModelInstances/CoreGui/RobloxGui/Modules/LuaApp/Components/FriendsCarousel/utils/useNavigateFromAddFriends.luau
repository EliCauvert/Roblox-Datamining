local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownToAddFriendsPageModule = require(Modules.LuaApp.Thunks.NavigateDownToAddFriendsPage)
local UseContactImporterConfigurationFunction = require(CorePackages.Workspace.Packages.ContactImporter).Utils.useContactImporterConfiguration
local UseNavigateToContactImporterModule = require(Modules.LuaApp.Components.ContactImporter.useNavigateToContactImporter)

return function(p1)
	-- upvalues: UseNavigateToContactImporterModule (copy), UseContactImporterConfigurationFunction (copy), UseDispatchFunction (copy), NavigateDownToAddFriendsPageModule (copy)
	local UseNavigateToContactImporterModuleResult = UseNavigateToContactImporterModule()
	local UseContactImporterConfigurationResult = UseContactImporterConfigurationFunction(p1)
	local UseDispatchResult = UseDispatchFunction()
	
	local function _()
		-- upvalues: UseDispatchResult (copy), NavigateDownToAddFriendsPageModule (upval)
		UseDispatchResult(NavigateDownToAddFriendsPageModule())
	end
	
	return function()
		-- upvalues: UseContactImporterConfigurationResult (copy), UseNavigateToContactImporterModuleResult (copy), UseDispatchResult (copy), NavigateDownToAddFriendsPageModule (upval)
		if UseContactImporterConfigurationResult.shouldShowContactImporterModal then
			UseNavigateToContactImporterModuleResult()
			
			return
		else
			UseDispatchResult(NavigateDownToAddFriendsPageModule())
		end
	end
end