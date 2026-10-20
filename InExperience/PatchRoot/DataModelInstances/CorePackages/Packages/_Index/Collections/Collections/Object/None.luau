local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string
	return "Object.None"
end

return Proxy