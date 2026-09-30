local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local var1 = nil
local var2 = nil

return {
	registerOpenPeoplePage = function(p1)
		-- upvalues: var1 (write)
		var1 = p1
	end,
	registerClosePeoplePage = function(p1)
		-- upvalues: var2 (write)
		var2 = p1
	end,
	openPeoplePage = function()
		-- upvalues: var1 (write)
		if var1 then
			var1()
		end
	end,
	closePeoplePage = function(p1)
		-- upvalues: inExperienceSideSheet (ref), var2 (write)
		if p1 ~= nil and require(inExperienceSideSheet.Flags.FFlagClosePeoplePageWhenNoRoomBesideSideSheet) and not require(inExperienceSideSheet.Utils.getHasRoomForPeoplePage)(false, p1) then
			require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)(false).setDidSideSheetOpenWithPeoplePage(false)
		end
		if var2 then
			var2()
		end
	end
}