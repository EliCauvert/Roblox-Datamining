local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(parent.SduiCoreSystem)

local function useFriendsInGame() --[[ line: 16 ]]
	-- upvalues: useSelector (ref), reactModule (ref)
	local var3 = useSelector(function(p0) --[[ line: 17 ]]
		return p0.LocalUserId
	end)
	local var4 = useSelector(function(p1) --[[ line: 21 ]]
		return p1.InGameUsersByGame
	end)
	
	return reactModule.useMemo(function() --[[ line: 25 ]]
		-- upvalues: var4 (ref), var3 (ref)
		local t = {}
		
		for i, v in var4 do
			local t_1 = {}
			
			for i_1, v_1 in v do
				if i_1 ~= tostring(var3) then
					t_1[i_1] = i_1
				end
			end
			if next(t_1) then
				t[tostring(i)] = t_1
			end
		end
		return t
	end, { var3, var4 })
end

return function() --[[ line: 43 | named "useSduiSocialData" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), useFriendsInGame (ref)
	local var7, var8 = reactModule.useMemo(function() --[[ line: 44 ]]
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal({})
	end, {})
	var8(useFriendsInGame())
	
	return reactModule.useMemo(function() --[[ line: 50 ]]
		-- upvalues: var7 (ref)
		return { getInGameFriendsByGame = var7 }
	end, { var7 })
end