local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local GlobalConfigModule = require(Parent.GlobalConfig)
local ImageSetLabel = InGameMenuDependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local config = {
	[Enum.UserInputType.MouseButton1] = AssetsModule.Images.Mouse1Press,
	[Enum.UserInputType.MouseButton2] = AssetsModule.Images.Mouse2Press,
	[Enum.UserInputType.MouseWheel] = AssetsModule.Images.MouseWheelScroll
}
local StrictInterfaceResult = T.strictInterface({
	input = T.enum(Enum.UserInputType),
	AnchorPoint = T.optional(T.Vector2),
	Position = T.optional(T.UDim2),
	LayoutOrder = T.optional(T.integer)
})

return function(Frame: Frame)
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), Roact (copy), ImageSetLabel (copy), config (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(Frame))
	end
	return Roact.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Image = config[Frame.input],
		Size = UDim2.new(0, 36, 0, 36),
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint,
		LayoutOrder = Frame.LayoutOrder
	})
end