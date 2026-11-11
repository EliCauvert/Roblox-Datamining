local function _(Text: string)
	local D = Text:match("^%d+")
	
	if D then
		return tonumber(D), (string.sub(Text, #D + 1))
	else
		return nil, Text
	end
end

return function(p1, p2): boolean
	local Name: string = p1.name
	local D = Name:match("^%d+")
	local Segment = nil
	local Number = nil
	
	if D then
		Number = tonumber(D)
		Segment = string.sub(Name, #D + 1)
	else
		Number = nil
		Segment = Name
	end
	local Name1: string = p2.name
	local D1 = Name1:match("^%d+")
	local Number1 = nil
	local Segment1 = nil
	
	if D1 then
		Number1 = tonumber(D1)
		Segment1 = string.sub(Name1, #D1 + 1)
	else
		Number1 = nil
		Segment1 = Name1
	end
	return Number ~= nil and Number1 == nil or (Number ~= nil or Number1 == nil) and (if Number == nil or Number1 == nil or Segment ~= Segment1 then Segment < Segment1 else Number < Number1)
end