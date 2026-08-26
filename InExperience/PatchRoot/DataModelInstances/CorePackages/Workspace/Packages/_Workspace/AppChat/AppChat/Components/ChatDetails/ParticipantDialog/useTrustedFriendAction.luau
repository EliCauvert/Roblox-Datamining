local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getTrustedFriendActionModule = require(script.Parent.getTrustedFriendAction)

return function(value)
	-- upvalues: reactModule (ref), useLocalization (ref), getTrustedFriendActionModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3, var4 = reactModule.useState(0)
	local var5 = useLocalization({
		addTrustedFriendText = "Feature.Friends.TrustedFriend.Label.AddTrustedFriend",
		acceptTrustedFriendText = "Feature.Friends.TrustedFriend.AcceptTrustedRequest",
		removeTrustedFriendText = "Feature.Friends.TrustedFriend.Action.RemoveTrustedFriend",
		removeTrustedFriendToastText = "Feature.Friends.TrustedFriend.Toast.TrustedFriendRemoved"
	})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(function(p1)
			return p1 + 1
		end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: value (ref), var2 (ref), getTrustedFriendActionModule (copy)
		if value == "" then
			var2(nil)
			
			return
		end
		local var7 = true
		var2(nil)
		getTrustedFriendActionModule(value):andThen(function(p1)
			-- upvalues: var7 (write), var2 (copy)
			if var7 then
				var2(p1)
			end
		end):catch(function()
			-- upvalues: var7 (write), var2 (copy)
			if var7 then
				var2(nil)
			end
		end)
		
		return function()
			-- upvalues: var7 (write)
			var7 = false
		end
	end, { value, var3 })
	local var7 = if var1 ~= nil then nil else var1.actionType
	
	return {
		action = var1,
		actionText = if var7 == "RemoveTrustedConnection" then var5.removeTrustedFriendText elseif var7 == "AddIncomingTrustedConnection" then var5.acceptTrustedFriendText elseif var7 == "AddTrustedConnection" then var5.addTrustedFriendText else nil,
		toastText = var5.removeTrustedFriendToastText,
		refetch = var6
	}
end