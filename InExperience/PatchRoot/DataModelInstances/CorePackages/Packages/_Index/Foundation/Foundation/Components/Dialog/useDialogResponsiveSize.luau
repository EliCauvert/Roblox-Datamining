local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.DialogSize)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local getResponsiveSizeModule = require(script.Parent.getResponsiveSize)
local useDialogModule = require(script.Parent.useDialog)

return function(p0) --[[ line: 16 | named "useDialogResponsiveSize" ]]
	-- upvalues: useTokensModule (ref), useOverlayModule (ref), useDialogModule (ref), reactModule (ref), getResponsiveSizeModule (ref)
	local var6 = useTokensModule()
	local var7 = useOverlayModule()
	local var8 = useDialogModule()
	local var9 = reactModule.useCallback(function() --[[ line: 21 ]]
		-- upvalues: var7 (ref), var8 (ref), getResponsiveSizeModule (copy), p0 (ref), var6 (ref)
		if var7 then
			var8.setResponsiveSize(getResponsiveSizeModule(var7.AbsoluteSize.X, p0, var6))
			
			return
		end
	end, { var7, p0, var6, var8.size })
	reactModule.useLayoutEffect(function() --[[ line: 28 ]]
		-- upvalues: var7 (ref), var9 (ref)
		if var7 then
			var9()
			local var10 = var7:GetPropertyChangedSignal("AbsoluteSize"):Connect(var9)
			
			return function() --[[ line: 37 ]]
				-- upvalues: var10 (ref)
				var10:Disconnect()
			end
		end
	end, { var7, p0, var9 })
end