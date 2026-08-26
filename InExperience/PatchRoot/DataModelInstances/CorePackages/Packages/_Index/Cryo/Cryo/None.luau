local var1 = newproxy(true)

getmetatable(var1).__tostring = function()
	return "Cryo.None"
end

return var1