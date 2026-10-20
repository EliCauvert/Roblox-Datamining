local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function(Current, p1, Callback, p2)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), Current (copy), UseRefResult (copy), p1 (copy), p2 (copy)
		local CallbackResult = Callback()
		
		if not CallbackResult then return end
		assert(CallbackResult, "")
		local Current1 = CallbackResult.current
		
		if not Current1 then return end
		if Current ~= UseRefResult.current then
			UseRefResult.current = Current
			Current1.CanvasPosition = Vector2.new(0, 0)
			
			return
		end
		if p1 and Current1 then
			Current1.CanvasPosition = Vector2.new(0, 0)
			
			return
		end
		if not p1 then
			Current1.CanvasPosition = Vector2.new(0, p2.current or 0)
		end
	end, { Current, p1, Callback, p2 })
end