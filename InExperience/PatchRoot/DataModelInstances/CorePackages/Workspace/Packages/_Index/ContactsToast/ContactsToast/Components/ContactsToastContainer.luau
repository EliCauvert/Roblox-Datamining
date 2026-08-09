local contactsToast = script:FindFirstAncestor("ContactsToast")
local userInputService = game:GetService("UserInputService")
local appStorageService = game:GetService("AppStorageService")
local parent = contactsToast.Parent
local experienceServiceModule = require(parent.ExperienceService)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local useScreenSize = robloxAppHooksModule.useScreenSize
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local socialModalsCommonModule = require(parent.SocialModalsCommon)
local enumScreens = socialModalsCommonModule.EnumScreens
local updateOptedInUsers = socialModalsCommonModule.Utils.updateOptedInUsers
local updateContactImporterModalLogic = socialModalsCommonModule.Actions.UpdateContactImporterModalLogic
local setTimeout = require(parent.LuauPolyfill).setTimeout
local UIBloxModule = require(parent.UIBlox)
local toast = UIBloxModule.App.Dialog.Toast
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.Constant.IconSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local getFFlagContactsToastEnabled = require(parent.SharedFlags).GetFFlagContactsToastEnabled
local experienceService = experienceServiceModule.ExperienceService
local constantsModule = require(contactsToast.Common.Constants)
local localStorageContactsToastModule = require(contactsToast.Utils.localStorageContactsToast)
local configureRoduxUsersModule = require(contactsToast.Networking.configureRoduxUsers)
local contactsToastIXPModule = require(contactsToast.Experiments.ContactsToastIXP)
local analytics = require(contactsToast.Analytics).Analytics
local eventNamesModule = require(contactsToast.Analytics.EventNames)
local platform = userInputService:GetPlatform()
local contactsToastAccountAgeThresholdInDays = game:DefineFastInt("ContactsToastAccountAgeThresholdInDays", 7)
local connectcontactsLarge = images["icons/graphic/connectcontacts_large"]
local vector2 = Vector2.new(iconSize.Large, iconSize.Large)

return function(p0) --[[ line: 63 ]]
	-- upvalues: reactModule (ref), useDispatch (ref), analytics (ref), useLocalization (ref), constantsModule (ref), contactsToastIXPModule (ref), useSelector (ref), useScreenSize (ref), useLocalUserId (ref), getFFlagContactsToastEnabled (ref), getDeepValue (ref), permissionsProtocol (ref), setCurrentToastMessage (ref), cryoModule (ref), eventNamesModule (ref), updateContactImporterModalLogic (ref), platform (ref), updateOptedInUsers (ref), appStorageService (ref), enumScreens (ref), promiseModule (ref), toast (ref), connectcontactsLarge (ref), vector2 (ref), configureRoduxUsersModule (ref), contactsToastAccountAgeThresholdInDays (ref), localStorageContactsToastModule (ref), experienceService (ref), setTimeout (ref)
	local var18, var19 = reactModule.useState(false)
	local var20 = useDispatch()
	local var21 = analytics()
	local var22 = useLocalization({
		title = constantsModule.Translations.title,
		subtitle = constantsModule.Translations.subtitle,
		button = constantsModule.Translations.button,
		buttonV2 = constantsModule.Translations.buttonV2
	})
	local var23 = contactsToastIXPModule.useContactsToastVariant()
	local var24 = useSelector(p0.getContactImporterParams)
	local isDiscoverabilityUnset = var24.isDiscoverabilityUnset
	local isPhoneVerified = var24.isPhoneVerified
	local var25 = useScreenSize()
	local var26 = useLocalUserId()
	local var27 = useSelector(function(p1) --[[ line: 80 ]]
		return p1.IsLocalUserUnder13
	end)
	local var28 = useSelector(function(p2) --[[ line: 84 ]]
		-- upvalues: getFFlagContactsToastEnabled (copy), var23 (ref), getDeepValue (copy), constantsModule (copy), var26 (ref)
		return if getFFlagContactsToastEnabled() or var23 then getDeepValue(p2, `{constantsModule.RODUX_KEY}.Users.byUserId.{var26}`) else {}
	end)
	local default = permissionsProtocol.default
	
	local var29 = function(p3) --[[ line: 92 ]]
		-- upvalues: var20 (ref), setCurrentToastMessage (copy)
		var20(setCurrentToastMessage({ toastMessage = p3 }))
	end
	
	local var30 = function() --[[ line: 97 ]]
		-- upvalues: var20 (ref), p0 (ref)
		var20(p0.openContactImporterLearnMoreLink())
	end
	
	local var31 = function(p4, p5) --[[ line: 100 ]]
		-- upvalues: var20 (ref), p0 (ref)
		var20(p0.openProfilePeekView(p4, p5))
	end
	
	local var32 = function(p6, p7) --[[ line: 104 ]]
		-- upvalues: var20 (ref), p0 (ref)
		var20(p0.openAmpWizardContainer(p6, p7))
	end
	
	local var33 = function(p8, p9) --[[ line: 108 ]]
		-- upvalues: var20 (ref), p0 (ref), cryoModule (copy)
		var20(p0.navigateToRoute({ cryoModule.Dictionary.join({ name = p8 }, p9) }))
	end
	
	local _ = function() --[[ line: 112 ]]
		-- upvalues: default (ref), permissionsProtocol (copy)
		return default:checkOrRequestPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS })
	end
	
	local _ = function() --[[ line: 118 ]]
		-- upvalues: p0 (ref), default (ref), permissionsProtocol (copy)
		return if p0.hasPermissions then p0.hasPermissions() else default:hasPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS })
	end
	
	local _ = function() --[[ line: 131 ]]
		-- upvalues: var20 (ref), updateContactImporterModalLogic (copy)
		var20(updateContactImporterModalLogic({
			hasOSPermissions = true,
			shouldShowContactImporterUpsellModal = false
		}))
	end
	
	local var34 = reactModule.createElement(toast, {
		duration = 4,
		toastContent = {
			swipeUpDismiss = true,
			iconImage = connectcontactsLarge,
			toastTitle = var22.title,
			toastSubtitle = var22.subtitle,
			iconSize = vector2,
			onActivated = function() --[[ line: 138 ]]
				-- upvalues: platform (copy), default (ref), permissionsProtocol (copy), updateOptedInUsers (copy), appStorageService (copy), var26 (ref), var20 (ref), updateContactImporterModalLogic (copy), var33 (ref), enumScreens (copy), var29 (ref), isPhoneVerified (ref), var30 (ref), var32 (ref), promiseModule (copy), var25 (ref), isDiscoverabilityUnset (ref), var31 (ref), var19 (ref), var21 (ref), eventNamesModule (copy), var23 (ref)
				if platform == Enum.Platform.IOS then
					default:checkOrRequestPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(p10) --[[ line: 140 ]]
						-- upvalues: permissionsProtocol (copy), updateOptedInUsers (copy), appStorageService (copy), var26 (copy), var20 (copy), updateContactImporterModalLogic (copy), var33 (copy), enumScreens (copy), var29 (copy), isPhoneVerified (copy), var30 (copy), var32 (copy), promiseModule (copy), var25 (copy)
						if p10 == permissionsProtocol.Status.AUTHORIZED then
							updateOptedInUsers:addUserToLocalStorage(appStorageService, var26)
							var20(updateContactImporterModalLogic({
								hasOSPermissions = true,
								shouldShowContactImporterUpsellModal = false
							}))
							var33(enumScreens.ContactsList, {
								shouldUpdateUserSettings = true,
								showToast = var29,
								isPhoneVerified = isPhoneVerified,
								openLearnMoreLink = var30,
								openAmpUpsell = var32
							})
							
							return promiseModule.resolve()
						elseif p10 == permissionsProtocol.Status.DENIED then
							var33(enumScreens.ContactsRevokedAccessDialog, { screenSize = var25 })
							
							return promiseModule.resolve()
						end
						return promiseModule.reject()
					end)
				else
					var33(enumScreens.ContactImporter, {
						isFromAddFriendsPage = false,
						showToast = var29,
						openLearnMoreLink = var30,
						isDiscoverabilityUnset = isDiscoverabilityUnset,
						isPhoneVerified = isPhoneVerified,
						openProfilePeekView = var31,
						openAmpUpsell = var32
					})
				end
				var19(false)
				var21.fireAnalyticsEvent(eventNamesModule.ContactsToastButtonPressed, { variant = var23 })
			end,
			onDismissed = function() --[[ line: 124 ]]
				-- upvalues: var19 (ref), var21 (ref), eventNamesModule (copy), var23 (ref)
				var19(false)
				var21.fireAnalyticsEvent(eventNamesModule.ContactsToastDismissed, { variant = var23 })
			end,
			buttonText = if var23 == constantsModule.Experiment.FIND_FRIENDS then var22.button else var22.buttonV2
		}
	})
	
	local _ = function() --[[ line: 194 ]]
		-- upvalues: var26 (ref), var20 (ref), configureRoduxUsersModule (copy)
		if var26 and string.len(var26) > 0 and var26 ~= "0" then
			var20(configureRoduxUsersModule.GetUserV2FromUserId.API(var26))
		end
	end
	
	reactModule.useEffect(function() --[[ line: 200 ]]
		-- upvalues: var26 (ref), var20 (ref), configureRoduxUsersModule (copy)
		if var26 and string.len(var26) > 0 and var26 ~= "0" then
			var20(configureRoduxUsersModule.GetUserV2FromUserId.API(var26))
		end
	end, { var26 })
	reactModule.useEffect(function() --[[ line: 204 ]]
		-- upvalues: var26 (ref), var28 (ref), contactsToastAccountAgeThresholdInDays (copy), p0 (ref), var27 (ref), localStorageContactsToastModule (copy), default (ref), permissionsProtocol (copy), experienceService (copy), setTimeout (copy), var19 (ref), var21 (ref), eventNamesModule (copy), var23 (ref)
		if var26 and string.len(var26) > 0 and (var28 and var28.created) then
			local var35, var36, var37 = var28.created:match("(%d+)-(%d+)-(%d+)")
			
			if math.floor((os.time() - os.time({ year = var35, month = var36, day = var37 })) / 86400) <= contactsToastAccountAgeThresholdInDays and p0.isContactsToastPolicyEnabled and (not var27 and localStorageContactsToastModule:CheckUserHasNotSeen(var26)) then
				(if p0.hasPermissions then p0.hasPermissions() else default:hasPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS })):andThen(function(p11) --[[ line: 215 ]]
					-- upvalues: permissionsProtocol (copy), localStorageContactsToastModule (copy), var26 (copy), experienceService (copy), setTimeout (copy), var19 (copy), var21 (copy), eventNamesModule (copy), var23 (copy)
					if p11.status == permissionsProtocol.Status.DENIED and p11.missingPermissions[1] == permissionsProtocol.Permissions.CONTACTS_ACCESS or p11.status ~= permissionsProtocol.Status.DENIED and localStorageContactsToastModule:CheckUserHasNotOptedIn(var26) then
						experienceService:RegisterForExperienceLeave(function() --[[ line: 224 ]]
							-- upvalues: localStorageContactsToastModule (copy), var26 (copy), setTimeout (copy), var19 (copy), var21 (copy), eventNamesModule (copy), var23 (copy)
							if localStorageContactsToastModule:CheckUserHasNotSeen(var26) then
								setTimeout(function() --[[ line: 227 ]]
									-- upvalues: var19 (copy), localStorageContactsToastModule (copy), var26 (copy), var21 (copy), eventNamesModule (copy), var23 (copy)
									var19(true)
									localStorageContactsToastModule:AddUser(var26)
									var21.fireAnalyticsEvent(eventNamesModule.ContactsToastSeen, { variant = var23 })
								end, 1000)
							end
						end)
					end
				end)
			end
		end
	end, { var26, p0.isContactsToastPolicyEnabled, var27, var28 })
	
	return if p0.isContactsToastPolicyEnabled and not var27 and var18 or p0.testOverride then reactModule.createElement("ScreenGui", { DisplayOrder = 13 }, {
		reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -20),
			Position = UDim2.new(0, 0, 0, 20)
		}, var34)
	}) else nil
end