local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string --[[ Line: 20 ]]
	return "Object.None"
end

return Proxy