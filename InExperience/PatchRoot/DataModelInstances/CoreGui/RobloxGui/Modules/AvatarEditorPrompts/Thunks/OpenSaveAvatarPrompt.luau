local parent = script.Parent.Parent
local openPromptModule = require(parent.Actions.OpenPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: openPromptModule (ref), promptTypeModule (ref)
	return function(p2) --[[ line: 7 ]]
		-- upvalues: openPromptModule (copy), promptTypeModule (copy), p0 (ref), p1 (ref)
		p2:dispatch(openPromptModule(promptTypeModule.SaveAvatar, { humanoidDescription = p0, rigType = p1 }))
	end
end