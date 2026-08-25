return {
	named = function(p0)
		assert(type(p0) == "string", "Symbols must be created using a string name!")
		local var0 = newproxy(true)
		local formattedText = string.format("Symbol(%s)", p0)
		
		getmetatable(var0).__tostring = function()
			-- upvalues: formattedText (ref)
			return formattedText
		end
		
		return var0
	end
}