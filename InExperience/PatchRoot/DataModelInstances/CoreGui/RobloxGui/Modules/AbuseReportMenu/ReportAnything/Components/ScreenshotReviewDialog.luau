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

local function ScreenshotReviewDialogSmallPortraitModeHeaderRight(p1)
	-- upvalues: reactModule (ref), robloxTranslatorModule (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var1, var2 = reactModule.useState(0)
	
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
			Font = p1.font.Header2.Font,
			TextColor3 = p1.theme.TextEmphasis.Color,
			TextTransparency = p1.theme.TextEmphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			Size = UDim2.new(0, p1.viewportUISafeAreaWidth - var1 - 50, 1, 0)
		}),
		RetakeButton = reactModule.createElement(button, {
			buttonType = buttonType.Secondary,
			text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Retake"),
			fitContent = true,
			standardSize = standardButtonSize.XSmall,
			onActivated = reactModule.useCallback(function()
				-- upvalues: p1 (ref)
				p1.setShowRestartDialog(true)
			end, { p1.setShowRestartDialog }),
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref)
				var2(p2.AbsoluteSize.X)
			end, { var2 })
		})
	})
end

return function(p1)
	-- upvalues: usePreferredInput (ref), responsiveModule (ref), robloxTranslatorModule (ref), reactModule (ref), useStyle (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), restartScreenshotDialogModule (ref), imageSetButton (ref), assetsModule (ref), headerBar (ref), iconButton (ref), iconSize (ref), images (ref), ScreenshotReviewDialogSmallPortraitModeHeaderRight (ref), button (ref), buttonType (ref), standardButtonSize (ref), dividerModule (ref), buttonStack (ref)
	local var1 = usePreferredInput() == responsiveModule.Input.Directional
	
	if robloxTranslatorModule then
		local var2 = if p1.isSmallPortraitMode then 104 else 60
		local var3 = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			p1.reportAnythingAnalytics.incrementPreviewBack()
			p1.onBack()
		end, { p1.onBack, p1.reportAnythingAnalytics })
		local var4 = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			p1.reportAnythingAnalytics.incrementPreviewAttach()
			p1.onSkip()
		end, { p1.onSkip, p1.reportAnythingAnalytics })
		local var5, var6 = reactModule.useState(false)
		local var7 = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var6 (ref)
			p1.reportAnythingAnalytics.incrementRetake()
			var6(true)
		end, { var6, p1.reportAnythingAnalytics })
		local var8 = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			p1.reportAnythingAnalytics.setRetakeAbandon()
			p1.onRestart()
		end, { p1.onRestart, p1.reportAnythingAnalytics })
		local var9 = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			p1.reportAnythingAnalytics.incrementHighlightScene()
			p1.onNextPage()
		end, { p1.onNextPage, p1.reportAnythingAnalytics })
		local var10 = useStyle()
		local theme = var10.Theme
		local font = var10.Font
		
		return reactModule.createElement("TextButton", {
			Selectable = false,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundColor3 = theme.Overlay.Color,
			BackgroundTransparency = theme.Overlay.Transparency,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 10,
			Text = "",
			[reactModule.Event.Activated] = var3
		}, {
			Container = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 0,
				ZIndex = 10,
				Size = if p1.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) elseif p1.viewportUISafeAreaHeight >= 800 then UDim2.new(0, 800, 0, 800) else UDim2.new(1, 0, 1, 0),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = theme.Overlay.Color
			}, {
				RestartDialog = var5 and reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
						isIsolated = true,
						isAutoFocusRoot = true,
						surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
					}, {
						DialogBody = reactModule.createElement(restartScreenshotDialogModule, {
							ZIndex = 3,
							isSmallPortraitMode = p1.isSmallPortraitMode,
							onCancel = function()
								-- upvalues: var6 (ref)
								var6(false)
							end,
							onRestart = var8
						})
					})
				}),
				RestartDialogMask = var5 and reactModule.createElement(imageSetButton, {
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
						Size = UDim2.new(1, 0, 1, -var2)
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
									-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), var3 (ref)
									return reactModule.createElement(iconButton, {
										iconSize = iconSize.Medium,
										icon = images["icons/navigation/pushBack"],
										onActivated = var3
									})
								end,
								renderRight = function()
									-- upvalues: p1 (ref), reactModule (copy), ScreenshotReviewDialogSmallPortraitModeHeaderRight (copy), var7 (ref), font (ref), theme (ref), button (copy), buttonType (copy), robloxTranslatorModule (copy), standardButtonSize (copy)
									return if p1.isSmallPortraitMode then reactModule.createElement(ScreenshotReviewDialogSmallPortraitModeHeaderRight, {
										onActivated = var7,
										font = font,
										theme = theme,
										viewportUISafeAreaWidth = p1.viewportUISafeAreaWidth
									}) else reactModule.createElement(button, {
										fitContent = true,
										buttonType = buttonType.Secondary,
										text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Retake"),
										standardSize = standardButtonSize.XSmall,
										onActivated = var7
									})
								end,
								title = if p1.isSmallPortraitMode then nil else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"),
								isSecondary = p1.isSmallPortraitMode
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
									UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p1.imageAspectRatio }),
									ScreenshotImage = reactModule.createElement(imageSetButton, {
										Active = true,
										Selectable = if var1 then false else true,
										Size = UDim2.fromScale(1, 1),
										Image = p1.screenshot,
										ZIndex = 1,
										AnchorPoint = Vector2.new(0.5, 0.5),
										Position = UDim2.fromScale(0.5, 0.5),
										BackgroundTransparency = 1,
										ScaleType = Enum.ScaleType.Fit,
										SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
										[reactModule.Event.Activated] = var9
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
								TextSize = if p1.isSmallPortraitMode then 12 else 20,
								TextXAlignment = Enum.TextXAlignment.Center,
								Size = UDim2.new(1, -24, 0, if p1.isSmallPortraitMode then 24 else 40)
							})
						})
					}),
					Footer = reactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, var2),
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
							Size = if p1.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else UDim2.new(0, if p1.isSmallPortraitMode then 400 else 612, 1, 0)
						}, {
							Padding = reactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 12),
								PaddingBottom = UDim.new(0, 12),
								PaddingLeft = UDim.new(0, 16),
								PaddingRight = UDim.new(0, 16)
							}),
							ActionButtons = reactModule.createElement(buttonStack, {
								marginBetween = 8,
								forcedFillDirection = if p1.isSmallPortraitMode then Enum.FillDirection.Vertical else nil,
								buttons = {
									{
										buttonType = buttonType.Secondary,
										props = {
											onActivated = var4,
											text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot")
										}
									},
									if var1 then nil else {
										buttonType = buttonType.PrimarySystem,
										props = {
											onActivated = var9,
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