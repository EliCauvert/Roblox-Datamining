local var1 = newproxy(true)

getmetatable(var1).__tostring = function()
	return "Object.None"
end

return var1