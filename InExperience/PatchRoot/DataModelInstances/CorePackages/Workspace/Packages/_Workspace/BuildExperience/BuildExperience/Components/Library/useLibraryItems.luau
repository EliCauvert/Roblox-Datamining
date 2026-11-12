local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local GetLibraryMatchesModule = require(script.Parent.getLibraryMatches)

return function(p1, p2, p3, p4, Count, p5, p6)
	-- upvalues: ReactModule (copy), GetLibraryMatchesModule (copy), SendBuildExperienceEventModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		return {}
	end, {
		p1,
		p3 or false,
		p4,
		p5 or false,
		p6 or false
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState({ key = UseMemoResult, count = Count })
	local Count1 = if UseStateResult.key == UseMemoResult then UseStateResult.count else Count
	local LibraryMatchesModule = GetLibraryMatchesModule(p2, p3, p4, p6, p4 ~= "")
	local CountLibraryMatchesModule = #LibraryMatchesModule
	local MoveResult = table.move(LibraryMatchesModule, 1, math.min(Count1, CountLibraryMatchesModule), 1, {})
	local IsCountBelow = Count1 < CountLibraryMatchesModule
	local UseRefResult = ReactModule.useRef({ key = UseMemoResult, count = Count1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseMemoResult (copy), Count1 (copy), CountLibraryMatchesModule (copy), SendBuildExperienceEventModule (upval), p5 (copy), p3 (copy), p6 (copy)
		local Current = UseRefResult.current
		
		if Current.key == UseMemoResult and Current.count < Count1 then
			local SmallestDelta = math.min(Count1, CountLibraryMatchesModule) - math.min(Current.count, CountLibraryMatchesModule)
			
			if SmallestDelta > 0 then
				SendBuildExperienceEventModule("LIBRARY_LOAD_MORE", { universeId = game.GameId, placeId = game.PlaceId }, {
					surface = if p5 == nil then "Browser" else "Category",
					kind = p3 or "All",
					scope = if p6 == nil then "Root" else "Folder",
					addedCount = tostring(SmallestDelta),
					visibleCount = tostring((math.min(Count1, CountLibraryMatchesModule)))
				})
			end
		end
		UseRefResult.current = { key = UseMemoResult, count = Count1 }
	end, {
		UseMemoResult, Count1, CountLibraryMatchesModule, p3 or false, p5 or false,
		p6 or false
	})
	
	return MoveResult, IsCountBelow, (ReactModule.useCallback(function()
		-- upvalues: IsCountBelow (copy), UseStateResult2 (copy), UseMemoResult (copy), Count1 (copy), Count (copy)
		if IsCountBelow then
			UseStateResult2({ key = UseMemoResult, count = Count1 + Count })
		end
	end, { UseMemoResult, Count1, Count, IsCountBelow }))
end