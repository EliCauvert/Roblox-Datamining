local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local headerBar = UIBloxModule.App.Bar.HeaderBar
local useStyle = UIBloxModule.Core.Style.useStyle
local parent = script.Parent.Parent.Parent
local dependenciesModule = require(parent.Dependencies)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local getFFlagReportAnythingLocalizationEnabledModule = require(parent.Flags.GetFFlagReportAnythingLocalizationEnabled)
local dividerModule = require(dependenciesModule.Divider)

return function(p0)
	-- upvalues: useStyle (ref), getFFlagReportAnythingLocalizationEnabledModule (ref), reactModule (ref), headerBar (ref), robloxTranslatorModule (ref), dividerModule (ref), buttonStack (ref), buttonType (ref)
	local var7 = useStyle()
	local theme = var7.Theme
	local font = var7.Font
	local var8 = 48
	local var9 = 180
	local var10 = 50
	
	if getFFlagReportAnythingLocalizationEnabledModule() and p0.isSmallPortraitMode then
		var8 = 84
		var9 = 260
		var10 = 100
	end
	return reactModule.createElement("Frame", {
		ZIndex = 5,
		Size = UDim2.new(0, if p0.isSmallPortraitMode then 343 else 480, 0, var9),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = Color3.fromHex("#4F545F")
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		HeaderAndContent = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Header = reactModule.createElement(headerBar, {
				backgroundTransparency = 1,
				barHeight = 48,
				LayoutOrder = 1,
				renderLeft = function() end,
				renderRight = function() end,
				title = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.RetakeScene") else "Retake Scene"
			}),
			Divider = reactModule.createElement(dividerModule, { LayoutOrder = 2 }),
			Description = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 1, (-var8) - 1)
			}, {
				Padding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 8),
					PaddingBottom = UDim.new(0, 8),
					PaddingLeft = UDim.new(0, 16),
					PaddingRight = UDim.new(0, 16)
				}),
				TextBody = reactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					TextSize = 16,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Message.RetakeScene") else "Help us understand what\226\128\153s happening around you. We\226\128\153ll capture the scene the moment you select \226\128\156Report.\226\128\157",
					Font = font.Body.Font,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = if getFFlagReportAnythingLocalizationEnabledModule() then Enum.TextYAlignment.Top else nil,
					Size = UDim2.new(1, 0, 0, var10)
				})
			})
		}),
		Footer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, var8),
			Position = UDim2.new(0, 0, 1, -var8)
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 6),
				PaddingBottom = UDim.new(0, 6),
				PaddingLeft = UDim.new(0, 16),
				PaddingRight = UDim.new(0, 16)
			}),
			ActionButtons = reactModule.createElement(buttonStack, {
				forcedFillDirection = if getFFlagReportAnythingLocalizationEnabledModule() and p0.isSmallPortraitMode then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = if p0.isSmallPortraitMode then {
							onActivated = p0.onCancel,
							text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel") else "Cancel",
							size = if getFFlagReportAnythingLocalizationEnabledModule() then UDim2.new(1, 0, 0, 28) else UDim2.new(0, 80, 0, 28),
							fontStyle = font.Body2
						} else {
							onActivated = p0.onCancel,
							text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel") else "Cancel"
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = if p0.isSmallPortraitMode then {
							onActivated = p0.onRestart,
							text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.BackToExperience") else "Back To Experience",
							size = if getFFlagReportAnythingLocalizationEnabledModule() then UDim2.new(1, 0, 0, 28) else UDim2.new(0, 200, 0, 28),
							fontStyle = font.Body2
						} else {
							onActivated = p0.onRestart,
							text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.BackToExperience") else "Back To Experience"
						}
					}
				}
			})
		})
	})
end