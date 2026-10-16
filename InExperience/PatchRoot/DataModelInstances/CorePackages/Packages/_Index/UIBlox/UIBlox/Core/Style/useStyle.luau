local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local _ = require(Parent1.App.Style.StyleTypes)
local StyleContextModule = require(Parent.StyleContext)
local ReactModule = require(Parent1.Parent.React)

return function() --[[ Line: 15 | Named "useStyle" ]]
	-- upvalues: ReactModule (copy), StyleContextModule (copy)
	return ReactModule.useContext(StyleContextModule).style
end