local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string --[[ Line: 11 ]]
	return "Cryo.None"
end

return Proxy