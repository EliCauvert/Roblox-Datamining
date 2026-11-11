local ReactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)

return function(p1: number, p2, p3, p4)
	-- upvalues: ReactModule (copy)
	local v1 = p2 ~= nil
	local Largest = math.max(1, p3 or 1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): number
		-- upvalues: v1 (copy), p1 (copy), p2 (copy)
		return if v1 then math.min(math.max(0, p2), p1) else p1
	end)
	local Smallest = if v1 then math.min(UseStateResult, p1) else p1
	local IsSmallestBelow: boolean = v1 and Smallest < p1
	ReactModule.useEffect(function()
		-- upvalues: IsSmallestBelow (copy), UseStateResult2 (copy), Largest (copy), p4 (copy)
		if not IsSmallestBelow then
			return nil
		end
		local Flag = nil
		
		local function advance()
			-- upvalues: Flag (ref), UseStateResult2 (upval), Largest (upval)
			if not Flag then
				UseStateResult2(function(p5)
					-- upvalues: Largest (upval)
					return p5 + Largest
				end)
				
				return
			end
		end
		
		if p4 and p4 > 0 then
			task.delay(p4 / 1000, advance)
		else
			task.defer(advance)
		end
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { IsSmallestBelow, Largest, UseStateResult, p4 })
	
	return Smallest, IsSmallestBelow
end