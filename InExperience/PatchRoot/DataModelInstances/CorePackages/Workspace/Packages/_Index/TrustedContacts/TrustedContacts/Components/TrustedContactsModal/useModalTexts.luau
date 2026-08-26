local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local trustedConnectionStatus = require(trustedContacts.Enums).TrustedConnectionStatus

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), trustedConnectionStatus (ref)
	local var1 = useLocalization({
		addTFHeader = "Feature.Friends.TrustedFriend.Label.AddTrustedFriend",
		addTFBody = "Feature.Friends.Description.DoMoreWithTrustedFriends",
		acceptTFHeader = "Feature.Friends.TrustedFriend.AddBack.Header",
		acceptTFBody = "Feature.Friends.Description.TrustedFriendsRequestModalBody",
		newTFHeader = "Feature.Friends.TrustedFriend.Info.Modal.Header",
		newTFBody = "Feature.Friends.Description.YouCanDoMoreWithTrustedFriends"
	})
	local var2 = if p1 then reactModule.useMemo(function()
		-- upvalues: trustedConnectionStatus (copy), var1 (ref)
		return {
			[trustedConnectionStatus.Friends] = { header = var1.addTFHeader, description = var1.addTFBody },
			[trustedConnectionStatus.RequestReceived] = {
				header = var1.acceptTFHeader,
				description = var1.acceptTFBody
			},
			[trustedConnectionStatus.TrustedFriends] = { header = var1.newTFHeader, description = var1.newTFBody }
		}
	end, { var1 })[p1] else nil
	
	return {
		header = if var2 then var2.header else "",
		description = if var2 then var2.description else ""
	}
end