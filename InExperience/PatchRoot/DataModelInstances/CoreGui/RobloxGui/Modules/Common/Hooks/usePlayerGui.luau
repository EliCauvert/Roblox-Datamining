local reactModule = require(game:GetService("CorePackages").Packages.React)
local useLocalPlayerModule = require(script.Parent.useLocalPlayer)

return function()
	-- upvalues: useLocalPlayerModule (ref), reactModule (ref)
	local var1 = useLocalPlayerModule()
	local var2, var3 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		local childAddedConnection = nil
		
		if var1 then
			var3(var1:FindFirstChildOfClass("PlayerGui"))
			childAddedConnection = var1.ChildAdded:Connect(function(p1)
				-- upvalues: var3 (copy)
				if p1:IsA("PlayerGui") then
					var3(p1)
				end
			end)
		end
		return function()
			-- upvalues: childAddedConnection (write)
			if childAddedConnection then
				childAddedConnection:Disconnect()
			end
		end
	end, { var1 })
	
	return var2
end