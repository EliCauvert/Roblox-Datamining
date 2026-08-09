local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local globalConfigModule = require(parent.GlobalConfig)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local t_1 = {
	[Enum.UserInputType.MouseButton1] = assetsModule.Images.Mouse1Press,
	[Enum.UserInputType.MouseButton2] = assetsModule.Images.Mouse2Press,
	[Enum.UserInputType.MouseWheel] = assetsModule.Images.MouseWheelScroll
}
local var4 = t.strictInterface({
	input = t.enum(Enum.UserInputType),
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	LayoutOrder = t.optional(t.integer)
})

return function(p0) --[[ line: 29 | named "PointerLabel" ]]
	-- upvalues: globalConfigModule (ref), var4 (ref), roact (ref), imageSetLabel (ref), t_1 (ref)
	if globalConfigModule.propValidation then
		assert(var4(p0))
	end
	return roact.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Image = t_1[p0.input],
		Size = UDim2.new(0, 36, 0, 36),
		Position = p0.Position,
		AnchorPoint = p0.AnchorPoint,
		LayoutOrder = p0.LayoutOrder
	})
end