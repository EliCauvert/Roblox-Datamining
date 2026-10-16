local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.DialogSize)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local GetResponsiveSizeModule = require(script.Parent.getResponsiveSize)
local UseDialogModule = require(script.Parent.useDialog)

return function(p1) --[[ Line: 16 | Named "useDialogResponsiveSize" ]]
	-- upvalues: UseTokensModule (copy), UseOverlayModule (copy), UseDialogModule (copy), ReactModule (copy), GetResponsiveSizeModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseOverlayModuleResult = UseOverlayModule()
	local UseDialogModuleResult = UseDialogModule()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 21 ]]
		-- upvalues: UseOverlayModuleResult (copy), UseDialogModuleResult (copy), GetResponsiveSizeModule (upval), p1 (copy), UseTokensModuleResult (copy)
		if UseOverlayModuleResult then
			UseDialogModuleResult.setResponsiveSize(GetResponsiveSizeModule(UseOverlayModuleResult.AbsoluteSize.X, p1, UseTokensModuleResult))
			
			return
		end
	end, {
		UseOverlayModuleResult,
		p1,
		UseTokensModuleResult,
		UseDialogModuleResult.size
	})
	ReactModule.useLayoutEffect(function() --[[ Line: 28 ]]
		-- upvalues: UseOverlayModuleResult (copy), UseResult (copy)
		if not UseOverlayModuleResult then return end
		UseResult()
		local Connection = UseOverlayModuleResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(UseResult)
		
		return function() --[[ Line: 37 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseOverlayModuleResult, p1, UseResult })
end