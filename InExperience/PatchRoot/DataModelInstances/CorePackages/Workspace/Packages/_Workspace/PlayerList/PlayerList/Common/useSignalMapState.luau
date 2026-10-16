local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.CoreScriptsRoactCommon)

return function(p1) --[[ Line: 10 | Named "useSignalMapState" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1)
	ReactModule.useLayoutEffect(function() --[[ Line: 13 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy), SignalsModule (upval)
		UseStateResult2(p1)
		
		return SignalsModule.createEffect(function(p2) --[[ Line: 15 ]]
			-- upvalues: p1 (upval), UseStateResult2 (upval)
			p1.getCount(p2)
			UseStateResult2(p1)
		end)
	end, { p1 })
	
	return UseStateResult
end