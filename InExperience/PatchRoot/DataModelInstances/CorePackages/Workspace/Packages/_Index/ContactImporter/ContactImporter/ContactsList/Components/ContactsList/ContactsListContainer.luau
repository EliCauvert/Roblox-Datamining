local Parent = script.Parent.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Roact = DependenciesModule.Roact
local RoactRodux = DependenciesModule.RoactRodux
local _ = require(Parent.Common.LocalTypes)
local ConstantsModule = require(Parent.Common.Constants)
local Promise = DependenciesModule.Promise
local AnalyticsModule = require(Parent.Analytics)
local FieldNames = AnalyticsModule.FieldNames
local EventNames = AnalyticsModule.EventNames
local SetupFireAnalyticsEventsModule = require(Parent.Analytics.setupFireAnalyticsEvents)
local FormatContactsModule = require(Parent.Utils.formatContacts)
local Dash = DependenciesModule.Dash
local EnumScreens = DependenciesModule.SocialModalsCommon.EnumScreens
local AmpApiProvider = DependenciesModule.AmpUpsell.AmpApiProvider
local AccessResponseEnum = DependenciesModule.AmpUpsell.AmpEnums.AccessResponseEnum
local GetFFlagFindFriendsClickedEventEnabledModule = require(Parent.Flags.getFFlagFindFriendsClickedEventEnabled)
local ContactsListModule = require(script.Parent.ContactsList)
local ContactsListMapDispatchToPropsModule = require(script.Parent.ContactsListMapDispatchToProps)
local ContactsListMapStateToPropsModule = require(script.Parent.ContactsListMapStateToProps)
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local UploadContactsSourcesModule = require(Parent.Analytics.Enums.UploadContactsSources)
local GetFIntContactImporterUploadContactsMinModule = require(Parent.Flags.getFIntContactImporterUploadContactsMin)
local DiscoverabilityAnalytics = DependenciesModule.DiscoverabilityAnalytics
local ContactsListContainer = Roact.PureComponent:extend("ContactsListContainer")
ContactsListContainer.defaultProps = {
	contactsProtocol = DependenciesModule.ContactsProtocol.default
}

function ContactsListContainer.init(p1) --[[ Line: 68 ]]
	-- upvalues: SetupFireAnalyticsEventsModule (copy), AnalyticsModule (copy), GetDeepValueFunction (copy), AmpApiProvider (copy), Promise (copy), EventNames (copy), FieldNames (copy), FormatContactsModule (copy), UploadContactsSourcesModule (copy), GetFIntContactImporterUploadContactsMinModule (copy), ConstantsModule (copy), AccessResponseEnum (copy), EnumScreens (copy), DiscoverabilityAnalytics (copy), GetFFlagFindFriendsClickedEventEnabledModule (copy), Dash (copy)
	p1.entryPoint = p1.props.navigation.getParam("entryPoint")
	p1.fireAnalyticsEvent = SetupFireAnalyticsEventsModule({
		analytics = AnalyticsModule.AnalyticsService,
		defaultAnalyticsInfo = { entry = p1.entryPoint }
	})
	p1.state = {
		hasUploadError = false,
		isFetching = true,
		showMatchedContacts = false
	}
	
	function p1.getPropOrParam(OPENAMPUPSELL) --[[ Line: 85 ]]
		-- upvalues: p1 (copy), GetDeepValueFunction (upval)
		return if p1.props.navigation and p1.props.navigation.getParam(OPENAMPUPSELL) or p1.props.navigation then p1.props.navigation.getParam(OPENAMPUPSELL) else GetDeepValueFunction(p1.props, OPENAMPUPSELL)
	end
	
	p1.contactsCount = nil
	p1.numTotalNumbersOnDevice = nil
	p1.numTotalContactsOnDevice = nil
	p1.numContactsWithMultipleNumbers = nil
	p1.startTime = os.clock()
	p1.ampApiProvider = if p1.props.ampApiProvider == nil then AmpApiProvider else p1.props.ampApiProvider
	
	local function _(FailedStep) --[[ Line: 101 | Named "makeErrorFunction" ]]
		-- upvalues: Promise (upval), p1 (copy)
		return function(p2) --[[ Line: 102 ]]
			-- upvalues: Promise (upval), p1 (upval), FailedStep (copy)
			if type(p2) == "table" and p2.hasAlreadyErrored then
				return Promise.reject({ hasAlreadyErrored = true })
			else
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(FailedStep, { failedStep = FailedStep })
				p1.fireContactImportingTimeEvent({ isSuccessfulUpload = false, failedStep = FailedStep })
				
				return Promise.reject({ hasAlreadyErrored = true })
			end
		end
	end
	
	local _ = function(p2): number --[[ Line: 125 ]]
		-- upvalues: GetDeepValueFunction (upval)
		local ResponseBodyUserContactsEntities = GetDeepValueFunction(p2 or {}, "responseBody.userContactsEntities")
		
		return if ResponseBodyUserContactsEntities then #ResponseBodyUserContactsEntities else 0
	end
	
	local _ = function() --[[ Line: 131 ]]
		-- upvalues: p1 (copy)
		if p1.props.navigation then
			p1.props.navigation.pop()
			
			return
		end
		if p1.props.onClose then
			p1.props.onClose()
		end
	end
	
	function p1.requestFriendship(ContactId) --[[ Line: 139 ]]
		-- upvalues: p1 (copy), EventNames (upval)
		local Props = p1.props
		p1.fireAnalyticsEvent(EventNames.RequestFriendship, { requestedId = ContactId })
		Props.requestFriendship({ currentUserId = Props.localUserId, contactId = ContactId }):andThen(function() --[[ Line: 151 ]]
			-- upvalues: Props (copy), ContactId (copy)
			Props.requestSent(ContactId)
		end)
	end
	
	function p1.fireContactImportingTimeEvent(p2) --[[ Line: 156 ]]
		-- upvalues: p1 (copy), EventNames (upval), FieldNames (upval)
		p1.fireAnalyticsEvent(EventNames.ContactImportingTime, {
			[FieldNames.NumTotalContactsImported] = p1.contactsCount,
			[FieldNames.NumMatchedContacts] = p2.numMatchedContacts,
			[FieldNames.NumTotalContactsOnDevice] = p1.numTotalContactsOnDevice,
			[FieldNames.NumMaxContacts] = true,
			[FieldNames.NumMinContacts] = true,
			[FieldNames.NumTotalNumbersOnDevice] = p1.numTotalNumbersOnDevice,
			[FieldNames.NumContactsWithMultipleNumbers] = p1.numContactsWithMultipleNumbers,
			loadingTime = os.clock() - p1.startTime,
			isSuccessfulUpload = p2.isSuccessfulUpload
		})
	end
	
	function p1.getContactsFromDevice() --[[ Line: 174 ]]
		-- upvalues: p1 (copy), Promise (upval)
		local Props = p1.props
		
		return Props.contactsProtocol:supportsContacts():andThen(function(Result) --[[ Line: 179 ]]
			-- upvalues: Promise (upval), Props (copy)
			return if Result then Props.contactsProtocol:getContacts() else Promise.reject()
		end):catch(function() --[[ Line: 186 ]]
			-- upvalues: Promise (upval)
			return Promise.reject()
		end)
	end
	
	function p1.formatContactsFromDevice(Result) --[[ Line: 191 ]]
		-- upvalues: p1 (copy), FormatContactsModule (upval)
		local Props = p1.props
		
		if #(Result.contacts or {}) == 0 then
			return { contactsCount = 0, countryCode = nil, contacts = {} }
		end
		Props.deviceContactsReceived(Result.contacts)
		local FormatContactsModuleResult = FormatContactsModule(Result)
		p1.contactsCount = #FormatContactsModuleResult.contacts
		p1.numTotalContactsOnDevice = FormatContactsModuleResult.contactsCount
		local NumTotalNumbersOnDevice = 0
		local NumContactsWithMultipleNumbers = 0
		
		for _, contact in ipairs(Result.contacts) do
			local CountPhonenumber = #contact.phonenumber
			
			if CountPhonenumber > 1 then
				NumContactsWithMultipleNumbers += 1
			end
			NumTotalNumbersOnDevice += CountPhonenumber
		end
		p1.numTotalNumbersOnDevice = NumTotalNumbersOnDevice
		p1.numContactsWithMultipleNumbers = NumContactsWithMultipleNumbers
		
		return FormatContactsModuleResult
	end
	
	function p1.uploadDeviceContacts(Result) --[[ Line: 224 ]]
		-- upvalues: UploadContactsSourcesModule (upval), p1 (copy), GetFIntContactImporterUploadContactsMinModule (upval), Promise (upval), EventNames (upval)
		Result.source = UploadContactsSourcesModule.CI
		local Props = p1.props
		
		return if #Result.contacts == 0 or #Result.contacts < GetFIntContactImporterUploadContactsMinModule() then Promise.resolve({ shouldFindContacts = false }) else Props.uploadContacts(Result):andThen(function() --[[ Line: 235 ]]
			-- upvalues: Promise (upval)
			return Promise.resolve({ shouldFindContacts = true })
		end, function() --[[ Line: 237 ]]
			-- upvalues: p1 (upval), EventNames (upval), Promise (upval)
			p1.fireAnalyticsEvent(EventNames.FailedUploadContactsFromDevice, { failedStep = EventNames.FailedUploadContactsFromDevice })
			p1.fireContactImportingTimeEvent({
				isSuccessfulUpload = false,
				failedStep = EventNames.FailedUploadContactsFromDevice
			})
			
			return Promise.resolve({ shouldFindContacts = true })
		end)
	end
	
	function p1.findContacts(Result) --[[ Line: 251 ]]
		-- upvalues: p1 (copy), Promise (upval)
		local Props = p1.props
		
		return if Result.shouldFindContacts then Props.findContacts() else Promise.resolve()
	end
	
	function p1.getContactEntities(Result) --[[ Line: 260 ]]
		-- upvalues: p1 (copy), Promise (upval)
		local Props = p1.props
		
		return if Result then Props.getContactEntities(Result) else Promise.resolve()
	end
	
	function p1.fireHasLoaded(Result) --[[ Line: 270 ]]
		-- upvalues: GetDeepValueFunction (upval), p1 (copy), EventNames (upval), FieldNames (upval), Promise (upval)
		local ResponseBodyUserContactsEntities = GetDeepValueFunction(Result or {}, "responseBody.userContactsEntities")
		local CountResponseBodyUserContactsEntities: number = if ResponseBodyUserContactsEntities then #ResponseBodyUserContactsEntities else 0
		p1.fireAnalyticsEvent(EventNames.ContactsListLoaded, {
			[FieldNames.NumTotalContactsImported] = p1.contactsCount,
			[FieldNames.NumMatchedContacts] = CountResponseBodyUserContactsEntities,
			[FieldNames.NumMaxContacts] = true,
			[FieldNames.NumMinContacts] = true,
			[FieldNames.NumTotalContactsOnDevice] = p1.numTotalContactsOnDevice
		})
		p1:setState({ isFetching = false })
		p1.fireContactImportingTimeEvent({
			isSuccessfulUpload = true,
			nummatchedContacts = CountResponseBodyUserContactsEntities
		})
		
		return Promise.resolve()
	end
	
	function p1:failedToUpload() --[[ Line: 292 ]]
		-- upvalues: p1 (copy)
		p1:setState({ hasUploadError = true, isFetching = false })
		p1.fireContactImportingTimeEvent({ isSuccessfulUpload = false })
	end
	
	function p1.getContacts() --[[ Line: 301 ]]
		-- upvalues: p1 (copy), ConstantsModule (upval), AccessResponseEnum (upval), EventNames (upval), Promise (upval)
		p1:setState({ isFetching = true })
		local FeatureAccess = p1.ampApiProvider.getFeatureAccess({ ConstantsModule.SHOW_MATCHED_CONTACTS })
		p1:setState({
			showMatchedContacts = (if #FeatureAccess.featureAccessList > 0 then FeatureAccess.featureAccessList[1].access else AccessResponseEnum.Actionable) == AccessResponseEnum.Granted
		})
		local FailedGetContactsFromDevice = EventNames.FailedGetContactsFromDevice
		local Promise1 = p1.getContactsFromDevice():andThen(p1.formatContactsFromDevice, function(p2) --[[ Line: 102 ]]
			-- upvalues: Promise (upval), p1 (upval), FailedGetContactsFromDevice (copy)
			if type(p2) == "table" and p2.hasAlreadyErrored then
				return Promise.reject({ hasAlreadyErrored = true })
			else
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(FailedGetContactsFromDevice, { failedStep = FailedGetContactsFromDevice })
				p1.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = FailedGetContactsFromDevice
				})
				
				return Promise.reject({ hasAlreadyErrored = true })
			end
		end)
		local FailedFormatContactsFromDevice = EventNames.FailedFormatContactsFromDevice
		local Promise2 = Promise1:andThen(p1.uploadDeviceContacts, function(p2) --[[ Line: 102 ]]
			-- upvalues: Promise (upval), p1 (upval), FailedFormatContactsFromDevice (copy)
			if type(p2) == "table" and p2.hasAlreadyErrored then
				return Promise.reject({ hasAlreadyErrored = true })
			else
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(FailedFormatContactsFromDevice, { failedStep = FailedFormatContactsFromDevice })
				p1.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = FailedFormatContactsFromDevice
				})
				
				return Promise.reject({ hasAlreadyErrored = true })
			end
		end)
		local FailedUploadContactsFromDevice = EventNames.FailedUploadContactsFromDevice
		local Promise3 = Promise2:andThen(p1.findContacts, function(p2) --[[ Line: 102 ]]
			-- upvalues: Promise (upval), p1 (upval), FailedUploadContactsFromDevice (copy)
			if type(p2) == "table" and p2.hasAlreadyErrored then
				return Promise.reject({ hasAlreadyErrored = true })
			else
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(FailedUploadContactsFromDevice, { failedStep = FailedUploadContactsFromDevice })
				p1.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = FailedUploadContactsFromDevice
				})
				
				return Promise.reject({ hasAlreadyErrored = true })
			end
		end)
		local FailedFindContacts = EventNames.FailedFindContacts
		local Promise4 = Promise3:andThen(p1.getContactEntities, function(p2) --[[ Line: 102 ]]
			-- upvalues: Promise (upval), p1 (upval), FailedFindContacts (copy)
			if type(p2) == "table" and p2.hasAlreadyErrored then
				return Promise.reject({ hasAlreadyErrored = true })
			else
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(FailedFindContacts, { failedStep = FailedFindContacts })
				p1.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = FailedFindContacts
				})
				
				return Promise.reject({ hasAlreadyErrored = true })
			end
		end)
		local FailedGetContactEntities = EventNames.FailedGetContactEntities
		Promise4:andThen(p1.fireHasLoaded, function(p2) --[[ Line: 102 ]]
			-- upvalues: Promise (upval), p1 (upval), FailedGetContactEntities (copy)
			if type(p2) == "table" and p2.hasAlreadyErrored then
				return Promise.reject({ hasAlreadyErrored = true })
			else
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(FailedGetContactEntities, { failedStep = FailedGetContactEntities })
				p1.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = FailedGetContactEntities
				})
				
				return Promise.reject({ hasAlreadyErrored = true })
			end
		end):catch(p1.failedToUpload)
	end
	
	function p1.closeModal(p2) --[[ Line: 323 ]]
		-- upvalues: p1 (copy)
		p1.fireAnalyticsEvent(p2, {
			isLoading = p1.state.isFetching,
			loadingTime = if p1.state.isFetching then os.clock() - p1.startTime else nil
		})
		
		if p1.props.navigation then
			p1.props.navigation.pop()
			
			return
		end
		if p1.props.onClose then
			p1.props.onClose()
		end
	end
	
	function p1.onAddFriendsActivated() --[[ Line: 334 ]]
		-- upvalues: p1 (copy), EnumScreens (upval)
		p1.props.navigation.replace(EnumScreens.AddFriendsPage)
	end
	
	p1.isFetching = nil
	
	function p1.openDiscoverabilityModal() --[[ Line: 343 ]]
		-- upvalues: p1 (copy), EnumScreens (upval), DiscoverabilityAnalytics (upval), ConstantsModule (upval), AccessResponseEnum (upval), GetFFlagFindFriendsClickedEventEnabledModule (upval), EventNames (upval), Dash (upval)
		local Navigation = p1.props.navigation
		Navigation.replace(EnumScreens.DiscoverabilityOverlay, {
			isStandaloneDiscoverabilityModal = true,
			entryPoint = DiscoverabilityAnalytics.EntryPoints.ContactsList,
			navigateOnActivated = function() --[[ Line: 350 ]]
				-- upvalues: Navigation (copy), EnumScreens (upval), ConstantsModule (upval), p1 (upval)
				Navigation.replace(EnumScreens.ContactsList, {
					[ConstantsModule.SHOULD_UPDATE_USER_SETTINGS] = true,
					[ConstantsModule.IS_PHONE_VERIFIED] = p1.getPropOrParam(ConstantsModule.IS_PHONE_VERIFIED),
					openAmpUpsell = p1.getPropOrParam(ConstantsModule.OPEN_AMP_UPSELL),
					entryPoint = p1.entryPoint
				})
			end
		})
		local PropOrParam = p1.getPropOrParam(ConstantsModule.OPEN_AMP_UPSELL)
		p1.openAmpUpsell = if PropOrParam then function() --[[ Line: 363 ]]
			-- upvalues: AccessResponseEnum (upval), p1 (upval), GetFFlagFindFriendsClickedEventEnabledModule (upval), EventNames (upval), PropOrParam (copy), ConstantsModule (upval)
			local function v52(Granted, _) --[[ Line: 364 ]]
				-- upvalues: AccessResponseEnum (upval), p1 (upval)
				if Granted == AccessResponseEnum.Granted then
					p1.getContacts()
					p1.openDiscoverabilityModal()
				end
			end
			
			if GetFFlagFindFriendsClickedEventEnabledModule() then
				p1.fireAnalyticsEvent(EventNames.FindFriendsButtonClicked)
			end
			PropOrParam(ConstantsModule.SHOW_MATCHED_CONTACTS, v52)
		end else Dash.noop
	end
end

function ContactsListContainer.didMount(p2) --[[ Line: 380 ]]
	p2.getContacts()
end

function ContactsListContainer.render(p2) --[[ Line: 384 ]]
	-- upvalues: Roact (copy), ContactsListModule (copy), AnalyticsModule (copy)
	local Props = p2.props
	
	return Roact.createElement(ContactsListModule, {
		deviceContacts = Props.deviceContacts,
		matchedContacts = Props.matchedContacts,
		isFetching = p2.state.isFetching,
		requestFriendship = p2.requestFriendship,
		screenSize = Props.screenSize,
		hasUploadError = p2.state.hasUploadError,
		onAddFriendsActivated = p2.onAddFriendsActivated,
		closeModal = p2.closeModal,
		showAddFriendsButton = p2.entryPoint == AnalyticsModule.EntryPoints.HomePage,
		openProfilePeekView = p2.props.openProfilePeekView,
		showMatchedContacts = p2.state.showMatchedContacts,
		openAmpUpsell = p2.openAmpUpsell
	})
end

return RoactRodux.connect(ContactsListMapStateToPropsModule, ContactsListMapDispatchToPropsModule)(ContactsListContainer)