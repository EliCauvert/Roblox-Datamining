local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local validateFontModule = require(parent.Validator.validateFont)
local fontLoaderModule = require(script.Parent.FontLoader)
local _ = require(parent.StyleTypes)

return function(p1, p2)
	-- upvalues: fontLoaderModule (ref), constantsModule (ref), validateFontModule (ref)
	local var1 = fontLoaderModule.new(p2)
	local t = {
		[constantsModule.FontName.Gotham:lower()] = var1:loadFont(),
		[constantsModule.FontName.Classic:lower()] = var1:loadFont(Enum.Font.Cartoon)
	}
	local var2 = if not (p1 == nil or #p1 <= 0) then t[p1:lower()] else nil
	
	if var2 == nil then
		var2 = t[constantsModule.DefaultFontName:lower()]
	end
	assert(validateFontModule(var2))
	
	return var2
end