local FriendRequestOriginSource = require(script:FindFirstAncestor("ProfileInsights").Enums).FriendRequestOriginSource

return function(PhoneContactImporter, p1)
	-- upvalues: FriendRequestOriginSource (copy)
	return if PhoneContactImporter == FriendRequestOriginSource.QrCode then p1.fromQrCode elseif PhoneContactImporter == FriendRequestOriginSource.PhoneContactImporter then p1.fromContacts elseif PhoneContactImporter == FriendRequestOriginSource.PlayerSearch then p1.fromSearch else nil
end