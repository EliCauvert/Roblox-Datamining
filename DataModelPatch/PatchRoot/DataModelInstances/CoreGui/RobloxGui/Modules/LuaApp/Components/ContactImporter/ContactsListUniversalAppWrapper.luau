local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OpenProfilePeekViewModule = require(Modules.LuaApp.Thunks.OpenProfilePeekView)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local ContactsList = require(Modules.LuaApp.Components.ContactImporter.api).ContactsList
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local OpenAmpWizardContainerFunction = require(CorePackages.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer
local OpenContactImporterLearnMoreLinkModule = require(Modules.LuaApp.Thunks.OpenContactImporterLearnMoreLink)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: UseDispatchFunction (copy), SetCurrentToastMessageModule (copy), OpenProfilePeekViewModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), OpenAmpWizardContainerFunction (copy), OpenContactImporterLearnMoreLinkModule (copy), ReactModule (copy), ContactsList (copy), DashModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(ContactsList, DashModule.join(p1, {
		showToast = function(ToastMessage)
			-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageModule (upval)
			UseDispatchResult(SetCurrentToastMessageModule({ toastMessage = ToastMessage }))
		end,
		onClose = function(p2)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back(p2)
				
				return
			else
				UseDispatchResult(NavigateBackModule(p2))
			end
		end,
		openProfilePeekView = function(p2, p3)
			-- upvalues: UseDispatchResult (copy), OpenProfilePeekViewModule (upval)
			UseDispatchResult(OpenProfilePeekViewModule(p2, p3))
		end,
		openAmpUpsell = function(p2, p3)
			-- upvalues: UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval)
			UseDispatchResult(OpenAmpWizardContainerFunction(p2, p3))
		end,
		openLearnMoreLink = function()
			-- upvalues: UseDispatchResult (copy), OpenContactImporterLearnMoreLinkModule (upval)
			UseDispatchResult(OpenContactImporterLearnMoreLinkModule())
		end
	}))
end