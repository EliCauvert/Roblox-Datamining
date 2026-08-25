local _ = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local create = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create

return {
	CreateShadow = function(p0)
		-- upvalues: create (ref)
		return create("ImageLabel")({
			Name = "Shadow",
			Image = "rbxasset://textures/ui/Shell/Buttons/Generic9ScaleShadow.png",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 3, 1, 3),
			Position = UDim2.new(0, 0, 0, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(10, 10, 28, 28),
			ZIndex = p0 or 1
		})
	end
}