local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string --[[ Line: 4 ]]
	return "Llama.None"
end

return Proxy