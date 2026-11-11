game:DefineFastInt("LuaAppTransparentPageMaxCount", 2)

return function(): number
	return (math.max(game:GetFastInt("LuaAppTransparentPageMaxCount"), 1))
end