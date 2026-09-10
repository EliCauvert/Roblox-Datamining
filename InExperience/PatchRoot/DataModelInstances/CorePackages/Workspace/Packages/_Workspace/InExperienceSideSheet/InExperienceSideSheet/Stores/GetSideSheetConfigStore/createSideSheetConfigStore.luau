local guiService = game:GetService("GuiService")
local signalsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Signals)
local maxIGMBackgroundTransparencyPercent = game:DefineFastInt("MaxIGMBackgroundTransparencyPercent", 30)

return function()
	-- upvalues: signalsModule (ref), guiService (ref), maxIGMBackgroundTransparencyPercent (ref)
	local var1, var2 = signalsModule.createSignal(0)
	
	local function _()
		-- upvalues: var2 (ref), guiService (copy), maxIGMBackgroundTransparencyPercent (copy)
		return var2(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	end
	
	local _ = var2(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	local var3 = guiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
		-- upvalues: var2 (ref), guiService (copy), maxIGMBackgroundTransparencyPercent (copy)
		local _ = var2(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	end)
	
	return {
		getBackgroundTransparency = var1,
		cleanUp = function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	}
end