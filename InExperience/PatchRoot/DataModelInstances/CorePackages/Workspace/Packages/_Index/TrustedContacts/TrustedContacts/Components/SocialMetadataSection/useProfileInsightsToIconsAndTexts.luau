local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local friendRequestOriginSource = require(parent.ApolloProfileInsights).Enums.FriendRequestOriginSource
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local icon = require(parent.BuilderIcons).Icon
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagTFNonFriendsPermittedModule = require(trustedContacts.Flags.FFlagTFNonFriendsPermitted)
local t = {
	mutualFriends = icon.TwoPeople,
	friendshipAgeUnixSeconds = icon.Calendar,
	qrCode = icon.SquaresGridQr,
	search = icon.MagnifyingGlass,
	contacts = icon.SmartphonePortrait,
	accountCreationDateUnixSeconds = icon.CircleI,
	localizedCountryName = icon.GlobeDetailed,
	notAFriend = if fFlagTFNonFriendsPermittedModule then icon.TriangleExclamation else nil,
	noMutualFriends = if fFlagTFNonFriendsPermittedModule then icon.TriangleExclamation else nil
}

local _ = function(p1, p2)
	-- upvalues: friendRequestOriginSource (ref), t (ref)
	if p1 ~= "friendRequestOriginSource" then
		return t[p1]
	end
	local var1 = nil
	
	if p2 == friendRequestOriginSource.QrCode then
		var1 = "qrCode"
	elseif p2 == friendRequestOriginSource.PhoneContactImporter then
		var1 = "contacts"
	elseif p2 == friendRequestOriginSource.PlayerSearch then
		var1 = "search"
	end
	return t[var1]
end

local var1 = function(p1, p2, p3)
	-- upvalues: friendRequestOriginSource (ref)
	local joinedInYear = nil
	
	if p1 == "friendshipAgeUnixSeconds" then
		return p3.connectedDuration
	elseif p1 == "friendRequestOriginSource" then
		if p2 == friendRequestOriginSource.QrCode then
			joinedInYear = p3.fromQrCode
			
			return joinedInYear
		elseif p2 == friendRequestOriginSource.PhoneContactImporter then
			joinedInYear = p3.fromContacts
			
			return joinedInYear
		elseif p2 == friendRequestOriginSource.PlayerSearch then
			joinedInYear = p3.fromSearch
			
			return joinedInYear
		end
	elseif p1 == "mutualFriends" then
		if #p2 > 1 then
			joinedInYear = p3.mutualConnections
			
			return joinedInYear
		elseif #p2 == 1 then
			joinedInYear = p3.singularMutualConnection
			
			return joinedInYear
		end
	elseif p1 == "localizedCountryName" then
		joinedInYear = p2
		
		return joinedInYear
	elseif p1 == "accountCreationDateUnixSeconds" then
		joinedInYear = p3.joinedInYear
	end
	return joinedInYear
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagConnectionsToFriendsRename (ref), localizationService (ref), useLocalization (ref), fFlagTFNonFriendsPermittedModule (ref), friendRequestOriginSource (ref), t (ref), var1 (ref)
	local var2 = useLocalization({
		singularMutualConnection = "Feature.Friends.Label.MutualFriendTitle",
		fromQrCode = "Feature.Friends.Description.FromQrCode",
		fromContacts = "Feature.Friends.Description.FromContacts",
		fromSearch = "Feature.PlayerSearchResults.Label.FromSearch",
		mutualConnections = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendsTitle" else "Feature.Friends.Label.MutualConnections",
			numConnections = if p1.mutualFriends then #p1.mutualFriends else 0
		},
		joinedInYear = {
			"Feature.Friends.Label.JoinedInYear",
			year = DateTime.fromUnixTimestamp(p1.accountCreationDateUnixSeconds or 0):FormatLocalTime("YYYY", localizationService.RobloxLocaleId)
		},
		connectedDuration = reactModule.useMemo(function()
			-- upvalues: p1 (ref), fFlagConnectionsToFriendsRename (copy)
			if not p1.friendshipAgeUnixSeconds then
				return nil
			end
			local var3 = DateTime.now().UnixTimestamp - p1.friendshipAgeUnixSeconds or 0
			local floored = math.floor(var3 / 31536000)
			local floored_1 = math.floor(var3 / 2592000)
			local floored_2 = math.floor(var3 / 86400)
			local _ = nil
			
			return if floored > 1 then { "Feature.Friends.Label.ConnectedNumYears", num = floored } elseif floored == 1 then "Feature.Friends.Label.ConnectedOneYear" elseif floored_1 > 1 then {
				"Feature.Friends.Label.ConnectedNumMonths",
				num = floored_1
			} elseif floored_1 == 1 then "Feature.Friends.Label.ConnectedOneMonth" elseif floored_2 > 1 then {
				"Feature.Friends.Label.ConnectedNumDays",
				num = floored_2
			} elseif floored_2 == 1 then "Feature.Friends.Label.ConnectedOneDay" elseif fFlagConnectionsToFriendsRename then "Feature.Friends.Label.NewFriend" else "Feature.Friends.Label.NewConnection"
		end, { p1.friendshipAgeUnixSeconds }),
		notAFriend = if fFlagTFNonFriendsPermittedModule then "Feature.Friends.Description.NotAFriend" else nil,
		noMutualFriends = if fFlagTFNonFriendsPermittedModule then "Feature.Friends.Description.NoMutualFriends" else nil
	})
	local t_1 = {}
	
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), friendRequestOriginSource (copy), t (copy), var1 (copy), var2 (ref), t_1 (ref), fFlagTFNonFriendsPermittedModule (copy)
		for i, v in p1 do
			local var3
			if i ~= "friendRequestOriginSource" then
				var3 = t[i]
				local var4 = var1(i, v, var2)
				
				if var3 and var4 then
					table.insert(t_1, { icon = var3, text = var4 })
				end
			end
			local var5 = nil
			
			if v == friendRequestOriginSource.QrCode then
				var5 = "qrCode"
			elseif v == friendRequestOriginSource.PhoneContactImporter then
				var5 = "contacts"
			elseif v == friendRequestOriginSource.PlayerSearch then
				var5 = "search"
			end
			var3 = t[var5]
		end
		if fFlagTFNonFriendsPermittedModule then
			if p1.friendshipAgeUnixSeconds == nil then
				table.insert(t_1, { icon = t.notAFriend, text = var2.notAFriend })
			end
			if p1.mutualFriends == nil or next(p1.mutualFriends) == nil then
				table.insert(t_1, { icon = t.noMutualFriends, text = var2.noMutualFriends })
			end
		end
		return t_1
	end, { var2, p1 })
end