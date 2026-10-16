local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Checkbox = FoundationModule.Checkbox
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local CheckboxRow = RoactModule.PureComponent:extend("CheckboxRow")
CheckboxRow.defaultProps = {
	height = 28,
	image = "icons/controls/microphone",
	descriptionText = "Description Text",
	checkboxSelected = false,
	actionDisabled = false,
	LayoutOrder = 1,
	onCheckboxActivated = function() --[[ Line: 29 ]] end
}
CheckboxRow.validateProps = TModule.interface({
	height = TModule.number,
	image = TModule.string,
	descriptionText = TModule.string,
	checkboxSelected = TModule.boolean,
	actionDisabled = TModule.boolean,
	onCheckboxActivated = TModule.callback,
	LayoutOrder = TModule.optional(TModule.number)
})

function CheckboxRow.render(p1) --[[ Line: 43 ]]
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), RoactModule (copy), FoundationModule (copy), ImageSetLabel (copy), Images (copy), NormalizeFontFaceFunction (copy), Checkbox (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2) --[[ Line: 44 ]]
		-- upvalues: FoundationFontFaceMigration (upval)
		return {
			Tokens = if FoundationFontFaceMigration then p2 else nil,
			Theme = {
				IconDefault = {
					Color = p2.Color.Content.Default.Color3,
					Transparency = p2.Color.Content.Default.Transparency
				},
				IconEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				},
				TextEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				},
				TextMuted = {
					Color = p2.Color.Content.Muted.Color3,
					Transparency = p2.Color.Content.Muted.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Header2 = {
					Font = p2.Typography.TitleLarge.Font,
					RelativeSize = p2.Typography.TitleLarge.FontSize
				}
			}
		}
	end, function(p2) --[[ Line: 73 ]]
		-- upvalues: p1 (copy), FFlagCoreUiMigrateUIBloxToFoundation (upval), RoactModule (upval), FoundationModule (upval), ImageSetLabel (upval), Images (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), Checkbox (upval)
		local BaseSize = p2.Font.BaseSize
		local TextMuted = nil
		local IconDefault = nil
		
		if p1.props.actionDisabled then
			TextMuted = p2.Theme.TextMuted
			IconDefault = p2.Theme.IconDefault
		else
			TextMuted = p2.Theme.TextEmphasis
			IconDefault = p2.Theme.IconEmphasis
		end
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, p1.props.height),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			layout = RoactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 12),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			image = if FFlagCoreUiMigrateUIBloxToFoundation then RoactModule.createElement(FoundationModule.Icon, {
				LayoutOrder = 1,
				name = p1.props.image,
				size = FoundationModule.Enums.IconSize.Medium,
				style = {
					Color3 = IconDefault.Color,
					Transparency = IconDefault.Transparency
				}
			}) else RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(p1.props.height, p1.props.height),
				Image = Images[p1.props.image],
				ImageColor3 = IconDefault.Color,
				ImageTransparency = IconDefault.Transparency
			}),
			text = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, -(p1.props.height + 12) * 4, 1, 0),
				Text = p1.props.descriptionText,
				TextColor3 = TextMuted.Color,
				TextTransparency = TextMuted.Transparency,
				TextSize = p2.Font.Header2.RelativeSize * BaseSize,
				Font = if FoundationFontFaceMigration then nil else p2.Font.Header2.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.TitleLarge.Font) else nil,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			checkbox = RoactModule.createElement(Checkbox, {
				label = "",
				LayoutOrder = 3,
				isDisabled = p1.props.actionDisabled,
				isChecked = p1.props.checkboxSelected,
				onActivated = p1.props.onCheckboxActivated
			})
		})
	end)
end

return CheckboxRow