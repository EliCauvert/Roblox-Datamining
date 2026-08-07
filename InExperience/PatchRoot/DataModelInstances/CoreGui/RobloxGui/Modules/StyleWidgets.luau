local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local create = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create
local t = { TabSelectionHeight = 6 }

function t.MakeTabSelectionWidget(value) --[[ line: 24 ]]
	-- upvalues: create (ref), t (ref)
	return create("ImageLabel")({
		Name = "TabSelection",
		Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png",
		Visible = false,
		BackgroundTransparency = 1,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(3, 1, 4, 5),
		Size = UDim2.new(1, 0, 0, t.TabSelectionHeight),
		Position = UDim2.new(0, 0, 1, -t.TabSelectionHeight),
		Parent = value
	})
end

return t