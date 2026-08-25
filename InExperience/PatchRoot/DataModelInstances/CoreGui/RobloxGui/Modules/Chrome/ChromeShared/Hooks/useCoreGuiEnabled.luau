local starterGuiService = game:GetService("StarterGui")
local reactModule = require(game:GetService("CorePackages").Packages.React)

function useCoreGuiEnabled(p0)
	-- upvalues: reactModule (ref), starterGuiService (ref)
	local var2, var3 = reactModule.useState(starterGuiService:GetCoreGuiEnabled(p0))
	reactModule.useEffect(function()
		-- upvalues: starterGuiService (copy), p0 (ref), var3 (ref)
		local coreGuiChangedSignalConnection = starterGuiService.CoreGuiChangedSignal:Connect(function(p1, p2)
			-- upvalues: p0 (copy), var3 (copy)
			if p1 == p0 then
				var3(p2)
			end
		end)
		var3(starterGuiService:GetCoreGuiEnabled(p0))
		
		return function()
			-- upvalues: coreGuiChangedSignalConnection (ref)
			coreGuiChangedSignalConnection:Disconnect()
		end
	end, { p0 })
	
	return var2
end

return useCoreGuiEnabled