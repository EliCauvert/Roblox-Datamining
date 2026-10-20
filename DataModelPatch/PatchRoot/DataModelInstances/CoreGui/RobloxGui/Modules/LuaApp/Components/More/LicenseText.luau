local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local VerticalScrollViewWithMargin = UIBloxModule.App.Container.VerticalScrollViewWithMargin
local LicenseText = RoactModule.PureComponent:extend("LicenseText")
LicenseText.defaultProps = { contentMaxWidth = 1e999, paddingHorizontal = 0 }
LicenseText.validateProps = TModule.strictInterface({
	licenseTextLines = TModule.array(TModule.string),
	contentMaxWidth = TModule.optional(TModule.number),
	paddingHorizontal = TModule.optional(TModule.number)
})

function LicenseText.getTextLines(p1, p2)
	-- upvalues: RoactModule (copy), CryoModule (copy)
	local config = {
		TextLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		})
	}
	
	for LayoutOrder, licenseTextLine in ipairs(p1.props.licenseTextLines) do
		config[LayoutOrder] = RoactModule.createElement("TextLabel", CryoModule.Dictionary.join(p2, { LayoutOrder = LayoutOrder, Text = licenseTextLine }))
	end
	return config
end

function LicenseText.render(p3)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), VerticalScrollViewWithMargin (copy)
	return WithStyleFunction(function(p4)
		-- upvalues: p3 (copy), RoactModule (upval), VerticalScrollViewWithMargin (upval)
		local TextDefault = p4.Theme.TextDefault
		local _Font = p4.Font
		local PaddingHorizontal: number = p3.props.paddingHorizontal
		
		return RoactModule.createElement(VerticalScrollViewWithMargin, {
			useAutomaticCanvasSize = true,
			paddingHorizontal = 0,
			canvasSizeY = UDim.new(0, 0)
		}, {
			LicenseFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0),
				Position = UDim2.fromScale(0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {
				License = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0)
				}, (p3:getTextLines({
					BackgroundTransparency = 1,
					LineHeight = 1.25,
					TextWrapped = true,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Font = _Font.Body.Font,
					TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
					TextColor3 = TextDefault.Color,
					TextTransparency = TextDefault.Transparency
				}))),
				LicenseMaxWidth = RoactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(p3.props.contentMaxWidth + 2 * PaddingHorizontal, 1e999)
				}),
				LicensePadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, PaddingHorizontal),
					PaddingRight = UDim.new(0, PaddingHorizontal),
					PaddingBottom = UDim.new(0, 24)
				})
			})
		})
	end)
end

return LicenseText