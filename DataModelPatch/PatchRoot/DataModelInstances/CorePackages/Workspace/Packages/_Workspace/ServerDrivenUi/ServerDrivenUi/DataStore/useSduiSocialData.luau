local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(Parent.SduiCoreSystem)

local function useFriendsInGame()
	-- upvalues: UseSelectorFunction (copy), ReactModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.LocalUserId
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		return p1.InGameUsersByGame
	end)
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult1 (copy), UseSelectorResult (copy)
		local t = {}
		
		for i, value in UseSelectorResult1 do
			local t1 = {}
			
			for i1, _ in value do
				if i1 ~= tostring(UseSelectorResult) then
					t1[i1] = i1
				end
			end
			if next(t1) then
				t[tostring(i)] = t1
			end
		end
		return t
	end, { UseSelectorResult, UseSelectorResult1 })
end

return function()
	-- upvalues: ReactModule (copy), SignalsModule (copy), useFriendsInGame (copy)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		return SignalsModule.createSignal({})
	end, {})
	UseMemoResult2((useFriendsInGame()))
	
	return ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy)
		return { getInGameFriendsByGame = UseMemoResult }
	end, { UseMemoResult })
end