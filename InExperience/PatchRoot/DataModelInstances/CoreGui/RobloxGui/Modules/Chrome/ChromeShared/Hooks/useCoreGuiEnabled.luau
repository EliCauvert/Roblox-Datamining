local StarterGui = game:GetService("StarterGui")
local ReactModule = require(game:GetService("CorePackages").Packages.React)

function useCoreGuiEnabled(CoreGuiType) --[[ Line: 5 ]]
	-- upvalues: ReactModule (copy), StarterGui (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(StarterGui:GetCoreGuiEnabled(CoreGuiType))
	ReactModule.useEffect(function() --[[ Line: 7 ]]
		-- upvalues: StarterGui (upval), CoreGuiType (copy), UseStateResult2 (copy)
		local CoreGuiChangedSignalConnection = StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType1, Enabled) --[[ Line: 9 ]]
			-- upvalues: CoreGuiType (upval), UseStateResult2 (upval)
			if CoreGuiType1 == CoreGuiType then
				UseStateResult2(Enabled)
			end
		end)
		UseStateResult2(StarterGui:GetCoreGuiEnabled(CoreGuiType))
		
		return function() --[[ Line: 16 ]]
			-- upvalues: CoreGuiChangedSignalConnection (copy)
			CoreGuiChangedSignalConnection:Disconnect()
		end
	end, { CoreGuiType })
	
	return UseStateResult
end

return useCoreGuiEnabled