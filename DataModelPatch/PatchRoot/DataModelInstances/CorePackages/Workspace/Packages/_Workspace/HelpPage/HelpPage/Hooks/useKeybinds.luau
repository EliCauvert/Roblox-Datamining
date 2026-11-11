local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local KeybindContextModule = require(Parent.Context.KeybindContext)

return function()
	-- upvalues: ReactModule (copy), KeybindContextModule (copy)
	return ReactModule.useContext(KeybindContextModule)
end