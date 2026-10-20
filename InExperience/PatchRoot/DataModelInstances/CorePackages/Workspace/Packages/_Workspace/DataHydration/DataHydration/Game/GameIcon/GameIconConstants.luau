return {
	FIntGameIconSmallSizePx = game:DefineFastInt("LuaAppGameIconSmallSizePx", 150),
	FIntGameIconLargeSizePx = game:DefineFastInt("LuaAppGameIconLargeSizePx", 512),
	sizeString = function(p1): string
		return string.format("%dx%d", p1, p1)
	end
}