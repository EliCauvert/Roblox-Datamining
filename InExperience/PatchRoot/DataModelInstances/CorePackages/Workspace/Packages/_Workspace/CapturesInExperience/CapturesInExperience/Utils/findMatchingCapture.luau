local _ = require(script.Parent.Parent.Types)

local function _(p1) --[[ Line: 5 | Named "getLocalId" ]]
	return if p1 and p1.LocalId then p1.LocalId else nil
end

return function(List, p1) --[[ Line: 12 | Named "findMatchingCapture" ]]
	local LocalId = if p1 and p1.LocalId then p1.LocalId else nil
	
	if LocalId == nil then
		return nil
	end
	for _, value in List do
		if value.LocalId == LocalId then
			return value
		elseif value.videoCapture then
			local VideoCapture = value.videoCapture
			
			if (if VideoCapture and VideoCapture.LocalId then VideoCapture.LocalId else nil) == LocalId then
				return value.videoCapture
			end
		end
	end
	return nil
end