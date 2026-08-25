local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local _ = UIBloxModule.App.Button.Enum.ButtonType
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local standardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local parent = script.Parent.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local dependenciesModule = require(parent.Dependencies)
local restartScreenshotDialogModule = require(parent.Components.ReportAnything.RestartScreenshotDialog)
local _ = require(parent.Utility.ReportAnythingAnalytics)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local getFFlagReportAnythingLocalizationEnabledModule = require(parent.Flags.GetFFlagReportAnythingLocalizationEnabled)
local dividerModule = require(dependenciesModule.Divider)

local function ScreenshotReviewDialogSmallPortraitModeHeaderRight(p0)
	-- upvalues: reactModule (ref), robloxTranslatorModule (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var10, var11 = reactModule.useState(0)
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Text = reactModule.createElement("TextLabel", {
			LayoutOrder = -1,
			TextSize = 20,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Text = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"),
			Font = p0.font.Header2.Font,
			TextColor3 = p0.theme.TextEmphasis.Color,
			TextTransparency = p0.theme.TextEmphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			Size = UDim2.new(0, p0.viewportWidth - var10 - 50, 1, 0)
		}),
		RetakeButton = reactModule.createElement(button, {
			buttonType = buttonType.Secondary,
			text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Retake"),
			fitContent = true,
			standardSize = standardButtonSize.XSmall,
			onActivated = reactModule.useCallback(function()
				-- upvalues: p0 (ref)
				p0.setShowRestartDialog(true)
			end, { p0.setShowRestartDialog }),
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p1)
				-- upvalues: var11 (ref)
				var11(p1.AbsoluteSize.X)
			end, { var11 })
		})
	})
end

return function(p2)
	-- upvalues: reactModule (ref), getFFlagReportAnythingLocalizationEnabledModule (ref), useStyle (ref), restartScreenshotDialogModule (ref), imageSetButton (ref), assetsModule (ref), headerBar (ref), iconButton (ref), iconSize (ref), images (ref), ScreenshotReviewDialogSmallPortraitModeHeaderRight (ref), button (ref), buttonType (ref), robloxTranslatorModule (ref), standardButtonSize (ref), dividerModule (ref), buttonStack (ref)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref)
		if p2.reportAnythingAnalytics then
			p2.reportAnythingAnalytics.incrementAnnotationOptionSeen()
		end
	end, {})
	local var12 = if getFFlagReportAnythingLocalizationEnabledModule() and p2.isSmallPortraitMode then 104 else 60
	local var13, var14 = reactModule.useState(false)
	local var15 = useStyle()
	local theme = var15.Theme
	local font = var15.Font
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundColor3 = theme.Overlay.Color,
		BackgroundTransparency = theme.Overlay.Transparency,
		Size = UDim2.fromScale(1, 1),
		ZIndex = 10,
		Text = "",
		[reactModule.Event.Activated] = p2.onBack
	}, {
		Container = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			ZIndex = 10,
			Size = if p2.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) elseif p2.viewportHeight >= 800 then UDim2.new(0, 800, 0, 800) else UDim2.new(1, 0, 1, 0),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = theme.Overlay.Color
		}, {
			RestartDialog = var13 and reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				DialogBody = reactModule.createElement(restartScreenshotDialogModule, {
					ZIndex = 3,
					isSmallPortraitMode = p2.isSmallPortraitMode,
					onCancel = function()
						-- upvalues: var14 (ref)
						var14(false)
					end,
					onRestart = p2.onRestart
				})
			}),
			RestartDialogMask = var13 and reactModule.createElement(imageSetButton, {
				BackgroundTransparency = 0.2,
				Active = true,
				AutoButtonColor = false,
				ImageTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = theme.BackgroundUIDefault.Color,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = assetsModule.Images.RoundedRect.Image,
				ImageColor3 = theme.BackgroundUIDefault.Color,
				ScaleType = assetsModule.Images.RoundedRect.ScaleType,
				SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
			}, {}),
			ScreenshotDialog = reactModule.createElement(imageSetButton, {
				Active = true,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = assetsModule.Images.RoundedRect.Image,
				ImageColor3 = theme.BackgroundUIDefault.Color,
				ImageTransparency = theme.BackgroundUIDefault.Transparency,
				ScaleType = assetsModule.Images.RoundedRect.ScaleType,
				SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				HeaderAndContent = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, -var12)
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Header = reactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						LayoutOrder = 1,
						BackgroundColor3 = Color3.fromHex("#4F545F"),
						Size = UDim2.new(1, 0, 0, 48)
					}, {
						Bar = reactModule.createElement(headerBar, {
							backgroundTransparency = 1,
							barHeight = 48,
							margin = 12,
							renderLeft = function()
								-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), p2 (ref)
								return reactModule.createElement(iconButton, {
									iconSize = iconSize.Medium,
									icon = images["icons/navigation/pushBack"],
									onActivated = function()
										-- upvalues: p2 (copy)
										p2.onBack()
									end
								})
							end,
							renderRight = function()
								-- upvalues: getFFlagReportAnythingLocalizationEnabledModule (copy), p2 (ref), reactModule (copy), ScreenshotReviewDialogSmallPortraitModeHeaderRight (copy), var14 (ref), font (ref), theme (ref), button (copy), buttonType (copy), robloxTranslatorModule (copy), standardButtonSize (copy)
								return if getFFlagReportAnythingLocalizationEnabledModule() and p2.isSmallPortraitMode then reactModule.createElement(ScreenshotReviewDialogSmallPortraitModeHeaderRight, {
									setShowRestartDialog = var14,
									font = font,
									theme = theme,
									viewportWidth = p2.viewportWidth
								}) else reactModule.createElement(button, {
									buttonType = buttonType.Secondary,
									size = if getFFlagReportAnythingLocalizationEnabledModule() then nil else UDim2.new(0, if p2.isSmallPortraitMode then 72 else 120, 0, if p2.isSmallPortraitMode then 28 else 36),
									text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Retake") else "Retake",
									fitContent = getFFlagReportAnythingLocalizationEnabledModule(),
									standardSize = if getFFlagReportAnythingLocalizationEnabledModule() then standardButtonSize.XSmall else nil,
									onActivated = function()
										-- upvalues: var14 (copy)
										var14(true)
									end
								})
							end,
							title = if getFFlagReportAnythingLocalizationEnabledModule() then if p2.isSmallPortraitMode then nil else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.SceneCaptured") else "Scene Captured",
							isSecondary = p2.isSmallPortraitMode
						})
					}),
					Divider = reactModule.createElement(dividerModule, { LayoutOrder = 2 }),
					ScreenshotBody = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						ZIndex = 10,
						Size = UDim2.new(1, 0, 1, -60)
					}, {
						Padding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 16) }),
						Layout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						ScreenshotContainer = reactModule.createElement("Frame", {
							BackgroundTransparency = 2,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 1, -32)
						}, {
							Padding = reactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 12),
								PaddingBottom = UDim.new(0, 12),
								PaddingLeft = UDim.new(0, 16),
								PaddingRight = UDim.new(0, 16)
							}),
							Screenshot = reactModule.createElement("Frame", {
								BorderSizePixel = 2,
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 1, 0),
								Position = UDim2.fromScale(0.5, 0.5),
								AnchorPoint = Vector2.new(0.5, 0.5),
								BorderMode = Enum.BorderMode.Inset,
								BorderColor3 = Color3.fromRGB(255, 255, 255)
							}, {
								UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p2.imageAspectRatio }),
								ScreenshotImage = reactModule.createElement(imageSetButton, {
									Active = true,
									Size = UDim2.fromScale(1, 1),
									Image = p2.screenshot,
									ZIndex = 1,
									AnchorPoint = Vector2.new(0.5, 0.5),
									Position = UDim2.fromScale(0.5, 0.5),
									BackgroundTransparency = 1,
									ScaleType = Enum.ScaleType.Fit,
									SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
									[reactModule.Event.Activated] = function()
										-- upvalues: p2 (ref)
										p2.onNextPage()
									end
								})
							})
						}),
						Description = reactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Message.ProblemNotInScene") else "If the problem is not in this scene, you can \226\128\156Retake\226\128\157\nthe screenshot.",
							Font = font.Header1.Font,
							TextColor3 = theme.TextEmphasis.Color,
							TextTransparency = theme.TextEmphasis.Transparency,
							TextSize = if p2.isSmallPortraitMode then 12 else 20,
							TextXAlignment = Enum.TextXAlignment.Center,
							TextWrapped = getFFlagReportAnythingLocalizationEnabledModule(),
							Size = if getFFlagReportAnythingLocalizationEnabledModule() then UDim2.new(1, -24, 0, if p2.isSmallPortraitMode then 24 else 40) else UDim2.new(1, 0, 0, 20)
						})
					})
				}),
				Footer = reactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var12),
					BackgroundColor3 = Color3.fromHex("#4F545F"),
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.fromScale(0, 1)
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					Container = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = if getFFlagReportAnythingLocalizationEnabledModule() and p2.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else UDim2.new(0, if p2.isSmallPortraitMode then 400 else 612, 1, 0)
					}, {
						Padding = reactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 12),
							PaddingBottom = UDim.new(0, 12),
							PaddingLeft = UDim.new(0, 16),
							PaddingRight = UDim.new(0, 16)
						}),
						ActionButtons = reactModule.createElement(buttonStack, {
							marginBetween = 8,
							forcedFillDirection = if getFFlagReportAnythingLocalizationEnabledModule() and p2.isSmallPortraitMode then Enum.FillDirection.Vertical else nil,
							buttons = {
								{
									buttonType = buttonType.Secondary,
									props = {
										onActivated = p2.onSkip,
										text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot") else "Attach Screenshot"
									}
								},
								{
									buttonType = buttonType.PrimarySystem,
									props = {
										onActivated = function()
											-- upvalues: p2 (ref)
											p2.onNextPage()
										end,
										text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.HighlightScene") else "Highlight Scene"
									}
								}
							}
						})
					})
				})
			})
		})
	})
end