local guiService = game:GetService("GuiService")
local signalsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Signals)
local maxIGMBackgroundTransparencyPercent = game:DefineFastInt("MaxIGMBackgroundTransparencyPercent", 30)

return function()
	-- upvalues: signalsModule (ref), guiService (ref), maxIGMBackgroundTransparencyPercent (ref)
	local var1, var2 = signalsModule.createSignal(0)
	local var3, var4 = signalsModule.createSignal(0)
	local var5, var6 = signalsModule.createSignal(false)
	local var7, var8 = signalsModule.createSignal(false)
	
	local function _()
		-- upvalues: var2 (ref), guiService (copy), maxIGMBackgroundTransparencyPercent (copy)
		return var2(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	end
	
	local _ = var2(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	local var9 = guiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
		-- upvalues: var2 (ref), guiService (copy), maxIGMBackgroundTransparencyPercent (copy)
		local _ = var2(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	end)
	
	return {
		getBackgroundTransparency = var1,
		getSideSheetDrawerWidth = var3,
		setSideSheetDrawerWidth = var4,
		getIsPeoplePageOpen = var5,
		setIsPeoplePageOpen = var6,
		getDidSideSheetOpenWithPeoplePage = var7,
		setDidSideSheetOpenWithPeoplePage = var8,
		cleanUp = function()
			-- upvalues: var9 (ref)
			var9:Disconnect()
		end
	}
end