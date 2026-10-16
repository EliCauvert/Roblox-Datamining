local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local GlobalConfigModule = require(Parent.GlobalConfig)
local StrictInterfaceResult = T.strictInterface({
	Size = T.optional(T.UDim2),
	AnchorPoint = T.optional(T.UDim2),
	CanvasSize = T.optional(T.UDim2),
	Position = T.optional(T.UDim2),
	[Roact.Children] = T.optional(T.table)
})

return function(Frame) --[[ Line: 23 | Named "PaddedScrollFrame" ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), AssetsModule (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(Frame))
	end
	return WithFoundationOrUIBloxStyleFunction(function(p1) --[[ Line: 27 ]]
		return {
			Theme = {
				UIEmphasis = {
					Color = p1.Color.Shift.Shift_400.Color3,
					Transparency = p1.Color.Shift.Shift_400.Transparency
				}
			}
		}
	end, function(p1) --[[ Line: 33 ]]
		-- upvalues: Roact (upval), AssetsModule (upval), Frame (copy)
		return Roact.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			ScrollBarThickness = 12,
			ScrollBarImageColor3 = p1.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = p1.Theme.UIEmphasis.Transparency,
			BottomImage = AssetsModule.Images.ScrollBottom,
			MidImage = AssetsModule.Images.ScrollMid,
			TopImage = AssetsModule.Images.ScrollTop,
			Size = Frame.Size,
			AnchorPoint = Frame.AnchorPoint,
			CanvasSize = Frame.CanvasSize,
			Position = Frame.Position
		}, Frame[Roact.Children])
	end)
end