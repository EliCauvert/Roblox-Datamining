return function(p0) --[[ line: 12 | named "getCaptureVideoContent" ]]
	if typeof(p0) == "table" and p0.assetId ~= nil then
		return Content.fromUri(`rbxassetid://{p0.assetId}`)
	elseif typeof(p0) ~= "table" then
		local ok, status = pcall(Content.fromObject, p0)
		
		return if ok then status else nil
	end
end