local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local FriendRequestOriginSource = require(Parent.ApolloProfileInsights).Enums.FriendRequestOriginSource
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Icon = require(Parent.BuilderIcons).Icon
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagTFNonFriendsPermittedModule = require(TrustedContacts.Flags.FFlagTFNonFriendsPermitted)
local config = {
	mutualFriends = Icon.TwoPeople,
	friendshipAgeUnixSeconds = Icon.Calendar,
	qrCode = Icon.SquaresGridQr,
	search = Icon.MagnifyingGlass,
	contacts = Icon.SmartphonePortrait,
	accountCreationDateUnixSeconds = Icon.CircleI,
	localizedCountryName = Icon.GlobeDetailed,
	notAFriend = if FFlagTFNonFriendsPermittedModule then Icon.TriangleExclamation else nil,
	noMutualFriends = if FFlagTFNonFriendsPermittedModule then Icon.TriangleExclamation else nil
}

local function _(p1, PhoneContactImporter)
	-- upvalues: FriendRequestOriginSource (copy), config (copy)
	return if p1 == "friendRequestOriginSource" then config[if PhoneContactImporter == FriendRequestOriginSource.QrCode then "qrCode" elseif PhoneContactImporter == FriendRequestOriginSource.PhoneContactImporter then "contacts" elseif PhoneContactImporter == FriendRequestOriginSource.PlayerSearch then "search" else nil] else config[p1]
end

local function v10(p2, PhoneContactImporter, p3)
	-- upvalues: FriendRequestOriginSource (copy)
	local FromContacts = nil
	
	if p2 == "friendshipAgeUnixSeconds" then
		return p3.connectedDuration
	end
	if p2 ~= "friendRequestOriginSource" then
		if p2 ~= "mutualFriends" then
			if p2 == "localizedCountryName" then
				FromContacts = PhoneContactImporter
				
				return FromContacts
			end
			if p2 == "accountCreationDateUnixSeconds" then
				FromContacts = p3.joinedInYear
			end
		elseif #PhoneContactImporter > 1 then
			FromContacts = p3.mutualConnections
			
			return FromContacts
		elseif #PhoneContactImporter == 1 then
			FromContacts = p3.singularMutualConnection
			
			return FromContacts
		end
	elseif PhoneContactImporter == FriendRequestOriginSource.QrCode then
		FromContacts = p3.fromQrCode
		
		return FromContacts
	elseif PhoneContactImporter == FriendRequestOriginSource.PhoneContactImporter then
		FromContacts = p3.fromContacts
		
		return FromContacts
	elseif PhoneContactImporter == FriendRequestOriginSource.PlayerSearch then
		FromContacts = p3.fromSearch
		
		return FromContacts
	end
	return FromContacts
end

return function(PhoneContactImporters)
	-- upvalues: ReactModule (copy), FFlagConnectionsToFriendsRename (copy), LocalizationService (copy), UseLocalizationFunction (copy), FFlagTFNonFriendsPermittedModule (copy), FriendRequestOriginSource (copy), config (copy), v10 (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		singularMutualConnection = "Feature.Friends.Label.MutualFriendTitle",
		fromQrCode = "Feature.Friends.Description.FromQrCode",
		fromContacts = "Feature.Friends.Description.FromContacts",
		fromSearch = "Feature.PlayerSearchResults.Label.FromSearch",
		mutualConnections = {
			if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendsTitle" else "Feature.Friends.Label.MutualConnections",
			numConnections = PhoneContactImporters.mutualFriends and #PhoneContactImporters.mutualFriends or 0
		},
		joinedInYear = {
			"Feature.Friends.Label.JoinedInYear",
			year = DateTime.fromUnixTimestamp(PhoneContactImporters.accountCreationDateUnixSeconds or 0):FormatLocalTime("YYYY", LocalizationService.RobloxLocaleId)
		},
		connectedDuration = ReactModule.useMemo(function()
			-- upvalues: PhoneContactImporters (copy), FFlagConnectionsToFriendsRename (upval)
			if PhoneContactImporters.friendshipAgeUnixSeconds then
				local UnixTimestampDelta = DateTime.now().UnixTimestamp - PhoneContactImporters.friendshipAgeUnixSeconds or 0
				local Floored = math.floor(UnixTimestampDelta / 31536000)
				local Floored1 = math.floor(UnixTimestampDelta / 2592000)
				local Floored2 = math.floor(UnixTimestampDelta / 86400)
				
				return if Floored > 1 then { "Feature.Friends.Label.ConnectedNumYears", num = Floored } elseif Floored == 1 then "Feature.Friends.Label.ConnectedOneYear" elseif Floored1 > 1 then {
					"Feature.Friends.Label.ConnectedNumMonths",
					num = Floored1
				} elseif Floored1 == 1 then "Feature.Friends.Label.ConnectedOneMonth" elseif Floored2 > 1 then { "Feature.Friends.Label.ConnectedNumDays", num = Floored2 } elseif Floored2 == 1 then "Feature.Friends.Label.ConnectedOneDay" elseif FFlagConnectionsToFriendsRename then "Feature.Friends.Label.NewFriend" else "Feature.Friends.Label.NewConnection"
			else
				return nil
			end
		end, { PhoneContactImporters.friendshipAgeUnixSeconds }),
		notAFriend = if FFlagTFNonFriendsPermittedModule then "Feature.Friends.Description.NotAFriend" else nil,
		noMutualFriends = if FFlagTFNonFriendsPermittedModule then "Feature.Friends.Description.NoMutualFriends" else nil
	})
	local List = {}
	
	return ReactModule.useMemo(function()
		-- upvalues: PhoneContactImporters (copy), FriendRequestOriginSource (upval), config (upval), v10 (upval), UseLocalizationResult (copy), List (copy), FFlagTFNonFriendsPermittedModule (upval)
		for i, phoneContactImporter in PhoneContactImporters do
			local Entry = if i == "friendRequestOriginSource" then config[if phoneContactImporter == FriendRequestOriginSource.QrCode then "qrCode" elseif phoneContactImporter == FriendRequestOriginSource.PhoneContactImporter then "contacts" elseif phoneContactImporter == FriendRequestOriginSource.PlayerSearch then "search" else nil] else config[i]
			local Text = v10(i, phoneContactImporter, UseLocalizationResult)
			
			if Entry and Text then
				table.insert(List, { icon = Entry, text = Text })
			end
		end
		if FFlagTFNonFriendsPermittedModule then
			if PhoneContactImporters.friendshipAgeUnixSeconds == nil then
				table.insert(List, {
					icon = config.notAFriend,
					text = UseLocalizationResult.notAFriend
				})
			end
			if PhoneContactImporters.mutualFriends == nil or next(PhoneContactImporters.mutualFriends) == nil then
				table.insert(List, {
					icon = config.noMutualFriends,
					text = UseLocalizationResult.noMutualFriends
				})
			end
		end
		return List
	end, { UseLocalizationResult, PhoneContactImporters })
end