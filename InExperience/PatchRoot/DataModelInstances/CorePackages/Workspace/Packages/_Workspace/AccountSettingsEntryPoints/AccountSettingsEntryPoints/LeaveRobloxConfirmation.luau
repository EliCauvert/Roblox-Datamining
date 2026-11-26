local Parent = script.Parent
local v1 = nil

return {
	register = function(p1)
		-- upvalues: v1 (ref)
		v1 = p1
		
		return function()
			-- upvalues: v1 (upval), p1 (copy)
			if v1 == p1 then
				v1 = nil
			end
		end
	end,
	confirm = function(p1, p2)
		-- upvalues: v1 (ref), Parent (copy)
		(v1 or require(Parent.LeaveRobloxDialogPresenter).show)(p1, p2)
	end
}