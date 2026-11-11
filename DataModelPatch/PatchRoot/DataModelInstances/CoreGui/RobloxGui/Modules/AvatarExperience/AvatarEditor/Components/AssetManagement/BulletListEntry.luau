local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitTextLabel = RoactFitComponents.FitTextLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local BulletListEntry = RoactModule.PureComponent:extend("BulletListEntry")
BulletListEntry.validateProps = TModule.strictInterface({
	text = TModule.string,
	layoutOrder = TModule.integer,
	positionChangedCallback = TModule.optional(TModule.callback),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table)
})

function BulletListEntry.renderWithProviders(p1, p2, Callback)
	-- upvalues: Text (copy), RoactModule (copy), RoactFitComponents (copy), CursorKind (copy), FitTextLabel (copy)
	local _Font = p2.Font
	local Theme = p2.Theme
	local CaptionBodyFont = _Font.CaptionBody.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.CaptionBody.RelativeSize
	local XOffset = Text.GetTextWidth("• ", CaptionBodyFont, ScaledBaseSize)
	
	return RoactModule.createElement(RoactFitComponents.FitFrameVertical, {
		width = UDim.new(1, 0),
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.layoutOrder,
		[RoactModule.Change.AbsolutePosition] = p1.props.positionChangedCallback,
		SelectionImageObject = Callback(CursorKind.RoundedRect),
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		[RoactModule.Ref] = p1.props.forwardRef
	}, {
		Bullet = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = "• ",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(XOffset, ScaledBaseSize),
			Font = CaptionBodyFont,
			TextSize = ScaledBaseSize,
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Text = RoactModule.createElement(FitTextLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			width = UDim.new(1, -XOffset),
			Text = p1.props.text,
			Font = CaptionBodyFont,
			TextSize = ScaledBaseSize,
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
end

function BulletListEntry.render(p1)
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (copy)
		return WithSelectionCursorProviderFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), BulletListEntry (copy), CryoModule (copy)
	return RoactModule.createElement(BulletListEntry, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)