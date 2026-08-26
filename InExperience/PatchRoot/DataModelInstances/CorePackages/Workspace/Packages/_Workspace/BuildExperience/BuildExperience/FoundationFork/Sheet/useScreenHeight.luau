local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local reactModule = require(foundation.Parent.React)
local useScreenModule = require(foundation.Providers.Overlay.useScreen)

return function()
	-- upvalues: useScreenModule (ref), reactModule (ref)
	local var1 = useScreenModule()
	local var2, var3 = reactModule.useState(if var1 then var1.AbsoluteSize.Y else 0)
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		local var4 = nil
		
		if var1 then
			var3(var1.AbsoluteSize.Y)
			var4 = var1:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var3 (copy), var1 (copy)
				var3(var1.AbsoluteSize.Y)
			end)
		end
		return function()
			-- upvalues: var4 (write)
			if var4 then
				var4:Disconnect()
			end
		end
	end, { var1 })
	
	return var2
end