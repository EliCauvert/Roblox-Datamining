local GuiService = game:GetService("GuiService")
local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local SignalsModule = require(InExperienceSideSheet.Parent.Signals)
local ConstantsModule = require(InExperienceSideSheet.Common.Constants)
local MaxIGMBackgroundTransparencyPercent = game:DefineFastInt("MaxIGMBackgroundTransparencyPercent", 30)

return function()
	-- upvalues: SignalsModule (copy), ConstantsModule (copy), GuiService (copy), MaxIGMBackgroundTransparencyPercent (copy)
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Computed = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: Signal1 (copy), ConstantsModule (upval)
		return Signal1(p1) <= ConstantsModule.Breakpoint.HeightSmall
	end)
	
	local function onHeightChanged(p1)
		-- upvalues: Signal2_1 (copy)
		return Signal2_1(p1)
	end
	
	local function _()
		-- upvalues: Signal2 (copy), GuiService (upval), MaxIGMBackgroundTransparencyPercent (upval)
		return Signal2(GuiService.PreferredTransparency * MaxIGMBackgroundTransparencyPercent / 100)
	end
	
	local _ = Signal2(GuiService.PreferredTransparency * MaxIGMBackgroundTransparencyPercent / 100)
	local Connection = GuiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
		-- upvalues: Signal2 (copy), GuiService (upval), MaxIGMBackgroundTransparencyPercent (upval)
		local _ = Signal2(GuiService.PreferredTransparency * MaxIGMBackgroundTransparencyPercent / 100)
	end)
	
	return {
		getHeight = Signal1,
		getIsHeightSmall = Computed,
		onHeightChanged = onHeightChanged,
		getBackgroundTransparency = Signal,
		cleanUp = function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	}
end