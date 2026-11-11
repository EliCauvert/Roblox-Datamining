local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UsePlayerGuiModule = require(script.Parent.usePlayerGui)

return function()
	-- upvalues: UsePlayerGuiModule (copy), ReactModule (copy)
	local UsePlayerGuiModuleResult = UsePlayerGuiModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UsePlayerGuiModuleResult (copy), UseStateResult2 (copy)
		local Connection = nil
		
		if UsePlayerGuiModuleResult then
			UseStateResult2(UsePlayerGuiModuleResult.CurrentScreenOrientation)
			Connection = UsePlayerGuiModuleResult:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function()
				-- upvalues: UseStateResult2 (upval), UsePlayerGuiModuleResult (upval)
				UseStateResult2(UsePlayerGuiModuleResult.CurrentScreenOrientation)
			end)
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UsePlayerGuiModuleResult })
	
	return UseStateResult
end