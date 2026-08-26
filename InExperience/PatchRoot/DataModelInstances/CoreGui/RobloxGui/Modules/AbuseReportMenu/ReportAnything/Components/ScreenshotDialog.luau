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
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)

local function PortraitModeFooter(p1)
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
							onActivated = function()
								-- upvalues: p1 (ref)
								p1.finishAnnotationAction(p1.annotationPoints)
							end,
							text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next")
						}
					}
				}
			})
		})
	})
end

return function(p1)
	-- upvalues: useStyle (ref), virtualKeyboardMonitorModule (ref), reactModule (ref), cryoModule (ref), imageSetButton (ref), assetsModule (ref), screenshotDialogPortraitModeHeaderModule (ref), screenshotDialogLandscapeModeHeaderModule (ref), dividerModule (ref), screenshotHighlighterModule (ref), PortraitModeFooter (ref)
	local theme = useStyle().Theme
	local instance = virtualKeyboardMonitorModule.getInstance()
	
	local var1 = function()
		-- upvalues: instance (ref), p1 (ref)
		warn("OverlayActivated")
		
		if instance:isKeyboardJustOff() then return end
		if p1.dismissAction then
			warn("Menu dismissed")
			p1.dismissAction()
		end
	end
	
	local var2, var3 = reactModule.useState(cryoModule.Dictionary.join({}, p1.initialAnnotationPoints or {}))
	local var4, var5 = reactModule.useState({})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref)
		var3(table.clone(var2))
	end, { var3, var2 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.reportAnythingAnalytics.incrementAnnotationBack()
		p1.backAction()
	end, { p1.backAction, p1.reportAnythingAnalytics })
	local var8 = reactModule.useCallback(function(_)
		-- upvalues: p1 (ref), var6 (ref), var5 (ref)
		p1.reportAnythingAnalytics.incrementAnnotationPlace()
		var6()
		var5({})
	end, { var5, var6, p1.reportAnythingAnalytics })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), p1 (ref), var4 (ref), var6 (ref)
		if #var2 > 0 then
			p1.reportAnythingAnalytics.incrementAnnotationUndo()
			table.insert(var4, 1, var2[#var2])
			table.remove(var2, #var2)
			var6()
		end
	end, { var6, var2, var4, p1.reportAnythingAnalytics })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), p1 (ref), var2 (ref), var6 (ref)
		if #var4 > 0 then
			p1.reportAnythingAnalytics.incrementAnnotationRedo()
			table.insert(var2, var4[1])
			table.remove(var4, 1)
			var6()
		end
	end, { var6, var2, var4, p1.reportAnythingAnalytics })
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		p1.reportAnythingAnalytics.setAnnotationNext()
		p1.finishAnnotationAction(p2)
	end, { p1.finishAnnotationAction, p1.reportAnythingAnalytics })
	local var12 = #var2 > 0
	local var13 = #var4 > 0
	
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
		[reactModule.Event.Activated] = var1
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
					backAction = var7,
					undoAnnotationPoints = var9,
					redoAnnotationPoints = var10,
					isRedoEnabled = var13,
					isUndoEnabled = var12,
					annotationPoints = var2
				}) else reactModule.createElement(screenshotDialogLandscapeModeHeaderModule, {
					titleText = p1.titleText,
					backAction = var7,
					finishAnnotationAction = var11,
					undoAnnotationPoints = var9,
					redoAnnotationPoints = var10,
					isRedoEnabled = var13,
					isUndoEnabled = var12,
					annotationPoints = var2
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
						Layout = reactModule.createElement("UIListLayout", {
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						Padding = reactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 16),
							PaddingBottom = UDim.new(0, 16),
							PaddingLeft = UDim.new(0, 16),
							PaddingRight = UDim.new(0, 16)
						}),
						AnnotationLayer = reactModule.createElement("Frame", {
							BorderSizePixel = 2,
							Size = UDim2.new(1, 0, 1, 0),
							BorderMode = Enum.BorderMode.Outline,
							BorderColor3 = Color3.fromRGB(255, 255, 255)
						}, {
							UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p1.imageAspectRatio }),
							ScreenshotImage = reactModule.createElement("ImageLabel", {
								ZIndex = 1,
								Size = UDim2.fromScale(1, 1),
								Image = p1.screenshot,
								ScaleType = Enum.ScaleType.Fit
							}, {}),
							Highlighter = reactModule.createElement(screenshotHighlighterModule, {
								ZIndex = 3,
								annotationPoints = var2,
								handleAnnotationPoints = var8,
								setAnnotationCircleRadius = p1.setAnnotationCircleRadius,
								setAnnotationAreaDimensions = p1.setAnnotationAreaDimensions
							}, {})
						})
					})
				})
			}),
			Footer = if p1.isSmallPortraitMode then reactModule.createElement(PortraitModeFooter, { finishAnnotationAction = var11, annotationPoints = var2 }) else nil
		})
	})
end