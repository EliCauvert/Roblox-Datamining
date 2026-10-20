local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(MomentsCommon.Media.MediaTypes)

return function(p1, p2)
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), p1 (copy), UseStateResult2 (copy), SignalsModule (upval)
		if not p2 or p1 == nil then return end
		UseStateResult2(false)
		local Flag = false
		local Callback = nil
		Callback = SignalsModule.createEffect(function(p3)
			-- upvalues: p1 (upval), Flag (ref), UseStateResult2 (upval), Callback (ref)
			if p1.getPosition(p3) > 0 and not Flag then
				Flag = true
				UseStateResult2(true)
				task.defer(function()
					-- upvalues: Callback (upval)
					if Callback ~= nil then
						Callback()
					end
				end)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref), Callback (ref)
			Flag = true
			
			if Callback ~= nil then
				Callback()
			end
		end
	end, { p1, p2 })
	
	return UseStateResult
end