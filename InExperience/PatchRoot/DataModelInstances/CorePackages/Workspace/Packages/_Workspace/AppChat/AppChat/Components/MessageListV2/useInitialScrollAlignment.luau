local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)

return function(p1, p2, p3, p4)
	-- upvalues: ReactModule (copy), ViewRecyclerModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	
	if UseRefResult.current == nil and not p2 then
		UseRefResult.current = if p1 then ViewRecyclerModule.ScrollAlignment.Start else ViewRecyclerModule.ScrollAlignment.End
	end
	local Current = UseRefResult.current
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseRefResult1 (copy), Current (copy), ViewRecyclerModule (upval), p3 (copy)
		if p2 then
			UseRefResult1.current = false
			
			return
		end
		if UseRefResult1.current or Current ~= ViewRecyclerModule.ScrollAlignment.Start then return end
		local Current1 = p3.current
		
		if Current1 ~= nil then
			UseRefResult1.current = true
			Current1.scrollToStart()
			
			return
		end
	end, { p2, Current, p4 })
	
	return Current
end