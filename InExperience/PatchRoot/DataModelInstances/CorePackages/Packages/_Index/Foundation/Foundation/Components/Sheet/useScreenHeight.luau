local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local useScreenModule = require(foundation.Providers.Overlay.useScreen)

return function()
	-- upvalues: useScreenModule (ref), reactModule (ref)
	local var3 = useScreenModule()
	local var4, var5 = reactModule.useState(if var3 then var3.AbsoluteSize.Y else 0)
	reactModule.useLayoutEffect(function()
		-- upvalues: var3 (ref), var5 (ref)
		local var6 = nil
		
		if var3 then
			var5(var3.AbsoluteSize.Y)
			var6 = var3:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var5 (copy), var3 (copy)
				var5(var3.AbsoluteSize.Y)
			end)
		end
		return function()
			-- upvalues: var6 (write)
			if var6 then
				var6:Disconnect()
			end
		end
	end, { var3 })
	
	return var4
end