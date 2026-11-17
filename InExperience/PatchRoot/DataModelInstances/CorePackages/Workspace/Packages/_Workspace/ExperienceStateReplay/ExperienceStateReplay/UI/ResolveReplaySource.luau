return {
	resolve = function(Text: string)
		if string.sub(Text, 1, 4) == "RWS;" then
			return { kind = "rws", dir = string.sub(Text, 5) }
		elseif string.sub(Text, 1, 5) == "FILE;" then
			local Segment = string.sub(Text, 6)
			local Match, Match2 = string.match(Segment, "^(.*);(%-?%d+)$")
			local Number = if Match2 then tonumber(Match2) else nil
			
			return if Match == nil or Number == nil then { kind = "file", sliceCount = nil, dir = Match or Segment } else { kind = "file", dir = Match, sliceCount = Number }
		else
			return { kind = "guid", guid = Text }
		end
	end
}