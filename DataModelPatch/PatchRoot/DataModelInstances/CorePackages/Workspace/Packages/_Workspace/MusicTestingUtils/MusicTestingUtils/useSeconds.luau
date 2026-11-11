local ReactModule = require(script:FindFirstAncestor("MusicTestingUtils").Parent.React)
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect

return function()
	-- upvalues: UseStateFunction (copy), UseEffectFunction (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	UseEffectFunction(function()
		-- upvalues: UseStateResult2 (copy)
		local Flag = true
		task.spawn(function()
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			while Flag do
				task.wait(1)
				UseStateResult2(function(p1: number): number
					return p1 + 1
				end)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, {})
	
	return UseStateResult
end