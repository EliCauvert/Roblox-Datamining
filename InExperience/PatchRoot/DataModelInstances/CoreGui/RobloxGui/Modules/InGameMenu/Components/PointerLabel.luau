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
local var5 = t.strictInterface({
	input = t.enum(Enum.UserInputType),
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	LayoutOrder = t.optional(t.integer)
})

return function(p0) --[[ line: 34 | named "PointerLabel" ]]
	-- upvalues: globalConfigModule (ref), var5 (ref), t_1 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), roact (ref), image (ref), imageSetLabel (ref)
	if globalConfigModule.propValidation then
		assert(var5(p0))
	end
	local input = t_1[p0.input]
	
	return if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
		Image = input.Image,
		imageRect = {
			offset = input.ImageRectOffset,
			size = input.ImageRectSize
		},
		Size = UDim2.new(0, 36, 0, 36),
		Position = p0.Position,
		AnchorPoint = p0.AnchorPoint,
		LayoutOrder = p0.LayoutOrder
	}) else roact.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Image = input,
		Size = UDim2.new(0, 36, 0, 36),
		Position = p0.Position,
		AnchorPoint = p0.AnchorPoint,
		LayoutOrder = p0.LayoutOrder
	})
end