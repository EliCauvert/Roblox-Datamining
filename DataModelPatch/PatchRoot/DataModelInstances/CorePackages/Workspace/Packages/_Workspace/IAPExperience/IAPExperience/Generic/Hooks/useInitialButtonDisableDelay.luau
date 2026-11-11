local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function(p1, p2)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Delay = p2 or UseTokensResult.Time.Time_300
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	ReactModule.useEffect(function()
		-- upvalues: Delay (copy), UseStateResult2 (copy)
		local Flag = false
		task.delay(Delay, function()
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if not Flag then
				UseStateResult2(false)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { Delay })
	
	return p1 or UseStateResult
end