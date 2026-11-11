local Parent = script.Parent.Parent
local OpenPromptModule = require(Parent.Actions.OpenPrompt)
local PromptTypeModule = require(Parent.PromptType)

return function(HumanoidDescription, RigType)
	-- upvalues: OpenPromptModule (copy), PromptTypeModule (copy)
	return function(p1)
		-- upvalues: OpenPromptModule (upval), PromptTypeModule (upval), HumanoidDescription (copy), RigType (copy)
		p1:dispatch(OpenPromptModule(PromptTypeModule.SaveAvatar, {
			humanoidDescription = HumanoidDescription,
			rigType = RigType
		}))
	end
end