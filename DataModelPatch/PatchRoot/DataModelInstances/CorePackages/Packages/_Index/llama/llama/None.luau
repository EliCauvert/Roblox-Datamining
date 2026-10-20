local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string
	return "Llama.None"
end

return Proxy