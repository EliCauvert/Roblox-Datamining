local _ = require(script.Parent.LibraryTypes)

local function getFolderPreview(p1, List)
	-- upvalues: getFolderPreview (copy)
	if p1.className ~= "Folder" then
		return nil
	end
	local List1 = {}
	
	for _, value in List do
		if value.folderId == p1.id and value.kind == p1.kind then
			if value.className ~= "Folder" then
				return value
			end
			table.insert(List1, value)
		end
	end
	local FolderPreview = nil
	for _, value1 in List1 do
		FolderPreview = getFolderPreview(value1, List)
		
		if FolderPreview ~= nil then
			return FolderPreview
		end
	end
	return nil
end

return getFolderPreview