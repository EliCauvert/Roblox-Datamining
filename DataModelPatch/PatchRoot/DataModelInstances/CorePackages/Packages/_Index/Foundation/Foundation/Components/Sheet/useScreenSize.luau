local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UseScreenModule = require(Foundation.Providers.Overlay.useScreen)

return function()
	-- upvalues: FlagsModule (copy), UseScreenModule (copy), UseOverlayModule (copy), ReactModule (copy)
	local UseScreenModuleResult = if FlagsModule.FoundationOverlayKeyboardAwarenessHardened then UseScreenModule() else UseOverlayModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseScreenModuleResult and UseScreenModuleResult.AbsoluteSize or Vector2.new(0, 0))
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseScreenModuleResult (copy), UseStateResult2 (copy)
		local Connection = nil
		
		if UseScreenModuleResult then
			UseStateResult2(UseScreenModuleResult.AbsoluteSize)
			Connection = UseScreenModuleResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: UseStateResult2 (upval), UseScreenModuleResult (upval)
				UseStateResult2(UseScreenModuleResult.AbsoluteSize)
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