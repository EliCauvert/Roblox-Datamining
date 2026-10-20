local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ReactModule = require(CorePackages.Packages.React)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local UseScreenSizeModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Hooks.useScreenSize)
local ExperienceService = require(CorePackages.Workspace.Packages.ExperienceService).ExperienceService
local CloseOverlayModule = require(script.Parent.Parent.Actions.CloseOverlay)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseScreenSizeModule (copy), UseStyleFunction (copy), ReactModule (copy), CloseOverlayModule (copy), ExperienceService (copy), UseSelectorFunction (copy), InteractiveAlert (copy), RobloxTranslatorModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ImageSetLabel (copy), StyledTextLabel (copy), ButtonType (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeModuleResult = UseScreenSizeModule()
	local UseStyleResult = UseStyleFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseOverlayModule (upval)
		UseDispatchResult(CloseOverlayModule())
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ExperienceService (upval), UseDispatchResult (copy), CloseOverlayModule (upval)
		ExperienceService:LaunchExperience({ placeId = p1.rootPlaceId })
		UseDispatchResult(CloseOverlayModule())
	end, { UseDispatchResult, p1.rootPlaceId })
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.locale
	end)
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local Name = p1.name or ""
	
	return ReactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = false,
		title = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToExperience", UseSelectorResult),
		middleContent = function()
			-- upvalues: ReactModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), UseStyleResult (copy), Theme (copy), ImageSetLabel (upval), p1 (copy), StyledTextLabel (upval), RobloxTranslatorModule (upval), UseSelectorResult (copy), Name (copy), UseStyleResultFont (copy)
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
					Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_300 else UseStyleResult.Tokens.Global.Space_150)
				}),
				ExperienceThumbnailFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
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
						Image = string.format("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", tostring(p1.universeId), 150, 150),
						Size = UDim2.fromScale(1, 1)
					}, {
						RoundCorner = ReactModule.createElement("UICorner", {
							CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Radius.Medium else UseStyleResult.Tokens.Semantic.Radius.Medium)
						})
					})
				}),
				BodyText = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 2,
					lineHeight = 1,
					text = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToDescription", UseSelectorResult, { EXPERIENCE_NAME = Name }),
					fontStyle = UseStyleResultFont.Body,
					colorStyle = Theme.TextDefault,
					automaticSize = Enum.AutomaticSize.Y,
					size = UDim2.fromScale(1, 0),
					textXAlignment = Enum.TextXAlignment.Center
				})
			})
		end,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						layoutOrder = 0,
						onActivated = UseResult,
						text = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.Cancel", UseSelectorResult)
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimaryContextual,
					props = {
						layoutOrder = 2,
						onActivated = UseResult1,
						text = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.Go", UseSelectorResult)
					}
				}
			}
		},
		screenSize = UseScreenSizeModuleResult
	})
end