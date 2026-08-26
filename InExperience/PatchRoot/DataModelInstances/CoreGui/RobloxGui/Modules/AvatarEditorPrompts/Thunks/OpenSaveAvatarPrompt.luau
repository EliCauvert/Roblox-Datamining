local parent = script.Parent.Parent
local openPromptModule = require(parent.Actions.OpenPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p1, p2)
	-- upvalues: openPromptModule (ref), promptTypeModule (ref)
	return function(p3)
		-- upvalues: openPromptModule (copy), promptTypeModule (copy), p1 (ref), p2 (ref)
		p3:dispatch(openPromptModule(promptTypeModule.SaveAvatar, { humanoidDescription = p1, rigType = p2 }))
	end
end