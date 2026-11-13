return function()
	local t = {}
	local Count = 0
	local Count1 = 0
	local Count2 = 0
	local Flag = false
	
	return {
		push = function(p1)
			-- upvalues: Count1 (ref), t (copy), Flag (ref)
			Count1 += 1
			
			if t[Count1] ~= p1 then
				t[Count1] = p1
				Flag = true
			end
		end,
		finish = function(): number
			-- upvalues: Count1 (ref), Count (ref), t (copy), Flag (ref), Count2 (ref)
			if Count1 ~= Count then
				for i = Count, Count1 + 1, -1 do
					t[i] = nil
				end
				Count = Count1
				Flag = true
			end
			if Flag then
				Count2 += 1
			end
			Count1 = 0
			Flag = false
			
			return Count2
		end
	}
end