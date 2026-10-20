local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local ReactModule = require(Foundation.Parent.React)
local UseScreenModule = require(Foundation.Providers.Overlay.useScreen)

return function()
	-- upvalues: UseScreenModule (copy), ReactModule (copy)
	local UseScreenModuleResult = UseScreenModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseScreenModuleResult and UseScreenModuleResult.AbsoluteSize.Y or 0)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseScreenModuleResult (copy), UseStateResult2 (copy)
		local Connection = nil
		
		if UseScreenModuleResult then
			UseStateResult2(UseScreenModuleResult.AbsoluteSize.Y)
			Connection = UseScreenModuleResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: UseStateResult2 (upval), UseScreenModuleResult (upval)
				UseStateResult2(UseScreenModuleResult.AbsoluteSize.Y)
			end)
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UseScreenModuleResult })
	
	return UseStateResult
end