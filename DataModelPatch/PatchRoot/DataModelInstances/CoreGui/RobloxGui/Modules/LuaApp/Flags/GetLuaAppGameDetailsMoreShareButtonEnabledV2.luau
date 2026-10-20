game:DefineFastInt("LuaAppGameDetailsMoreShareButtonRolloutV2", 0)

return function(p1: number): boolean
	local LuaAppGameDetailsMoreShareButtonRolloutV2FastInt: number = game:GetFastInt("LuaAppGameDetailsMoreShareButtonRolloutV2")
	
	return LuaAppGameDetailsMoreShareButtonRolloutV2FastInt > 0 and (if p1 and p1 ~= "" then (p1 + 55) % 100 < LuaAppGameDetailsMoreShareButtonRolloutV2FastInt else false)
end