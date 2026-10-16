local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore

local function v3(p1, p2): boolean --[[ Line: 16 ]]
	return p1 == p2
end

return function(Callback, p1) --[[ Line: 20 | Named "useSelectorSignal" ]]
	-- upvalues: UseStoreFunction (copy), ReactModule (copy), SignalsModule (copy), v3 (copy)
	local UseStoreResult = UseStoreFunction()
	local State = UseStoreResult:getState()
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 24 ]]
		-- upvalues: SignalsModule (upval), State (copy)
		return SignalsModule.createSignal(State)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 28 ]]
		-- upvalues: UseStoreResult (copy), UseMemoResult2 (copy)
		UseMemoResult2((UseStoreResult:getState()))
		local ChangedConnection = UseStoreResult.changed:connect(UseMemoResult2)
		
		return function() --[[ Line: 32 ]]
			-- upvalues: ChangedConnection (copy)
			ChangedConnection:disconnect()
		end
	end, { UseStoreResult })
	
	return ReactModule.useMemo(function() --[[ Line: 37 ]]
		-- upvalues: SignalsModule (upval), Callback (copy), UseMemoResult (copy), p1 (copy), v3 (upval)
		return SignalsModule.createComputed(function(p2) --[[ Line: 38 ]]
			-- upvalues: Callback (upval), UseMemoResult (upval)
			return Callback(UseMemoResult(p2))
		end, p1 or v3)
	end, { UseMemoResult, Callback, p1 })
end