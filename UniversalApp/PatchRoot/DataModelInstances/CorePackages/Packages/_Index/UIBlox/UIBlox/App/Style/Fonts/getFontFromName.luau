local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local validateFontModule = require(parent.Validator.validateFont)
local fontLoaderModule = require(script.Parent.FontLoader)
local _ = require(parent.StyleTypes)

return function(p1, p2)
	-- upvalues: fontLoaderModule (ref), constantsModule (ref), validateFontModule (ref)
	local t = {
		[constantsModule.FontName.Gotham:lower()] = fontLoaderModule.new(p2):loadFont()
	}
	local var1 = if not (p1 == nil or #p1 <= 0) then t[p1:lower()] else nil
	
	if var1 == nil then
		var1 = t[constantsModule.DefaultFontName:lower()]
	end
	assert(validateFontModule(var1))
	
	return var1
end