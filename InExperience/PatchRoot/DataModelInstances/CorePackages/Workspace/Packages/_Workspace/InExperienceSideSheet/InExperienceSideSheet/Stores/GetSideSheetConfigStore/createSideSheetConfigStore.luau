local GuiService = game:GetService("GuiService")
local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local SignalsModule = require(InExperienceSideSheet.Parent.Signals)
local FFlagKeepSideSheetOpenBesideMenu = require(InExperienceSideSheet.Flags).FFlagKeepSideSheetOpenBesideMenu
local MaxIGMBackgroundTransparencyPercent = game:DefineFastInt("MaxIGMBackgroundTransparencyPercent", 30)

return function()
	-- upvalues: SignalsModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), GuiService (copy), MaxIGMBackgroundTransparencyPercent (copy)
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal(false)
	local Signal2_4 = nil
	local Signal6 = nil
	local Signal5 = nil
	local Signal2_5 = nil
	
	if FFlagKeepSideSheetOpenBesideMenu then
		Signal5, Signal2_4 = SignalsModule.createSignal(false)
		Signal6, Signal2_5 = SignalsModule.createSignal(nil)
	else
		Signal5 = nil
		Signal2_4 = nil
		Signal6 = nil
		Signal2_5 = nil
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
		getBackgroundTransparency = Signal,
		getSideSheetDrawerWidth = Signal1,
		setSideSheetDrawerWidth = Signal2_1,
		getIsPeoplePageOpen = Signal3,
		setIsPeoplePageOpen = Signal2_2,
		getDidSideSheetOpenWithPeoplePage = Signal4,
		setDidSideSheetOpenWithPeoplePage = Signal2_3,
		getIsMenuShownBesideSideSheet = Signal5,
		setIsMenuShownBesideSideSheet = Signal2_4,
		getWindowShownBesideSideSheet = Signal6,
		setWindowShownBesideSideSheet = Signal2_5,
		cleanUp = function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	}
end