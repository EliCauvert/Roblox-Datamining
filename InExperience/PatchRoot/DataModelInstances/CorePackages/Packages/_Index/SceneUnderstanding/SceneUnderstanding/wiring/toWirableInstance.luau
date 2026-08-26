local sceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local isWirableModule = require(sceneUnderstanding.wiring.isWirable)
local _ = require(sceneUnderstanding.wiring.types)

return function(p1)
	-- upvalues: isWirableModule (ref)
	return if p1 and isWirableModule(p1) then p1 else nil
end