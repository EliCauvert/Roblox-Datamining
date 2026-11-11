local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local AppDropdownMenuModule = require(Modules.LuaApp.Components.Common.AppDropdownMenu)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local UserGender = AuthCommonModule.Enums.UserGender
local RegisterAuditContent = AuthCommonModule.Components.RegisterAuditContent
local GetFFlagEnableAuditForSsoFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuditForSso
local config = {
	[Enum.HorizontalAlignment.Left] = Vector2.new(0, 0),
	[Enum.HorizontalAlignment.Center] = Vector2.new(0.5, 0),
	[Enum.HorizontalAlignment.Right] = Vector2.new(1, 0)
}
local config1 = {
	[Enum.HorizontalAlignment.Left] = UDim2.fromScale(0, 0),
	[Enum.HorizontalAlignment.Center] = UDim2.fromScale(0.5, 0),
	[Enum.HorizontalAlignment.Right] = UDim2.fromScale(1, 0)
}

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationModule (copy), UseSelectorFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), config (copy), config1 (copy), AppDropdownMenuModule (copy), UserGender (copy), GetFFlagEnableAuditForSsoFunction (copy), RegisterAuditContent (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationModuleResult = UseLocalizationModule({
		titleText = "Authentication.SignUp.Label.Gender",
		optionalText = "Authentication.SignUp.Label.OptionalGenderShort",
		maleText = "Authentication.SignUp.Label.GenderMale",
		femaleText = "Authentication.SignUp.Label.GenderFemale"
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize or Vector2.new(1920, 1080)
	end)
	local SignUpView = UseDesignTokensFunction().LuaApps.SignUpView
	local DropdownHeight = SignUpView.dropdownHeight
	local Alignment = p1.alignment or Enum.HorizontalAlignment.Left
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 270, 1, 0),
		AnchorPoint = config[Alignment],
		Position = config1[Alignment],
		LayoutOrder = p1.layoutOrder
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, SignUpView.dropdownVerticalPadding)
		}),
		Title = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 6)
			}),
			MainTitle = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				TextWrapped = false,
				Font = UseStyleResult.Font.CaptionHeader.Font,
				Size = UDim2.fromScale(0, 0),
				Text = UseLocalizationModuleResult.titleText,
				TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
				TextSize = SignUpView.textCaptionHeaderSize,
				TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.XY
			}),
			OptionalTitle = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				TextWrapped = false,
				Font = UseStyleResult.Font.Footer.Font,
				Size = UDim2.fromScale(0, 0),
				Text = "(" .. UseLocalizationModuleResult.optionalText .. ")",
				TextColor3 = UseStyleResult.Theme.TextMuted.Color,
				TextSize = SignUpView.textSmallSize,
				TextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.XY
			})
		}),
		GenderPicker = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			ZIndex = 2,
			Size = UDim2.new(0, 270, 0, DropdownHeight)
		}, {
			GenderDropdownMenu = ReactModule.createElement(AppDropdownMenuModule, {
				placeholder = "--",
				showDropShadow = true,
				analyticsContext = "GenderDropdownMenu",
				selectionGroupName = "GenderDropdownMenu",
				height = UDim.new(0, DropdownHeight),
				screenSize = UseSelectorResult,
				onChange = p1.onGenderChanged,
				cellDatas = {
					{
						key = UserGender.Male,
						text = UseLocalizationModuleResult.maleText
					},
					{
						key = UserGender.Female,
						text = UseLocalizationModuleResult.femaleText
					},
					{ text = "--", key = UserGender.Unknown }
				}
			})
		}),
		RegisterTitleAuditContent = if GetFFlagEnableAuditForSsoFunction() and RegisterAuditContent and p1.enableAuditContentCapture and UseLocalizationModuleResult.titleText then ReactModule.createElement(RegisterAuditContent, {
			translationKey = "Authentication.SignUp.Label.Gender",
			translatedSourceString = UseLocalizationModuleResult.titleText
		}) else nil
	})
end