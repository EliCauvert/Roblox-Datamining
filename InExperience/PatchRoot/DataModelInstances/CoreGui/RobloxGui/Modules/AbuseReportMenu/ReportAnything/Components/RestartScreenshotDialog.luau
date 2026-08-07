local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local headerBar = UIBloxModule.App.Bar.HeaderBar
local useStyle = UIBloxModule.Core.Style.useStyle
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local dividerModule = require(script.Parent.Parent.Components.Divider)

return function(p0) --[[ line: 26 | named "RestartScreenshotDialog" ]]
	-- upvalues: useStyle (ref), reactModule (ref), headerBar (ref), robloxTranslatorModule (ref), dividerModule (ref), buttonStack (ref), buttonType (ref)
	local var5 = useStyle()
	local theme = var5.Theme
	local font = var5.Font
	local var6 = 48
	local var7 = 180
	local var8 = 50
	
	if p0.isSmallPortraitMode then
		var6 = 84
		var7 = 260
		var8 = 100
	end
	return reactModule.createElement("Frame", {
		ZIndex = 5,
		Size = UDim2.new(0, if p0.isSmallPortraitMode then 343 else 480, 0, var7),
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
				renderLeft = function() --[[ line: 63 ]] end,
				renderRight = function() --[[ line: 65 ]] end,
				title = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.RetakeScene")
			}),
			Divider = reactModule.createElement(dividerModule, { LayoutOrder = 2 }),
			Description = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 1, (-var6) - 1)
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
					Text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Message.RetakeScene"),
					Font = font.Body.Font,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Size = UDim2.new(1, 0, 0, var8)
				})
			})
		}),
		Footer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, var6),
			Position = UDim2.new(0, 0, 1, -var6)
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 6),
				PaddingBottom = UDim.new(0, 6),
				PaddingLeft = UDim.new(0, 16),
				PaddingRight = UDim.new(0, 16)
			}),
			ActionButtons = reactModule.createElement(buttonStack, {
				forcedFillDirection = if p0.isSmallPortraitMode then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = if p0.isSmallPortraitMode then {
							onActivated = p0.onCancel,
							text = robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel"),
							size = UDim2.new(1, 0, 0, 28),
							fontStyle = font.Body2
						} else {
							onActivated = p0.onCancel,
							text = robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel")
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = if p0.isSmallPortraitMode then {
							onActivated = p0.onRestart,
							text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.BackToExperience"),
							size = UDim2.new(1, 0, 0, 28),
							fontStyle = font.Body2
						} else {
							onActivated = p0.onRestart,
							text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.BackToExperience")
						}
					}
				}
			})
		})
	})
end