local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local RODUX_KEY = require(contactImporter.Common.Constants).RODUX_KEY
local networkStatus = dependenciesModule.RoduxNetworking.Enum.NetworkStatus
local networkingFriends = dependenciesModule.NetworkingFriends
local networkingContacts = dependenciesModule.NetworkingContacts
local selectors = dependenciesModule.RoduxContacts.Selectors
local memoize = dependenciesModule.memoize
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local getDeviceContactsModule = require(script.Parent.getDeviceContacts)
local decorateMatchedContactModule = require(script.Parent.decorateMatchedContact)

return function(p0) --[[ line: 16 ]]
	-- upvalues: getDeepValue (ref), RODUX_KEY (ref), memoize (ref), getDeviceContactsModule (ref), decorateMatchedContactModule (ref), selectors (ref), networkingFriends (ref), networkStatus (ref), networkingContacts (ref)
	local localUserId = p0.LocalUserId
	local var4 = getDeepValue(p0, RODUX_KEY .. ".Contacts")
	
	return {
		localUserId = p0.LocalUserId,
		matchedContacts = decorateMatchedContactModule(selectors.sortContacts(p0), var4),
		deviceContacts = memoize(getDeviceContactsModule)(var4),
		screenSize = p0.ScreenSize,
		isFetching = if networkingFriends.RequestFriendshipFromContactId.getStatus(p0, localUserId) ~= networkStatus.Fetching then if networkingContacts.FindContactFriends.getStatus(p0, localUserId) ~= networkStatus.Fetching then if networkingContacts.GetContactEntitiesByContactId.getStatus(p0, localUserId) ~= networkStatus.Fetching then networkingContacts.UploadContactsByUser.getStatus(p0, localUserId) == networkStatus.Fetching else true else true else true
	}
end