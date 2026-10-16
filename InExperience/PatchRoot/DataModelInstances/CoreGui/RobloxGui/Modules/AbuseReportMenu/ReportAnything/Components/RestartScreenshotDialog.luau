local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ReactModule = require(CorePackages.Packages.React)
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local DividerModule = require(script.Parent.Parent.Components.Divider)

return function(p1) --[[ Line: 29 | Named "RestartScreenshotDialog" ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), HeaderBar (copy), RobloxTranslatorModule (copy), DividerModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ButtonStack (copy), ButtonType (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local YOffset2 = 48
	local YOffset1 = 180
	local YOffset = 50
	
	if p1.isSmallPortraitMode then
		YOffset2 = 84
		YOffset1 = 260
		YOffset = 100
	end
	return ReactModule.createElement("Frame", {
		ZIndex = 5,
		Size = UDim2.new(0, if p1.isSmallPortraitMode then 343 else 480, 0, YOffset1),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = Color3.fromHex("#4F545F")
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		HeaderAndContent = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Header = ReactModule.createElement(HeaderBar, {
				backgroundTransparency = 1,
				barHeight = 48,
				LayoutOrder = 1,
				renderLeft = function() --[[ Line: 66 ]] end,
				renderRight = function() --[[ Line: 68 ]] end,
				title = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.RetakeScene")
			}),
			Divider = ReactModule.createElement(DividerModule, { LayoutOrder = 2 }),
			Description = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 1, -YOffset2 - 1)
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 8),
					PaddingBottom = UDim.new(0, 8),
					PaddingLeft = UDim.new(0, 16),
					PaddingRight = UDim.new(0, 16)
				}),
				TextBody = ReactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					TextSize = 16,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Message.RetakeScene"),
					Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Size = UDim2.new(1, 0, 0, YOffset)
				})
			})
		}),
		Footer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, YOffset2),
			Position = UDim2.new(0, 0, 1, -YOffset2)
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 6),
				PaddingBottom = UDim.new(0, 6),
				PaddingLeft = UDim.new(0, 16),
				PaddingRight = UDim.new(0, 16)
			}),
			ActionButtons = ReactModule.createElement(ButtonStack, {
				forcedFillDirection = if p1.isSmallPortraitMode then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = if p1.isSmallPortraitMode then {
							onActivated = p1.onCancel,
							text = RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel"),
							size = UDim2.new(1, 0, 0, 28),
							fontStyle = UseStyleResultFont.Body2
						} else {
							onActivated = p1.onCancel,
							text = RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel")
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = if p1.isSmallPortraitMode then {
							onActivated = p1.onRestart,
							text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.BackToExperience"),
							size = UDim2.new(1, 0, 0, 28),
							fontStyle = UseStyleResultFont.Body2
						} else {
							onActivated = p1.onRestart,
							text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.BackToExperience")
						}
					}
				}
			})
		})
	})
end