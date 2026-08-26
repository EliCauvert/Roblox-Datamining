local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local globalConfigModule = require(parent.GlobalConfig)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local image = require(corePackagesService.Packages.Foundation).Image
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local t_1 = {
	[Enum.UserInputType.MouseButton1] = assetsModule.Images.Mouse1Press,
	[Enum.UserInputType.MouseButton2] = assetsModule.Images.Mouse2Press,
	[Enum.UserInputType.MouseWheel] = assetsModule.Images.MouseWheelScroll
}
local var1 = t.strictInterface({
	input = t.enum(Enum.UserInputType),
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	LayoutOrder = t.optional(t.integer)
})

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), t_1 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), roact (ref), image (ref), imageSetLabel (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	local input = t_1[p1.input]
	
	return if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
		Image = input.Image,
		imageRect = {
			offset = input.ImageRectOffset,
			size = input.ImageRectSize
		},
		Size = UDim2.new(0, 36, 0, 36),
		Position = p1.Position,
		AnchorPoint = p1.AnchorPoint,
		LayoutOrder = p1.LayoutOrder
	}) else roact.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Image = input,
		Size = UDim2.new(0, 36, 0, 36),
		Position = p1.Position,
		AnchorPoint = p1.AnchorPoint,
		LayoutOrder = p1.LayoutOrder
	})
end