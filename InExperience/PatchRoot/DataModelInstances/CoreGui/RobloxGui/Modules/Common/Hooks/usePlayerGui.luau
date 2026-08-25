local reactModule = require(game:GetService("CorePackages").Packages.React)
local useLocalPlayerModule = require(script.Parent.useLocalPlayer)

return function()
	-- upvalues: useLocalPlayerModule (ref), reactModule (ref)
	local var2 = useLocalPlayerModule()
	local var3, var4 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		local childAddedConnection = nil
		
		if var2 then
			var4(var2:FindFirstChildOfClass("PlayerGui"))
			childAddedConnection = var2.ChildAdded:Connect(function(p0)
				-- upvalues: var4 (copy)
				if p0:IsA("PlayerGui") then
					var4(p0)
				end
			end)
		end
		return function()
			-- upvalues: childAddedConnection (write)
			if childAddedConnection then
				childAddedConnection:Disconnect()
			end
		end
	end, { var2 })
	
	return var3
end