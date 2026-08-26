local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local globalConfigModule = require(parent.GlobalConfig)
local var1 = t.strictInterface({
	Size = t.optional(t.UDim2),
	AnchorPoint = t.optional(t.UDim2),
	CanvasSize = t.optional(t.UDim2),
	Position = t.optional(t.UDim2),
	[roact.Children] = t.optional(t.table)
})

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), withFoundationOrUIBloxStyle (ref), roact (ref), assetsModule (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				UIEmphasis = {
					Color = p2.Color.Shift.Shift_400.Color3,
					Transparency = p2.Color.Shift.Shift_400.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: roact (copy), assetsModule (copy), p1 (ref)
		return roact.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			ScrollBarThickness = 12,
			ScrollBarImageColor3 = p2.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = p2.Theme.UIEmphasis.Transparency,
			BottomImage = assetsModule.Images.ScrollBottom,
			MidImage = assetsModule.Images.ScrollMid,
			TopImage = assetsModule.Images.ScrollTop,
			Size = p1.Size,
			AnchorPoint = p1.AnchorPoint,
			CanvasSize = p1.CanvasSize,
			Position = p1.Position
		}, p1[roact.Children])
	end)
end