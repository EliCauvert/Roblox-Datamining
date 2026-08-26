local reactModule = require(game:GetService("CorePackages").Packages.React)
local usePlayerGuiModule = require(script.Parent.usePlayerGui)

return function()
	-- upvalues: usePlayerGuiModule (ref), reactModule (ref)
	local var1 = usePlayerGuiModule()
	local var2, var3 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		local var4 = nil
		
		if var1 then
			var3(var1.CurrentScreenOrientation)
			var4 = var1:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function()
				-- upvalues: var3 (copy), var1 (copy)
				var3(var1.CurrentScreenOrientation)
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