local _ = require(script.Parent.LibraryTypes)

local function getFolderPreview(p1, p2)
	-- upvalues: getFolderPreview (ref)
	if p1.className ~= "Folder" then
		return nil
	end
	local t = {}
	
	for i, v in p2 do
		if v.folderId == p1.id and v.kind == p1.kind then
			if v.className == "Folder" then
				table.insert(t, v)
				continue
			end
			return v
		end
	end
	for i, v in t do
		local var1 = getFolderPreview(v, p2)
		
		if var1 ~= nil then
			return var1
		end
	end
	return nil
end

return getFolderPreview