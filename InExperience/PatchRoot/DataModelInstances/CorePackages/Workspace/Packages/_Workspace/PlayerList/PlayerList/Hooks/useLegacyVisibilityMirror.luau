local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy)
		return SignalsModule.createSignal(p1)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult2 (copy), p1 (copy)
		UseMemoResult2(p1)
	end, { p1 })
	
	return UseMemoResult
end