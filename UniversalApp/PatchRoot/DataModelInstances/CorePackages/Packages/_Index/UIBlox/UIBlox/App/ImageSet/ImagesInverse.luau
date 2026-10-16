local ImagesInverseModule = {}

for i, value in require(script.Parent.Images) do
	ImagesInverseModule[value] = i
end
return ImagesInverseModule