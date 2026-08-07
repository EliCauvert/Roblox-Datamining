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

function contactsListContainer.init(p0) --[[ line: 74 ]]
	-- upvalues: setupFireAnalyticsEventsModule (ref), analyticsModule (ref), getDeepValue (ref), ampApiProvider (ref), promise (ref), eventNames (ref), fieldNames (ref), formatContactsModule (ref), uploadContactsSourcesModule (ref), fFlagContactImporterIXPCleanup (ref), IXPVariantsModule (ref), getFIntContactImporterUploadContactsMinModule (ref), constantsModule (ref), accessResponseEnum (ref), enumScreens (ref), discoverabilityAnalytics (ref), getFFlagFindFriendsClickedEventEnabledModule (ref), dash (ref)
	p0.entryPoint = p0.props.navigation.getParam("entryPoint")
	p0.fireAnalyticsEvent = setupFireAnalyticsEventsModule({
		analytics = analyticsModule.AnalyticsService,
		defaultAnalyticsInfo = { entry = p0.entryPoint }
	})
	p0.state = {
		hasUploadError = false,
		isFetching = true,
		showMatchedContacts = false
	}
	
	function p0.getPropOrParam(p1) --[[ line: 91 ]]
		-- upvalues: p0 (ref), getDeepValue (copy)
		return if p0.props.navigation and p0.props.navigation.getParam(p1) or p0.props.navigation then p0.props.navigation.getParam(p1) else getDeepValue(p0.props, p1)
	end
	
	p0.contactsCount = nil
	p0.numTotalNumbersOnDevice = nil
	p0.numTotalContactsOnDevice = nil
	p0.numContactsWithMultipleNumbers = nil
	p0.startTime = os.clock()
	p0.ampApiProvider = if p0.props.ampApiProvider ~= nil then ampApiProvider else p0.props.ampApiProvider
	
	local function _(p2) --[[ line: 107 | named "makeErrorFunction" ]]
		-- upvalues: promise (copy), p0 (ref)
		return function(p3) --[[ line: 108 ]]
			-- upvalues: promise (copy), p0 (copy), p2 (ref)
			if type(p3) == "table" and p3.hasAlreadyErrored then
				return promise.reject({ hasAlreadyErrored = true })
			end
			p0:setState({ hasUploadError = true, isFetching = false })
			p0.fireAnalyticsEvent(p2, { failedStep = p2 })
			p0.fireContactImportingTimeEvent({ isSuccessfulUpload = false, failedStep = p2 })
			
			return promise.reject({ hasAlreadyErrored = true })
		end
	end
	
	local _ = function(p4) --[[ line: 131 ]]
		-- upvalues: getDeepValue (copy)
		local var13 = getDeepValue(p4 or {}, "responseBody.userContactsEntities")
		
		return if var13 then #var13 else 0
	end
	
	local _ = function() --[[ line: 137 ]]
		-- upvalues: p0 (ref)
		if p0.props.navigation then
			p0.props.navigation.pop()
			
			return
		elseif p0.props.onClose then
			p0.props.onClose()
		end
	end
	
	function p0.requestFriendship(p5) --[[ line: 145 ]]
		-- upvalues: p0 (ref), eventNames (copy)
		local props = p0.props
		p0.fireAnalyticsEvent(eventNames.RequestFriendship, { requestedId = p5 })
		props.requestFriendship({ currentUserId = props.localUserId, contactId = p5 }):andThen(function() --[[ line: 157 ]]
			-- upvalues: props (ref), p5 (ref)
			props.requestSent(p5)
		end)
	end
	
	function p0.fireContactImportingTimeEvent(p6) --[[ line: 162 ]]
		-- upvalues: p0 (ref), eventNames (copy), fieldNames (copy)
		p0.fireAnalyticsEvent(eventNames.ContactImportingTime, {
			[fieldNames.NumTotalContactsImported] = p0.contactsCount,
			[fieldNames.NumMatchedContacts] = p6.numMatchedContacts,
			[fieldNames.NumTotalContactsOnDevice] = p0.numTotalContactsOnDevice,
			[fieldNames.NumMaxContacts] = true,
			[fieldNames.NumMinContacts] = true,
			[fieldNames.NumTotalNumbersOnDevice] = p0.numTotalNumbersOnDevice,
			[fieldNames.NumContactsWithMultipleNumbers] = p0.numContactsWithMultipleNumbers,
			loadingTime = os.clock() - p0.startTime,
			isSuccessfulUpload = p6.isSuccessfulUpload
		})
	end
	
	function p0.getContactsFromDevice() --[[ line: 180 ]]
		-- upvalues: p0 (ref), promise (copy)
		local props = p0.props
		
		return props.contactsProtocol:supportsContacts():andThen(function(p7) --[[ line: 185 ]]
			-- upvalues: promise (copy), props (ref)
			return if p7 then props.contactsProtocol:getContacts() else promise.reject()
		end):catch(function() --[[ line: 192 ]]
			-- upvalues: promise (copy)
			return promise.reject()
		end)
	end
	
	function p0.formatContactsFromDevice(p8) --[[ line: 197 ]]
		-- upvalues: p0 (ref), formatContactsModule (copy)
		local props = p0.props
		
		if #(p8.contacts or {}) == 0 then
			return { contactsCount = 0, countryCode = nil, contacts = {} }
		end
		props.deviceContactsReceived(p8.contacts)
		local var14 = formatContactsModule(p8)
		p0.contactsCount = #var14.contacts
		p0.numTotalContactsOnDevice = var14.contactsCount
		local var15 = 0
		local var16 = 0
		
		for i, v in ipairs(p8.contacts) do
			local phonenumberCount = #v.phonenumber
			
			if phonenumberCount > 1 then
				var16 += 1
			end
			var15 += phonenumberCount
		end
		p0.numTotalNumbersOnDevice = var15
		p0.numContactsWithMultipleNumbers = var16
		
		return var14
	end
	
	function p0.uploadDeviceContacts(p9) --[[ line: 230 ]]
		-- upvalues: uploadContactsSourcesModule (copy), p0 (ref), fFlagContactImporterIXPCleanup (copy), IXPVariantsModule (copy), getFIntContactImporterUploadContactsMinModule (copy), promise (copy), eventNames (copy)
		p9.source = uploadContactsSourcesModule.CI
		local props = p0.props
		
		return if #p9.contacts == 0 or not fFlagContactImporterIXPCleanup and props.variant == IXPVariantsModule.INVITES_ONLY or #p9.contacts < getFIntContactImporterUploadContactsMinModule() then promise.resolve({ shouldFindContacts = false }) else props.uploadContacts(p9):andThen(function() --[[ line: 246 ]]
			-- upvalues: promise (copy)
			return promise.resolve({ shouldFindContacts = true })
		end, function() --[[ line: 248 ]]
			-- upvalues: p0 (copy), eventNames (copy), promise (copy)
			p0.fireAnalyticsEvent(eventNames.FailedUploadContactsFromDevice, { failedStep = eventNames.FailedUploadContactsFromDevice })
			p0.fireContactImportingTimeEvent({
				isSuccessfulUpload = false,
				failedStep = eventNames.FailedUploadContactsFromDevice
			})
			
			return promise.resolve({ shouldFindContacts = true })
		end)
	end
	
	function p0.findContacts(p10) --[[ line: 262 ]]
		-- upvalues: p0 (ref), promise (copy)
		return if p10.shouldFindContacts then p0.props.findContacts() else promise.resolve()
	end
	
	function p0.getContactEntities(p11) --[[ line: 271 ]]
		-- upvalues: p0 (ref), promise (copy)
		return if p11 then p0.props.getContactEntities(p11) else promise.resolve()
	end
	
	function p0.fireHasLoaded(p12) --[[ line: 281 ]]
		-- upvalues: getDeepValue (copy), p0 (ref), eventNames (copy), fieldNames (copy), promise (copy)
		local var18 = getDeepValue(p12 or {}, "responseBody.userContactsEntities")
		local var19 = if var18 then #var18 else 0
		p0.fireAnalyticsEvent(eventNames.ContactsListLoaded, {
			[fieldNames.NumTotalContactsImported] = p0.contactsCount,
			[fieldNames.NumMatchedContacts] = var19,
			[fieldNames.NumMaxContacts] = true,
			[fieldNames.NumMinContacts] = true,
			[fieldNames.NumTotalContactsOnDevice] = p0.numTotalContactsOnDevice
		})
		p0:setState({ isFetching = false })
		p0.fireContactImportingTimeEvent({ isSuccessfulUpload = true, nummatchedContacts = var19 })
		
		return promise.resolve()
	end
	
	function p0.failedToUpload(_) --[[ line: 303 ]]
		-- upvalues: p0 (ref)
		p0:setState({ hasUploadError = true, isFetching = false })
		p0.fireContactImportingTimeEvent({ isSuccessfulUpload = false })
	end
	
	function p0.getContacts() --[[ line: 312 ]]
		-- upvalues: p0 (ref), constantsModule (copy), accessResponseEnum (copy), fFlagContactImporterIXPCleanup (copy), eventNames (copy), promise (copy)
		local _ = nil
		p0:setState({ isFetching = true })
		local featureAccess = p0.ampApiProvider.getFeatureAccess({ constantsModule.SHOW_MATCHED_CONTACTS })
		local var21 = (if #featureAccess.featureAccessList > 0 then featureAccess.featureAccessList[1].access else accessResponseEnum.Actionable) == accessResponseEnum.Granted
		p0:setState({ showMatchedContacts = var21 })
		
		if fFlagContactImporterIXPCleanup or not p0.props.isPVRequired or var21 then
			local failedGetContactsFromDevice = eventNames.FailedGetContactsFromDevice
			local formatContactsFromDevice = p0.getContactsFromDevice():andThen(p0.formatContactsFromDevice, function(p13) --[[ line: 108 ]]
				-- upvalues: promise (copy), p0 (copy), failedGetContactsFromDevice (ref)
				if type(p13) == "table" and p13.hasAlreadyErrored then
					return promise.reject({ hasAlreadyErrored = true })
				end
				p0:setState({ hasUploadError = true, isFetching = false })
				p0.fireAnalyticsEvent(failedGetContactsFromDevice, { failedStep = failedGetContactsFromDevice })
				p0.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = failedGetContactsFromDevice
				})
				
				return promise.reject({ hasAlreadyErrored = true })
			end)
			local failedFormatContactsFromDevice = eventNames.FailedFormatContactsFromDevice
			formatContactsFromDevice = formatContactsFromDevice:andThen(p0.uploadDeviceContacts, function(p14) --[[ line: 108 ]]
				-- upvalues: promise (copy), p0 (copy), failedFormatContactsFromDevice (ref)
				if type(p14) == "table" and p14.hasAlreadyErrored then
					return promise.reject({ hasAlreadyErrored = true })
				end
				p0:setState({ hasUploadError = true, isFetching = false })
				p0.fireAnalyticsEvent(failedFormatContactsFromDevice, { failedStep = failedFormatContactsFromDevice })
				p0.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = failedFormatContactsFromDevice
				})
				
				return promise.reject({ hasAlreadyErrored = true })
			end)
			local failedUploadContactsFromDevice = eventNames.FailedUploadContactsFromDevice
			formatContactsFromDevice = formatContactsFromDevice:andThen(p0.findContacts, function(p15) --[[ line: 108 ]]
				-- upvalues: promise (copy), p0 (copy), failedUploadContactsFromDevice (ref)
				if type(p15) == "table" and p15.hasAlreadyErrored then
					return promise.reject({ hasAlreadyErrored = true })
				end
				p0:setState({ hasUploadError = true, isFetching = false })
				p0.fireAnalyticsEvent(failedUploadContactsFromDevice, { failedStep = failedUploadContactsFromDevice })
				p0.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = failedUploadContactsFromDevice
				})
				
				return promise.reject({ hasAlreadyErrored = true })
			end)
			local failedFindContacts = eventNames.FailedFindContacts
			formatContactsFromDevice = formatContactsFromDevice:andThen(p0.getContactEntities, function(p16) --[[ line: 108 ]]
				-- upvalues: promise (copy), p0 (copy), failedFindContacts (ref)
				if type(p16) == "table" and p16.hasAlreadyErrored then
					return promise.reject({ hasAlreadyErrored = true })
				end
				p0:setState({ hasUploadError = true, isFetching = false })
				p0.fireAnalyticsEvent(failedFindContacts, { failedStep = failedFindContacts })
				p0.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = failedFindContacts
				})
				
				return promise.reject({ hasAlreadyErrored = true })
			end)
			local failedGetContactEntities = eventNames.FailedGetContactEntities
			formatContactsFromDevice:andThen(p0.fireHasLoaded, function(p17) --[[ line: 108 ]]
				-- upvalues: promise (copy), p0 (copy), failedGetContactEntities (ref)
				if type(p17) == "table" and p17.hasAlreadyErrored then
					return promise.reject({ hasAlreadyErrored = true })
				end
				p0:setState({ hasUploadError = true, isFetching = false })
				p0.fireAnalyticsEvent(failedGetContactEntities, { failedStep = failedGetContactEntities })
				p0.fireContactImportingTimeEvent({
					isSuccessfulUpload = false,
					failedStep = failedGetContactEntities
				})
				
				return promise.reject({ hasAlreadyErrored = true })
			end):catch(p0.failedToUpload)
			
			return
		end
		local failedGetContactsFromDevice = eventNames.FailedGetContactsFromDevice
		local formatContactsFromDevice = p0.getContactsFromDevice():andThen(p0.formatContactsFromDevice, function(p18) --[[ line: 108 ]]
			-- upvalues: promise (copy), p0 (copy), failedGetContactsFromDevice (ref)
			if type(p18) == "table" and p18.hasAlreadyErrored then
				return promise.reject({ hasAlreadyErrored = true })
			end
			p0:setState({ hasUploadError = true, isFetching = false })
			p0.fireAnalyticsEvent(failedGetContactsFromDevice, { failedStep = failedGetContactsFromDevice })
			p0.fireContactImportingTimeEvent({
				isSuccessfulUpload = false,
				failedStep = failedGetContactsFromDevice
			})
			
			return promise.reject({ hasAlreadyErrored = true })
		end)
		local failedFormatContactsFromDevice = eventNames.FailedFormatContactsFromDevice
		formatContactsFromDevice:andThen(p0.fireHasLoaded, function(p19) --[[ line: 108 ]]
			-- upvalues: promise (copy), p0 (copy), failedFormatContactsFromDevice (ref)
			if type(p19) == "table" and p19.hasAlreadyErrored then
				return promise.reject({ hasAlreadyErrored = true })
			end
			p0:setState({ hasUploadError = true, isFetching = false })
			p0.fireAnalyticsEvent(failedFormatContactsFromDevice, { failedStep = failedFormatContactsFromDevice })
			p0.fireContactImportingTimeEvent({
				isSuccessfulUpload = false,
				failedStep = failedFormatContactsFromDevice
			})
			
			return promise.reject({ hasAlreadyErrored = true })
		end):catch(p0.failedToUpload)
	end
	
	function p0.closeModal(p20) --[[ line: 342 ]]
		-- upvalues: p0 (ref), fFlagContactImporterIXPCleanup (copy), IXPVariantsModule (copy)
		p0.fireAnalyticsEvent(p20, {
			isLoading = if fFlagContactImporterIXPCleanup then p0.state.isFetching else p0.isFetching(p0.props.variant, IXPVariantsModule),
			loadingTime = if p0.state.isFetching then os.clock() - p0.startTime else nil
		})
		
		if p0.props.navigation then
			p0.props.navigation.pop()
			
			return
		elseif p0.props.onClose then
			p0.props.onClose()
		end
	end
	
	function p0.onAddFriendsActivated() --[[ line: 356 ]]
		-- upvalues: p0 (ref), enumScreens (copy)
		p0.props.navigation.replace(enumScreens.AddFriendsPage)
	end
	
	p0.isFetching = if fFlagContactImporterIXPCleanup then nil else function(p21, p22) --[[ line: 365 ]]
		-- upvalues: p0 (ref)
		return p21 == p22.BLENDED and p0.state.isFetching
	end
	
	function p0.openDiscoverabilityModal() --[[ line: 370 ]]
		-- upvalues: p0 (ref), enumScreens (copy), discoverabilityAnalytics (copy), constantsModule (copy), accessResponseEnum (copy), getFFlagFindFriendsClickedEventEnabledModule (copy), eventNames (copy), dash (copy)
		local navigation = p0.props.navigation
		navigation.replace(enumScreens.DiscoverabilityOverlay, {
			isStandaloneDiscoverabilityModal = true,
			entryPoint = discoverabilityAnalytics.EntryPoints.ContactsList,
			navigateOnActivated = function() --[[ line: 377 ]]
				-- upvalues: navigation (ref), enumScreens (copy), constantsModule (copy), p0 (copy)
				navigation.replace(enumScreens.ContactsList, {
					[constantsModule.SHOULD_UPDATE_USER_SETTINGS] = true,
					[constantsModule.IS_PHONE_VERIFIED] = p0.getPropOrParam(constantsModule.IS_PHONE_VERIFIED),
					openAmpUpsell = p0.getPropOrParam(constantsModule.OPEN_AMP_UPSELL),
					entryPoint = p0.entryPoint
				})
			end
		})
		local propOrParam = p0.getPropOrParam(constantsModule.OPEN_AMP_UPSELL)
		p0.openAmpUpsell = if propOrParam then function() --[[ line: 390 ]]
			-- upvalues: accessResponseEnum (copy), p0 (copy), getFFlagFindFriendsClickedEventEnabledModule (copy), eventNames (copy), propOrParam (ref), constantsModule (copy)
			local var25 = function(p23, _) --[[ line: 391 ]]
				-- upvalues: accessResponseEnum (copy), p0 (copy)
				if p23 == accessResponseEnum.Granted then
					p0.getContacts()
					p0.openDiscoverabilityModal()
				end
			end
			
			if getFFlagFindFriendsClickedEventEnabledModule() then
				p0.fireAnalyticsEvent(eventNames.FindFriendsButtonClicked)
			end
			propOrParam(constantsModule.SHOW_MATCHED_CONTACTS, var25)
		end else dash.noop
	end
end

function contactsListContainer.didMount(p24) --[[ line: 407 ]]
	p24.getContacts()
end

function contactsListContainer.render(p25) --[[ line: 411 ]]
	-- upvalues: fFlagContactImporterIXPCleanup (ref), roact (ref), contactsListModule (ref), IXPVariantsModule (ref), analyticsModule (ref)
	local props = p25.props
	
	return roact.createElement(contactsListModule, {
		deviceContacts = props.deviceContacts,
		matchedContacts = props.matchedContacts,
		isFetching = if fFlagContactImporterIXPCleanup then p25.state.isFetching else p25.isFetching(if fFlagContactImporterIXPCleanup then nil else props.variant, IXPVariantsModule),
		requestFriendship = p25.requestFriendship,
		screenSize = props.screenSize,
		hasUploadError = p25.state.hasUploadError,
		onAddFriendsActivated = p25.onAddFriendsActivated,
		closeModal = p25.closeModal,
		showAddFriendsButton = p25.entryPoint == analyticsModule.EntryPoints.HomePage,
		variant = if fFlagContactImporterIXPCleanup then nil else props.variant,
		openProfilePeekView = p25.props.openProfilePeekView,
		showMatchedContacts = p25.state.showMatchedContacts,
		openAmpUpsell = p25.openAmpUpsell
	})
end

return roactRodux.connect(contactsListMapStateToPropsModule, contactsListMapDispatchToPropsModule)(contactsListContainer)