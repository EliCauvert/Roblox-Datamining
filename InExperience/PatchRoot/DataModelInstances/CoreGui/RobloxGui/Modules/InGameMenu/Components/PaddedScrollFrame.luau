local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local withStyle = inGameMenuDependenciesModule.UIBlox.Core.Style.withStyle
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local globalConfigModule = require(parent.GlobalConfig)
local var3 = t.strictInterface({
	Size = t.optional(t.UDim2),
	AnchorPoint = t.optional(t.UDim2),
	CanvasSize = t.optional(t.UDim2),
	Position = t.optional(t.UDim2),
	[roact.Children] = t.optional(t.table)
})

return function(p0) --[[ line: 24 | named "PaddedScrollFrame" ]]
	-- upvalues: globalConfigModule (ref), var3 (ref), withStyle (ref), roact (ref), assetsModule (ref)
	if globalConfigModule.propValidation then
		assert(var3(p0))
	end
	return withStyle(function(p1) --[[ line: 28 ]]
		-- upvalues: roact (copy), assetsModule (copy), p0 (ref)
		return roact.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			ScrollBarThickness = 12,
			ScrollBarImageColor3 = p1.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = p1.Theme.UIEmphasis.Transparency,
			BottomImage = assetsModule.Images.ScrollBottom,
			MidImage = assetsModule.Images.ScrollMid,
			TopImage = assetsModule.Images.ScrollTop,
			Size = p0.Size,
			AnchorPoint = p0.AnchorPoint,
			CanvasSize = p0.CanvasSize,
			Position = p0.Position
		}, p0[roact.Children])
	end)
end