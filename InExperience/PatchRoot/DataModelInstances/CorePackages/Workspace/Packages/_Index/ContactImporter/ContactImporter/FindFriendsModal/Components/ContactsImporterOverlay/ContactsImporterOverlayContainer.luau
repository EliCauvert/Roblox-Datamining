local parent = script.Parent.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local _ = parent.Parent
local textKeysModule = require(parent.Common.TextKeys)
local contactImporterModalInfoUpdaterModule = require(parent.Utils.contactImporterModalInfoUpdater)
local updateOptedInUsers = dependenciesModule.SocialModalsCommon.Utils.updateOptedInUsers
local enumScreens = dependenciesModule.SocialModalsCommon.EnumScreens
local constantsModule = require(parent.Common.Constants)
local analyticsModule = require(parent.Analytics)
local roact = dependenciesModule.Roact
local roactRodux = dependenciesModule.RoactRodux
local permissionsProtocol = dependenciesModule.PermissionsProtocol
local promise = dependenciesModule.Promise
local contactsImporterOverlayModule = require(script.Parent.ContactsImporterOverlay)
local mapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local selectors = dependenciesModule.RoduxContacts.Selectors
local appStorageService = dependenciesModule.AppStorageService
local discoverabilityAnalytics = dependenciesModule.DiscoverabilityAnalytics
local contactsImporterOverlayContainer = roact.PureComponent:extend("ContactsImporterOverlayContainer")
contactsImporterOverlayContainer.defaultProps = {
	localUserId = "",
	handleShowToastForTests = nil,
	checkOrRequestPermissions = function(p0)
		-- upvalues: permissionsProtocol (ref)
		return permissionsProtocol.default:checkOrRequestPermissions(p0)
	end
}

function contactsImporterOverlayContainer.init(p1)
	-- upvalues: constantsModule (ref), discoverabilityAnalytics (ref), analyticsModule (ref), permissionsProtocol (ref), textKeysModule (ref), updateOptedInUsers (ref), appStorageService (ref), enumScreens (ref), promise (ref)
	p1.isFromAddFriendsPage = p1.props.navigation.getParam(constantsModule.IS_FROM_ADD_FRIENDS_PAGE, false)
	p1.entryPoint = if p1.isFromAddFriendsPage then discoverabilityAnalytics.EntryPoints.AddFriends else discoverabilityAnalytics.EntryPoints.HomePage
	p1.fireAnalyticsEvent = analyticsModule.setupFireAnalyticsEvents({
		analytics = analyticsModule.AnalyticsService,
		defaultAnalyticsInfo = { entry = p1.entryPoint }
	})
	local param = p1.props.navigation.getParam(constantsModule.OPEN_AMP_UPSELL)
	
	function p1.checkOrRequestContactsPermissions()
		-- upvalues: p1 (ref), permissionsProtocol (copy)
		return p1.props.checkOrRequestPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS })
	end
	
	function p1.failedToUpload(_)
		-- upvalues: p1 (ref), textKeysModule (copy)
		p1.props.showToast(textKeysModule.CI_FAILED)
	end
	
	function p1.closeModal()
		-- upvalues: p1 (ref)
		p1.props.navigation.pop()
	end
	
	function p1.permissionsFlowToContactImporter()
		-- upvalues: p1 (ref), constantsModule (copy), permissionsProtocol (copy), updateOptedInUsers (copy), appStorageService (copy), enumScreens (copy), param (ref), promise (copy)
		local props = p1.props
		local navigation = props.navigation
		local param_1 = navigation.getParam(constantsModule.IS_FROM_SIGNUP)
		p1.checkOrRequestContactsPermissions():andThen(function(p2)
			-- upvalues: permissionsProtocol (copy), updateOptedInUsers (copy), appStorageService (copy), props (ref), param_1 (ref), navigation (ref), enumScreens (copy), constantsModule (copy), param (copy), p1 (copy), promise (copy)
			if p2 == permissionsProtocol.Status.AUTHORIZED then
				updateOptedInUsers:addUserToLocalStorage(appStorageService, props.localUserId)
				
				if param_1 then
					props.updateUserSettings()
					props.navigation.pop()
				else
					props.hideContactImporterModal()
					navigation.replace(enumScreens.ContactsList, {
						[constantsModule.SHOULD_UPDATE_USER_SETTINGS] = true,
						[constantsModule.IS_PHONE_VERIFIED] = navigation.getParam(constantsModule.IS_PHONE_VERIFIED),
						[constantsModule.OPEN_LEARN_MORE_LINK] = navigation.getParam(constantsModule.OPEN_LEARN_MORE_LINK),
						openAmpUpsell = param,
						entryPoint = p1.entryPoint
					})
				end
				return promise.resolve()
			elseif p2 == permissionsProtocol.Status.DENIED then
				navigation.replace(enumScreens.ContactsRevokedAccessDialog, {
					screenSize = props.screenSize,
					closeModal = p1.closeModal
				})
				
				return promise.resolve()
			end
			return promise.reject()
		end):catch(p1.failedToUpload)
	end
	
	function p1.checkDiscoverability(p3)
		-- upvalues: p1 (ref), constantsModule (copy)
		return p3 and p1.props.navigation.getParam(constantsModule.IS_PHONE_VERIFIED)
	end
	
	function p1.onConnectContacts()
		-- upvalues: p1 (ref), analyticsModule (copy)
		local isDiscoverabilityUnset = p1.props.navigation.getParam("isDiscoverabilityUnset")
		p1.fireAnalyticsEvent(analyticsModule.EventNames.ContactImportModalContinue)
		
		if p1.checkDiscoverability(isDiscoverabilityUnset) then
			p1.navigateToDiscoverabilityModal()
			
			return
		end
		p1.permissionsFlowToContactImporter()
	end
	
	function p1.navigateToDiscoverabilityModal()
		-- upvalues: p1 (ref), enumScreens (copy)
		local props = p1.props
		local navigation = props.navigation
		props.getUserSettingsMetadata():andThen(function()
			-- upvalues: navigation (ref), enumScreens (copy), p1 (copy)
			navigation.replace(enumScreens.DiscoverabilityOverlay, { entryPoint = p1.entryPoint })
		end)
	end
	
	function p1.onAddFriendsActivated()
		-- upvalues: p1 (ref), analyticsModule (copy), enumScreens (copy)
		local props = p1.props
		p1.fireAnalyticsEvent(analyticsModule.EventNames.ContactImportModalAddFriends)
		props.navigation.replace(enumScreens.AddFriendsPage)
	end
	
	function p1.onCloseClicked()
		-- upvalues: p1 (ref), analyticsModule (copy)
		local props = p1.props
		p1.fireAnalyticsEvent(analyticsModule.EventNames.ContactImportModalClose)
		props.navigation.pop()
	end
	
	function p1.onLearnMoreClick()
		-- upvalues: p1 (ref)
		p1.props.openLearnMoreLink()
	end
end

function contactsImporterOverlayContainer.didMount(p4)
	-- upvalues: analyticsModule (ref), contactImporterModalInfoUpdaterModule (ref), appStorageService (ref)
	p4.fireAnalyticsEvent(analyticsModule.EventNames.ContactImportModalPageLoad)
	contactImporterModalInfoUpdaterModule:addSeenCount(appStorageService, p4.props.localUserId)
	contactImporterModalInfoUpdaterModule:updateTimestamp(appStorageService, p4.props.localUserId, DateTime.now().UnixTimestampMillis)
end

function contactsImporterOverlayContainer.render(p5)
	-- upvalues: constantsModule (ref), roact (ref), contactsImporterOverlayModule (ref)
	local props = p5.props
	local navigation = props.navigation
	
	return roact.createElement(contactsImporterOverlayModule, {
		screenSize = props.screenSize,
		onCloseClicked = p5.onCloseClicked,
		onAddFriendsActivated = p5.onAddFriendsActivated,
		onConnectContacts = p5.onConnectContacts,
		onLearnMoreClick = p5.onLearnMoreClick,
		isFromAddFriendsPage = navigation.getParam(constantsModule.IS_FROM_ADD_FRIENDS_PAGE, false),
		isFromSignup = if navigation.getParam(constantsModule.IS_FROM_SOCIAL_ONBOARDING_BUTTONS) then true else p5.props.navigation.getParam(constantsModule.IS_FROM_SIGNUP)
	})
end

return roactRodux.connect(function(p6)
	-- upvalues: selectors (ref)
	return {
		contacts = selectors.sortContacts(p6),
		localUserId = p6.LocalUserId,
		screenSize = p6.ScreenSize
	}
end, mapDispatchToPropsModule)(contactsImporterOverlayContainer)