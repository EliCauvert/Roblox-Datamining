local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local FullPageModal = UIBloxModule.App.Dialog.Modal.FullPageModal
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagVngAppUpsellPcLayout = SharedFlagsModule.FFlagVngAppUpsellPcLayout
local RoactLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactLocalization)
local VngAppUpsellUrl = game:DefineFastString("VngAppUpsellUrl", "https://www.roblox.com")
local VngAppUpsellProTipTextEn = game:DefineFastString("VngAppUpsellProTipTextEn", "")
local VngAppUpsellProTipTextVn = game:DefineFastString("VngAppUpsellProTipTextVn", "")

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), FFlagVngAppUpsellPcLayout (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), UseRoactServiceFunction (copy), AppLinking (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), ReactModule (copy), CloseCentralOverlayFunction (copy), RoactLocalizationModule (copy), VngAppUpsellProTipTextVn (copy), VngAppUpsellProTipTextEn (copy), GuiService (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FullPageModal (copy), ButtonType (copy), VngAppUpsellUrl (copy), StyledTextLabel (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseAppPolicyResult = if FFlagVngAppUpsellPcLayout then UseAppPolicyFunction(function(p2)
		return p2.getVngAppUpsellPcLayout()
	end) else false
	local UseLocalizationResult = UseLocalizationFunction({
		vngUpsellProtip = "CommonUI.Features.Label.VNGMigrationTip",
		vngUpsellTitle = if UseAppPolicyResult then "CommonUI.Features.Label.VNGMigrationTitlePC" else "CommonUI.Features.Label.VNGMigrationTitle",
		vngUpsellBody = if UseAppPolicyResult then "CommonUI.Features.Label.VNGMigrationBodyPC" else "CommonUI.Features.Label.VNGMigrationBody",
		vngUpsellButtonText = if UseAppPolicyResult then "CommonUI.Features.Label.VNGMigrationGoButtonPC" else "CommonUI.Features.Label.VNGMigrationGoButton"
	})
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
		UseDispatchResult(CloseCentralOverlayFunction())
	end, {})
	local VngUpsellProtip = UseLocalizationResult.vngUpsellProtip
	local Locale = UseRoactServiceFunction(RoactLocalizationModule):GetLocale()
	
	if VngAppUpsellProTipTextVn == "" or Locale ~= "vi-vn" then
		if VngAppUpsellProTipTextEn ~= "" and Locale == "en-us" then
			VngUpsellProtip = VngAppUpsellProTipTextEn
		end
	else
		VngUpsellProtip = VngAppUpsellProTipTextVn
	end
	local Size500 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250
	
	return ReactModule.createElement(FullPageModal, {
		screenSize = UseSelectorResult,
		title = UseLocalizationResult.vngUpsellTitle,
		distanceFromTop = GuiService:GetSafeZoneOffsets().top + Size500,
		onCloseClicked = if p1.isDismissable then UseResult else nil,
		buttonStackProps = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = function()
							-- upvalues: VngAppUpsellUrl (upval), UseRoactServiceResult (copy)
							UseRoactServiceResult:openURL(VngAppUpsellUrl)
						end,
						text = UseLocalizationResult.vngUpsellButtonText
					}
				}
			}
		}
	}, {
		ContentFrame = ReactModule.createElement("ScrollingFrame", {
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			BackgroundTransparency = UseStyleResult.Theme.BackgroundUIDefault.Transparency,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			Selectable = not FFlagVngAppUpsellPcLayout and nil,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 0, 0)
		}, {
			VngIcon = ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 186, 0, 186),
				Image = if UseAppPolicyResult then "rbxasset://textures/ui/LuaApp/icons/pc_icon_vng_square_xxxhdpi.png" else "rbxasset://textures/ui/LuaApp/icons/ic_launcher_vng_square_xxxhdpi.png",
				Position = UDim2.new(0.5, 0, 0, Size500),
				AnchorPoint = Vector2.new(0.5, 0)
			}),
			Contents = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0.5, 0, 0, Size500 + 186 + (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_800 else UseDesignTokensResult.Global.Size_400)),
				AnchorPoint = Vector2.new(0.5, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, Size500)
				}),
				BodyText = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 1,
					automaticSize = Enum.AutomaticSize.Y,
					text = UseLocalizationResult.vngUpsellBody,
					colorStyle = UseStyleResult.Theme.TextEmphasis,
					fontStyle = UseStyleResult.Font.HeadingSmall,
					size = UDim2.new(1, 0, 0, 0),
					textXAlignment = Enum.TextXAlignment.Center
				}),
				Protip = if UseAppPolicyResult then nil else ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 2,
					automaticSize = Enum.AutomaticSize.Y,
					text = VngUpsellProtip,
					colorStyle = UseStyleResult.Theme.TextDefault,
					fontStyle = UseStyleResult.Font.BodyLarge,
					size = UDim2.new(1, 0, 0, 0),
					textXAlignment = Enum.TextXAlignment.Center
				}),
				BottomPadding = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, 1)
				})
			})
		})
	})
end