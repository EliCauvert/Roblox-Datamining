local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getTrustedFriendActionModule = require(script.Parent.getTrustedFriendAction)

return function(value) --[[ line: 23 | named "useTrustedFriendAction" ]]
	-- upvalues: reactModule (ref), useLocalization (ref), getTrustedFriendActionModule (ref)
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(0)
	local var6 = useLocalization({
		addTrustedFriendText = "Feature.Friends.TrustedFriend.Label.AddTrustedFriend",
		acceptTrustedFriendText = "Feature.Friends.TrustedFriend.AcceptTrustedRequest",
		removeTrustedFriendText = "Feature.Friends.TrustedFriend.Action.RemoveTrustedFriend",
		removeTrustedFriendToastText = "Feature.Friends.TrustedFriend.Toast.TrustedFriendRemoved"
	})
	local var7 = reactModule.useCallback(function() --[[ line: 35 ]]
		-- upvalues: var5 (ref)
		var5(function(p0) --[[ line: 36 ]]
			return p0 + 1
		end)
	end, {})
	reactModule.useEffect(function() --[[ line: 41 ]]
		-- upvalues: value (ref), var3 (ref), getTrustedFriendActionModule (copy)
		if value == "" then
			var3(nil)
			
			return
		end
		local var9 = true
		var3(nil)
		getTrustedFriendActionModule(value):andThen(function(p1) --[[ line: 54 ]]
			-- upvalues: var9 (write), var3 (copy)
			if var9 then
				var3(p1)
			end
		end):catch(function() --[[ line: 59 ]]
			-- upvalues: var9 (write), var3 (copy)
			if var9 then
				var3(nil)
			end
		end)
		
		return function() --[[ line: 65 ]]
			-- upvalues: var9 (write)
			var9 = false
		end
	end, { value, var4 })
	local var8 = if var2 ~= nil then nil else var2.actionType
	
	return {
		action = var2,
		actionText = if var8 == "RemoveTrustedConnection" then var6.removeTrustedFriendText elseif var8 == "AddIncomingTrustedConnection" then var6.acceptTrustedFriendText elseif var8 == "AddTrustedConnection" then var6.addTrustedFriendText else nil,
		toastText = var6.removeTrustedFriendToastText,
		refetch = var7
	}
end