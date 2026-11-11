local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NavigateToRouteModule = require(Modules.LuaApp.Thunks.NavigateToRoute)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local OpenCentralOverlayForDiscoverabilityUpsellModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForDiscoverabilityUpsell)
local OpenPhoneUpsellModalModule = require(Modules.LuaApp.Thunks.Verification.OpenPhoneUpsellModal)
local OpenContactImporterLearnMoreLinkModule = require(Modules.LuaApp.Thunks.OpenContactImporterLearnMoreLink)
local OpenProfilePeekViewModule = require(Modules.LuaApp.Thunks.OpenProfilePeekView)
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ContactImporterManager = require(CorePackages.Workspace.Packages.ContactImporter).ContactImporterManager
local OpenAmpWizardContainerFunction = require(CorePackages.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer
local SetHomePageUpsellCardVariationFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.SetHomePageUpsellCardVariation
local WaitUntilIXPUserInitModule = require(Modules.LuaApp.Thunks.WaitUntilIXPUserInit)

return function()
	-- upvalues: UseDispatchFunction (copy), OpenAmpWizardContainerFunction (copy), NavigateToRouteModule (copy), DashModule (copy), OpenCentralOverlayForDiscoverabilityUpsellModule (copy), CloseCentralOverlayModule (copy), SetHomePageUpsellCardVariationFunction (copy), WaitUntilIXPUserInitModule (copy), IXPService (copy), ReactModule (copy), ContactImporterManager (copy), OpenPhoneUpsellModalModule (copy), OpenContactImporterLearnMoreLinkModule (copy), OpenProfilePeekViewModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(ContactImporterManager, {
		openAmpUpsell = function(p1, p2)
			-- upvalues: UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval)
			UseDispatchResult(OpenAmpWizardContainerFunction(p1, p2))
		end,
		navigate = function(Name, p1)
			-- upvalues: UseDispatchResult (copy), NavigateToRouteModule (upval), DashModule (upval)
			UseDispatchResult(NavigateToRouteModule({ DashModule.join({ name = Name }, p1) }))
		end,
		openDiscoverabilityModal = function(p1)
			-- upvalues: UseDispatchResult (copy), OpenCentralOverlayForDiscoverabilityUpsellModule (upval)
			UseDispatchResult(OpenCentralOverlayForDiscoverabilityUpsellModule(p1))
		end,
		onCloseDiscoverabilityModal = function()
			-- upvalues: UseDispatchResult (copy), CloseCentralOverlayModule (upval)
			UseDispatchResult(CloseCentralOverlayModule())
		end,
		openPhoneUpsellModal = OpenPhoneUpsellModalModule,
		closeCentralOverlay = CloseCentralOverlayModule,
		openContactImporterLearnMoreLink = OpenContactImporterLearnMoreLinkModule,
		openProfilePeekView = OpenProfilePeekViewModule,
		hideUpsellCard = function()
			-- upvalues: UseDispatchResult (copy), SetHomePageUpsellCardVariationFunction (upval)
			UseDispatchResult(SetHomePageUpsellCardVariationFunction("", "", ""))
		end,
		waitUntilIXPUserInit = function(p1)
			-- upvalues: UseDispatchResult (copy), WaitUntilIXPUserInitModule (upval), IXPService (upval)
			return UseDispatchResult(WaitUntilIXPUserInitModule(IXPService, p1))
		end
	})
end