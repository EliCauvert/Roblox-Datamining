return {
	Color3FromString = function(Text: string): Color3
		local Unpacked, Unpacked2, Unpacked3 = unpack(Text:split("/"))
		
		return (Color3.fromRGB(tonumber(Unpacked), tonumber(Unpacked2), (tonumber(Unpacked3))))
	end
}