local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local OpenContactImporterLearnMoreLinkModule = require(Modules.LuaApp.Thunks.OpenContactImporterLearnMoreLink)
local OpenProfilePeekViewModule = require(Modules.LuaApp.Thunks.OpenProfilePeekView)
local EnumScreens = require(CorePackages.Workspace.Packages.SocialModalsCommon).EnumScreens
local GetContactImporterParams = require(CorePackages.Workspace.Packages.ContactImporter).Utils.getContactImporterParams
local OpenAmpWizardContainerFunction = require(CorePackages.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer

return function()
	-- upvalues: UseSelectorFunction (copy), GetContactImporterParams (copy), UseDispatchFunction (copy), SetCurrentToastMessageModule (copy), OpenContactImporterLearnMoreLinkModule (copy), OpenProfilePeekViewModule (copy), OpenAmpWizardContainerFunction (copy), UseNavigationFunction (copy), UseRoactServiceModule (copy), AppEventIngestServiceModule (copy), RoactAnalyticsModule (copy), EnumScreens (copy)
	local UseSelectorResult = UseSelectorFunction(GetContactImporterParams)
	local IsDiscoverabilityUnset = UseSelectorResult.isDiscoverabilityUnset
	local IsPhoneVerified = UseSelectorResult.isPhoneVerified
	local UseDispatchResult = UseDispatchFunction()
	
	local function ShowToast(ToastMessage)
		-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageModule (upval)
		UseDispatchResult(SetCurrentToastMessageModule({ toastMessage = ToastMessage }))
	end
	
	local function OpenLearnMoreLink()
		-- upvalues: UseDispatchResult (copy), OpenContactImporterLearnMoreLinkModule (upval)
		UseDispatchResult(OpenContactImporterLearnMoreLinkModule())
	end
	
	local function OpenProfilePeekView(p1, p2)
		-- upvalues: UseDispatchResult (copy), OpenProfilePeekViewModule (upval)
		UseDispatchResult(OpenProfilePeekViewModule(p1, p2))
	end
	
	local function OpenAmpUpsell(p1, p2)
		-- upvalues: UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval)
		UseDispatchResult(OpenAmpWizardContainerFunction(p1, p2))
	end
	
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AppEventIngestServiceModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactAnalyticsModule)
	
	return function()
		-- upvalues: UseNavigationResult (copy), EnumScreens (upval), ShowToast (copy), OpenLearnMoreLink (copy), UseRoactServiceModuleResult1 (copy), UseRoactServiceModuleResult (copy), IsDiscoverabilityUnset (copy), IsPhoneVerified (copy), OpenProfilePeekView (copy), OpenAmpUpsell (copy)
		UseNavigationResult.navigate(EnumScreens.ContactImporter, {
			isFromAddFriendsPage = false,
			showToast = ShowToast,
			openLearnMoreLink = OpenLearnMoreLink,
			diagService = if UseRoactServiceModuleResult1 then UseRoactServiceModuleResult1.Diag else nil,
			eventIngestService = UseRoactServiceModuleResult,
			closeModal = UseNavigationResult.pop,
			isDiscoverabilityUnset = IsDiscoverabilityUnset,
			isPhoneVerified = IsPhoneVerified,
			openProfilePeekView = OpenProfilePeekView,
			openAmpUpsell = OpenAmpUpsell
		})
	end
end