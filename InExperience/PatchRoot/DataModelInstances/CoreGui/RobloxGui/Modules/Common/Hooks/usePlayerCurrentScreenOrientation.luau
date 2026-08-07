local reactModule = require(game:GetService("CorePackages").Packages.React)
local usePlayerGuiModule = require(script.Parent.usePlayerGui)

return function() --[[ line: 5 | named "usePlayerCurrentScreenOrientation" ]]
	-- upvalues: usePlayerGuiModule (ref), reactModule (ref)
	local var2 = usePlayerGuiModule()
	local var3, var4 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 9 ]]
		-- upvalues: var2 (ref), var4 (ref)
		local var5 = nil
		
		if var2 then
			var4(var2.CurrentScreenOrientation)
			var5 = var2:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function() --[[ line: 15 ]]
				-- upvalues: var4 (copy), var2 (copy)
				var4(var2.CurrentScreenOrientation)
			end)
		end
		return function() --[[ line: 20 ]]
			-- upvalues: var5 (write)
			if var5 then
				var5:Disconnect()
			end
		end
	end, { var2 })
	
	return var3
end