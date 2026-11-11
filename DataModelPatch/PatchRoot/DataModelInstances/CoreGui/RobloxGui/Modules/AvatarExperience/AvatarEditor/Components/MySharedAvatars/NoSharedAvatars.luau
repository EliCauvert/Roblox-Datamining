local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagSignalsNavP3gAvatarExperience = SharedFlagsModule.FFlagSignalsNavP3gAvatarExperience
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local FlexLayout = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.FlexLayout
local NavigationUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

return function(_)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), UseLocalizationFunction (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), UseNavigationFunction (copy), ReactModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy), FlexLayout (copy), FFlagRenameDeprecatedUIBloxTokens (copy), Focusable (copy), ImageSetLabel (copy), Images (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		shareAvatarMsg = "Feature.Avatar.Message.ShareAvatarWithCommunity",
		shareCurrentAvatar = "Feature.Avatar.Action.ShareCurrentAvatar"
	})
	local UseSignalStateResult = nil
	UseSignalStateResult = if FFlagSignalsNavP3gAvatarExperience then UseSignalStateFunction(GetLegacyNavigationStore(false).getHistory) else UseSelectorFunction(function(p1)
		-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
		return if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else p1.Navigation.history
	end)
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	
	return ReactModule.createElement(FlexLayout, {
		padding = {
			top = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Space_600
		},
		flexSlot = ReactModule.createElement(Focusable.Frame, {
			BorderSizePixel = 0,
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Space_250)
			}),
			NoSharedAvatarPrompt = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header1.RelativeSize,
				Font = UseStyleResultFont.Header1.Font,
				TextColor3 = Theme.IconEmphasis.Color,
				TextTransparency = Theme.IconEmphasis.Transparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Text = UseLocalizationResult.shareAvatarMsg
			}),
			CreateAvatarButton = ReactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = Theme.BackgroundUIContrast.Transparency,
				BackgroundColor3 = Theme.BackgroundUIContrast.Color,
				BorderSizePixel = 0,
				Position = UDim2.new(1, 0, 0.5, 0),
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = "",
				LayoutOrder = 2,
				[ReactModule.Event.Activated] = ReactModule.useCallback(function()
					-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval), UseSignalStateResult (ref)
					NavigationUtilsModule.closeMySharedAvatars(UseNavigationResult)
					UseNavigationResult.navigate(AvatarScreen.LookComposerPage, {
						prevNavPage = AvatarScreen.AvatarEditor,
						prevNavHistory = UseSignalStateResult
					})
				end, { UseNavigationResult, UseSignalStateResult })
			}, {
				UICorner = ReactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Size_600)
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_250 else UseDesignTokensResult.Global.Space_125)
				}),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Space_250),
					PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Space_250),
					PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_250 else UseDesignTokensResult.Global.Space_125),
					PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_250 else UseDesignTokensResult.Global.Space_125)
				}),
				PlusIcon = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = Images["icons/common/plus"],
					ImageColor3 = Theme.IconEmphasis.Color,
					ImageTransparency = Theme.IconEmphasis.Transparency,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, 36, 0, 36)
				}),
				Text = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 2,
					LayoutOrder = 2,
					TextWrapped = false,
					Size = UDim2.new(0, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize,
					Font = UseStyleResultFont.Header2.Font,
					TextColor3 = Theme.SystemPrimaryDefault.Color,
					TextTransparency = Theme.SystemPrimaryDefault.Transparency,
					TextTruncate = Enum.TextTruncate.None,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					Text = UseLocalizationResult.shareCurrentAvatar
				})
			})
		})
	})
end