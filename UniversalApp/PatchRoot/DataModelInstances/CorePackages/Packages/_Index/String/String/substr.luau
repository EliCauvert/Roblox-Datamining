return function(Text: string, StartIndex: number, p1: number): string --[[ Line: 16 ]]
	return if p1 and p1 <= 0 then "" else string.sub(Text, StartIndex, p1 and StartIndex + p1 - 1 or nil)
end