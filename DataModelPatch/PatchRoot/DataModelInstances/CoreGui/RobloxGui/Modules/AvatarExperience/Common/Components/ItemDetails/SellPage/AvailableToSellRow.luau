local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local FFlagAXRemoveSellPageAndChildrenGamepadBindings = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveSellPageAndChildrenGamepadBindings
local IconsActionsEditAdd = UIBloxModule.App.ImageSet.Images["icons/actions/edit/add"]
local AvailableToSellRow = RoactModule.PureComponent:extend("AvailableToSellRow")
AvailableToSellRow.defaultProps = {
	horizontalPadding = 24,
	onActivated = function() end
}

function AvailableToSellRow.render(p1)
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy), RoactModule (copy), Focusable (copy), CursorKind (copy), FFlagAXRemoveSellPageAndChildrenGamepadBindings (copy), RoactGamepadModule (copy), ImageSetLabel (copy), IconsActionsEditAdd (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), WithSelectionCursorProviderFunction (upval), RoactModule (upval), Focusable (upval), CursorKind (upval), FFlagAXRemoveSellPageAndChildrenGamepadBindings (upval), RoactGamepadModule (upval), ImageSetLabel (upval), IconsActionsEditAdd (upval)
		local _Font = p2.Font
		local Theme = p2.Theme
		local Position = p1.props.Position
		local LayoutOrder = p1.props.LayoutOrder
		local HorizontalPadding = p1.props.horizontalPadding
		local OnActivated = p1.props.onActivated
		local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
		local Text = p1.props.Text
		local ForwardRef = p1.props.forwardRef
		
		return WithSelectionCursorProviderFunction(function(Callback)
			-- upvalues: RoactModule (upval), Focusable (upval), LayoutOrder (copy), Position (copy), p1 (upval), ForwardRef (copy), CursorKind (upval), FFlagAXRemoveSellPageAndChildrenGamepadBindings (upval), RoactGamepadModule (upval), OnActivated (copy), HorizontalPadding (copy), _Font (copy), Text (copy), Theme (copy), ScaledBaseSize (copy), ImageSetLabel (upval), IconsActionsEditAdd (upval)
			return RoactModule.createElement(Focusable.Frame, {
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				Position = Position,
				Size = UDim2.new(1, 0, 0, 70),
				NextSelectionLeft = p1.props.NextSelectionLeft,
				NextSelectionRight = p1.props.NextSelectionRight,
				NextSelectionUp = p1.props.NextSelectionUp,
				NextSelectionDown = p1.props.NextSelectionDown,
				[RoactModule.Ref] = ForwardRef,
				SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
				inputBindings = if FFlagAXRemoveSellPageAndChildrenGamepadBindings then nil else {
					SellItem = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, OnActivated)
				}
			}, {
				Paddding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, HorizontalPadding),
					PaddingRight = UDim.new(0, HorizontalPadding)
				}),
				TextLabel = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Font = _Font.Body.Font,
					Position = UDim2.new(0, 0, 0.5, 0),
					Size = UDim2.new(1, -50, 1, 0),
					Text = Text,
					TextColor3 = Theme.TextDefault.Color,
					TextSize = ScaledBaseSize,
					TextTransparency = Theme.TextDefault.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				PressableButton = RoactModule.createElement("TextButton", {
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Position = UDim2.new(1, -50, 0.5, 0),
					Size = UDim2.new(0, 50, 0, 50),
					Text = "",
					[RoactModule.Event.Activated] = OnActivated
				}, {
					RemoveButton = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = IconsActionsEditAdd,
						ImageColor3 = Theme.IconEmphasis.Color,
						ImageTransparency = Theme.IconEmphasis.Transparency,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, 40, 0, 40)
					})
				})
			})
		end)
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), AvailableToSellRow (copy), CryoModule (copy)
	return RoactModule.createElement(AvailableToSellRow, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)