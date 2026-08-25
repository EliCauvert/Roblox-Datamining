local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local reactModule = require(foundation.Parent.React)
local useScreenModule = require(foundation.Providers.Overlay.useScreen)

return function()
	-- upvalues: useScreenModule (ref), reactModule (ref)
	local var2 = useScreenModule()
	local var3, var4 = reactModule.useState(if var2 then var2.AbsoluteSize else Vector2.new(0, 0))
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		local var5 = nil
		
		if var2 then
			var4(var2.AbsoluteSize)
			var5 = var2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var4 (copy), var2 (copy)
				var4(var2.AbsoluteSize)
			end)
		end
		return function()
			-- upvalues: var5 (write)
			if var5 then
				var5:Disconnect()
			end
		end
	end, { var2 })
	
	return var3
end