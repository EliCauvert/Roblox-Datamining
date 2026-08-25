local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local keybindContextModule = require(script.Parent.KeybindContext)
local bindingConfigsModule = require(parent.Configs.BindingConfigs)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), bindingConfigsModule (ref), keybindContextModule (ref)
	local var3, _ = reactModule.useState(bindingConfigsModule.ControlGroups)
	local var4, _ = reactModule.useState(bindingConfigsModule.Controls)
	
	return reactModule.createElement(keybindContextModule.Provider, { value = { groups = var3, controls = var4 } }, p0.children)
end)