return function(p1) --[[ Line: 12 | Named "getCaptureVideoContent" ]]
	if typeof(p1) == "table" and p1.assetId ~= nil then
		return Content.fromUri(`rbxassetid://{p1.assetId}`)
	end
	if typeof(p1) ~= "table" then
		local Success, Result = pcall(Content.fromObject, p1)
		
		if Success then
			return Result
		end
	end
	return nil
end