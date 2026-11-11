local ContactsToast = script:FindFirstAncestor("ContactsToast")
local AppStorageService = game:GetService("AppStorageService")
local Parent = ContactsToast.Parent
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local UseLocalUserIdFunction = RobloxAppHooksModule.useLocalUserId
local UseScreenSizeFunction = RobloxAppHooksModule.useScreenSize
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local PermissionsProtocol = require(Parent.PermissionsProtocol).PermissionsProtocol
local SocialModalsCommonModule = require(Parent.SocialModalsCommon)
local EnumScreens = SocialModalsCommonModule.EnumScreens
local UpdateOptedInUsers = SocialModalsCommonModule.Utils.updateOptedInUsers
local UpdateContactImporterModalLogicFunction = SocialModalsCommonModule.Actions.UpdateContactImporterModalLogic
local SetTimeoutFunction = require(Parent.LuauPolyfill).setTimeout
local UIBloxModule = require(Parent.UIBlox)
local Toast = UIBloxModule.App.Dialog.Toast
local IconSize = UIBloxModule.App.Constant.IconSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local GetFFlagContactsToastEnabledFunction = require(Parent.SharedFlags).GetFFlagContactsToastEnabled
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local ConstantsModule = require(ContactsToast.Common.Constants)
local LocalStorageContactsToastModule = require(ContactsToast.Utils.localStorageContactsToast)
local ConfigureRoduxUsersModule = require(ContactsToast.Networking.configureRoduxUsers)
local ContactsToastIXPModule = require(ContactsToast.Experiments.ContactsToastIXP)
local AnalyticsFunction = require(ContactsToast.Analytics).Analytics
local EventNamesModule = require(ContactsToast.Analytics.EventNames)
local Platform = game:GetService("UserInputService"):GetPlatform()
local ContactsToastAccountAgeThresholdInDays = game:DefineFastInt("ContactsToastAccountAgeThresholdInDays", 7)
local IconsGraphicConnectcontactsLarge = UIBloxModule.App.ImageSet.Images["icons/graphic/connectcontacts_large"]
local _Vector2 = Vector2.new(IconSize.Large, IconSize.Large)

return function(p1)
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), AnalyticsFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ContactsToastIXPModule (copy), UseSelectorFunction (copy), UseScreenSizeFunction (copy), UseLocalUserIdFunction (copy), GetFFlagContactsToastEnabledFunction (copy), GetDeepValueFunction (copy), PermissionsProtocol (copy), SetCurrentToastMessageFunction (copy), CryoModule (copy), EventNamesModule (copy), UpdateContactImporterModalLogicFunction (copy), Platform (copy), UpdateOptedInUsers (copy), AppStorageService (copy), EnumScreens (copy), PromiseModule (copy), Toast (copy), IconsGraphicConnectcontactsLarge (copy), _Vector2 (copy), ConfigureRoduxUsersModule (copy), ContactsToastAccountAgeThresholdInDays (copy), LocalStorageContactsToastModule (copy), ExperienceService (copy), SetTimeoutFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseDispatchResult = UseDispatchFunction()
	local AnalyticsResult = AnalyticsFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		title = ConstantsModule.Translations.title,
		subtitle = ConstantsModule.Translations.subtitle,
		button = ConstantsModule.Translations.button,
		buttonV2 = ConstantsModule.Translations.buttonV2
	})
	local UseContactsToastVariantResult = ContactsToastIXPModule.useContactsToastVariant()
	local UseSelectorResult = UseSelectorFunction(p1.getContactImporterParams)
	local IsDiscoverabilityUnset = UseSelectorResult.isDiscoverabilityUnset
	local IsPhoneVerified = UseSelectorResult.isPhoneVerified
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.IsLocalUserUnder13
	end)
	local UseSelectorResult11 = UseSelectorFunction(function(p2)
		-- upvalues: GetFFlagContactsToastEnabledFunction (upval), UseContactsToastVariantResult (copy), GetDeepValueFunction (upval), ConstantsModule (upval), UseLocalUserIdResult (copy)
		return if GetFFlagContactsToastEnabledFunction() or UseContactsToastVariantResult then GetDeepValueFunction(p2, `{ConstantsModule.RODUX_KEY}.Users.byUserId.{UseLocalUserIdResult}`) else {}
	end)
	local Default = PermissionsProtocol.default
	
	local function ShowToast(ToastMessage)
		-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageFunction (upval)
		UseDispatchResult(SetCurrentToastMessageFunction({ toastMessage = ToastMessage }))
	end
	
	local function OpenLearnMoreLink()
		-- upvalues: UseDispatchResult (copy), p1 (copy)
		UseDispatchResult(p1.openContactImporterLearnMoreLink())
	end
	
	local function OpenProfilePeekView(p2, p3)
		-- upvalues: UseDispatchResult (copy), p1 (copy)
		UseDispatchResult(p1.openProfilePeekView(p2, p3))
	end
	
	local function OpenAmpUpsell(p2, p3)
		-- upvalues: UseDispatchResult (copy), p1 (copy)
		UseDispatchResult(p1.openAmpWizardContainer(p2, p3))
	end
	
	local function v42(Name, p2)
		-- upvalues: UseDispatchResult (copy), p1 (copy), CryoModule (upval)
		UseDispatchResult(p1.navigateToRoute({ CryoModule.Dictionary.join({ name = Name }, p2) }))
	end
	
	local function _()
		-- upvalues: Default (copy), PermissionsProtocol (upval)
		return Default:checkOrRequestPermissions({ PermissionsProtocol.Permissions.CONTACTS_ACCESS })
	end
	
	local _ = function()
		-- upvalues: p1 (copy), Default (copy), PermissionsProtocol (upval)
		return if p1.hasPermissions then p1.hasPermissions() else Default:hasPermissions({ PermissionsProtocol.Permissions.CONTACTS_ACCESS })
	end
	
	local _ = function()
		-- upvalues: UseDispatchResult (copy), UpdateContactImporterModalLogicFunction (upval)
		UseDispatchResult(UpdateContactImporterModalLogicFunction({
			hasOSPermissions = true,
			shouldShowContactImporterUpsellModal = false
		}))
	end
	
	local Element = ReactModule.createElement(Toast, {
		duration = 4,
		toastContent = {
			swipeUpDismiss = true,
			iconImage = IconsGraphicConnectcontactsLarge,
			toastTitle = UseLocalizationResult.title,
			toastSubtitle = UseLocalizationResult.subtitle,
			iconSize = _Vector2,
			onActivated = function()
				-- upvalues: Platform (upval), Default (copy), PermissionsProtocol (upval), UpdateOptedInUsers (upval), AppStorageService (upval), UseLocalUserIdResult (copy), UseDispatchResult (copy), UpdateContactImporterModalLogicFunction (upval), v42 (copy), EnumScreens (upval), ShowToast (copy), IsPhoneVerified (copy), OpenLearnMoreLink (copy), OpenAmpUpsell (copy), PromiseModule (upval), UseScreenSizeResult (copy), IsDiscoverabilityUnset (copy), OpenProfilePeekView (copy), UseStateResult2 (copy), AnalyticsResult (copy), EventNamesModule (upval), UseContactsToastVariantResult (copy)
				if Platform == Enum.Platform.IOS then
					Default:checkOrRequestPermissions({ PermissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(Result)
						-- upvalues: PermissionsProtocol (upval), UpdateOptedInUsers (upval), AppStorageService (upval), UseLocalUserIdResult (upval), UseDispatchResult (upval), UpdateContactImporterModalLogicFunction (upval), v42 (upval), EnumScreens (upval), ShowToast (upval), IsPhoneVerified (upval), OpenLearnMoreLink (upval), OpenAmpUpsell (upval), PromiseModule (upval), UseScreenSizeResult (upval)
						if Result == PermissionsProtocol.Status.AUTHORIZED then
							UpdateOptedInUsers:addUserToLocalStorage(AppStorageService, UseLocalUserIdResult)
							UseDispatchResult(UpdateContactImporterModalLogicFunction({
								hasOSPermissions = true,
								shouldShowContactImporterUpsellModal = false
							}))
							v42(EnumScreens.ContactsList, {
								shouldUpdateUserSettings = true,
								showToast = ShowToast,
								isPhoneVerified = IsPhoneVerified,
								openLearnMoreLink = OpenLearnMoreLink,
								openAmpUpsell = OpenAmpUpsell
							})
							
							return PromiseModule.resolve()
						elseif Result == PermissionsProtocol.Status.DENIED then
							v42(EnumScreens.ContactsRevokedAccessDialog, { screenSize = UseScreenSizeResult })
							
							return PromiseModule.resolve()
						else
							return PromiseModule.reject()
						end
					end)
				else
					v42(EnumScreens.ContactImporter, {
						isFromAddFriendsPage = false,
						showToast = ShowToast,
						openLearnMoreLink = OpenLearnMoreLink,
						isDiscoverabilityUnset = IsDiscoverabilityUnset,
						isPhoneVerified = IsPhoneVerified,
						openProfilePeekView = OpenProfilePeekView,
						openAmpUpsell = OpenAmpUpsell
					})
				end
				UseStateResult2(false)
				AnalyticsResult.fireAnalyticsEvent(EventNamesModule.ContactsToastButtonPressed, { variant = UseContactsToastVariantResult })
			end,
			onDismissed = function()
				-- upvalues: UseStateResult2 (copy), AnalyticsResult (copy), EventNamesModule (upval), UseContactsToastVariantResult (copy)
				UseStateResult2(false)
				AnalyticsResult.fireAnalyticsEvent(EventNamesModule.ContactsToastDismissed, { variant = UseContactsToastVariantResult })
			end,
			buttonText = if UseContactsToastVariantResult == ConstantsModule.Experiment.FIND_FRIENDS then UseLocalizationResult.button else UseLocalizationResult.buttonV2
		}
	})
	
	local _ = function()
		-- upvalues: UseLocalUserIdResult (copy), UseDispatchResult (copy), ConfigureRoduxUsersModule (upval)
		if UseLocalUserIdResult and string.len(UseLocalUserIdResult) > 0 and UseLocalUserIdResult ~= "0" then
			UseDispatchResult(ConfigureRoduxUsersModule.GetUserV2FromUserId.API(UseLocalUserIdResult))
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseLocalUserIdResult (copy), UseDispatchResult (copy), ConfigureRoduxUsersModule (upval)
		if UseLocalUserIdResult and string.len(UseLocalUserIdResult) > 0 and UseLocalUserIdResult ~= "0" then
			UseDispatchResult(ConfigureRoduxUsersModule.GetUserV2FromUserId.API(UseLocalUserIdResult))
		end
	end, { UseLocalUserIdResult })
	ReactModule.useEffect(function()
		-- upvalues: UseLocalUserIdResult (copy), UseSelectorResult11 (copy), ContactsToastAccountAgeThresholdInDays (upval), p1 (copy), UseSelectorResult1 (copy), LocalStorageContactsToastModule (upval), Default (copy), PermissionsProtocol (upval), ExperienceService (upval), SetTimeoutFunction (upval), UseStateResult2 (copy), AnalyticsResult (copy), EventNamesModule (upval), UseContactsToastVariantResult (copy)
		if UseLocalUserIdResult and string.len(UseLocalUserIdResult) > 0 and UseSelectorResult11 and UseSelectorResult11.created then
			local DDD, DDD2, DDD3 = UseSelectorResult11.created:match("(%d+)-(%d+)-(%d+)")
			
			if math.floor((os.time() - os.time({ year = DDD, month = DDD2, day = DDD3 })) / 86400) <= ContactsToastAccountAgeThresholdInDays and p1.isContactsToastPolicyEnabled and not UseSelectorResult1 and LocalStorageContactsToastModule:CheckUserHasNotSeen(UseLocalUserIdResult) then
				(if p1.hasPermissions then p1.hasPermissions() else Default:hasPermissions({ PermissionsProtocol.Permissions.CONTACTS_ACCESS })):andThen(function(Result)
					-- upvalues: PermissionsProtocol (upval), LocalStorageContactsToastModule (upval), UseLocalUserIdResult (upval), ExperienceService (upval), SetTimeoutFunction (upval), UseStateResult2 (upval), AnalyticsResult (upval), EventNamesModule (upval), UseContactsToastVariantResult (upval)
					if Result.status == PermissionsProtocol.Status.DENIED and Result.missingPermissions[1] == PermissionsProtocol.Permissions.CONTACTS_ACCESS or Result.status ~= PermissionsProtocol.Status.DENIED and LocalStorageContactsToastModule:CheckUserHasNotOptedIn(UseLocalUserIdResult) then
						ExperienceService:RegisterForExperienceLeave(function()
							-- upvalues: LocalStorageContactsToastModule (upval), UseLocalUserIdResult (upval), SetTimeoutFunction (upval), UseStateResult2 (upval), AnalyticsResult (upval), EventNamesModule (upval), UseContactsToastVariantResult (upval)
							if LocalStorageContactsToastModule:CheckUserHasNotSeen(UseLocalUserIdResult) then
								SetTimeoutFunction(function()
									-- upvalues: UseStateResult2 (upval), LocalStorageContactsToastModule (upval), UseLocalUserIdResult (upval), AnalyticsResult (upval), EventNamesModule (upval), UseContactsToastVariantResult (upval)
									UseStateResult2(true)
									LocalStorageContactsToastModule:AddUser(UseLocalUserIdResult)
									AnalyticsResult.fireAnalyticsEvent(EventNamesModule.ContactsToastSeen, { variant = UseContactsToastVariantResult })
								end, 1000)
							end
						end)
					end
				end)
			end
		end
	end, {
		UseLocalUserIdResult,
		p1.isContactsToastPolicyEnabled,
		UseSelectorResult1,
		UseSelectorResult11
	})
	
	if p1.isContactsToastPolicyEnabled and not UseSelectorResult1 and UseStateResult or p1.testOverride then
		return (ReactModule.createElement("ScreenGui", { DisplayOrder = 13 }, {
			ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -20),
				Position = UDim2.new(0, 0, 0, 20)
			}, Element)
		}))
	else
		return nil
	end
end