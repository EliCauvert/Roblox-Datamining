local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.DialogSize)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local getResponsiveSizeModule = require(script.Parent.getResponsiveSize)
local useDialogModule = require(script.Parent.useDialog)

return function(p1)
	-- upvalues: useTokensModule (ref), useOverlayModule (ref), useDialogModule (ref), reactModule (ref), getResponsiveSizeModule (ref)
	local var1 = useTokensModule()
	local var2 = useOverlayModule()
	local var3 = useDialogModule()
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var3 (ref), getResponsiveSizeModule (copy), p1 (ref), var1 (ref)
		if var2 then
			var3.setResponsiveSize(getResponsiveSizeModule(var2.AbsoluteSize.X, p1, var1))
			
			return
		end
	end, { var2, p1, var1, var3.size })
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		if var2 then
			var4()
			local var5 = var2:GetPropertyChangedSignal("AbsoluteSize"):Connect(var4)
			
			return function()
				-- upvalues: var5 (ref)
				var5:Disconnect()
			end
		end
	end, { var2, p1, var4 })
end