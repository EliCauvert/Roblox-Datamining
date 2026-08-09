local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useScreenModule = require(foundation.Providers.Overlay.useScreen)

return function() --[[ line: 9 | named "useScreenSize" ]]
	-- upvalues: flagsModule (ref), useScreenModule (ref), useOverlayModule (ref), reactModule (ref)
	local var4 = if flagsModule.FoundationOverlayKeyboardAwarenessHardened then useScreenModule() else useOverlayModule()
	local var5, var6 = reactModule.useState(if var4 then var4.AbsoluteSize else Vector2.new(0, 0))
	reactModule.useLayoutEffect(function() --[[ line: 13 ]]
		-- upvalues: var4 (ref), var6 (ref)
		local var7 = nil
		
		if var4 then
			var6(var4.AbsoluteSize)
			var7 = var4:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 18 ]]
				-- upvalues: var6 (copy), var4 (copy)
				var6(var4.AbsoluteSize)
			end)
		end
		return function() --[[ line: 23 ]]
			-- upvalues: var7 (write)
			if var7 then
				var7:Disconnect()
			end
		end
	end, { var4 })
	
	return var5
end