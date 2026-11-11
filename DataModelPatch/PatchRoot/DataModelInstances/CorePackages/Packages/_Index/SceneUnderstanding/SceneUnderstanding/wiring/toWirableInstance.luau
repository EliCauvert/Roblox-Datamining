local SceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local IsWirableModule = require(SceneUnderstanding.wiring.isWirable)
local _ = require(SceneUnderstanding.wiring.types)

return function(p1)
	-- upvalues: IsWirableModule (copy)
	return if p1 and IsWirableModule(p1) then p1 else nil
end