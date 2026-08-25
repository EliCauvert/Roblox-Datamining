local sceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local isWirableModule = require(sceneUnderstanding.wiring.isWirable)
local _ = require(sceneUnderstanding.wiring.types)

return function(p0)
	-- upvalues: isWirableModule (ref)
	return if p0 and isWirableModule(p0) then p0 else nil
end