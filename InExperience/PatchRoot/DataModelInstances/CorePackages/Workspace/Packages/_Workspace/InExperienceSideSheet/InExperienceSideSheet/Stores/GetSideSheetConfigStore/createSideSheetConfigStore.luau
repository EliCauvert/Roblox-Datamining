local guiService = game:GetService("GuiService")
local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local signalsModule = require(inExperienceSideSheet.Parent.Signals)
local constantsModule = require(inExperienceSideSheet.Common.Constants)
local maxIGMBackgroundTransparencyPercent = game:DefineFastInt("MaxIGMBackgroundTransparencyPercent", 30)

return function()
	-- upvalues: signalsModule (ref), constantsModule (ref), guiService (ref), maxIGMBackgroundTransparencyPercent (ref)
	local var1, var2 = signalsModule.createSignal(0)
	local var3, var4 = signalsModule.createSignal(0)
	local var5 = signalsModule.createComputed(function(p1)
		-- upvalues: var3 (ref), constantsModule (copy)
		return var3(p1) <= constantsModule.Breakpoint.HeightSmall
	end)
	
	local function onHeightChanged(p1)
		-- upvalues: var4 (ref)
		return var4(p1)
	end
	
	local function _()
		-- upvalues: var2 (ref), guiService (copy), maxIGMBackgroundTransparencyPercent (copy)
		return var2(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	end
	
	local _ = var2(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	local var6 = guiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
		-- upvalues: var2 (ref), guiService (copy), maxIGMBackgroundTransparencyPercent (copy)
		local _ = var2(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	end)
	
	return {
		getHeight = var3,
		getIsHeightSmall = var5,
		onHeightChanged = onHeightChanged,
		getBackgroundTransparency = var1,
		cleanUp = function()
			-- upvalues: var6 (ref)
			var6:Disconnect()
		end
	}
end