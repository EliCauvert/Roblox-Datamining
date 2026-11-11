local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local FitTextLabel = RoactFitComponents.FitTextLabel
local FFlagAXRemoveSellPageAndChildrenGamepadBindings = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveSellPageAndChildrenGamepadBindings
local IconsCommonRobux = Images["icons/common/robux"]
local IconsActionsEditRemove = Images["icons/actions/edit/remove"]
local CurrentlySellingRow = RoactModule.PureComponent:extend("CurrentlySellingRow")
CurrentlySellingRow.defaultProps = {
	horizontalPadding = 0,
	onActivated = function() end
}

function CurrentlySellingRow.render(p1)
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy), RoactModule (copy), Focusable (copy), CursorKind (copy), FFlagAXRemoveSellPageAndChildrenGamepadBindings (copy), RoactGamepadModule (copy), FitFrameVertical (copy), FitTextLabel (copy), ImageSetLabel (copy), IconsCommonRobux (copy), IconsActionsEditRemove (copy)
	local UserAssetInfo = p1.props.userAssetInfo
	
	if not UserAssetInfo then return end
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), UserAssetInfo (copy), WithSelectionCursorProviderFunction (upval), RoactModule (upval), Focusable (upval), CursorKind (upval), FFlagAXRemoveSellPageAndChildrenGamepadBindings (upval), RoactGamepadModule (upval), FitFrameVertical (upval), FitTextLabel (upval), ImageSetLabel (upval), IconsCommonRobux (upval), IconsActionsEditRemove (upval)
		local _Font = p2.Font
		local Theme = p2.Theme
		local Position = p1.props.Position
		local LayoutOrder = p1.props.LayoutOrder
		local HorizontalPadding = p1.props.horizontalPadding
		local OnActivated = p1.props.onActivated
		local IsLimitedUnique = p1.props.isLimitedUnique
		local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
		local Text = "# " .. tostring(UserAssetInfo.serialNumber)
		local PriceInRobux = UserAssetInfo.priceInRobux
		local ForwardRef = p1.props.forwardRef
		
		return WithSelectionCursorProviderFunction(function(Callback)
			-- upvalues: RoactModule (upval), Focusable (upval), LayoutOrder (copy), Position (copy), p1 (upval), ForwardRef (copy), CursorKind (upval), FFlagAXRemoveSellPageAndChildrenGamepadBindings (upval), RoactGamepadModule (upval), OnActivated (copy), HorizontalPadding (copy), FitFrameVertical (upval), IsLimitedUnique (copy), FitTextLabel (upval), _Font (copy), ScaledBaseSize (copy), Text (copy), Theme (copy), ImageSetLabel (upval), IconsCommonRobux (upval), PriceInRobux (copy), IconsActionsEditRemove (upval)
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
				onFocusGained = p1.props.onFocusGained,
				SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
				inputBindings = if FFlagAXRemoveSellPageAndChildrenGamepadBindings then nil else {
					RemoveItemFromSale = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, OnActivated)
				}
			}, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, HorizontalPadding),
					PaddingRight = UDim.new(0, HorizontalPadding)
				}),
				SerialAndPriceContainer = RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					width = UDim.new(1, 0),
					contentPadding = UDim.new(0, 6),
					FillDirection = Enum.FillDirection.Vertical,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 0, 0.5, 0)
				}, {
					SerialNumberTextLabel = IsLimitedUnique and RoactModule.createElement(FitTextLabel, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 1,
						width = UDim.new(1, 0),
						Font = _Font.Body.Font,
						Position = UDim2.new(0, 0, 0, -ScaledBaseSize),
						Size = UDim2.new(1, 0, 0, 0),
						Text = Text,
						TextColor3 = Theme.TextEmphasis.Color,
						TextSize = ScaledBaseSize,
						TextTransparency = Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					RobuxContainer = RoactModule.createElement(FitFrameVertical, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						width = UDim.new(1, -40),
						contentPadding = UDim.new(0, 6),
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}, {
						Image = RoactModule.createElement(ImageSetLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Size = UDim2.new(0, ScaledBaseSize, 0, ScaledBaseSize),
							Image = IconsCommonRobux,
							ImageColor3 = Theme.TextDefault.Color,
							ImageTransparency = Theme.TextDefault.Transparency
						}),
						Text = RoactModule.createElement(FitTextLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							Size = UDim2.new(1, -ScaledBaseSize, 0, ScaledBaseSize),
							Text = tostring(PriceInRobux),
							Font = _Font.Body.Font,
							TextColor3 = Theme.TextDefault.Color,
							TextTransparency = Theme.TextDefault.Transparency,
							TextSize = ScaledBaseSize,
							TextXAlignment = Enum.TextXAlignment.Left
						})
					})
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
					RemoveIcon = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = IconsActionsEditRemove,
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

local v1 = RoactRoduxModule.connect(function(p1, p2)
	return {
		userAssetInfo = p1.AvatarExperience.Catalog.UserAssets[p2.userAssetId]
	}
end)(CurrentlySellingRow)

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)