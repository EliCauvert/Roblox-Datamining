local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local FoundationModule = require(CorePackages.Packages.Foundation)
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local FoundationFontFaceMigration1 = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFontFaceAX and FoundationFontFaceMigration
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitTextLabel = RoactFitComponents.FitTextLabel
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ListEntry = RoactModule.PureComponent:extend("ListEntry")
ListEntry.validateProps = TModule.strictInterface({
	text = TModule.string,
	hasBullet = TModule.boolean,
	layoutOrder = TModule.integer,
	positionChangedCallback = TModule.optional(TModule.callback),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table)
})

function ListEntry.render(p1) --[[ Line: 40 ]]
	-- upvalues: WithStyleFunction (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Text (copy), RoactModule (copy), RoactFitComponents (copy), NormalizeFontFaceFunction (copy), FitTextLabel (copy), FoundationFontFaceMigration1 (copy)
	return WithStyleFunction(function(p2) --[[ Line: 41 ]]
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Text (upval), p1 (copy), RoactModule (upval), RoactFitComponents (upval), NormalizeFontFaceFunction (upval), FitTextLabel (upval), FoundationFontFaceMigration1 (upval)
		local _Font = p2.Font
		local Theme = p2.Theme
		local CaptionBodyFont = _Font.CaptionBody.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.CaptionBody.RelativeSize
		local X = if FoundationFontFaceMigration then GetTextSizeFunction("• ", ScaledBaseSize, p2.Tokens.Typography.BodySmall.Font, Vector2.new(10000, 10000)).X else Text.GetTextWidth("• ", CaptionBodyFont, ScaledBaseSize)
		
		return RoactModule.createElement(RoactFitComponents.FitFrameVertical, {
			width = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			[RoactModule.Change.AbsolutePosition] = p1.props.positionChangedCallback,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			[RoactModule.Ref] = p1.props.forwardRef
		}, {
			Bullet = p1.props.hasBullet and RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = "• ",
				LayoutOrder = 1,
				Size = UDim2.fromOffset(X, ScaledBaseSize),
				Font = if FoundationFontFaceMigration then nil else CaptionBodyFont,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodySmall.Font) else nil,
				TextSize = ScaledBaseSize,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Text = RoactModule.createElement(FitTextLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				width = UDim.new(1, p1.props.hasBullet and -X or 0),
				Text = p1.props.text,
				Font = if FoundationFontFaceMigration1 then NormalizeFontFaceFunction(p2.Tokens.Typography.BodySmall.Font) else CaptionBodyFont,
				TextSize = ScaledBaseSize,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef) --[[ Line: 102 ]]
	-- upvalues: RoactModule (copy), ListEntry (copy), CryoModule (copy)
	return RoactModule.createElement(ListEntry, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)