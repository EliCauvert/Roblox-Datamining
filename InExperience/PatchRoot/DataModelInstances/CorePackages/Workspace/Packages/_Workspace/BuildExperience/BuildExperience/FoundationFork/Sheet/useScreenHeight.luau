local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local ReactModule = require(Foundation.Parent.React)
local UseScreenModule = require(Foundation.Providers.Overlay.useScreen)

return function() --[[ Line: 7 | Named "useScreenHeight" ]]
	-- upvalues: UseScreenModule (copy), ReactModule (copy)
	local UseScreenModuleResult = UseScreenModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseScreenModuleResult and UseScreenModuleResult.AbsoluteSize.Y or 0)
	ReactModule.useLayoutEffect(function() --[[ Line: 11 ]]
		-- upvalues: UseScreenModuleResult (copy), UseStateResult2 (copy)
		local Connection = nil
		
		if UseScreenModuleResult then
			UseStateResult2(UseScreenModuleResult.AbsoluteSize.Y)
			Connection = UseScreenModuleResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 16 ]]
				-- upvalues: UseStateResult2 (upval), UseScreenModuleResult (upval)
				UseStateResult2(UseScreenModuleResult.AbsoluteSize.Y)
			end)
		end
		return function() --[[ Line: 21 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UseScreenModuleResult })
	
	return UseStateResult
end