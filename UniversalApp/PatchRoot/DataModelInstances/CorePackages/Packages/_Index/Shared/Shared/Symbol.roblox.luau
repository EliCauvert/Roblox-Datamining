return {
	named = function(p1)
		assert(type(p1) == "string", "Symbols must be created using a string name!")
		local var1 = newproxy(true)
		local formattedText = string.format("Symbol(%s)", p1)
		
		getmetatable(var1).__tostring = function()
			-- upvalues: formattedText (ref)
			return formattedText
		end
		
		return var1
	end
}