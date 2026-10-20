local Segments = {
	"rbxassetid://", "rbxthumb://", "rbxgameasset://", "rbxhttp://", "http://",
	"https://"
}

local function _(Text: string, Segment): boolean
	return string.sub(Text, 1, #Segment) == Segment
end

return function(Text: string): boolean
	-- upvalues: Segments (copy)
	if Text == nil or Text == "" then
		return false
	end
	for _, segment in Segments do
		if string.sub(Text, 1, #segment) == segment then
			return true
		end
	end
	return false
end