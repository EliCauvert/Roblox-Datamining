local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Callback = nil
local Callback3 = nil
local Callback1 = nil
local Callback2 = nil

return {
	registerOpenPeoplePage = function(p1)
		-- upvalues: Callback (ref)
		Callback = p1
	end,
	registerClosePeoplePage = function(p1)
		-- upvalues: Callback3 (ref)
		Callback3 = p1
	end,
	openPeoplePage = function()
		-- upvalues: Callback (ref)
		if Callback then
			Callback()
		end
	end,
	registerCloseMenuShownBesideSideSheet = function(p1)
		-- upvalues: Callback1 (ref)
		Callback1 = p1
	end,
	closeMenuShownBesideSideSheet = function()
		-- upvalues: Callback1 (ref)
		if Callback1 then
			Callback1()
		end
	end,
	registerCloseWindowShownBesideSideSheet = function(p1)
		-- upvalues: Callback2 (ref)
		Callback2 = p1
	end,
	closeWindowShownBesideSideSheet = function()
		-- upvalues: Callback2 (ref)
		if Callback2 then
			Callback2()
		end
	end,
	closePeoplePage = function(p1)
		-- upvalues: InExperienceSideSheet (copy), Callback3 (ref)
		if p1 ~= nil and require(InExperienceSideSheet.Flags.FFlagClosePeoplePageWhenNoRoomBesideSideSheet) and not require(InExperienceSideSheet.Utils.getHasRoomForPeoplePage)(false, p1) then
			require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)(false).setDidSideSheetOpenWithPeoplePage(false)
		end
		if Callback3 then
			Callback3()
		end
	end
}