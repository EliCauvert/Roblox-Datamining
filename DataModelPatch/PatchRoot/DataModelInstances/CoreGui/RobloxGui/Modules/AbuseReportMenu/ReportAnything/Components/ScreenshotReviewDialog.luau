local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Button = UIBloxModule.App.Button.Button
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local DividerModule = require(Parent.Components.Divider)
local RestartScreenshotDialogModule = require(Parent.Components.RestartScreenshotDialog)
local _ = require(Parent.Utility.ReportAnythingAnalytics)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GetFFlagAvatarIdentificationSafeAreaFixFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAvatarIdentificationSafeAreaFix

local function ScreenshotReviewDialogSmallPortraitModeHeaderRight(p1)
	-- upvalues: ReactModule (copy), RobloxTranslatorModule (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Text = ReactModule.createElement("TextLabel", {
			LayoutOrder = -1,
			TextSize = 20,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Text = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"),
			Font = p1.font.Header2.Font,
			TextColor3 = p1.theme.TextEmphasis.Color,
			TextTransparency = p1.theme.TextEmphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			Size = UDim2.new(0, p1.viewportUISafeAreaWidth - UseStateResult - 50, 1, 0)
		}),
		RetakeButton = ReactModule.createElement(Button, {
			buttonType = ButtonType.Secondary,
			text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Retake"),
			fitContent = true,
			standardSize = StandardButtonSize.XSmall,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: p1 (copy)
				p1.setShowRestartDialog(true)
			end, { p1.setShowRestartDialog }),
			[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Frame.AbsoluteSize.X)
			end, { UseStateResult2 })
		})
	})
end

return function(p1)
	-- upvalues: UsePreferredInputFunction (copy), ResponsiveModule (copy), RobloxTranslatorModule (copy), ReactModule (copy), UseStyleFunction (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), RestartScreenshotDialogModule (copy), ImageSetButton (copy), AssetsModule (copy), HeaderBar (copy), IconButton (copy), IconSize (copy), Images (copy), ScreenshotReviewDialogSmallPortraitModeHeaderRight (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy), DividerModule (copy), GetFFlagAvatarIdentificationSafeAreaFixFunction (copy), ButtonStack (copy)
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	
	if RobloxTranslatorModule then
		local YOffset: number = if p1.isSmallPortraitMode then 104 else 60
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.reportAnythingAnalytics.incrementPreviewBack()
			p1.onBack()
		end, { p1.onBack, p1.reportAnythingAnalytics })
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.reportAnythingAnalytics.incrementPreviewAttach()
			p1.onSkip()
		end, { p1.onSkip, p1.reportAnythingAnalytics })
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local UseResult2 = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), UseStateResult2 (copy)
			p1.reportAnythingAnalytics.incrementRetake()
			UseStateResult2(true)
		end, { UseStateResult2, p1.reportAnythingAnalytics })
		local UseResult3 = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.reportAnythingAnalytics.setRetakeAbandon()
			p1.onRestart()
		end, { p1.onRestart, p1.reportAnythingAnalytics })
		local UseResult4 = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.reportAnythingAnalytics.incrementHighlightScene()
			p1.onNextPage()
		end, { p1.onNextPage, p1.reportAnythingAnalytics })
		local UseStyleResult = UseStyleFunction()
		local Theme = UseStyleResult.Theme
		local UseStyleResultFont = UseStyleResult.Font
		local _UDim2: UDim2 = if p1.viewportUISafeAreaHeight >= 800 then UDim2.new(0, 800, 0, 800) else UDim2.new(1, 0, 1, 0)
		
		return ReactModule.createElement("TextButton", {
			Selectable = false,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 10,
			Text = "",
			[ReactModule.Event.Activated] = UseResult
		}, {
			Container = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 0,
				ZIndex = 10,
				Size = if p1.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else _UDim2,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Theme.Overlay.Color
			}, {
				RestartDialog = UseStateResult and ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
						isIsolated = true,
						isAutoFocusRoot = true,
						surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
					}, {
						DialogBody = ReactModule.createElement(RestartScreenshotDialogModule, {
							ZIndex = 3,
							isSmallPortraitMode = p1.isSmallPortraitMode,
							onCancel = function()
								-- upvalues: UseStateResult2 (copy)
								UseStateResult2(false)
							end,
							onRestart = UseResult3
						})
					})
				}),
				RestartDialogMask = UseStateResult and ReactModule.createElement(ImageSetButton, {
					BackgroundTransparency = 0.2,
					Active = true,
					AutoButtonColor = false,
					ImageTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = Theme.BackgroundUIDefault.Color,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = AssetsModule.Images.RoundedRect.Image,
					ImageColor3 = Theme.BackgroundUIDefault.Color,
					ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
					SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter
				}, {}),
				ScreenshotDialog = ReactModule.createElement(ImageSetButton, {
					Active = true,
					Selectable = false,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = AssetsModule.Images.RoundedRect.Image,
					ImageColor3 = Theme.BackgroundUIDefault.Color,
					ImageTransparency = Theme.BackgroundUIDefault.Transparency,
					ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
					SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					HeaderAndContent = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, -YOffset)
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Header = ReactModule.createElement("Frame", {
							BackgroundTransparency = 0,
							LayoutOrder = 1,
							BackgroundColor3 = Color3.fromHex("#4F545F"),
							Size = UDim2.new(1, 0, 0, 48)
						}, {
							Bar = ReactModule.createElement(HeaderBar, {
								backgroundTransparency = 1,
								barHeight = 48,
								margin = 12,
								renderLeft = function()
									-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), UseResult (copy)
									return ReactModule.createElement(IconButton, {
										iconSize = IconSize.Medium,
										icon = Images["icons/navigation/pushBack"],
										onActivated = UseResult
									})
								end,
								renderRight = function()
									-- upvalues: p1 (copy), ReactModule (upval), ScreenshotReviewDialogSmallPortraitModeHeaderRight (upval), UseResult2 (copy), UseStyleResultFont (copy), Theme (copy), Button (upval), ButtonType (upval), RobloxTranslatorModule (upval), StandardButtonSize (upval)
									return if p1.isSmallPortraitMode then ReactModule.createElement(ScreenshotReviewDialogSmallPortraitModeHeaderRight, {
										onActivated = UseResult2,
										font = UseStyleResultFont,
										theme = Theme,
										viewportUISafeAreaWidth = p1.viewportUISafeAreaWidth
									}) else ReactModule.createElement(Button, {
										fitContent = true,
										buttonType = ButtonType.Secondary,
										text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Retake"),
										standardSize = StandardButtonSize.XSmall,
										onActivated = UseResult2
									})
								end,
								title = if p1.isSmallPortraitMode then nil else RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"),
								isSecondary = p1.isSmallPortraitMode
							})
						}),
						Divider = ReactModule.createElement(DividerModule, { LayoutOrder = 2 }),
						ScreenshotBody = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							ZIndex = 10,
							Size = UDim2.new(1, 0, 1, -60)
						}, {
							Padding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 16) }),
							Layout = ReactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								SortOrder = Enum.SortOrder.LayoutOrder
							}),
							ScreenshotContainer = ReactModule.createElement("Frame", {
								BackgroundTransparency = 2,
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 1, -32)
							}, {
								Padding = ReactModule.createElement("UIPadding", {
									PaddingTop = UDim.new(0, 12),
									PaddingBottom = UDim.new(0, 12),
									PaddingLeft = UDim.new(0, 16),
									PaddingRight = UDim.new(0, 16)
								}),
								Screenshot = ReactModule.createElement("Frame", {
									BorderSizePixel = 2,
									LayoutOrder = 1,
									Size = UDim2.new(1, 0, 1, 0),
									Position = UDim2.fromScale(0.5, 0.5),
									AnchorPoint = Vector2.new(0.5, 0.5),
									BorderMode = if GetFFlagAvatarIdentificationSafeAreaFixFunction() then Enum.BorderMode.Outline else Enum.BorderMode.Inset,
									BorderColor3 = Color3.fromRGB(255, 255, 255)
								}, {
									UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p1.imageAspectRatio }),
									ScreenshotImage = ReactModule.createElement(ImageSetButton, {
										Active = true,
										Selectable = not IsUsePreferredInputResultMatch,
										Size = UDim2.fromScale(1, 1),
										Image = p1.screenshot,
										ZIndex = 1,
										AnchorPoint = Vector2.new(0.5, 0.5),
										Position = UDim2.fromScale(0.5, 0.5),
										BackgroundTransparency = 1,
										ScaleType = Enum.ScaleType.Fit,
										SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter,
										[ReactModule.Event.Activated] = UseResult4
									})
								})
							}),
							Description = ReactModule.createElement("TextLabel", {
								LayoutOrder = 2,
								TextWrapped = true,
								BackgroundTransparency = 1,
								Text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Message.ProblemNotInScene"),
								Font = UseStyleResultFont.Header1.Font,
								TextColor3 = Theme.TextEmphasis.Color,
								TextTransparency = Theme.TextEmphasis.Transparency,
								TextSize = if p1.isSmallPortraitMode then 12 else 20,
								TextXAlignment = Enum.TextXAlignment.Center,
								Size = UDim2.new(1, -24, 0, if p1.isSmallPortraitMode then 24 else 40)
							})
						})
					}),
					Footer = ReactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, YOffset),
						BackgroundColor3 = Color3.fromHex("#4F545F"),
						AnchorPoint = Vector2.new(0, 1),
						Position = UDim2.fromScale(0, 1)
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center
						}),
						Container = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = if p1.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else UDim2.new(0, if p1.isSmallPortraitMode then 400 else 612, 1, 0)
						}, {
							Padding = ReactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 12),
								PaddingBottom = UDim.new(0, 12),
								PaddingLeft = UDim.new(0, 16),
								PaddingRight = UDim.new(0, 16)
							}),
							ActionButtons = ReactModule.createElement(ButtonStack, {
								marginBetween = 8,
								forcedFillDirection = if p1.isSmallPortraitMode then Enum.FillDirection.Vertical else nil,
								buttons = {
									{
										buttonType = ButtonType.Secondary,
										props = {
											onActivated = UseResult1,
											text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot")
										}
									},
									if IsUsePreferredInputResultMatch then nil else {
										buttonType = ButtonType.PrimarySystem,
										props = {
											onActivated = UseResult4,
											text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.HighlightScene")
										}
									}
								}
							})
						})
					})
				})
			})
		})
	else
		return nil
	end
end