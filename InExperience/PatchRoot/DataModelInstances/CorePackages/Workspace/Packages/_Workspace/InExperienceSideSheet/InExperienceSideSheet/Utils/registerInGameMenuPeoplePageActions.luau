local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Callback = nil
local Callback1 = nil

return {
	registerOpenPeoplePage = function(p1) --[[ Line: 7 ]]
		-- upvalues: Callback (ref)
		Callback = p1
	end,
	registerClosePeoplePage = function(p1) --[[ Line: 10 ]]
		-- upvalues: Callback1 (ref)
		Callback1 = p1
	end,
	openPeoplePage = function() --[[ Line: 13 ]]
		-- upvalues: Callback (ref)
		if Callback then
			Callback()
		end
	end,
	closePeoplePage = function(p1) --[[ Line: 20 ]]
		-- upvalues: InExperienceSideSheet (copy), Callback1 (ref)
		if p1 ~= nil and require(InExperienceSideSheet.Flags.FFlagClosePeoplePageWhenNoRoomBesideSideSheet) and not require(InExperienceSideSheet.Utils.getHasRoomForPeoplePage)(false, p1) then
			require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)(false).setDidSideSheetOpenWithPeoplePage(false)
		end
		if Callback1 then
			Callback1()
		end
	end
}