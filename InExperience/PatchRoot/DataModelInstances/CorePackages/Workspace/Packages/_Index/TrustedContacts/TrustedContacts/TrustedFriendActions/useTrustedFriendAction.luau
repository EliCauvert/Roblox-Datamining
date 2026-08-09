local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local reactModule = require(trustedContacts.Parent.React)
local getTFActionModule = require(trustedContacts.Requests.getTFAction)
local _ = require(script.Parent.TFActionsEnum)

return function(value) --[[ line: 21 | named "useTrustedFriendAction" ]]
	-- upvalues: reactModule (ref), getTFActionModule (ref)
	local userId = value.userId
	local tokens = value.tokens
	local var3, var4 = reactModule.useState({ isLoading = true, enum = nil })
	reactModule.useEffect(function() --[[ line: 30 ]]
		-- upvalues: getTFActionModule (copy), userId (ref), tokens (ref), var4 (ref)
		getTFActionModule(userId, { friendRequestToken = tokens }):andThen(function(p0) --[[ line: 32 ]]
			-- upvalues: var4 (copy)
			var4({ isLoading = false, enum = p0 })
		end):catch(function(_) --[[ line: 38 ]]
			-- upvalues: var4 (copy)
			var4({ isLoading = false, enum = nil })
		end)
	end, { userId, tokens })
	
	return var3
end