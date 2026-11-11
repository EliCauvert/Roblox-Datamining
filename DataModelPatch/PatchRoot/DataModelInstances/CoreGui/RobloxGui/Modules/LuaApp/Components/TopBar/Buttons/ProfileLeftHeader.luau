local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local VerticalEfficiencyExperimentation = require(CorePackages.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconsLogoLetterform = UIBloxModule.App.ImageSet.Images["icons/logo/letterform"]
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetIconButtonSizeModule = require(Modules.LuaApp.Components.TopBar.Utils.getIconButtonSize)
local HomeUserInfoWidgetModule = require(Modules.LuaApp.Components.Home.HomeUserInfoWidget)
local FFlagLuaAppMoveProfileIntoTopBarIXP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP
local LuaAppEnableLogoHeaderByDefault = game:DefineFastFlag("LuaAppEnableLogoHeaderByDefault", false)

return function(p1)
	-- upvalues: UseStyleFunction (copy), GetIconButtonSizeModule (copy), FFlagLuaAppMoveProfileIntoTopBarIXP (copy), VerticalEfficiencyExperimentation (copy), LuaAppEnableLogoHeaderByDefault (copy), ReactModule (copy), HomeUserInfoWidgetModule (copy), ImageSetLabel (copy), IconsLogoLetterform (copy), StyledTextLabel (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local IconButtonSizeModule = GetIconButtonSizeModule(p1.formFactor)
	local IsRobloxLogoHeaderEnabled = FFlagLuaAppMoveProfileIntoTopBarIXP and VerticalEfficiencyExperimentation.getIsRobloxLogoHeaderEnabled() or LuaAppEnableLogoHeaderByDefault
	local YOffset = IconButtonSizeModule - UseStyleResult.Tokens.Size.Size_200
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(0, IconButtonSizeModule, 1, 0)
	}, {
		HorizontalLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseStyleResult.Tokens.Size.Size_300)
		}),
		UserAvatar = ReactModule.createElement(HomeUserInfoWidgetModule, {
			sideMargin = 0,
			shouldOnlyDisplayAvatarIcon = true,
			onlyAvatarButtonRef = p1.buttonRef
		}),
		LeftHeader = if IsRobloxLogoHeaderEnabled then ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ImageTransparency = 0,
			AnchorPoint = Vector2.new(0, 0.5),
			Image = IconsLogoLetterform,
			ImageColor3 = Theme.TextEmphasis.Color,
			Position = UDim2.fromOffset(24, 24),
			Size = UDim2.fromOffset(YOffset * 5.222222222222222, YOffset)
		}) else p1.titleText and ReactModule.createElement(StyledTextLabel, {
			fluidSizing = true,
			layoutOrder = 2,
			text = p1.titleText,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Left,
			fontStyle = UseStyleResultFont.Title,
			colorStyle = Theme.TextEmphasis
		}) or nil
	})
end