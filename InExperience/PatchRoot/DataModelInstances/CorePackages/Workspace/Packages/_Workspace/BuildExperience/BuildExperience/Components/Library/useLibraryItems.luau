local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return function(p1, List, Kind, Text: string, Count, p2, FolderId)
	-- upvalues: ReactModule (copy), SendBuildExperienceEventModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		return {}
	end, {
		p1,
		Kind or false,
		Text,
		p2 or false,
		FolderId or false
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState({ key = UseMemoResult, count = Count })
	local Count1 = if UseStateResult.key == UseMemoResult then UseStateResult.count else Count
	local List1 = {}
	local Count2 = 0
	local Lowered = string.lower(Text)
	local FolderIds = {}
	
	if Lowered ~= "" and FolderId ~= nil then
		for _, value in List do
			if value.className == "Folder" and value.folderId ~= nil then
				FolderIds[value.id] = value.folderId
			end
		end
	end
	for _, value1 in List do
		local IsFolderIdMatch = value1.folderId == FolderId
		
		if Lowered ~= "" then
			local FolderId1 = value1.folderId
			while FolderId ~= nil and (FolderId1 ~= nil and FolderId1 ~= FolderId) do
				FolderId1 = FolderIds[FolderId1]
			end
			IsFolderIdMatch = value1.className ~= "Folder" and (FolderId == nil or FolderId1 == FolderId)
		end
		if (Kind == nil or value1.kind == Kind) and (IsFolderIdMatch and (Lowered == "" or string.find(string.lower(value1.displayName), Lowered, 1, true) ~= nil)) then
			Count2 += 1
			
			if Count2 <= Count1 then
				table.insert(List1, value1)
			end
		end
	end
	local IsCountBelow = Count1 < Count2
	local UseRefResult = ReactModule.useRef({ key = UseMemoResult, count = Count1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseMemoResult (copy), Count1 (copy), Count2 (ref), SendBuildExperienceEventModule (upval), p2 (copy), Kind (copy), FolderId (copy)
		local Current = UseRefResult.current
		
		if Current.key == UseMemoResult and Current.count < Count1 then
			local SmallestDelta = math.min(Count1, Count2) - math.min(Current.count, Count2)
			
			if SmallestDelta > 0 then
				SendBuildExperienceEventModule("LIBRARY_LOAD_MORE", { universeId = game.GameId, placeId = game.PlaceId }, {
					surface = if p2 == nil then "Browser" else "Category",
					kind = Kind or "All",
					scope = if FolderId == nil then "Root" else "Folder",
					addedCount = tostring(SmallestDelta),
					visibleCount = tostring((math.min(Count1, Count2)))
				})
			end
		end
		UseRefResult.current = { key = UseMemoResult, count = Count1 }
	end, {
		UseMemoResult, Count1, Count2, Kind or false, p2 or false, FolderId or false
	})
	
	return List1, IsCountBelow, (ReactModule.useCallback(function()
		-- upvalues: IsCountBelow (copy), UseStateResult2 (copy), UseMemoResult (copy), Count1 (copy), Count (copy)
		if IsCountBelow then
			UseStateResult2({ key = UseMemoResult, count = Count1 + Count })
		end
	end, { UseMemoResult, Count1, Count, IsCountBelow }))
end