local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local withStyle = UIBloxModule.Style.withStyle

local function _(p1)
	-- upvalues: withStyle (ref), reactModule (ref)
	return function()
		-- upvalues: withStyle (copy), reactModule (copy), p1 (ref)
		return withStyle(function(p2)
			-- upvalues: reactModule (copy), p1 (copy)
			local theme = p2.Theme
			
			return reactModule.createElement("TextLabel", {
				TextSize = 20,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = p1,
				Font = p2.Font.Header2.Font,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		end)
	end
end

local _ = function(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	p4 = p4 or p5
	
	return function()
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), p1 (ref), p4 (ref), p5 (ref), p2 (ref), p4 (ref), p3 (ref)
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
				onActivated = p1
			}),
			UndoButton = p4 and reactModule.createElement(iconButton, {
				layoutOrder = 2,
				iconSize = iconSize.Medium,
				icon = images["icons/actions/edit/undo"],
				isDisabled = not p5,
				onActivated = p2
			}),
			RedoButton = p4 and reactModule.createElement(iconButton, {
				layoutOrder = 3,
				iconSize = iconSize.Medium,
				icon = images["icons/actions/edit/redo"],
				isDisabled = not p4,
				onActivated = p3
			})
		})
	end
end

local _ = function(p1, p2)
	-- upvalues: reactModule (ref), buttonStack (ref), buttonType (ref), robloxTranslatorModule (ref)
	return function()
		-- upvalues: reactModule (copy), buttonStack (copy), buttonType (copy), p1 (ref), p2 (ref), robloxTranslatorModule (copy)
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
							onActivated = function()
								-- upvalues: p1 (copy), p2 (copy)
								p1(p2)
							end,
							text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next")
						}
					}
				}
			})
		})
	end
end

return function(p1)
	-- upvalues: reactModule (ref), headerBar (ref), iconButton (ref), iconSize (ref), images (ref), buttonStack (ref), buttonType (ref), robloxTranslatorModule (ref), withStyle (ref)
	local createElement = reactModule.createElement
	local var1 = "Frame"
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
	local backAction = p1.backAction
	local undoAnnotationPoints = p1.undoAnnotationPoints
	local redoAnnotationPoints = p1.redoAnnotationPoints
	local isRedoEnabled = p1.isRedoEnabled
	local isUndoEnabled = p1.isUndoEnabled
	local isRedoEnabled_1 = isRedoEnabled or isUndoEnabled
	
	function t_2.renderLeft()
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
	
	local finishAnnotationAction = p1.finishAnnotationAction
	local annotationPoints = p1.annotationPoints
	
	function t_2.renderRight()
		-- upvalues: reactModule (copy), buttonStack (copy), buttonType (copy), finishAnnotationAction (ref), annotationPoints (ref), robloxTranslatorModule (copy)
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
							onActivated = function()
								-- upvalues: finishAnnotationAction (copy), annotationPoints (copy)
								finishAnnotationAction(annotationPoints)
							end,
							text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next")
						}
					}
				}
			})
		})
	end
	
	local titleText = p1.titleText
	
	function t_2.renderCenter()
		-- upvalues: withStyle (copy), reactModule (copy), titleText (ref)
		return withStyle(function(p2)
			-- upvalues: reactModule (copy), titleText (copy)
			local theme = p2.Theme
			
			return reactModule.createElement("TextLabel", {
				TextSize = 20,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = titleText,
				Font = p2.Font.Header2.Font,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		end)
	end
	
	t_1.Bar = createElement_1(headerBar, t_2)
	
	return createElement(var1, t, t_1)
end