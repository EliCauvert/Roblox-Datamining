local _ = require(script:FindFirstAncestor("BuildExperience").Stores.BuildLibrary.createBuildLibraryStore)

return function(List, Kind, Text: string, FolderId, p1)
	local List1 = {}
	local Lowered = string.lower(Text)
	local FolderIds = {}
	
	if p1 and FolderId ~= nil then
		for _, value in List do
			if value.className == "Folder" and value.folderId ~= nil then
				FolderIds[value.id] = value.folderId
			end
		end
	end
	for _, value1 in List do
		local IsFolderIdMatch = value1.folderId == FolderId
		
		if p1 then
			local FolderId1 = value1.folderId
			while FolderId ~= nil and (FolderId1 ~= nil and FolderId1 ~= FolderId) do
				FolderId1 = FolderIds[FolderId1]
			end
			IsFolderIdMatch = value1.className ~= "Folder" and (FolderId == nil or FolderId1 == FolderId)
		end
		if (Kind == nil or value1.kind == Kind) and (IsFolderIdMatch and (Lowered == "" or string.find(string.lower(value1.displayName), Lowered, 1, true) ~= nil)) then
			table.insert(List1, value1)
		end
	end
	return List1
end