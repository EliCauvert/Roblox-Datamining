local starterGuiService = game:GetService("StarterGui")
local reactModule = require(game:GetService("CorePackages").Packages.React)

function useCoreGuiEnabled(p1)
	-- upvalues: reactModule (ref), starterGuiService (ref)
	local var1, var2 = reactModule.useState(starterGuiService:GetCoreGuiEnabled(p1))
	reactModule.useEffect(function()
		-- upvalues: starterGuiService (copy), p1 (ref), var2 (ref)
		local coreGuiChangedSignalConnection = starterGuiService.CoreGuiChangedSignal:Connect(function(p2, p3)
			-- upvalues: p1 (copy), var2 (copy)
			if p2 == p1 then
				var2(p3)
			end
		end)
		var2(starterGuiService:GetCoreGuiEnabled(p1))
		
		return function()
			-- upvalues: coreGuiChangedSignalConnection (ref)
			coreGuiChangedSignalConnection:Disconnect()
		end
	end, { p1 })
	
	return var1
end

return useCoreGuiEnabled