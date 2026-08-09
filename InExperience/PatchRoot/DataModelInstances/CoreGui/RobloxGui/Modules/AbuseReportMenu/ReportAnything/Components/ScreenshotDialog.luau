local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local useStyle = UIBloxModule.Core.Style.useStyle
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local dividerModule = require(parent.Components.Divider)
local screenshotHighlighterModule = require(parent.Components.ScreenshotHighlighter)
local virtualKeyboardMonitorModule = require(parent.Utility.VirtualKeyboardMonitor)
local screenshotDialogPortraitModeHeaderModule = require(parent.Components.ScreenshotDialogPortraitModeHeader)
local screenshotDialogLandscapeModeHeaderModule = require(parent.Components.ScreenshotDialogLandscapeModeHeader)
local _ = require(parent.Utility.ReportAnythingAnalytics)
local getFFlagAvatarIdentificationSafeAreaFix = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagAvatarIdentificationSafeAreaFix
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)

local function PortraitModeFooter(p0) --[[ line: 45 ]]
	-- upvalues: reactModule (ref), buttonStack (ref), buttonType (ref), robloxTranslatorModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		LayoutOrder = 4,
		Size = UDim2.new(1, 0, 0, 60),
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
			Size = UDim2.new(0, 400, 1, 0)
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 32),
				PaddingRight = UDim.new(0, 32)
			}),
			ActionButtons = reactModule.createElement(buttonStack, {
				marginBetween = 8,
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = function() --[[ line: 76 ]]
								-- upvalues: p0 (ref)
								p0.finishAnnotationAction(p0.annotationPoints)
							end,
							text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next")
						}
					}
				}
			})
		})
	})
end

return function(p1) --[[ line: 88 | named "ScreenshotDialog" ]]
	-- upvalues: useStyle (ref), virtualKeyboardMonitorModule (ref), reactModule (ref), cryoModule (ref), imageSetButton (ref), assetsModule (ref), screenshotDialogPortraitModeHeaderModule (ref), screenshotDialogLandscapeModeHeaderModule (ref), dividerModule (ref), getFFlagAvatarIdentificationSafeAreaFix (ref), screenshotHighlighterModule (ref), PortraitModeFooter (ref)
	local theme = useStyle().Theme
	local instance = virtualKeyboardMonitorModule.getInstance()
	
	local var13 = function() --[[ line: 94 ]]
		-- upvalues: instance (ref), p1 (ref)
		warn("OverlayActivated")
		
		if instance:isKeyboardJustOff() then return end
		if p1.dismissAction then
			warn("Menu dismissed")
			p1.dismissAction()
		end
	end
	
	local var14, var15 = reactModule.useState(cryoModule.Dictionary.join({}, p1.initialAnnotationPoints or {}))
	local var16, var17 = reactModule.useState({})
	local var18 = reactModule.useCallback(function() --[[ line: 111 ]]
		-- upvalues: var15 (ref), var14 (ref)
		var15(table.clone(var14))
	end, { var15, var14 })
	local var19 = reactModule.useCallback(function() --[[ line: 115 ]]
		-- upvalues: p1 (ref)
		p1.reportAnythingAnalytics.incrementAnnotationBack()
		p1.backAction()
	end, { p1.backAction, p1.reportAnythingAnalytics })
	local var20 = reactModule.useCallback(function(_) --[[ line: 120 ]]
		-- upvalues: p1 (ref), var18 (ref), var17 (ref)
		p1.reportAnythingAnalytics.incrementAnnotationPlace()
		var18()
		var17({})
	end, { var17, var18, p1.reportAnythingAnalytics })
	local var21 = reactModule.useCallback(function() --[[ line: 127 ]]
		-- upvalues: var14 (ref), p1 (ref), var16 (ref), var18 (ref)
		if #var14 > 0 then
			p1.reportAnythingAnalytics.incrementAnnotationUndo()
			table.insert(var16, 1, var14[#var14])
			table.remove(var14, #var14)
			var18()
		end
	end, { var18, var14, var16, p1.reportAnythingAnalytics })
	local var22 = reactModule.useCallback(function() --[[ line: 137 ]]
		-- upvalues: var16 (ref), p1 (ref), var14 (ref), var18 (ref)
		if #var16 > 0 then
			p1.reportAnythingAnalytics.incrementAnnotationRedo()
			table.insert(var14, var16[1])
			table.remove(var16, 1)
			var18()
		end
	end, { var18, var14, var16, p1.reportAnythingAnalytics })
	local var23 = reactModule.useCallback(function(p2) --[[ line: 147 ]]
		-- upvalues: p1 (ref)
		p1.reportAnythingAnalytics.setAnnotationNext()
		p1.finishAnnotationAction(p2)
	end, { p1.finishAnnotationAction, p1.reportAnythingAnalytics })
	local var24 = #var14 > 0
	local var25 = #var16 > 0
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundColor3 = theme.Overlay.Color,
		BackgroundTransparency = theme.Overlay.Transparency,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ZIndex = 10,
		Text = "",
		[reactModule.Event.Activated] = var13
	}, {
		ScreenshotDialog = reactModule.createElement(imageSetButton, {
			Active = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Image = assetsModule.Images.RoundedRect.Image,
			ImageColor3 = theme.BackgroundUIDefault.Color,
			ImageTransparency = theme.BackgroundUIDefault.Transparency,
			ScaleType = assetsModule.Images.RoundedRect.ScaleType,
			SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
		}, {
			HeaderAndContent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, if p1.isSmallPortraitMode then -60 else 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Header = if p1.isSmallPortraitMode then reactModule.createElement(screenshotDialogPortraitModeHeaderModule, {
					titleText = p1.titleText,
					backAction = var19,
					undoAnnotationPoints = var21,
					redoAnnotationPoints = var22,
					isRedoEnabled = var25,
					isUndoEnabled = var24,
					annotationPoints = var14
				}) else reactModule.createElement(screenshotDialogLandscapeModeHeaderModule, {
					titleText = p1.titleText,
					backAction = var19,
					finishAnnotationAction = var23,
					undoAnnotationPoints = var21,
					redoAnnotationPoints = var22,
					isRedoEnabled = var25,
					isUndoEnabled = var24,
					annotationPoints = var14
				}),
				Divider = reactModule.createElement(dividerModule, { LayoutOrder = 2 }),
				ScreenshotAnnotation = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					ZIndex = 1,
					Size = UDim2.new(1, 0, 1, -49)
				}, {
					Container = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					}, {
						UIAspectRatioConstraint = if getFFlagAvatarIdentificationSafeAreaFix() then nil else reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p1.imageAspectRatio }),
						Layout = if getFFlagAvatarIdentificationSafeAreaFix() then reactModule.createElement("UIListLayout", {
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}) else nil,
						Padding = reactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 16),
							PaddingBottom = UDim.new(0, 16),
							PaddingLeft = UDim.new(0, 16),
							PaddingRight = UDim.new(0, 16)
						}),
						AnnotationLayer = reactModule.createElement("Frame", {
							BorderSizePixel = 2,
							Size = UDim2.new(1, 0, 1, 0),
							BorderMode = if getFFlagAvatarIdentificationSafeAreaFix() then Enum.BorderMode.Outline else Enum.BorderMode.Inset,
							BorderColor3 = Color3.fromRGB(255, 255, 255)
						}, {
							UIAspectRatioConstraint = if getFFlagAvatarIdentificationSafeAreaFix() then reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p1.imageAspectRatio }) else nil,
							ScreenshotImage = reactModule.createElement("ImageLabel", {
								ZIndex = 1,
								Size = UDim2.fromScale(1, 1),
								Image = p1.screenshot,
								ScaleType = Enum.ScaleType.Fit
							}, {}),
							Highlighter = reactModule.createElement(screenshotHighlighterModule, {
								ZIndex = 3,
								annotationPoints = var14,
								handleAnnotationPoints = var20,
								setAnnotationCircleRadius = p1.setAnnotationCircleRadius,
								setAnnotationAreaDimensions = p1.setAnnotationAreaDimensions
							}, {})
						})
					})
				})
			}),
			Footer = if p1.isSmallPortraitMode then reactModule.createElement(PortraitModeFooter, { finishAnnotationAction = var23, annotationPoints = var14 }) else nil
		})
	})
end