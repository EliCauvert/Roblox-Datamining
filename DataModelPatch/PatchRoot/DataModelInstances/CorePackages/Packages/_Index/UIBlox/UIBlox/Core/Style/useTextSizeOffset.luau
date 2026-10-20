local Parent = script.Parent
local StyleContextModule = require(Parent.StyleContext)
local ReactModule = require(Parent.Parent.Parent.Parent.React)

return function()
	-- upvalues: ReactModule (copy), StyleContextModule (copy)
	return ReactModule.useContext(StyleContextModule).derivedValues.textSizeOffset
end