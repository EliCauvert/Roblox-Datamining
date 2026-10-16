local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ImagesModule = {}

for i, value in pairs((require(script.Parent.GetImageSetData)((game:GetService("GuiService"):GetResolutionScale())))) do
	ArgCheckModule.isType(value, "table", "value")
	local t = {}
	
	for i1, value1 in pairs(value) do
		if i1 == "ImageSet" then
			t.Image = string.format("rbxasset://textures/ui/ImageSet/%s.png", value1)
		else
			t[i1] = value1
		end
	end
	ImagesModule[i] = t
end
setmetatable(ImagesModule, {
	__index = function(_, p1) --[[ Line: 30 ]]
		error(("%q is not a valid member of Images"):format((tostring(p1))), 2)
	end
})

return ImagesModule