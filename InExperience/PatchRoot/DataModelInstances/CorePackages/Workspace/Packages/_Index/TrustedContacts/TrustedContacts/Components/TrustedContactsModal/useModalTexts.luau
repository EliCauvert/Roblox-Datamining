local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local trustedConnectionStatus = require(trustedContacts.Enums).TrustedConnectionStatus

return function(p0) --[[ line: 14 | named "useModalTexts" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), trustedConnectionStatus (ref)
	local var2 = useLocalization({
		addTFHeader = "Feature.Friends.TrustedFriend.Label.AddTrustedFriend",
		addTFBody = "Feature.Friends.Description.DoMoreWithTrustedFriends",
		acceptTFHeader = "Feature.Friends.TrustedFriend.AddBack.Header",
		acceptTFBody = "Feature.Friends.Description.TrustedFriendsRequestModalBody",
		newTFHeader = "Feature.Friends.TrustedFriend.Info.Modal.Header",
		newTFBody = "Feature.Friends.Description.YouCanDoMoreWithTrustedFriends"
	})
	local var3 = if p0 then reactModule.useMemo(function() --[[ line: 24 ]]
		-- upvalues: trustedConnectionStatus (copy), var2 (ref)
		return {
			[trustedConnectionStatus.Friends] = { header = var2.addTFHeader, description = var2.addTFBody },
			[trustedConnectionStatus.RequestReceived] = {
				header = var2.acceptTFHeader,
				description = var2.acceptTFBody
			},
			[trustedConnectionStatus.TrustedFriends] = { header = var2.newTFHeader, description = var2.newTFBody }
		}
	end, { var2 })[p0] else nil
	
	return {
		header = if var3 then var3.header else "",
		description = if var3 then var3.description else ""
	}
end