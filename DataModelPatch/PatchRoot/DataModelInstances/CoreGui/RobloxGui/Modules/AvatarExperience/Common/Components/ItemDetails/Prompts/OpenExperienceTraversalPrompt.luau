local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AppPageModule = require(Modules.LuaApp.AppPage)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GameIconReducer = require(CorePackages.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local LinkButton = UIBloxModule.App.Button.LinkButton
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.Constant.IconSize
local IconsStatusImageunavailable = UIBloxModule.App.ImageSet.Images["icons/status/imageunavailable"]
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

return require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseLocalizationModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), NavigationUtilsModule (copy), AppPageModule (copy), UseStyleFunction (copy), IconsStatusImageunavailable (copy), IconSize (copy), GameIconReducer (copy), InteractiveAlert (copy), ImageSetLabel (copy), StyledTextLabel (copy), LinkButton (copy), CursorKind (copy), ButtonType (copy)
	local Params = p1.navigation.state.params
	local UseLocalizationModuleResult = UseLocalizationModule({
		title = "Feature.Catalog.Heading.GoToExperience",
		confirmButtonText = "CommonUI.Features.Action.Go",
		cancelButtonText = "CommonUI.Controls.Action.Cancel",
		viewDetailsButtonText = "Feature.Catalog.Action.ViewExperienceDetails",
		body = {
			"Feature.Catalog.Description.AttributionAlertBody",
			experienceName = p1.navigation.state.params.gameName or ""
		}
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end, GetUseSelectorDeepEqualsFunction())
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.navigation)
	end, { p1.navigation })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), Params (copy)
		NavigationUtilsModule.closeOverlay(p1.navigation)
		Params.onPlayButtonActivated()
	end, { p1.navigation })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: AppPageModule (upval), NavigationUtilsModule (upval), p1 (copy), Params (copy)
		NavigationUtilsModule.navigateFromOverlay(p1.navigation, AppPageModule.GameDetail, {
			detail = Params.gameUniverseId,
			extraProps = { mountAsFullView = true }
		})
	end, { p1.navigation })
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local ThumbnailUrl = if Params.thumbnailUrl then Params.thumbnailUrl else IconsStatusImageunavailable
	local _UDim2: UDim2 = if Params.thumbnailUrl then UDim2.fromOffset(150, 150) else UDim2.fromOffset(IconSize.Large, IconSize.Large)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local v1 = nil
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: GameIconReducer (upval)
		return p2[GameIconReducer.key]
	end)
	ReactModule.useEffect(function()
		-- upvalues: Params (copy), UseSelectorResult1 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if not Params.thumbnailUrl then
			local UseSelectorResultEntry = UseSelectorResult1[Params.gameUniverseId]
			
			if UseSelectorResultEntry then
				UseStateResult2(UseSelectorResultEntry.url)
				UseStateResult2_1(UDim2.fromOffset(150, 150))
			end
		end
	end, { UseSelectorResult1 })
	
	if Params.hideConfirmationButton then
		v1 = {
			{
				isDefaultChild = true,
				props = {
					layoutOrder = 0,
					onActivated = UseResult,
					text = UseLocalizationModuleResult.cancelButtonText
				}
			}
		}
	end
	return ReactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = true,
		title = if Params.overrideTitle then Params.overrideTitle else UseLocalizationModuleResult.title,
		middleContent = function()
			-- upvalues: ReactModule (upval), Theme (copy), ImageSetLabel (upval), UseStateResult (copy), ThumbnailUrl (copy), UseStateResult1 (copy), _UDim2 (copy), StyledTextLabel (upval), Params (copy), UseLocalizationModuleResult (copy), UseStyleResultFont (copy), LinkButton (upval), UseResult2 (copy), CursorKind (upval)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 12)
				}),
				ExperienceThumbnailFrame = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 1,
					ClipsDescendants = true,
					Size = UDim2.fromOffset(150, 150),
					BackgroundColor3 = Theme.BackgroundContrast.Color
				}, {
					ExperienceThumbnail = ReactModule.createElement(ImageSetLabel, {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Image = if UseStateResult then UseStateResult else ThumbnailUrl,
						Size = if UseStateResult1 then UseStateResult1 else _UDim2
					}, {
						RoundCorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
					}),
					RoundCorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				}),
				BodyText = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 2,
					lineHeight = 1,
					text = if Params.overrideBody then Params.overrideBody else UseLocalizationModuleResult.body,
					fontStyle = UseStyleResultFont.Body,
					colorStyle = Theme.TextDefault,
					automaticSize = Enum.AutomaticSize.Y,
					size = UDim2.fromScale(1, 0),
					textXAlignment = Enum.TextXAlignment.Center
				}),
				DetailsButton = ReactModule.createElement(LinkButton, {
					layoutOrder = 3,
					text = UseLocalizationModuleResult.viewDetailsButtonText,
					onActivated = UseResult2,
					selectionCursorKind = CursorKind.RoundedRectNoInset
				})
			})
		end,
		buttonStackInfo = {
			buttons = if v1 then v1 else {
				{
					isDefaultChild = true,
					props = {
						layoutOrder = 0,
						onActivated = UseResult,
						text = UseLocalizationModuleResult.cancelButtonText
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimaryContextual,
					props = {
						layoutOrder = 2,
						onActivated = UseResult1,
						text = UseLocalizationModuleResult.confirmButtonText
					}
				}
			}
		},
		screenSize = UseSelectorResult,
		defaultChildRef = p1.defaultChildRef
	})
end)