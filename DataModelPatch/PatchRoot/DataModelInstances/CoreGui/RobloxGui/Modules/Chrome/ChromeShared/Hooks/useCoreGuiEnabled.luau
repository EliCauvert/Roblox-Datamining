local StarterGui = game:GetService("StarterGui")
local ReactModule = require(game:GetService("CorePackages").Packages.React)

function useCoreGuiEnabled(CoreGuiType)
	-- upvalues: ReactModule (copy), StarterGui (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(StarterGui:GetCoreGuiEnabled(CoreGuiType))
	ReactModule.useEffect(function()
		-- upvalues: StarterGui (upval), CoreGuiType (copy), UseStateResult2 (copy)
		local CoreGuiChangedSignalConnection = StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType1, Enabled)
			-- upvalues: CoreGuiType (upval), UseStateResult2 (upval)
			if CoreGuiType1 == CoreGuiType then
				UseStateResult2(Enabled)
			end
		end)
		UseStateResult2(StarterGui:GetCoreGuiEnabled(CoreGuiType))
		
		return function()
			-- upvalues: CoreGuiChangedSignalConnection (copy)
			CoreGuiChangedSignalConnection:Disconnect()
		end
	end, { CoreGuiType })
	
	return UseStateResult
end

return useCoreGuiEnabled