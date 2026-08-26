local var1 = newproxy(true)

getmetatable(var1).__tostring = function()
	return "Llama.None"
end

return var1