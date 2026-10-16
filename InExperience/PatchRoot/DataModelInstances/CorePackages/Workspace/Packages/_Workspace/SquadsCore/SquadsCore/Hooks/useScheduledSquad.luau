local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetScheduledSquadsStoreModule = require(SquadsCore.Stores.GetScheduledSquadsStore)
local _ = require(SquadsCore.Types)

return function(p1) --[[ Line: 12 | Named "useScheduledSquad" ]]
	-- upvalues: GetScheduledSquadsStoreModule (copy), ReactModule (copy), SignalsModule (copy)
	local ScheduledSquadsStoreModule = GetScheduledSquadsStoreModule(false)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 15 ]]
		-- upvalues: SignalsModule (upval), ScheduledSquadsStoreModule (copy), p1 (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 16 ]]
			-- upvalues: ScheduledSquadsStoreModule (upval), p1 (upval)
			return ScheduledSquadsStoreModule.getScheduledSquadsStatus(p2)[p1]
		end)
	end, { ScheduledSquadsStoreModule, p1 })
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 21 ]]
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult(false)
	end)
	ReactModule.useLayoutEffect(function() --[[ Line: 25 ]]
		-- upvalues: UseStateResult2 (copy), UseMemoResult (copy), SignalsModule (upval)
		UseStateResult2(UseMemoResult(false))
		
		return SignalsModule.createEffect(function(p2) --[[ Line: 27 ]]
			-- upvalues: UseStateResult2 (upval), UseMemoResult (upval)
			UseStateResult2(UseMemoResult(p2))
		end)
	end, { UseMemoResult })
	
	return UseStateResult
end