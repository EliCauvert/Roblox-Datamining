local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel

local function _(Moderated)
	-- upvalues: ConstantsModule (copy)
	return if Moderated == ConstantsModule.ModerationStatus.PendingModeration then "icons/status/pending_small" elseif Moderated == ConstantsModule.ModerationStatus.Moderated then "icons/actions/info_small" else nil
end

local _ = function(Moderated): boolean
	-- upvalues: ConstantsModule (copy)
	return Moderated == ConstantsModule.ModerationStatus.Moderated
end

return function(p1)
	-- upvalues: UseStyleFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), UseLocalizationFunction (copy), ConstantsModule (copy), GetIconSizeFunction (copy), IconSize (copy), ReactModule (copy), ImageSetLabel (copy), Images (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local Size300 = if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_300 else UseStyleResult.Tokens.Global.Space_150
	local Size150 = if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_150 else UseStyleResult.Tokens.Global.Space_75
	local Size150_1 = if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_150 else UseStyleResult.Tokens.Global.Space_75
	local Size250 = if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_250 else UseStyleResult.Tokens.Global.Space_125
	local UseLocalizationResult = UseLocalizationFunction({
		moderated = "Feature.Catalog.Message.AvatarModerationModerated",
		underReview = "Feature.Catalog.Message.AvatarModerationPending"
	})
	local ModerationStatus = p1.moderationStatus
	local PendingSmall = if ModerationStatus == ConstantsModule.ModerationStatus.PendingModeration then "icons/status/pending_small" elseif ModerationStatus == ConstantsModule.ModerationStatus.Moderated then "icons/actions/info_small" else nil
	local IsModerationStatusMatch = ModerationStatus == ConstantsModule.ModerationStatus.Moderated
	local Moderated = if ModerationStatus == ConstantsModule.ModerationStatus.Moderated then UseLocalizationResult.moderated else UseLocalizationResult.underReview
	
	if PendingSmall == nil then
		return nil
	else
		local UseStyleResultFont = UseStyleResult.Font
		local IconSize1 = GetIconSizeFunction(IconSize.Small)
		local ScaledRelativeSize = UseStyleResultFont.CaptionHeader.RelativeSize * UseStyleResultFont.BaseSize
		
		return ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = if p1.hideBackground then 1 else 0.5,
			Position = UDim2.new(0, 0, 0, Size250)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, 0),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Size300),
				PaddingRight = UDim.new(0, Size300),
				PaddingTop = UDim.new(0, Size150),
				PaddingBottom = UDim.new(0, Size150)
			}),
			Content = ReactModule.createElement("Frame", {
				ClipsDescendants = true,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, Size150_1),
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Icon = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromOffset(IconSize1, IconSize1),
					Image = Images[PendingSmall],
					ImageColor3 = if IsModerationStatusMatch then Theme.Alert.Color else Theme.IconEmphasis.Color,
					ImageTransparency = Theme.IconEmphasis.Transparency
				}),
				PillText = if p1.iconOnly then nil else ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextSize = ScaledRelativeSize,
					Text = Moderated,
					Font = UseStyleResultFont.CaptionHeader.Font,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextColor3 = if IsModerationStatusMatch then Theme.Alert.Color else Theme.IconEmphasis.Color,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center
				})
			}),
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		})
	end
end