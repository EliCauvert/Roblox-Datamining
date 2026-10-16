local ContactImporter = script:FindFirstAncestor("ContactImporter")
local DependenciesModule = require(ContactImporter.dependencies)
local RODUXKEY = require(ContactImporter.Common.Constants).RODUX_KEY
local NetworkStatus = DependenciesModule.RoduxNetworking.Enum.NetworkStatus
local NetworkingFriends = DependenciesModule.NetworkingFriends
local NetworkingContacts = DependenciesModule.NetworkingContacts
local Selectors = DependenciesModule.RoduxContacts.Selectors
local MemoizeFunction = DependenciesModule.memoize
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local GetDeviceContactsModule = require(script.Parent.getDeviceContacts)
local DecorateMatchedContactModule = require(script.Parent.decorateMatchedContact)

return function(p1) --[[ Line: 16 ]]
	-- upvalues: GetDeepValueFunction (copy), RODUXKEY (copy), MemoizeFunction (copy), GetDeviceContactsModule (copy), DecorateMatchedContactModule (copy), Selectors (copy), NetworkingFriends (copy), NetworkStatus (copy), NetworkingContacts (copy)
	local LocalUserId = p1.LocalUserId
	local DeepValue = GetDeepValueFunction(p1, RODUXKEY .. ".Contacts")
	
	return {
		localUserId = p1.LocalUserId,
		matchedContacts = DecorateMatchedContactModule(Selectors.sortContacts(p1), DeepValue),
		deviceContacts = MemoizeFunction(GetDeviceContactsModule)(DeepValue),
		screenSize = p1.ScreenSize,
		isFetching = NetworkingFriends.RequestFriendshipFromContactId.getStatus(p1, LocalUserId) == NetworkStatus.Fetching or (NetworkingContacts.FindContactFriends.getStatus(p1, LocalUserId) == NetworkStatus.Fetching or (NetworkingContacts.GetContactEntitiesByContactId.getStatus(p1, LocalUserId) == NetworkStatus.Fetching or NetworkingContacts.UploadContactsByUser.getStatus(p1, LocalUserId) == NetworkStatus.Fetching))
	}
end