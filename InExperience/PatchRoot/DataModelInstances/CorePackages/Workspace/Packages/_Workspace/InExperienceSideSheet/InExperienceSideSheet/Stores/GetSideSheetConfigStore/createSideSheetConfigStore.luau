local guiService = game:GetService("GuiService")
local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local signalsModule = require(inExperienceSideSheet.Parent.Signals)
local constantsModule = require(inExperienceSideSheet.Common.Constants)
local maxIGMBackgroundTransparencyPercent = game:DefineFastInt("MaxIGMBackgroundTransparencyPercent", 30)

return function() --[[ line: 22 | named "createSideSheetConfigStore" ]]
	-- upvalues: signalsModule (ref), constantsModule (ref), guiService (ref), maxIGMBackgroundTransparencyPercent (ref)
	local var5, var6 = signalsModule.createSignal(0)
	local var7, var8 = signalsModule.createSignal(0)
	local var9 = signalsModule.createComputed(function(p0) --[[ line: 26 ]]
		-- upvalues: var7 (ref), constantsModule (copy)
		return var7(p0) <= constantsModule.Breakpoint.HeightSmall
	end)
	
	local function onHeightChanged(p1) --[[ line: 30 ]]
		-- upvalues: var8 (ref)
		return var8(p1)
	end
	
	local function _() --[[ line: 34 | named "updateBackgroundTransparency" ]]
		-- upvalues: var6 (ref), guiService (copy), maxIGMBackgroundTransparencyPercent (copy)
		return var6(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	end
	
	local _ = var6(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	local var11 = guiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ line: 43 ]]
		-- upvalues: var6 (ref), guiService (copy), maxIGMBackgroundTransparencyPercent (copy)
		local _ = var6(guiService.PreferredTransparency * maxIGMBackgroundTransparencyPercent / 100)
	end)
	
	return {
		getHeight = var7,
		getIsHeightSmall = var9,
		onHeightChanged = onHeightChanged,
		getBackgroundTransparency = var5,
		cleanUp = function() --[[ line: 47 ]]
			-- upvalues: var11 (ref)
			var11:Disconnect()
		end
	}
end