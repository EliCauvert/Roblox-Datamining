local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.withLocalization)
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.Constant.IconSize
local IconsStatusOofXlarge = Images["icons/status/oof_xlarge"]
local IconsCommonRefresh = Images["icons/common/refresh"]
local EmptyState = RoactModule.PureComponent:extend("EmptyState")
EmptyState.validateProps = TModule.interface({
	text = TModule.string,
	position = TModule.optional(TModule.UDim2),
	size = TModule.optional(TModule.UDim2),
	reloadAction = TModule.optional(TModule.callback)
})

function EmptyState.render(p1)
	-- upvalues: WithLocalizationModule (copy), WithStyleFunction (copy), TextService (copy), RoactModule (copy), ImageSetLabel (copy), IconSize (copy), IconsStatusOofXlarge (copy), Button (copy), ButtonType (copy), IconsCommonRefresh (copy)
	return WithLocalizationModule({ emptyText = p1.props.text })(function(p2)
		-- upvalues: WithStyleFunction (upval), TextService (upval), RoactModule (upval), p1 (copy), ImageSetLabel (upval), IconSize (upval), IconsStatusOofXlarge (upval), Button (upval), ButtonType (upval), IconsCommonRefresh (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p2 (copy), TextService (upval), RoactModule (upval), p1 (upval), ImageSetLabel (upval), IconSize (upval), IconsStatusOofXlarge (upval), Button (upval), ButtonType (upval), IconsCommonRefresh (upval)
			local EmptyText = p2.emptyText
			local BodyFont = p3.Font.Body.Font
			local ScaledBaseSize = p3.Font.BaseSize * p3.Font.Body.RelativeSize
			local TextSize = TextService:GetTextSize(EmptyText, ScaledBaseSize, BodyFont, Vector2.new(1000, 1000))
			
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = p1.props.position,
				Size = p1.props.size
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 0),
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				EmptyIcon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromOffset(IconSize.XLarge, IconSize.XLarge),
					Image = IconsStatusOofXlarge,
					ImageColor3 = p3.Theme.IconDefault.Color,
					ImageTransparency = p3.Theme.IconDefault.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				Padding1 = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 12)
				}),
				Text = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					TextWrapped = true,
					LayoutOrder = 3,
					Size = UDim2.fromOffset(TextSize.X, TextSize.Y),
					Text = EmptyText,
					Font = BodyFont,
					TextSize = ScaledBaseSize,
					TextColor3 = p3.Theme.TextMuted.Color,
					TextTransparency = p3.Theme.TextMuted.Transparency
				}),
				Padding2 = RoactModule.createElement("Frame", {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 24)
				}),
				ReloadButton = p1.props.reloadAction and RoactModule.createElement(Button, {
					layoutOrder = 5,
					buttonType = ButtonType.Secondary,
					size = UDim2.fromOffset(312, 48),
					icon = IconsCommonRefresh,
					onActivated = p1.props.reloadAction
				})
			})
		end)
	end)
end

return EmptyState