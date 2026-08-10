local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local globalConfigModule = require(parent.GlobalConfig)
local var4 = t.strictInterface({
	Size = t.optional(t.UDim2),
	AnchorPoint = t.optional(t.UDim2),
	CanvasSize = t.optional(t.UDim2),
	Position = t.optional(t.UDim2),
	[roact.Children] = t.optional(t.table)
})

return function(p0) --[[ line: 23 | named "PaddedScrollFrame" ]]
	-- upvalues: globalConfigModule (ref), var4 (ref), withFoundationOrUIBloxStyle (ref), roact (ref), assetsModule (ref)
	if globalConfigModule.propValidation then
		assert(var4(p0))
	end
	return withFoundationOrUIBloxStyle(function(p1) --[[ line: 27 ]]
		return {
			Theme = {
				UIEmphasis = {
					Color = p1.Color.Shift.Shift_400.Color3,
					Transparency = p1.Color.Shift.Shift_400.Transparency
				}
			}
		}
	end, function(p2) --[[ line: 33 ]]
		-- upvalues: roact (copy), assetsModule (copy), p0 (ref)
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
			Size = p0.Size,
			AnchorPoint = p0.AnchorPoint,
			CanvasSize = p0.CanvasSize,
			Position = p0.Position
		}, p0[roact.Children])
	end)
end