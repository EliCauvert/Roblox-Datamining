local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local getFFlagReportAnythingLocalizationEnabledModule = require(script.Parent.Parent.Parent.Flags.GetFFlagReportAnythingLocalizationEnabled)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local withStyle = UIBloxModule.Style.withStyle

local function _(p0) --[[ line: 31 | named "renderWrappingCenter" ]]
	-- upvalues: withStyle (ref), reactModule (ref)
	return function() --[[ line: 32 ]]
		-- upvalues: withStyle (copy), reactModule (copy), p0 (ref)
		return withStyle(function(p1) --[[ line: 33 ]]
			-- upvalues: reactModule (copy), p0 (copy)
			local theme = p1.Theme
			
			return reactModule.createElement("TextLabel", {
				TextSize = 20,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = p0,
				Font = p1.Font.Header2.Font,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		end)
	end
end

local _ = function(p2, p3, p4, p5, p6) --[[ line: 53 | named "renderHeaderBarLeft" ]]
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	p5 = p5 or p6
	
	return function() --[[ line: 55 ]]
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), p2 (ref), p5 (ref), p6 (ref), p3 (ref), p5 (ref), p4 (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 120, 1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			BackButton = reactModule.createElement(iconButton, {
				layoutOrder = 1,
				iconSize = iconSize.Medium,
				icon = images["icons/navigation/pushBack"],
				onActivated = p2
			}),
			UndoButton = p5 and reactModule.createElement(iconButton, {
				layoutOrder = 2,
				iconSize = iconSize.Medium,
				icon = images["icons/actions/edit/undo"],
				isDisabled = not p6,
				onActivated = p3
			}),
			RedoButton = p5 and reactModule.createElement(iconButton, {
				layoutOrder = 3,
				iconSize = iconSize.Medium,
				icon = images["icons/actions/edit/redo"],
				isDisabled = not p5,
				onActivated = p4
			})
		})
	end
end

local _ = function(p7, p8) --[[ line: 90 | named "renderHeaderBarRight" ]]
	-- upvalues: reactModule (ref), buttonStack (ref), buttonType (ref), getFFlagReportAnythingLocalizationEnabledModule (ref), robloxTranslatorModule (ref)
	return function() --[[ line: 91 ]]
		-- upvalues: reactModule (copy), buttonStack (copy), buttonType (copy), p7 (ref), p8 (ref), getFFlagReportAnythingLocalizationEnabledModule (copy), robloxTranslatorModule (copy)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Buttons = reactModule.createElement(buttonStack, {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = function() --[[ line: 106 ]]
								-- upvalues: p7 (copy), p8 (copy)
								p7(p8)
							end,
							text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
						}
					}
				}
			})
		})
	end
end

return function(p9) --[[ line: 119 | named "LandscapeModeHeader" ]]
	-- upvalues: reactModule (ref), headerBar (ref), iconButton (ref), iconSize (ref), images (ref), buttonStack (ref), buttonType (ref), getFFlagReportAnythingLocalizationEnabledModule (ref), robloxTranslatorModule (ref), withStyle (ref)
	local createElement = reactModule.createElement
	local var6 = "Frame"
	local t = {
		BackgroundTransparency = 0,
		LayoutOrder = 1,
		ZIndex = 2,
		BackgroundColor3 = Color3.fromHex("#4F545F"),
		Size = UDim2.new(1, 0, 0, 47)
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = { backgroundTransparency = 1, barHeight = 48 }
	local backAction = p9.backAction
	local undoAnnotationPoints = p9.undoAnnotationPoints
	local redoAnnotationPoints = p9.redoAnnotationPoints
	local isRedoEnabled = p9.isRedoEnabled
	local isUndoEnabled = p9.isUndoEnabled
	local isRedoEnabled_1 = isRedoEnabled or isUndoEnabled
	
	function t_2.renderLeft() --[[ line: 55 ]]
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), backAction (ref), isRedoEnabled_1 (ref), isUndoEnabled (ref), undoAnnotationPoints (ref), isRedoEnabled (ref), redoAnnotationPoints (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 120, 1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			BackButton = reactModule.createElement(iconButton, {
				layoutOrder = 1,
				iconSize = iconSize.Medium,
				icon = images["icons/navigation/pushBack"],
				onActivated = backAction
			}),
			UndoButton = isRedoEnabled_1 and reactModule.createElement(iconButton, {
				layoutOrder = 2,
				iconSize = iconSize.Medium,
				icon = images["icons/actions/edit/undo"],
				isDisabled = not isUndoEnabled,
				onActivated = undoAnnotationPoints
			}),
			RedoButton = isRedoEnabled_1 and reactModule.createElement(iconButton, {
				layoutOrder = 3,
				iconSize = iconSize.Medium,
				icon = images["icons/actions/edit/redo"],
				isDisabled = not isRedoEnabled,
				onActivated = redoAnnotationPoints
			})
		})
	end
	
	local reportAction = p9.reportAction
	local annotationPoints = p9.annotationPoints
	
	function t_2.renderRight() --[[ line: 91 ]]
		-- upvalues: reactModule (copy), buttonStack (copy), buttonType (copy), reportAction (ref), annotationPoints (ref), getFFlagReportAnythingLocalizationEnabledModule (copy), robloxTranslatorModule (copy)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Buttons = reactModule.createElement(buttonStack, {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = function() --[[ line: 106 ]]
								-- upvalues: reportAction (copy), annotationPoints (copy)
								reportAction(annotationPoints)
							end,
							text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
						}
					}
				}
			})
		})
	end
	
	t_2.title = if getFFlagReportAnythingLocalizationEnabledModule() then nil else p9.titleText
	
	if getFFlagReportAnythingLocalizationEnabledModule() then
		local titleText = p9.titleText
		
		local var11 = function() --[[ line: 32 ]]
			-- upvalues: withStyle (copy), reactModule (copy), titleText (ref)
			return withStyle(function(p10) --[[ line: 33 ]]
				-- upvalues: reactModule (copy), titleText (copy)
				local theme = p10.Theme
				
				return reactModule.createElement("TextLabel", {
					TextSize = 20,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Text = titleText,
					Font = p10.Font.Header2.Font,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Size = UDim2.new(1, 0, 1, 0)
				})
			end)
		end
	else
		local var11 = nil
	end
	t_2.renderCenter = var11
	t_1.Bar = createElement_1(headerBar, t_2)
	
	return createElement(var6, t, t_1)
end