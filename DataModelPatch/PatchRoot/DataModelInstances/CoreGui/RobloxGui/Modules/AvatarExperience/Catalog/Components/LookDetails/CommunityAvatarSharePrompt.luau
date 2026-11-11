local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local WithClosableOverlayBackdropModule = require(Modules.AvatarExperience.Common.Components.withClosableOverlayBackdrop)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseShareButtonModule = require(Modules.AvatarExperience.Common.Hooks.useShareButton)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local CommunityAvatarLookImageFrameModule = require(Modules.AvatarExperience.Catalog.Components.LookDetails.CommunityAvatarLookImageFrame)

local function v18(p1)
	return p1.ScreenSize
end

local v1 = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseNavigationFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseLocalizationModule (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), GetIconSizeFunction (copy), IconSize (copy), UseShareButtonModule (copy), ConstantsModule (copy), UseSelectorFunction (copy), v18 (copy), ReactModule (copy), NavigationUtilsModule (copy), PartialPageModal (copy), ButtonType (copy), FFlagRenameDeprecatedUIBloxTokens (copy), CommunityAvatarLookImageFrameModule (copy), ImageSetLabel (copy), Images (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseLocalizationModuleResult = UseLocalizationModule({
		titleText = "Feature.Avatar.Heading.SharePublicAvatar",
		messageText = "Feature.Avatar.Message.SharePublicAvatar",
		disclaimerText = "Feature.Avatar.Message.ShareAvatarWithCommunityDisclaimer"
	})
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local IconSize1 = GetIconSizeFunction(IconSize.Small)
	local LookId = p1.lookId
	local UseShareButtonModuleResult = UseShareButtonModule(LookId, ConstantsModule.ItemType.Look, true, nil, nil)
	local UseSelectorResult = UseSelectorFunction(v18)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
		NavigationUtilsModule.closeOverlay(UseNavigationResult)
	end, { UseNavigationResult })
	ReactModule.useEffect(function()
		-- upvalues: UseShareButtonModuleResult (copy), UseResult (copy)
		if UseShareButtonModuleResult == nil then
			UseResult()
		end
	end, { UseShareButtonModuleResult, UseResult })
	
	return ReactModule.createElement(PartialPageModal, {
		title = UseLocalizationModuleResult.titleText,
		screenSize = UseSelectorResult,
		buttonStackProps = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = ReactModule.useCallback(function()
							-- upvalues: UseShareButtonModuleResult (copy)
							UseShareButtonModuleResult.onActivated()
						end, {
							LookId,
							UseRoactServiceModuleResult,
							UseShareButtonModuleResult
						}),
						text = UseShareButtonModuleResult.text
					}
				}
			}
		},
		onCloseClicked = UseResult
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		CommunityAvatarSharePromptBodyText = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(0, 0, 0, 0),
			Text = UseLocalizationModuleResult.messageText,
			TextTruncate = Enum.TextTruncate.AtEnd,
			AutomaticSize = Enum.AutomaticSize.XY,
			Font = UseStyleResultFont.Body.Font,
			TextSize = UseStyleResultFont.Body.RelativeSize * UseStyleResultFont.BaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Theme.TextDefault.Color
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Space_200)
			})
		}),
		AvatarImage = ReactModule.createElement(CommunityAvatarLookImageFrameModule, { size = 300, layoutOrder = 2, lookId = p1.lookId }),
		CommunityAvatarSharePromptDisclaimer = ReactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_150 else UseDesignTokensResult.Global.Space_75),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			Padding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Space_200)
			}),
			CommunityAvatarSharePromptDisclaimerIcon = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(IconSize1, IconSize1),
				Image = Images["icons/actions/info_small"],
				ImageColor3 = Theme.IconEmphasis.Color,
				ImageTransparency = Theme.IconEmphasis.Transparency
			}),
			CommunityAvatarSharePromptDisclaimerText = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = UseLocalizationModuleResult.disclaimerText,
				TextTruncate = Enum.TextTruncate.AtEnd,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = UseStyleResultFont.Footer.Font,
				TextSize = UseStyleResultFont.Footer.RelativeSize * UseStyleResultFont.BaseSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Theme.TextDefault.Color
			})
		})
	})
end)))

if require(Modules.AvatarExperience.Flags.GetFFlagAXShareAvatarPromptEasyDismiss)() then
	v1 = WithClosableOverlayBackdropModule(v1)
end
return v1