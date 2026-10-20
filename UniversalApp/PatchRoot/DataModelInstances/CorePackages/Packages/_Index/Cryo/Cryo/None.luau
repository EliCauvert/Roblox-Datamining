local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string
	return "Cryo.None"
end

return Proxy