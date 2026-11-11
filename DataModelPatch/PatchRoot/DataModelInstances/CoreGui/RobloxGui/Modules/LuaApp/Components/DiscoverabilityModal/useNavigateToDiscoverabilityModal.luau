local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local ReactModule = require(CorePackages.Packages.React)
local PromiseModule = require(CorePackages.Packages.Promise)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local OpenContactImporterLearnMoreLinkModule = require(Modules.LuaApp.Thunks.OpenContactImporterLearnMoreLink)
local Dependencies = require(CorePackages.Workspace.Packages.DiscoverabilityModal).dependencies
local GetContactImporterParams = require(CorePackages.Workspace.Packages.ContactImporter).Utils.getContactImporterParams
local EnumScreens = require(CorePackages.Workspace.Packages.SocialModalsCommon).EnumScreens

return function()
	-- upvalues: UseSelectorFunction (copy), GetContactImporterParams (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), SetCurrentToastMessageModule (copy), OpenContactImporterLearnMoreLinkModule (copy), Dependencies (copy), ReactModule (copy), PromiseModule (copy), EnumScreens (copy)
	local UseSelectorResult = UseSelectorFunction(GetContactImporterParams)
	local IsDiscoverabilityUnset = UseSelectorResult.isDiscoverabilityUnset
	local IsPhoneVerified = UseSelectorResult.isPhoneVerified
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	
	local function ShowToast(ToastMessage)
		-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageModule (upval)
		UseDispatchResult(SetCurrentToastMessageModule({ toastMessage = ToastMessage }))
	end
	
	local function OpenLearnMoreLink()
		-- upvalues: UseDispatchResult (copy), OpenContactImporterLearnMoreLinkModule (upval)
		UseDispatchResult(OpenContactImporterLearnMoreLinkModule())
	end
	
	local function _()
		-- upvalues: UseDispatchResult (copy), Dependencies (upval)
		return UseDispatchResult(Dependencies.NetworkingUserSettings.GetUserSettingsMetadata.API())
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), Dependencies (upval), PromiseModule (upval)
		UseDispatchResult(Dependencies.NetworkingUserSettings.GetUserSettingsMetadata.API()):catch(function()
			-- upvalues: PromiseModule (upval)
			PromiseModule.reject()
		end)
	end, {})
	
	return function(p1)
		-- upvalues: IsDiscoverabilityUnset (copy), IsPhoneVerified (copy), UseNavigationResult (copy), EnumScreens (upval), ShowToast (copy), OpenLearnMoreLink (copy)
		if IsDiscoverabilityUnset and IsPhoneVerified then
			UseNavigationResult.navigate(EnumScreens.DiscoverabilityOverlay, {
				showToast = ShowToast,
				openLearnMoreLink = OpenLearnMoreLink,
				isStandaloneDiscoverabilityModal = p1.isStandaloneDiscoverabilityModal,
				navigateOnActivated = p1.navigateOnActivated,
				entryPoint = p1.entryPoint
			})
			
			return
		else
			p1.navigateOnActivated()
		end
	end
end