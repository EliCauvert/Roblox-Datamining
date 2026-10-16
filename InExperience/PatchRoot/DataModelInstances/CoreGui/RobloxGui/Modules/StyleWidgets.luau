local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CreateFunction = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create
local StyleWidgetsModule = { TabSelectionHeight = 6 }

function StyleWidgetsModule.MakeTabSelectionWidget(Parent) --[[ Line: 24 ]]
	-- upvalues: CreateFunction (copy), StyleWidgetsModule (copy)
	return (CreateFunction("ImageLabel")({
		Name = "TabSelection",
		Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png",
		Visible = false,
		BackgroundTransparency = 1,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(3, 1, 4, 5),
		Size = UDim2.new(1, 0, 0, StyleWidgetsModule.TabSelectionHeight),
		Position = UDim2.new(0, 0, 1, -StyleWidgetsModule.TabSelectionHeight),
		Parent = Parent
	}))
end

return StyleWidgetsModule