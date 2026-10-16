local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetTrustedFriendActionModule = require(script.Parent.getTrustedFriendAction)

return function(p1) --[[ Line: 23 | Named "useTrustedFriendAction" ]]
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), GetTrustedFriendActionModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseLocalizationResult = UseLocalizationFunction({
		addTrustedFriendText = "Feature.Friends.TrustedFriend.Label.AddTrustedFriend",
		acceptTrustedFriendText = "Feature.Friends.TrustedFriend.AcceptTrustedRequest",
		removeTrustedFriendText = "Feature.Friends.TrustedFriend.Action.RemoveTrustedFriend",
		removeTrustedFriendToastText = "Feature.Friends.TrustedFriend.Toast.TrustedFriendRemoved"
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 35 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(function(p2: number): number --[[ Line: 36 ]]
			return p2 + 1
		end)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 41 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), GetTrustedFriendActionModule (upval)
		if p1 == "" then
			UseStateResult2(nil)
			
			return
		end
		local Flag = true
		UseStateResult2(nil)
		GetTrustedFriendActionModule(p1):andThen(function(Result) --[[ Line: 54 ]]
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if Flag then
				UseStateResult2(Result)
			end
		end):catch(function() --[[ Line: 59 ]]
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if Flag then
				UseStateResult2(nil)
			end
		end)
		
		return function() --[[ Line: 65 ]]
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, { p1, UseStateResult1 })
	local ActionType = if UseStateResult == nil then nil else UseStateResult.actionType
	
	return {
		action = UseStateResult,
		actionText = if ActionType == "RemoveTrustedConnection" then UseLocalizationResult.removeTrustedFriendText elseif ActionType == "AddIncomingTrustedConnection" then UseLocalizationResult.acceptTrustedFriendText elseif ActionType == "AddTrustedConnection" then UseLocalizationResult.addTrustedFriendText else nil,
		toastText = UseLocalizationResult.removeTrustedFriendToastText,
		refetch = UseResult
	}
end