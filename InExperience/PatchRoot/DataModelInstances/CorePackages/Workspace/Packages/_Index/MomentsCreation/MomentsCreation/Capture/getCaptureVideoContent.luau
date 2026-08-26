return function(p1)
	if typeof(p1) == "table" and p1.assetId ~= nil then
		return Content.fromUri(`rbxassetid://{p1.assetId}`)
	elseif typeof(p1) ~= "table" then
		local ok, status = pcall(Content.fromObject, p1)
		
		return if ok then status else nil
	end
end