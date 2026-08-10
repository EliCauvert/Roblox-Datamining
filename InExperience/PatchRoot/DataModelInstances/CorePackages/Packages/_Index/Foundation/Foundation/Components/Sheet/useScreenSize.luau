local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local useScreenModule = require(foundation.Providers.Overlay.useScreen)

return function() --[[ line: 7 | named "useScreenSize" ]]
	-- upvalues: useScreenModule (ref), reactModule (ref)
	local var3 = useScreenModule()
	local var4, var5 = reactModule.useState(if var3 then var3.AbsoluteSize else Vector2.new(0, 0))
	reactModule.useLayoutEffect(function() --[[ line: 11 ]]
		-- upvalues: var3 (ref), var5 (ref)
		local var6 = nil
		
		if var3 then
			var5(var3.AbsoluteSize)
			var6 = var3:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 16 ]]
				-- upvalues: var5 (copy), var3 (copy)
				var5(var3.AbsoluteSize)
			end)
		end
		return function() --[[ line: 21 ]]
			-- upvalues: var6 (write)
			if var6 then
				var6:Disconnect()
			end
		end
	end, { var3 })
	
	return var4
end