local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local ValidateFontModule = require(Parent.Validator.validateFont)
local FontLoaderModule = require(script.Parent.FontLoader)
local _ = require(Parent.StyleTypes)

return function(Text: string, p1)
	-- upvalues: FontLoaderModule (copy), ConstantsModule (copy), ValidateFontModule (copy)
	local NewFontLoader = FontLoaderModule.new(p1)
	local config = {
		[ConstantsModule.FontName.Gotham:lower()] = NewFontLoader:loadFont(),
		[ConstantsModule.FontName.Classic:lower()] = NewFontLoader:loadFont(Enum.Font.Cartoon)
	}
	local Entry = if Text ~= nil and #Text > 0 then config[Text:lower()] else nil
	
	if Entry == nil then
		Entry = config[ConstantsModule.DefaultFontName:lower()]
	end
	assert(ValidateFontModule(Entry))
	
	return Entry
end