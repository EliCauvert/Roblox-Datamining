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

local _ = function(p0, p1)
	-- upvalues: friendRequestOriginSource (ref), t (ref)
	if p0 ~= "friendRequestOriginSource" then
		return t[p0]
	end
	local var6 = nil
	
	if p1 == friendRequestOriginSource.QrCode then
		var6 = "qrCode"
	elseif p1 == friendRequestOriginSource.PhoneContactImporter then
		var6 = "contacts"
	elseif p1 == friendRequestOriginSource.PlayerSearch then
		var6 = "search"
	end
	return t[var6]
end

local var5 = function(p2, p3, p4)
	-- upvalues: friendRequestOriginSource (ref)
	local joinedInYear = nil
	
	if p2 == "friendshipAgeUnixSeconds" then
		return p4.connectedDuration
	elseif p2 == "friendRequestOriginSource" then
		if p3 == friendRequestOriginSource.QrCode then
			joinedInYear = p4.fromQrCode
			
			return joinedInYear
		elseif p3 == friendRequestOriginSource.PhoneContactImporter then
			joinedInYear = p4.fromContacts
			
			return joinedInYear
		elseif p3 == friendRequestOriginSource.PlayerSearch then
			joinedInYear = p4.fromSearch
			
			return joinedInYear
		end
	elseif p2 == "mutualFriends" then
		if #p3 > 1 then
			joinedInYear = p4.mutualConnections
			
			return joinedInYear
		elseif #p3 == 1 then
			joinedInYear = p4.singularMutualConnection
			
			return joinedInYear
		end
	elseif p2 == "localizedCountryName" then
		joinedInYear = p3
		
		return joinedInYear
	elseif p2 == "accountCreationDateUnixSeconds" then
		joinedInYear = p4.joinedInYear
	end
	return joinedInYear
end

return function(p5)
	-- upvalues: reactModule (ref), fFlagConnectionsToFriendsRename (ref), localizationService (ref), useLocalization (ref), fFlagTFNonFriendsPermittedModule (ref), friendRequestOriginSource (ref), t (ref), var5 (ref)
	local var7 = useLocalization({
		singularMutualConnection = "Feature.Friends.Label.MutualFriendTitle",
		fromQrCode = "Feature.Friends.Description.FromQrCode",
		fromContacts = "Feature.Friends.Description.FromContacts",
		fromSearch = "Feature.PlayerSearchResults.Label.FromSearch",
		mutualConnections = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendsTitle" else "Feature.Friends.Label.MutualConnections",
			numConnections = if p5.mutualFriends then #p5.mutualFriends else 0
		},
		joinedInYear = {
			"Feature.Friends.Label.JoinedInYear",
			year = DateTime.fromUnixTimestamp(p5.accountCreationDateUnixSeconds or 0):FormatLocalTime("YYYY", localizationService.RobloxLocaleId)
		},
		connectedDuration = reactModule.useMemo(function()
			-- upvalues: p5 (ref), fFlagConnectionsToFriendsRename (copy)
			if not p5.friendshipAgeUnixSeconds then
				return nil
			end
			local var9 = DateTime.now().UnixTimestamp - p5.friendshipAgeUnixSeconds or 0
			local floored = math.floor(var9 / 31536000)
			local floored_1 = math.floor(var9 / 2592000)
			local floored_2 = math.floor(var9 / 86400)
			local _ = nil
			
			return if floored > 1 then { "Feature.Friends.Label.ConnectedNumYears", num = floored } elseif floored == 1 then "Feature.Friends.Label.ConnectedOneYear" elseif floored_1 > 1 then {
				"Feature.Friends.Label.ConnectedNumMonths",
				num = floored_1
			} elseif floored_1 == 1 then "Feature.Friends.Label.ConnectedOneMonth" elseif floored_2 > 1 then {
				"Feature.Friends.Label.ConnectedNumDays",
				num = floored_2
			} elseif floored_2 == 1 then "Feature.Friends.Label.ConnectedOneDay" elseif fFlagConnectionsToFriendsRename then "Feature.Friends.Label.NewFriend" else "Feature.Friends.Label.NewConnection"
		end, { p5.friendshipAgeUnixSeconds }),
		notAFriend = if fFlagTFNonFriendsPermittedModule then "Feature.Friends.Description.NotAFriend" else nil,
		noMutualFriends = if fFlagTFNonFriendsPermittedModule then "Feature.Friends.Description.NoMutualFriends" else nil
	})
	local t_1 = {}
	
	return reactModule.useMemo(function()
		-- upvalues: p5 (ref), friendRequestOriginSource (copy), t (copy), var5 (copy), var7 (ref), t_1 (ref), fFlagTFNonFriendsPermittedModule (copy)
		for i, v in p5 do
			local var14
			if i ~= "friendRequestOriginSource" then
				var14 = t[i]
				local var15 = var5(i, v, var7)
				
				if var14 and var15 then
					table.insert(t_1, { icon = var14, text = var15 })
				end
			end
			local var13 = nil
			
			if v == friendRequestOriginSource.QrCode then
				var13 = "qrCode"
			elseif v == friendRequestOriginSource.PhoneContactImporter then
				var13 = "contacts"
			elseif v == friendRequestOriginSource.PlayerSearch then
				var13 = "search"
			end
			var14 = t[var13]
		end
		if fFlagTFNonFriendsPermittedModule then
			if p5.friendshipAgeUnixSeconds == nil then
				table.insert(t_1, { icon = t.notAFriend, text = var7.notAFriend })
			end
			if p5.mutualFriends == nil or next(p5.mutualFriends) == nil then
				table.insert(t_1, { icon = t.noMutualFriends, text = var7.noMutualFriends })
			end
		end
		return t_1
	end, { var7, p5 })
end