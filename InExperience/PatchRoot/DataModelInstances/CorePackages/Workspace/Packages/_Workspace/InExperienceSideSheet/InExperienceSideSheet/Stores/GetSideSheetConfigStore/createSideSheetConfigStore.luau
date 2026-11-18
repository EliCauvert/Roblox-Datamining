local GuiService = game:GetService("GuiService")
local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local SignalsModule = require(Parent.Signals)
local FFlagKeepSideSheetOpenBesideMenu = require(InExperienceSideSheet.Flags).FFlagKeepSideSheetOpenBesideMenu
local MaxIGMBackgroundTransparencyPercent = game:DefineFastInt("MaxIGMBackgroundTransparencyPercent", 30)

return function()
	-- upvalues: SignalsModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), Parent (copy), GuiService (copy), MaxIGMBackgroundTransparencyPercent (copy)
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal(false)
	local SetWindowShownBesideSideSheet = nil
	local Signal5 = nil
	local Signal2_4 = nil
	local GetWindowShownBesideSideSheet = nil
	
	if FFlagKeepSideSheetOpenBesideMenu then
		Signal5, Signal2_4 = SignalsModule.createSignal(false)
		local v1 = require(Parent.InExperienceSideSheetStore.GetSideSheetStore)(false)
		GetWindowShownBesideSideSheet = v1.getWindowShownBesideSideSheet
		SetWindowShownBesideSideSheet = v1.setWindowShownBesideSideSheet
	else
		Signal5 = nil
		Signal2_4 = nil
		GetWindowShownBesideSideSheet = nil
		SetWindowShownBesideSideSheet = nil
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
		getWindowShownBesideSideSheet = GetWindowShownBesideSideSheet,
		setWindowShownBesideSideSheet = SetWindowShownBesideSideSheet,
		cleanUp = function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	}
end