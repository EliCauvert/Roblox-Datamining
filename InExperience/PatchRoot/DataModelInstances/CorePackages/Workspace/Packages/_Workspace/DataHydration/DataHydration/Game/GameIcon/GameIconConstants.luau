return {
	FIntGameIconSmallSizePx = game:DefineFastInt("LuaAppGameIconSmallSizePx", 150),
	FIntGameIconLargeSizePx = game:DefineFastInt("LuaAppGameIconLargeSizePx", 512),
	sizeString = function(p0)
		return string.format("%dx%d", p0, p0)
	end
}