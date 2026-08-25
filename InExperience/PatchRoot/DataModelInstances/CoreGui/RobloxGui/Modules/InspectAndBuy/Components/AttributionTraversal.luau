local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local useSelector = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local useScreenSizeModule = require(coreGuiService.RobloxGui.Modules.Common.Hooks.useScreenSize)
local experienceService = require(corePackagesService.Workspace.Packages.ExperienceService).ExperienceService
local closeOverlayModule = require(script.Parent.Parent.Actions.CloseOverlay)

return function(p0)
	-- upvalues: useDispatch (ref), useScreenSizeModule (ref), useStyle (ref), reactModule (ref), closeOverlayModule (ref), experienceService (ref), useSelector (ref), interactiveAlert (ref), robloxTranslatorModule (ref), imageSetLabel (ref), styledTextLabel (ref), buttonType (ref)
	local var7 = useDispatch()
	local var8 = useScreenSizeModule()
	local var9 = useStyle()
	local var10 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), closeOverlayModule (copy)
		var7(closeOverlayModule())
	end, { var7 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), experienceService (copy), var7 (ref), closeOverlayModule (copy)
		experienceService:LaunchExperience({ placeId = p0.rootPlaceId })
		var7(closeOverlayModule())
	end, { var7, p0.rootPlaceId })
	local var12 = useSelector(function(p1)
		return p1.locale
	end)
	local theme = var9.Theme
	local font = var9.Font
	local name = p0.name or ""
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		title = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToExperience", var12),
		middleContent = function()
			-- upvalues: reactModule (copy), var9 (ref), theme (ref), imageSetLabel (copy), p0 (ref), styledTextLabel (copy), robloxTranslatorModule (copy), var12 (ref), name (ref), font (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, var9.Tokens.Size.Size_300)
				}),
				ExperienceThumbnailFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					ClipsDescendants = true,
					Size = UDim2.fromOffset(150, 150),
					BackgroundColor3 = theme.BackgroundContrast.Color
				}, {
					ExperienceThumbnail = reactModule.createElement(imageSetLabel, {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Image = string.format("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", tostring(p0.universeId), 150, 150),
						Size = UDim2.fromScale(1, 1)
					}, {
						RoundCorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var9.Tokens.Radius.Medium) })
					})
				}),
				BodyText = reactModule.createElement(styledTextLabel, {
					layoutOrder = 2,
					lineHeight = 1,
					text = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToDescription", var12, { EXPERIENCE_NAME = name }),
					fontStyle = font.Body,
					colorStyle = theme.TextDefault,
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
						onActivated = var10,
						text = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.Cancel", var12)
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimaryContextual,
					props = {
						layoutOrder = 2,
						onActivated = var11,
						text = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.Go", var12)
					}
				}
			}
		},
		screenSize = var8
	})
end