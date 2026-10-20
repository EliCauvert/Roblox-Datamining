local Parent = script.Parent.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local _ = Parent.Parent
local TextKeysModule = require(Parent.Common.TextKeys)
local ContactImporterModalInfoUpdaterModule = require(Parent.Utils.contactImporterModalInfoUpdater)
local UpdateOptedInUsers = DependenciesModule.SocialModalsCommon.Utils.updateOptedInUsers
local EnumScreens = DependenciesModule.SocialModalsCommon.EnumScreens
local ConstantsModule = require(Parent.Common.Constants)
local AnalyticsModule = require(Parent.Analytics)
local Roact = DependenciesModule.Roact
local RoactRodux = DependenciesModule.RoactRodux
local PermissionsProtocol = DependenciesModule.PermissionsProtocol
local Promise = DependenciesModule.Promise
local ContactsImporterOverlayModule = require(script.Parent.ContactsImporterOverlay)
local MapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local Selectors = DependenciesModule.RoduxContacts.Selectors
local AppStorageService = DependenciesModule.AppStorageService
local DiscoverabilityAnalytics = DependenciesModule.DiscoverabilityAnalytics
local ContactsImporterOverlayContainer = Roact.PureComponent:extend("ContactsImporterOverlayContainer")
ContactsImporterOverlayContainer.defaultProps = {
	localUserId = "",
	handleShowToastForTests = nil,
	checkOrRequestPermissions = function(p1)
		-- upvalues: PermissionsProtocol (copy)
		return PermissionsProtocol.default:checkOrRequestPermissions(p1)
	end
}

function ContactsImporterOverlayContainer.init(p1)
	-- upvalues: ConstantsModule (copy), DiscoverabilityAnalytics (copy), AnalyticsModule (copy), PermissionsProtocol (copy), TextKeysModule (copy), UpdateOptedInUsers (copy), AppStorageService (copy), EnumScreens (copy), Promise (copy)
	p1.isFromAddFriendsPage = p1.props.navigation.getParam(ConstantsModule.IS_FROM_ADD_FRIENDS_PAGE, false)
	p1.entryPoint = if p1.isFromAddFriendsPage then DiscoverabilityAnalytics.EntryPoints.AddFriends else DiscoverabilityAnalytics.EntryPoints.HomePage
	p1.fireAnalyticsEvent = AnalyticsModule.setupFireAnalyticsEvents({
		analytics = AnalyticsModule.AnalyticsService,
		defaultAnalyticsInfo = { entry = p1.entryPoint }
	})
	local Param = p1.props.navigation.getParam(ConstantsModule.OPEN_AMP_UPSELL)
	
	function p1.checkOrRequestContactsPermissions()
		-- upvalues: p1 (copy), PermissionsProtocol (upval)
		return p1.props.checkOrRequestPermissions({ PermissionsProtocol.Permissions.CONTACTS_ACCESS })
	end
	
	function p1:failedToUpload()
		-- upvalues: p1 (copy), TextKeysModule (upval)
		p1.props.showToast(TextKeysModule.CI_FAILED)
	end
	
	function p1.closeModal()
		-- upvalues: p1 (copy)
		p1.props.navigation.pop()
	end
	
	function p1.permissionsFlowToContactImporter()
		-- upvalues: p1 (copy), ConstantsModule (upval), PermissionsProtocol (upval), UpdateOptedInUsers (upval), AppStorageService (upval), EnumScreens (upval), Param (copy), Promise (upval)
		local Props = p1.props
		local Navigation = Props.navigation
		local Param1 = Navigation.getParam(ConstantsModule.IS_FROM_SIGNUP)
		p1.checkOrRequestContactsPermissions():andThen(function(Result)
			-- upvalues: PermissionsProtocol (upval), UpdateOptedInUsers (upval), AppStorageService (upval), Props (copy), Param1 (copy), Navigation (copy), EnumScreens (upval), ConstantsModule (upval), Param (upval), p1 (upval), Promise (upval)
			if Result == PermissionsProtocol.Status.AUTHORIZED then
				UpdateOptedInUsers:addUserToLocalStorage(AppStorageService, Props.localUserId)
				
				if Param1 then
					Props.updateUserSettings()
					Props.navigation.pop()
				else
					Props.hideContactImporterModal()
					Navigation.replace(EnumScreens.ContactsList, {
						[ConstantsModule.SHOULD_UPDATE_USER_SETTINGS] = true,
						[ConstantsModule.IS_PHONE_VERIFIED] = Navigation.getParam(ConstantsModule.IS_PHONE_VERIFIED),
						[ConstantsModule.OPEN_LEARN_MORE_LINK] = Navigation.getParam(ConstantsModule.OPEN_LEARN_MORE_LINK),
						openAmpUpsell = Param,
						entryPoint = p1.entryPoint
					})
				end
				return Promise.resolve()
			elseif Result == PermissionsProtocol.Status.DENIED then
				Navigation.replace(EnumScreens.ContactsRevokedAccessDialog, {
					screenSize = Props.screenSize,
					closeModal = p1.closeModal
				})
				
				return Promise.resolve()
			else
				return Promise.reject()
			end
		end):catch(p1.failedToUpload)
	end
	
	function p1.checkDiscoverability(IsDiscoverabilityUnsetParam)
		-- upvalues: p1 (copy), ConstantsModule (upval)
		local Param = p1.props.navigation.getParam(ConstantsModule.IS_PHONE_VERIFIED)
		
		return IsDiscoverabilityUnsetParam and Param
	end
	
	function p1.onConnectContacts()
		-- upvalues: p1 (copy), AnalyticsModule (upval)
		local IsDiscoverabilityUnsetParam = p1.props.navigation.getParam("isDiscoverabilityUnset")
		p1.fireAnalyticsEvent(AnalyticsModule.EventNames.ContactImportModalContinue)
		
		if p1.checkDiscoverability(IsDiscoverabilityUnsetParam) then
			p1.navigateToDiscoverabilityModal()
			
			return
		else
			p1.permissionsFlowToContactImporter()
		end
	end
	
	function p1.navigateToDiscoverabilityModal()
		-- upvalues: p1 (copy), EnumScreens (upval)
		local Props = p1.props
		local Navigation = Props.navigation
		Props.getUserSettingsMetadata():andThen(function()
			-- upvalues: Navigation (copy), EnumScreens (upval), p1 (upval)
			Navigation.replace(EnumScreens.DiscoverabilityOverlay, { entryPoint = p1.entryPoint })
		end)
	end
	
	function p1.onAddFriendsActivated()
		-- upvalues: p1 (copy), AnalyticsModule (upval), EnumScreens (upval)
		local Props = p1.props
		p1.fireAnalyticsEvent(AnalyticsModule.EventNames.ContactImportModalAddFriends)
		Props.navigation.replace(EnumScreens.AddFriendsPage)
	end
	
	function p1.onCloseClicked()
		-- upvalues: p1 (copy), AnalyticsModule (upval)
		local Props = p1.props
		p1.fireAnalyticsEvent(AnalyticsModule.EventNames.ContactImportModalClose)
		Props.navigation.pop()
	end
	
	function p1.onLearnMoreClick()
		-- upvalues: p1 (copy)
		p1.props.openLearnMoreLink()
	end
end

function ContactsImporterOverlayContainer.didMount(p1)
	-- upvalues: AnalyticsModule (copy), ContactImporterModalInfoUpdaterModule (copy), AppStorageService (copy)
	p1.fireAnalyticsEvent(AnalyticsModule.EventNames.ContactImportModalPageLoad)
	ContactImporterModalInfoUpdaterModule:addSeenCount(AppStorageService, p1.props.localUserId)
	ContactImporterModalInfoUpdaterModule:updateTimestamp(AppStorageService, p1.props.localUserId, DateTime.now().UnixTimestampMillis)
end

function ContactsImporterOverlayContainer.render(p1)
	-- upvalues: ConstantsModule (copy), Roact (copy), ContactsImporterOverlayModule (copy)
	local Props = p1.props
	local Navigation = Props.navigation
	local Param = p1.props.navigation.getParam(ConstantsModule.IS_FROM_SIGNUP)
	
	return Roact.createElement(ContactsImporterOverlayModule, {
		screenSize = Props.screenSize,
		onCloseClicked = p1.onCloseClicked,
		onAddFriendsActivated = p1.onAddFriendsActivated,
		onConnectContacts = p1.onConnectContacts,
		onLearnMoreClick = p1.onLearnMoreClick,
		isFromAddFriendsPage = Navigation.getParam(ConstantsModule.IS_FROM_ADD_FRIENDS_PAGE, false),
		isFromSignup = if Navigation.getParam(ConstantsModule.IS_FROM_SOCIAL_ONBOARDING_BUTTONS) then true else Param
	})
end

return RoactRodux.connect(function(p1)
	-- upvalues: Selectors (copy)
	return {
		contacts = Selectors.sortContacts(p1),
		localUserId = p1.LocalUserId,
		screenSize = p1.ScreenSize
	}
end, MapDispatchToPropsModule)(ContactsImporterOverlayContainer)