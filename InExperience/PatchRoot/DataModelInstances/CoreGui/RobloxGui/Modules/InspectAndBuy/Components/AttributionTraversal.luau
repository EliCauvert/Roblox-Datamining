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

return function(p1)
	-- upvalues: useDispatch (ref), useScreenSizeModule (ref), useStyle (ref), reactModule (ref), closeOverlayModule (ref), experienceService (ref), useSelector (ref), interactiveAlert (ref), robloxTranslatorModule (ref), imageSetLabel (ref), styledTextLabel (ref), buttonType (ref)
	local var1 = useDispatch()
	local var2 = useScreenSizeModule()
	local var3 = useStyle()
	local var4 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), closeOverlayModule (copy)
		var1(closeOverlayModule())
	end, { var1 })
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), experienceService (copy), var1 (ref), closeOverlayModule (copy)
		experienceService:LaunchExperience({ placeId = p1.rootPlaceId })
		var1(closeOverlayModule())
	end, { var1, p1.rootPlaceId })
	local var6 = useSelector(function(p2)
		return p2.locale
	end)
	local theme = var3.Theme
	local font = var3.Font
	local name = p1.name or ""
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		title = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToExperience", var6),
		middleContent = function()
			-- upvalues: reactModule (copy), var3 (ref), theme (ref), imageSetLabel (copy), p1 (ref), styledTextLabel (copy), robloxTranslatorModule (copy), var6 (ref), name (ref), font (ref)
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
					Padding = UDim.new(0, var3.Tokens.Size.Size_300)
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
						Image = string.format("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", tostring(p1.universeId), 150, 150),
						Size = UDim2.fromScale(1, 1)
					}, {
						RoundCorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var3.Tokens.Radius.Medium) })
					})
				}),
				BodyText = reactModule.createElement(styledTextLabel, {
					layoutOrder = 2,
					lineHeight = 1,
					text = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToDescription", var6, { EXPERIENCE_NAME = name }),
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
						onActivated = var4,
						text = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.Cancel", var6)
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimaryContextual,
					props = {
						layoutOrder = 2,
						onActivated = var5,
						text = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.Go", var6)
					}
				}
			}
		},
		screenSize = var2
	})
end