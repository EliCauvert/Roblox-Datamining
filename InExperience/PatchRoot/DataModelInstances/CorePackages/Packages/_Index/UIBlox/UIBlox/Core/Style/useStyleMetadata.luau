local Parent = script.Parent
local StyleContextModule = require(Parent.StyleContext)
local ReactModule = require(Parent.Parent.Parent.Parent.React)

return function() --[[ Line: 13 | Named "useStyleMetadata" ]]
	-- upvalues: ReactModule (copy), StyleContextModule (copy)
	local UseContextResult = ReactModule.useContext(StyleContextModule)
	
	return if UseContextResult then UseContextResult.styleMetadata else nil
end