local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local KeybindContextModule = require(script.Parent.KeybindContext)
local BindingConfigsModule = require(Parent.Configs.BindingConfigs)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), BindingConfigsModule (copy), KeybindContextModule (copy)
	local UseStateResult, _ = ReactModule.useState(BindingConfigsModule.ControlGroups)
	local UseStateResult1, _ = ReactModule.useState(BindingConfigsModule.Controls)
	
	return ReactModule.createElement(KeybindContextModule.Provider, {
		value = { groups = UseStateResult, controls = UseStateResult1 }
	}, p1.children)
end)