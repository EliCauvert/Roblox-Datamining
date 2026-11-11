local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UseLocalPlayerModule = require(script.Parent.useLocalPlayer)

return function()
	-- upvalues: UseLocalPlayerModule (copy), ReactModule (copy)
	local UseLocalPlayerModuleResult = UseLocalPlayerModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseLocalPlayerModuleResult (copy), UseStateResult2 (copy)
		local Connection = nil
		
		if UseLocalPlayerModuleResult then
			UseStateResult2(UseLocalPlayerModuleResult:FindFirstChildOfClass("PlayerGui"))
			Connection = UseLocalPlayerModuleResult.ChildAdded:Connect(function(Child)
				-- upvalues: UseStateResult2 (upval)
				if Child:IsA("PlayerGui") then
					UseStateResult2(Child)
				end
			end)
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UseLocalPlayerModuleResult })
	
	return UseStateResult
end