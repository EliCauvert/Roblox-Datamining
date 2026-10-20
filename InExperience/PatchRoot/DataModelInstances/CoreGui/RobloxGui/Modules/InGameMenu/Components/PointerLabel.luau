local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local GlobalConfigModule = require(Parent.GlobalConfig)
local ImageSetLabel = InGameMenuDependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local Image = require(CorePackages.Packages.Foundation).Image
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
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
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), config (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Roact (copy), Image (copy), ImageSetLabel (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(Frame))
	end
	local Entry = config[Frame.input]
	
	return if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
		Image = Entry.Image,
		imageRect = {
			offset = Entry.ImageRectOffset,
			size = Entry.ImageRectSize
		},
		Size = UDim2.new(0, 36, 0, 36),
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint,
		LayoutOrder = Frame.LayoutOrder
	}) else Roact.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Image = Entry,
		Size = UDim2.new(0, 36, 0, 36),
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint,
		LayoutOrder = Frame.LayoutOrder
	})
end