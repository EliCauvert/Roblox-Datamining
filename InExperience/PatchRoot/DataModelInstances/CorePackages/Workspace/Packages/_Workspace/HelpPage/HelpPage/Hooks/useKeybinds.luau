local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local keybindContextModule = require(parent.Context.KeybindContext)

return function() --[[ line: 11 ]]
	-- upvalues: reactModule (ref), keybindContextModule (ref)
	return reactModule.useContext(keybindContextModule)
end