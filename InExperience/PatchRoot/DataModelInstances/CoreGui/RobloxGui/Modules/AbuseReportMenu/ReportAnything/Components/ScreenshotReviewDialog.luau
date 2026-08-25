local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local button = UIBloxModule.App.Button.Button
local standardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local dividerModule = require(parent.Components.Divider)
local restartScreenshotDialogModule = require(parent.Components.RestartScreenshotDialog)
local _ = require(parent.Utility.ReportAnythingAnalytics)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)

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
			Size = UDim2.new(0, p0.viewportUISafeAreaWidth - var10 - 50, 1, 0)
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
	-- upvalues: usePreferredInput (ref), responsiveModule (ref), robloxTranslatorModule (ref), reactModule (ref), useStyle (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), restartScreenshotDialogModule (ref), imageSetButton (ref), assetsModule (ref), headerBar (ref), iconButton (ref), iconSize (ref), images (ref), ScreenshotReviewDialogSmallPortraitModeHeaderRight (ref), button (ref), buttonType (ref), standardButtonSize (ref), dividerModule (ref), buttonStack (ref)
	local var12 = usePreferredInput() == responsiveModule.Input.Directional
	
	if robloxTranslatorModule then
		local var13 = if p2.isSmallPortraitMode then 104 else 60
		local var14 = reactModule.useCallback(function()
			-- upvalues: p2 (ref)
			p2.reportAnythingAnalytics.incrementPreviewBack()
			p2.onBack()
		end, { p2.onBack, p2.reportAnythingAnalytics })
		local var15 = reactModule.useCallback(function()
			-- upvalues: p2 (ref)
			p2.reportAnythingAnalytics.incrementPreviewAttach()
			p2.onSkip()
		end, { p2.onSkip, p2.reportAnythingAnalytics })
		local var16, var17 = reactModule.useState(false)
		local var18 = reactModule.useCallback(function()
			-- upvalues: p2 (ref), var17 (ref)
			p2.reportAnythingAnalytics.incrementRetake()
			var17(true)
		end, { var17, p2.reportAnythingAnalytics })
		local var19 = reactModule.useCallback(function()
			-- upvalues: p2 (ref)
			p2.reportAnythingAnalytics.setRetakeAbandon()
			p2.onRestart()
		end, { p2.onRestart, p2.reportAnythingAnalytics })
		local var20 = reactModule.useCallback(function()
			-- upvalues: p2 (ref)
			p2.reportAnythingAnalytics.incrementHighlightScene()
			p2.onNextPage()
		end, { p2.onNextPage, p2.reportAnythingAnalytics })
		local var21 = useStyle()
		local theme = var21.Theme
		local font = var21.Font
		
		return reactModule.createElement("TextButton", {
			Selectable = false,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundColor3 = theme.Overlay.Color,
			BackgroundTransparency = theme.Overlay.Transparency,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 10,
			Text = "",
			[reactModule.Event.Activated] = var14
		}, {
			Container = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 0,
				ZIndex = 10,
				Size = if p2.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) elseif p2.viewportUISafeAreaHeight >= 800 then UDim2.new(0, 800, 0, 800) else UDim2.new(1, 0, 1, 0),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = theme.Overlay.Color
			}, {
				RestartDialog = var16 and reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
						isIsolated = true,
						isAutoFocusRoot = true,
						surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
					}, {
						DialogBody = reactModule.createElement(restartScreenshotDialogModule, {
							ZIndex = 3,
							isSmallPortraitMode = p2.isSmallPortraitMode,
							onCancel = function()
								-- upvalues: var17 (ref)
								var17(false)
							end,
							onRestart = var19
						})
					})
				}),
				RestartDialogMask = var16 and reactModule.createElement(imageSetButton, {
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
					Selectable = false,
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
						Size = UDim2.new(1, 0, 1, -var13)
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
									-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), var14 (ref)
									return reactModule.createElement(iconButton, {
										iconSize = iconSize.Medium,
										icon = images["icons/navigation/pushBack"],
										onActivated = var14
									})
								end,
								renderRight = function()
									-- upvalues: p2 (ref), reactModule (copy), ScreenshotReviewDialogSmallPortraitModeHeaderRight (copy), var18 (ref), font (ref), theme (ref), button (copy), buttonType (copy), robloxTranslatorModule (copy), standardButtonSize (copy)
									return if p2.isSmallPortraitMode then reactModule.createElement(ScreenshotReviewDialogSmallPortraitModeHeaderRight, {
										onActivated = var18,
										font = font,
										theme = theme,
										viewportUISafeAreaWidth = p2.viewportUISafeAreaWidth
									}) else reactModule.createElement(button, {
										fitContent = true,
										buttonType = buttonType.Secondary,
										text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Retake"),
										standardSize = standardButtonSize.XSmall,
										onActivated = var18
									})
								end,
								title = if p2.isSmallPortraitMode then nil else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"),
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
									BorderMode = Enum.BorderMode.Outline,
									BorderColor3 = Color3.fromRGB(255, 255, 255)
								}, {
									UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p2.imageAspectRatio }),
									ScreenshotImage = reactModule.createElement(imageSetButton, {
										Active = true,
										Selectable = if var12 then false else true,
										Size = UDim2.fromScale(1, 1),
										Image = p2.screenshot,
										ZIndex = 1,
										AnchorPoint = Vector2.new(0.5, 0.5),
										Position = UDim2.fromScale(0.5, 0.5),
										BackgroundTransparency = 1,
										ScaleType = Enum.ScaleType.Fit,
										SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
										[reactModule.Event.Activated] = var20
									})
								})
							}),
							Description = reactModule.createElement("TextLabel", {
								LayoutOrder = 2,
								TextWrapped = true,
								BackgroundTransparency = 1,
								Text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Message.ProblemNotInScene"),
								Font = font.Header1.Font,
								TextColor3 = theme.TextEmphasis.Color,
								TextTransparency = theme.TextEmphasis.Transparency,
								TextSize = if p2.isSmallPortraitMode then 12 else 20,
								TextXAlignment = Enum.TextXAlignment.Center,
								Size = UDim2.new(1, -24, 0, if p2.isSmallPortraitMode then 24 else 40)
							})
						})
					}),
					Footer = reactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, var13),
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
							Size = if p2.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else UDim2.new(0, if p2.isSmallPortraitMode then 400 else 612, 1, 0)
						}, {
							Padding = reactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 12),
								PaddingBottom = UDim.new(0, 12),
								PaddingLeft = UDim.new(0, 16),
								PaddingRight = UDim.new(0, 16)
							}),
							ActionButtons = reactModule.createElement(buttonStack, {
								marginBetween = 8,
								forcedFillDirection = if p2.isSmallPortraitMode then Enum.FillDirection.Vertical else nil,
								buttons = {
									{
										buttonType = buttonType.Secondary,
										props = {
											onActivated = var15,
											text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot")
										}
									},
									if var12 then nil else {
										buttonType = buttonType.PrimarySystem,
										props = {
											onActivated = var20,
											text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.HighlightScene")
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
	return nil
end