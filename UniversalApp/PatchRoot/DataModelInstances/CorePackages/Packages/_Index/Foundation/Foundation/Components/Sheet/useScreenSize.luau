local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useScreenModule = require(foundation.Providers.Overlay.useScreen)

return function() --[[ line: 9 | named "useScreenSize" ]]
	-- upvalues: flagsModule (ref), useScreenModule (ref), useOverlayModule (ref), reactModule (ref)
	local var5 = if flagsModule.FoundationOverlayKeyboardAwarenessHardened then useScreenModule() else useOverlayModule()
	local var6, var7 = reactModule.useState(if var5 then var5.AbsoluteSize else Vector2.new(0, 0))
	reactModule.useLayoutEffect(function() --[[ line: 13 ]]
		-- upvalues: var5 (ref), var7 (ref)
		local var8 = nil
		
		if var5 then
			var7(var5.AbsoluteSize)
			var8 = var5:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 18 ]]
				-- upvalues: var7 (copy), var5 (copy)
				var7(var5.AbsoluteSize)
			end)
		end
		return function() --[[ line: 23 ]]
			-- upvalues: var8 (write)
			if var8 then
				var8:Disconnect()
			end
		end
	end, { var5 })
	
	return var6
end