local parent = script.Parent.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local roact = dependenciesModule.Roact
local roactRodux = dependenciesModule.RoactRodux
local _ = require(parent.Common.LocalTypes)
local constantsModule = require(parent.Common.Constants)
local promise = dependenciesModule.Promise
local analyticsModule = require(parent.Analytics)
local fieldNames = analyticsModule.FieldNames
local eventNames = analyticsModule.EventNames
local setupFireAnalyticsEventsModule = require(parent.Analytics.setupFireAnalyticsEvents)
local formatContactsModule = require(parent.Utils.formatContacts)
local contactsProtocol = dependenciesModule.ContactsProtocol
local dash = dependenciesModule.Dash
local enumScreens = dependenciesModule.SocialModalsCommon.EnumScreens
local ampApiProvider = dependenciesModule.AmpUpsell.AmpApiProvider
local accessResponseEnum = dependenciesModule.AmpUpsell.AmpEnums.AccessResponseEnum
local getFFlagFindFriendsClickedEventEnabledModule = require(parent.Flags.getFFlagFindFriendsClickedEventEnabled)
local contactsListModule = require(script.Parent.ContactsList)
local contactsListMapDispatchToPropsModule = require(script.Parent.ContactsListMapDispatchToProps)
local contactsListMapStateToPropsModule = require(script.Parent.ContactsListMapStateToProps)
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local uploadContactsSourcesModule = require(parent.Analytics.Enums.UploadContactsSources)
local getFIntContactImporterUploadContactsMinModule = require(parent.Flags.getFIntContactImporterUploadContactsMin)
local IXPVariantsModule = require(parent.Common.IXPVariants)
local fFlagContactImporterIXPCleanup = require(parent_1.SharedFlags).FFlagContactImporterIXPCleanup
local discoverabilityAnalytics = dependenciesModule.DiscoverabilityAnalytics
local contactsListContainer = roact.PureComponent:extend("ContactsListContainer")
contactsListContainer.defaultProps = { contactsProtocol = contactsProtocol.default }

function contactsListContainer.init(p1)
	-- upvalues: setupFireAnalyticsEventsModule (ref), analyticsModule (ref), getDeepValue (ref), ampApiProvider (ref), promise (ref), eventNames (ref), fieldNames (ref), formatContactsModule (ref), uploadContactsSourcesModule (ref), fFlagContactImporterIXPCleanup (ref), IXPVariantsModule (ref), getFIntContactImporterUploadContactsMinModule (ref), constantsModule (ref), accessResponseEnum (ref), enumScreens (ref), discoverabilityAnalytics (ref), getFFlagFindFriendsClickedEventEnabledModule (ref), dash (ref)
	p1.entryPoint = p1.props.navigation.getParam("entryPoint")
	p1.fireAnalyticsEvent = setupFireAnalyticsEventsModule({
		analytics = analyticsModule.AnalyticsService,
		defaultAnalyticsInfo = { entry = p1.entryPoint }
	})
	p1.state = {
		hasUploadError = false,
		isFetching = true,
		showMatchedContacts = false
	}
	
	function p0.getPropOrParam(p2)
		-- upvalues: p1 (ref), getDeepValue (copy)
		return if p1.props.navigation and p1.props.navigation.getParam(p2) or p1.props.navigation then p1.props.navigation.getParam(p2) else getDeepValue(p1.props, p2)
	end
	
	p1.contactsCount = nil
	p1.numTotalNumbersOnDevice = nil
	p1.numTotalContactsOnDevice = nil
	p1.numContactsWithMultipleNumbers = nil
	p1.startTime = os.clock()
	p1.ampApiProvider = if p1.props.ampApiProvider ~= nil then ampApiProvider else p1.props.ampApiProvider
	
	local function _(p2)
		-- upvalues: promise (copy), p1 (ref)
		return function(p3)
			-- upvalues: promise (copy), p1 (copy), p2 (ref)
			if type(p3) == "table" and p3.hasAlreadyErrored then
				return promise.reject({ hasAlreadyErrored = true })
			end
			p1:setState({ hasUploadError = true, isFetching = false })
			p1.fireAnalyticsEvent(p2, { failedStep = p2 })
			p1.fireContactImportingTimeEvent({ isSuccessfulUpload = false, failedStep = p2 })
			
			return promise.reject({ hasAlreadyErrored = true })
		end
	end
	
	local _ = function(p2)
		-- upvalues: getDeepValue (copy)
		local var1 = getDeepValue(p2 or {}, "responseBody.userContactsEntities")
		
		return if var1 then #var1 else 0
	end
	
	local _ = function()
		-- upvalues: p1 (ref)
		if p1.props.navigation then
			p1.props.navigation.pop()
			
			return
		elseif p1.props.onClose then
			p1.props.onClose()
		end
	end
	
	function p0.requestFriendship(p2)
		-- upvalues: p1 (ref), eventNames (copy)
		local props = p1.props
		p1.fireAnalyticsEvent(eventNames.RequestFriendship, { requestedId = p2 })
		props.requestFriendship({ currentUserId = props.localUserId, contactId = p2 }):andThen(function()
			-- upvalues: props (ref), p2 (ref)
			props.requestSent(p2)
		end)
	end
	
	function p0.fireContactImportingTimeEvent(p2)
		-- upvalues: p1 (ref), eventNames (copy), fieldNames (copy)
		p1.fireAnalyticsEvent(eventNames.ContactImportingTime, {
			[fieldNames.NumTotalContactsImported] = p1.contactsCount,
			[fieldNames.NumMatchedContacts] = p2.numMatchedContacts,
			[fieldNames.NumTotalContactsOnDevice] = p1.numTotalContactsOnDevice,
			[fieldNames.NumMaxContacts] = true,
			[fieldNames.NumMinContacts] = true,
			[fieldNames.NumTotalNumbersOnDevice] = p1.numTotalNumbersOnDevice,
			[fieldNames.NumContactsWithMultipleNumbers] = p1.numContactsWithMultipleNumbers,
			loadingTime = os.clock() - p1.startTime,
			isSuccessfulUpload = p2.isSuccessfulUpload
		})
	end
	
	function p0.getContactsFromDevice()
		-- upvalues: p1 (ref), promise (copy)
		local props = p1.props
		
		return props.contactsProtocol:supportsContacts():andThen(function(p2)
			-- upvalues: promise (copy), props (ref)
			return if p2 then props.contactsProtocol:getContacts() else promise.reject()
		end):catch(function()
			-- upvalues: promise (copy)
			return promise.reject()
		end)
	end
	
	function p0.formatContactsFromDevice(p2)
		-- upvalues: p1 (ref), formatContactsModule (copy)
		local props = p1.props
		
		if #(p2.contacts or {}) == 0 then
			return { contactsCount = 0, countryCode = nil, contacts = {} }
		end
		props.deviceContactsReceived(p2.contacts)
		local var1 = formatContactsModule(p2)
		p1.contactsCount = #var1.contacts
		p1.numTotalContactsOnDevice = var1.contactsCount
		local var2 = 0
		local var3 = 0
		
		for i, v in ipairs(p2.contacts) do
			local phonenumberCount = #v.phonenumber
			
			if phonenumberCount > 1 then
				var3 += 1
			end
			var2 += phonenumberCount
		end
		p1.numTotalNumbersOnDevice = var2
		p1.numContactsWithMultipleNumbers = var3
		
		return var1
	end
	
	function p0.uploadDeviceContacts(p3)
		-- upvalues: uploadContactsSourcesModule (copy), p1 (ref), fFlagContactImporterIXPCleanup (copy), IXPVariantsModule (copy), getFIntContactImporterUploadContactsMinModule (copy), promise (copy), eventNames (copy)
		p3.source = uploadContactsSourcesModule.CI
		local props = p1.props
		
		return if #p3.contacts == 0 or not fFlagContactImporterIXPCleanup and props.variant == IXPVariantsModule.INVITES_ONLY or #p3.contacts < getFIntContactImporterUploadContactsMinModule() then promise.resolve({ shouldFindContacts = false }) else props.uploadContacts(p3):andThen(function()
			-- upvalues: promise (copy)
			return promise.resolve({ shouldFindContacts = true })
		end, function()
			-- upvalues: p1 (copy), eventNames (copy), promise (copy)
			p1.fireAnalyticsEvent(eventNames.FailedUploadContactsFromDevice, { failedStep = eventNames.FailedUploadContactsFromDevice })
			p1.fireContactImportingTimeEvent({
				isSuccessfulUpload = false,
				failedStep = eventNames.FailedUploadContactsFromDevice
			})
			
			return promise.resolve({ shouldFindContacts = true })
		end)
	end
	
	function p0.findContacts(p3)
		-- upvalues: p1 (ref), promise (copy)
		return if p3.shouldFindContacts then p1.props.findContacts() else promise.resolve()
	end
	
	function p0.getContactEntities(p3)
		-- upvalues: p1 (ref), promise (copy)
		return if p3 then p1.props.getContactEntities(p3) else promise.resolve()
	end
	
	function p0.fireHasLoaded(p3)
		-- upvalues: getDeepValue (copy), p1 (ref), eventNames (copy), fieldNames (copy), promise (copy)
		local var4 = getDeepValue(p3 or {}, "responseBody.userContactsEntities")
		local var5 = if var4 then #var4 else 0
		p1.fireAnalyticsEvent(eventNames.ContactsListLoaded, {
			[fieldNames.NumTotalContactsImported] = p1.contactsCount,
			[fieldNames.NumMatchedContacts] = var5,
			[fieldNames.NumMaxContacts] = true,
			[fieldNames.NumMinContacts] = true,
			[fieldNames.NumTotalContactsOnDevice] = p1.numTotalContactsOnDevice
		})
		p1:setState({ isFetching = false })
		p1.fireContactImportingTimeEvent({ isSuccessfulUpload = true, nummatchedContacts = var5 })
		
		return promise.resolve()
	end
	
	function p0.failedToUpload(_)
		-- upvalues: p1 (ref)
		p1:setState({ hasUploadError = true, isFetching = false })
		p1.fireContactImportingTimeEvent({ isSuccessfulUpload = false })
	end
	
	function p0.getContacts()
		-- upvalues: p1 (ref), constantsModule (copy), accessResponseEnum (copy), fFlagContactImporterIXPCleanup (copy), eventNames (copy), promise (copy)
		local _ = nil
		p1:setState({ isFetching = true })
		local featureAccess = p1.ampApiProvider.getFeatureAccess({ constantsModule.SHOW_MATCHED_CONTACTS })
		local var4 = (if #featureAccess.featureAccessList > 0 then featureAccess.featureAccessList[1].access else accessResponseEnum.Actionable) == accessResponseEnum.Granted
		p1:setState({ showMatchedContacts = var4 })
		
		if fFlagContactImporterIXPCleanup or not p1.props.isPVRequired or var4 then
			local failedGetContactsFromDevice = eventNames.FailedGetContactsFromDevice
			local formatContactsFromDevice = p1.getContactsFromDevice():andThen(p1.formatContactsFromDevice, function(p3)
				-- upvalues: promise (copy), p1 (copy), failedGetContactsFromDevice (ref)
				if type(p3) == "table" and p3.hasAlreadyErrored then
					return promise.reject({ hasAlreadyErrored = true })
				end
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(failedGetContactsFromDevice, { failedStep = failedGetContactsFromDevice })
				p1.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = failedGetContactsFromDevice
				})
				
				return promise.reject({ hasAlreadyErrored = true })
			end)
			local failedFormatContactsFromDevice = eventNames.FailedFormatContactsFromDevice
			formatContactsFromDevice = formatContactsFromDevice:andThen(p1.uploadDeviceContacts, function(p3)
				-- upvalues: promise (copy), p1 (copy), failedFormatContactsFromDevice (ref)
				if type(p3) == "table" and p3.hasAlreadyErrored then
					return promise.reject({ hasAlreadyErrored = true })
				end
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(failedFormatContactsFromDevice, { failedStep = failedFormatContactsFromDevice })
				p1.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = failedFormatContactsFromDevice
				})
				
				return promise.reject({ hasAlreadyErrored = true })
			end)
			local failedUploadContactsFromDevice = eventNames.FailedUploadContactsFromDevice
			formatContactsFromDevice = formatContactsFromDevice:andThen(p1.findContacts, function(p3)
				-- upvalues: promise (copy), p1 (copy), failedUploadContactsFromDevice (ref)
				if type(p3) == "table" and p3.hasAlreadyErrored then
					return promise.reject({ hasAlreadyErrored = true })
				end
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(failedUploadContactsFromDevice, { failedStep = failedUploadContactsFromDevice })
				p1.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = failedUploadContactsFromDevice
				})
				
				return promise.reject({ hasAlreadyErrored = true })
			end)
			local failedFindContacts = eventNames.FailedFindContacts
			formatContactsFromDevice = formatContactsFromDevice:andThen(p1.getContactEntities, function(p3)
				-- upvalues: promise (copy), p1 (copy), failedFindContacts (ref)
				if type(p3) == "table" and p3.hasAlreadyErrored then
					return promise.reject({ hasAlreadyErrored = true })
				end
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(failedFindContacts, { failedStep = failedFindContacts })
				p1.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = failedFindContacts
				})
				
				return promise.reject({ hasAlreadyErrored = true })
			end)
			local failedGetContactEntities = eventNames.FailedGetContactEntities
			formatContactsFromDevice:andThen(p1.fireHasLoaded, function(p3)
				-- upvalues: promise (copy), p1 (copy), failedGetContactEntities (ref)
				if type(p3) == "table" and p3.hasAlreadyErrored then
					return promise.reject({ hasAlreadyErrored = true })
				end
				p1:setState({ hasUploadError = true, isFetching = false })
				p1.fireAnalyticsEvent(failedGetContactEntities, { failedStep = failedGetContactEntities })
				p1.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = failedGetContactEntities
				})
				
				return promise.reject({ hasAlreadyErrored = true })
			end):catch(p1.failedToUpload)
			
			return
		end
		local failedGetContactsFromDevice = eventNames.FailedGetContactsFromDevice
		local formatContactsFromDevice = p1.getContactsFromDevice():andThen(p1.formatContactsFromDevice, function(p3)
			-- upvalues: promise (copy), p1 (copy), failedGetContactsFromDevice (ref)
			if type(p3) == "table" and p3.hasAlreadyErrored then
				return promise.reject({ hasAlreadyErrored = true })
			end
			p1:setState({ hasUploadError = true, isFetching = false })
			p1.fireAnalyticsEvent(failedGetContactsFromDevice, { failedStep = failedGetContactsFromDevice })
			p1.fireContactImportingTimeEvent({
				isSuccessfulUpload = false,
				failedStep = failedGetContactsFromDevice
			})
			
			return promise.reject({ hasAlreadyErrored = true })
		end)
		local failedFormatContactsFromDevice = eventNames.FailedFormatContactsFromDevice
		formatContactsFromDevice:andThen(p1.fireHasLoaded, function(p3)
			-- upvalues: promise (copy), p1 (copy), failedFormatContactsFromDevice (ref)
			if type(p3) == "table" and p3.hasAlreadyErrored then
				return promise.reject({ hasAlreadyErrored = true })
			end
			p1:setState({ hasUploadError = true, isFetching = false })
			p1.fireAnalyticsEvent(failedFormatContactsFromDevice, { failedStep = failedFormatContactsFromDevice })
			p1.fireContactImportingTimeEvent({
				isSuccessfulUpload = false,
				failedStep = failedFormatContactsFromDevice
			})
			
			return promise.reject({ hasAlreadyErrored = true })
		end):catch(p1.failedToUpload)
	end
	
	function p0.closeModal(p3)
		-- upvalues: p1 (ref), fFlagContactImporterIXPCleanup (copy), IXPVariantsModule (copy)
		p1.fireAnalyticsEvent(p3, {
			isLoading = if fFlagContactImporterIXPCleanup then p1.state.isFetching else p1.isFetching(p1.props.variant, IXPVariantsModule),
			loadingTime = if p1.state.isFetching then os.clock() - p1.startTime else nil
		})
		
		if p1.props.navigation then
			p1.props.navigation.pop()
			
			return
		elseif p1.props.onClose then
			p1.props.onClose()
		end
	end
	
	function p0.onAddFriendsActivated()
		-- upvalues: p1 (ref), enumScreens (copy)
		p1.props.navigation.replace(enumScreens.AddFriendsPage)
	end
	
	p1.isFetching = if fFlagContactImporterIXPCleanup then nil else function(p3, p4)
		-- upvalues: p1 (ref)
		return p3 == p4.BLENDED and p1.state.isFetching
	end
	
	function p0.openDiscoverabilityModal()
		-- upvalues: p1 (ref), enumScreens (copy), discoverabilityAnalytics (copy), constantsModule (copy), accessResponseEnum (copy), getFFlagFindFriendsClickedEventEnabledModule (copy), eventNames (copy), dash (copy)
		local navigation = p1.props.navigation
		navigation.replace(enumScreens.DiscoverabilityOverlay, {
			isStandaloneDiscoverabilityModal = true,
			entryPoint = discoverabilityAnalytics.EntryPoints.ContactsList,
			navigateOnActivated = function()
				-- upvalues: navigation (ref), enumScreens (copy), constantsModule (copy), p1 (copy)
				navigation.replace(enumScreens.ContactsList, {
					[constantsModule.SHOULD_UPDATE_USER_SETTINGS] = true,
					[constantsModule.IS_PHONE_VERIFIED] = p1.getPropOrParam(constantsModule.IS_PHONE_VERIFIED),
					openAmpUpsell = p1.getPropOrParam(constantsModule.OPEN_AMP_UPSELL),
					entryPoint = p1.entryPoint
				})
			end
		})
		local propOrParam = p1.getPropOrParam(constantsModule.OPEN_AMP_UPSELL)
		p1.openAmpUpsell = if propOrParam then function()
			-- upvalues: accessResponseEnum (copy), p1 (copy), getFFlagFindFriendsClickedEventEnabledModule (copy), eventNames (copy), propOrParam (ref), constantsModule (copy)
			local var4 = function(p3, _)
				-- upvalues: accessResponseEnum (copy), p1 (copy)
				if p3 == accessResponseEnum.Granted then
					p1.getContacts()
					p1.openDiscoverabilityModal()
				end
			end
			
			if getFFlagFindFriendsClickedEventEnabledModule() then
				p1.fireAnalyticsEvent(eventNames.FindFriendsButtonClicked)
			end
			propOrParam(constantsModule.SHOW_MATCHED_CONTACTS, var4)
		end else dash.noop
	end
end

function contactsListContainer.didMount(p2)
	p2.getContacts()
end

function contactsListContainer.render(p2)
	-- upvalues: fFlagContactImporterIXPCleanup (ref), roact (ref), contactsListModule (ref), IXPVariantsModule (ref), analyticsModule (ref)
	local props = p2.props
	
	return roact.createElement(contactsListModule, {
		deviceContacts = props.deviceContacts,
		matchedContacts = props.matchedContacts,
		isFetching = if fFlagContactImporterIXPCleanup then p2.state.isFetching else p2.isFetching(if fFlagContactImporterIXPCleanup then nil else props.variant, IXPVariantsModule),
		requestFriendship = p2.requestFriendship,
		screenSize = props.screenSize,
		hasUploadError = p2.state.hasUploadError,
		onAddFriendsActivated = p2.onAddFriendsActivated,
		closeModal = p2.closeModal,
		showAddFriendsButton = p2.entryPoint == analyticsModule.EntryPoints.HomePage,
		variant = if fFlagContactImporterIXPCleanup then nil else props.variant,
		openProfilePeekView = p2.props.openProfilePeekView,
		showMatchedContacts = p2.state.showMatchedContacts,
		openAmpUpsell = p2.openAmpUpsell
	})
end

return roactRodux.connect(contactsListMapStateToPropsModule, contactsListMapDispatchToPropsModule)(contactsListContainer)