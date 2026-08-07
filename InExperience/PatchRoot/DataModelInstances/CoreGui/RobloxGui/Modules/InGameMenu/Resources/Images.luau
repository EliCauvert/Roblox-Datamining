local argCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local t = {}

for i, v in pairs(require(script.Parent.GetImageSetData)(game:GetService("GuiService"):GetResolutionScale())) do
	argCheckModule.isType(v, "table", "value")
	local t_1 = {}
	
	for i_1, v_1 in pairs(v) do
		if i_1 == "ImageSet" then
			t_1.Image = string.format("rbxasset://textures/ui/ImageSet/%s.png", v_1)
		else
			t_1[i_1] = v_1
		end
	end
	t[i] = t_1
end
setmetatable(t, {
	__index = function(_, p0) --[[ line: 30 ]]
		error(("%q is not a valid member of Images"):format(tostring(p0)), 2)
	end
})

return t