local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local _ = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local FitTextLabel = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitTextLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
local CatalogConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.CatalogConstants)
local ComponentAssetsCircle17 = UIBloxModule.App.ImageSet.Images["component_assets/circle_17"]
local ActionButton = RoactModule.PureComponent:extend("ActionButton")
ActionButton.validateProps = TModule.strictInterface({
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	Size = TModule.UDim2,
	Position = TModule.optional(TModule.UDim2),
	LayoutOrder = TModule.optional(TModule.number),
	AnchorPoint = TModule.optional(TModule.Vector2),
	buttonProps = TModule.table,
	Font = TModule.table,
	forwardRef = TModule.optional(TModule.table)
})

function ActionButton.init(p1)
	p1.state = { isButtonPressed = false }
	
	function p1.onInputBegan()
		-- upvalues: p1 (copy)
		p1:setState({ isButtonPressed = true })
	end
	
	function p1.onInputEnded()
		-- upvalues: p1 (copy)
		p1:setState({ isButtonPressed = false })
	end
end

function ActionButton.renderWithStyle(p1, p2, Callback)
	-- upvalues: CatalogConstantsModule (copy), RoactModule (copy), Skeleton (copy), Radius (copy), ImageSetLabel (copy), FitTextLabel (copy), FFlagAXMISEnableMultiShopping (copy), Focusable (copy), Interactable (copy), ComponentAssetsCircle17 (copy), CursorKind (copy)
	local PropsFont = p1.props.Font
	local ButtonProps = p1.props.buttonProps
	local IsButtonPressed = p1.state.isButtonPressed
	local Theme = p2.Theme
	local DisabledButtonTransparency = if ButtonProps.buttonIsDisabled then CatalogConstantsModule.ActionBar.DisabledButtonTransparency elseif IsButtonPressed then Theme.Overlay.Transparency else 0
	
	return RoactModule.createElement(Focusable[Interactable], {
		Size = p1.props.Size,
		Position = p1.props.Position,
		AnchorPoint = p1.props.AnchorPoint,
		LayoutOrder = p1.props.LayoutOrder,
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Image = ComponentAssetsCircle17,
		ImageColor3 = ButtonProps.buttonColor,
		ImageTransparency = DisabledButtonTransparency,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 8, 9, 9),
		ClipsDescendants = true,
		[RoactModule.Event.InputBegan] = p1.onInputBegan,
		[RoactModule.Event.InputEnded] = p1.onInputEnded,
		[RoactModule.Event.Activated] = function()
			-- upvalues: ButtonProps (copy)
			if ButtonProps.onActivated ~= nil and not ButtonProps.buttonIsLoading then
				ButtonProps.onActivated()
			end
		end,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionDown = p1.props.NextSelectionDown,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionRight = p1.props.NextSelectionRight,
		[RoactModule.Ref] = p1.props.forwardRef,
		SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
	}, {
		ButtonInfo = if ButtonProps.buttonIsLoading then RoactModule.createElement(Skeleton, {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			radius = Radius.Medium
		}) else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, ButtonProps.buttonIconPadding)
			}),
			Icon = ButtonProps.buttonIcon and RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, ButtonProps.buttonIconSize, 0, ButtonProps.buttonIconSize),
				Image = ButtonProps.buttonIcon,
				ImageTransparency = DisabledButtonTransparency,
				ImageColor3 = ButtonProps.buttonTextColor
			}),
			Text = RoactModule.createElement(FitTextLabel, {
				BackgroundTransparency = 1,
				TextWrapped = false,
				LayoutOrder = 2,
				width = FitTextLabel.Width.FitToText,
				Size = UDim2.new(0, 0, 0, PropsFont.BaseSize * PropsFont.Header1.RelativeSize),
				Text = ButtonProps.buttonText or "",
				Font = if FFlagAXMISEnableMultiShopping then PropsFont.Header2.Font else PropsFont.Header1.Font,
				TextSize = if FFlagAXMISEnableMultiShopping then (PropsFont.BaseSize - 2) * PropsFont.Header2.RelativeSize else PropsFont.BaseSize * PropsFont.Header1.RelativeSize,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextColor3 = ButtonProps.buttonTextColor,
				TextTransparency = DisabledButtonTransparency
			})
		})
	})
end

function ActionButton.render(p1)
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (copy)
		return WithSelectionCursorProviderFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithStyle(p2, p3)
		end)
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), ActionButton (copy), CryoModule (copy)
	return RoactModule.createElement(ActionButton, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)