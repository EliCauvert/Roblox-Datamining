local _ = require(script.Parent.Parent.Types)

local function _(p1)
	return if p1 and p1.LocalId then p1.LocalId else nil
end

return function(p1, p2)
	local var1 = if p2 and p2.LocalId then p2.LocalId else nil
	
	if var1 == nil then
		return nil
	end
	for i, v in p1 do
		if v.LocalId ~= var1 then
			if v.videoCapture then
				local videoCapture = v.videoCapture
				
				if (if videoCapture and videoCapture.LocalId then videoCapture.LocalId else nil) == var1 then
					return v.videoCapture
				end
			end
		end
		return v
	end
	return nil
end