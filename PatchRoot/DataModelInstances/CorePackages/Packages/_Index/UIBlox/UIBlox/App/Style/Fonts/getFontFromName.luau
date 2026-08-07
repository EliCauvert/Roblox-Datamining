-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:58 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local validateFontModule = require(parent.Validator.validateFont)
local fontLoaderModule = require(script.Parent.FontLoader)
local _ = require(parent.StyleTypes)

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: fontLoaderModule (ref), constantsModule (ref), validateFontModule (ref)
	local t = {
		[constantsModule.FontName.Gotham:lower()] = fontLoaderModule.new(p1):loadFont()
	}
	local var4 = if not (p0 == nil or #p0 <= 0) then t[p0:lower()] else nil
	
	if var4 == nil then
		var4 = t[constantsModule.DefaultFontName:lower()]
	end
	assert(validateFontModule(var4))
	
	return var4
end