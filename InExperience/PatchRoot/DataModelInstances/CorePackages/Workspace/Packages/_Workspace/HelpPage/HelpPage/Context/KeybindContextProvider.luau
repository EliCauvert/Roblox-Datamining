local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local keybindContextModule = require(script.Parent.KeybindContext)
local bindingConfigsModule = require(parent.Configs.BindingConfigs)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), bindingConfigsModule (ref), keybindContextModule (ref)
	local var1, _ = reactModule.useState(bindingConfigsModule.ControlGroups)
	local var2, _ = reactModule.useState(bindingConfigsModule.Controls)
	
	return reactModule.createElement(keybindContextModule.Provider, { value = { groups = var1, controls = var2 } }, p1.children)
end)