local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local EmptyPage = RoactModule.PureComponent:extend("EmptyPage")
local QuadResult = RoactFitComponents.Rect.quad(9, 0, 24, 0)
EmptyPage.validateProps = TModule.strictInterface({
	page = TModule.table,
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table)
})

function EmptyPage.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), RoactGamepadModule (copy), FitFrameVertical (copy), RoactModule (copy), QuadResult (copy)
	local Page = p1.props.page
	local EmptyString = Page.EmptyString or Page.Title
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), EmptyString (copy), RoactGamepadModule (upval), FitFrameVertical (upval), RoactModule (upval), QuadResult (upval), p1 (copy)
		return WithLocalizationFunction({
			noItemsLabel = "Feature.Avatar.Label.NoItems",
			itemType = EmptyString
		})(function(p3)
			-- upvalues: p2 (copy), RoactGamepadModule (upval), FitFrameVertical (upval), RoactModule (upval), QuadResult (upval), p1 (upval)
			local Theme = p2.Theme
			local _Font = p2.Font
			local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
			
			return RoactModule.createElement(RoactGamepadModule.Focusable[FitFrameVertical], {
				BorderSizePixel = 0,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 22),
				margin = QuadResult,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				BackgroundTransparency = Theme.BackgroundDefault.Transparency,
				NextSelectionUp = p1.props.NextSelectionUp,
				NextSelectionDown = p1.props.NextSelectionDown
			}, {
				NoItemsText = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, ScaledBaseSize),
					Text = p3.noItemsLabel:gsub("({itemType})", p3.itemType),
					TextSize = ScaledBaseSize,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.TextTransparency,
					TextXAlignment = Enum.TextXAlignment.Center,
					Font = _Font.Header2.Font
				})
			})
		end)
	end)
end

return EmptyPage