local _ = require(script.Parent.Parent.Types)

local function _(p0) --[[ line: 5 | named "getLocalId" ]]
	return if p0 and p0.LocalId then p0.LocalId else nil
end

return function(p1, p2) --[[ line: 12 | named "findMatchingCapture" ]]
	local var0 = if p2 and p2.LocalId then p2.LocalId else nil
	
	if var0 == nil then
		return nil
	end
	for i, v in p1 do
		if v.LocalId ~= var0 then
			if v.videoCapture then
				local videoCapture = v.videoCapture
				
				if (if videoCapture and videoCapture.LocalId then videoCapture.LocalId else nil) == var0 then
					return v.videoCapture
				end
			end
		end
		return v
	end
	return nil
end