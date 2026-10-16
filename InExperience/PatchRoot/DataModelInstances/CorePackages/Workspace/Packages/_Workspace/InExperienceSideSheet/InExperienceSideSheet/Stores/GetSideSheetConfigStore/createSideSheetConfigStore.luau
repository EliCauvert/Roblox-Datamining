local GuiService = game:GetService("GuiService")
local SignalsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Signals)
local MaxIGMBackgroundTransparencyPercent = game:DefineFastInt("MaxIGMBackgroundTransparencyPercent", 30)

return function() --[[ Line: 25 | Named "createSideSheetConfigStore" ]]
	-- upvalues: SignalsModule (copy), GuiService (copy), MaxIGMBackgroundTransparencyPercent (copy)
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal(false)
	
	local function _() --[[ Line: 31 | Named "updateBackgroundTransparency" ]]
		-- upvalues: Signal2 (copy), GuiService (upval), MaxIGMBackgroundTransparencyPercent (upval)
		return Signal2(GuiService.PreferredTransparency * MaxIGMBackgroundTransparencyPercent / 100)
	end
	
	local _ = Signal2(GuiService.PreferredTransparency * MaxIGMBackgroundTransparencyPercent / 100)
	local Connection = GuiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 40 ]]
		-- upvalues: Signal2 (copy), GuiService (upval), MaxIGMBackgroundTransparencyPercent (upval)
		local _ = Signal2(GuiService.PreferredTransparency * MaxIGMBackgroundTransparencyPercent / 100)
	end)
	
	return {
		getBackgroundTransparency = Signal,
		getSideSheetDrawerWidth = Signal1,
		setSideSheetDrawerWidth = Signal2_1,
		getIsPeoplePageOpen = Signal3,
		setIsPeoplePageOpen = Signal2_2,
		getDidSideSheetOpenWithPeoplePage = Signal4,
		setDidSideSheetOpenWithPeoplePage = Signal2_3,
		cleanUp = function() --[[ Line: 44 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	}
end