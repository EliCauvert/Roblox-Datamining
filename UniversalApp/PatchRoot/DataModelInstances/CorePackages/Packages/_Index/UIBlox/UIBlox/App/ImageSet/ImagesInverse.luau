local t = {}

for i, v in require(script.Parent.Images) do
	t[v] = i
end
return t