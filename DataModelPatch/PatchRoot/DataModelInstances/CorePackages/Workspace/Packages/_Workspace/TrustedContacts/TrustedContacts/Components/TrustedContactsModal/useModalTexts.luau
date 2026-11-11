local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TrustedConnectionStatus = require(TrustedContacts.Enums).TrustedConnectionStatus

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), TrustedConnectionStatus (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		addTFHeader = "Feature.Friends.TrustedFriend.Label.AddTrustedFriend",
		addTFBody = "Feature.Friends.Description.DoMoreWithTrustedFriends",
		acceptTFHeader = "Feature.Friends.TrustedFriend.AddBack.Header",
		acceptTFBody = "Feature.Friends.Description.TrustedFriendsRequestModalBody",
		newTFHeader = "Feature.Friends.TrustedFriend.Info.Modal.Header",
		newTFBody = "Feature.Friends.Description.YouCanDoMoreWithTrustedFriends"
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: TrustedConnectionStatus (upval), UseLocalizationResult (copy)
		return {
			[TrustedConnectionStatus.Friends] = {
				header = UseLocalizationResult.addTFHeader,
				description = UseLocalizationResult.addTFBody
			},
			[TrustedConnectionStatus.RequestReceived] = {
				header = UseLocalizationResult.acceptTFHeader,
				description = UseLocalizationResult.acceptTFBody
			},
			[TrustedConnectionStatus.TrustedFriends] = {
				header = UseLocalizationResult.newTFHeader,
				description = UseLocalizationResult.newTFBody
			}
		}
	end, { UseLocalizationResult })
	local UseMemoResultEntry = if p1 then UseMemoResult[p1] else nil
	
	return {
		header = if UseMemoResultEntry then UseMemoResultEntry.header else "",
		description = if UseMemoResultEntry then UseMemoResultEntry.description else ""
	}
end