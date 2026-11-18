local InExperienceSideSheetStore = script:FindFirstAncestor("InExperienceSideSheetStore")
local Parent = InExperienceSideSheetStore.Parent
local SignalsModule = require(Parent.Signals)
local FFlagKeepSideSheetOpenBesideMenuModule = require(Parent.SharedFlags.FFlagKeepSideSheetOpenBesideMenu)
local _ = require(InExperienceSideSheetStore.Types)

local function isSameClaimedWindowArea(p1, p2): boolean
	return if p1 == nil or p2 == nil then p1 == p2 else p1.integrationId == p2.integrationId and p1.area.position == p2.area.position and p1.area.size == p2.area.size
end

return function()
	-- upvalues: SignalsModule (copy), isSameClaimedWindowArea (copy), FFlagKeepSideSheetOpenBesideMenuModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil, isSameClaimedWindowArea)
	
	return {
		getWindowShownBesideSideSheet = Signal,
		setWindowShownBesideSideSheet = function(p1)
			-- upvalues: FFlagKeepSideSheetOpenBesideMenuModule (upval), Signal2 (copy)
			if FFlagKeepSideSheetOpenBesideMenuModule then
				Signal2(p1)
			end
		end,
		getClaimedWindowArea = Signal1,
		setClaimedWindowArea = Signal2_1
	}
end