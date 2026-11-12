local CreateAvatarSceneStageModule = require(script.Parent.createAvatarSceneStage)
local v1 = nil

return function()
	-- upvalues: v1 (ref), CreateAvatarSceneStageModule (copy)
	if v1 == nil then
		v1 = CreateAvatarSceneStageModule()
	end
	return v1
end