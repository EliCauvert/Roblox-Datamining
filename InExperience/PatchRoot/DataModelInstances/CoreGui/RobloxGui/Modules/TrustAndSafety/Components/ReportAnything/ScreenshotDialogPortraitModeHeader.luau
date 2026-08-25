local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local getFFlagReportAnythingLocalizationEnabledModule = require(script.Parent.Parent.Parent.Flags.GetFFlagReportAnythingLocalizationEnabled)
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local withStyle = UIBloxModule.Style.withStyle

local function _(p0, _, _)
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	return function()
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), p0 (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 30, 1, 0)
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
				onActivated = p0
			})
		})
	end
end

local _ = function(p1)
	-- upvalues: withStyle (ref), reactModule (ref)
	return function()
		-- upvalues: withStyle (copy), reactModule (copy), p1 (ref)
		return withStyle(function(p2)
			-- upvalues: reactModule (copy), p1 (copy)
			local currentCamera = game.Workspace.CurrentCamera
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
				Size = UDim2.new(0, if currentCamera ~= nil then currentCamera.ViewportSize.X - 150 else 300, 1, 0)
			})
		end)
	end
end

local _ = function(_, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	return function()
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), p5 (ref), p3 (ref), p6 (ref), p4 (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 60, 1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			UndoButton = reactModule.createElement(iconButton, {
				layoutOrder = 1,
				iconSize = iconSize.Medium,
				icon = images["icons/actions/edit/undo"],
				isDisabled = not p5,
				onActivated = p3
			}),
			RedoButton = reactModule.createElement(iconButton, {
				layoutOrder = 2,
				iconSize = iconSize.Medium,
				icon = images["icons/actions/edit/redo"],
				isDisabled = not p6,
				onActivated = p4
			})
		})
	end
end

return function(p7)
	-- upvalues: reactModule (ref), headerBar (ref), iconButton (ref), iconSize (ref), images (ref), getFFlagReportAnythingLocalizationEnabledModule (ref), withStyle (ref)
	local isRedoEnabled = p7.isRedoEnabled or p7.isUndoEnabled
	local createElement = reactModule.createElement
	local var5 = "Frame"
	local t = {
		BackgroundTransparency = 0,
		LayoutOrder = 1,
		ZIndex = 2,
		BackgroundColor3 = Color3.fromHex("#4F545F"),
		Size = UDim2.new(1, 0, 0, 48)
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		backgroundTransparency = 1,
		barHeight = 48,
		margin = 12,
		isSecondary = true
	}
	local backAction = p7.backAction
	local _ = p7.isRedoEnabled
	local _ = p7.isUndoEnabled
	
	function t_2.renderLeft()
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), backAction (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 30, 1, 0)
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
			})
		})
	end
	
	if isRedoEnabled then
		local _ = p7.annotationPoints
		local undoAnnotationPoints = p7.undoAnnotationPoints
		local redoAnnotationPoints = p7.redoAnnotationPoints
		local isUndoEnabled = p7.isUndoEnabled
		local isRedoEnabled_1 = p7.isRedoEnabled
		
		local var9 = function()
			-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), isUndoEnabled (ref), undoAnnotationPoints (ref), isRedoEnabled_1 (ref), redoAnnotationPoints (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 60, 1, 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				UndoButton = reactModule.createElement(iconButton, {
					layoutOrder = 1,
					iconSize = iconSize.Medium,
					icon = images["icons/actions/edit/undo"],
					isDisabled = not isUndoEnabled,
					onActivated = undoAnnotationPoints
				}),
				RedoButton = reactModule.createElement(iconButton, {
					layoutOrder = 2,
					iconSize = iconSize.Medium,
					icon = images["icons/actions/edit/redo"],
					isDisabled = not isRedoEnabled_1,
					onActivated = redoAnnotationPoints
				})
			})
		end
	else
		local var9 = function() end
	end
	t_2.renderRight = var9
	t_2.title = if getFFlagReportAnythingLocalizationEnabledModule() then nil else p7.titleText
	
	if getFFlagReportAnythingLocalizationEnabledModule() then
		local titleText = p7.titleText
		
		local var10 = function()
			-- upvalues: withStyle (copy), reactModule (copy), titleText (ref)
			return withStyle(function(p8)
				-- upvalues: reactModule (copy), titleText (copy)
				local currentCamera = game.Workspace.CurrentCamera
				local theme = p8.Theme
				
				return reactModule.createElement("TextLabel", {
					TextSize = 20,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Text = titleText,
					Font = p8.Font.Header2.Font,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Size = UDim2.new(0, if currentCamera ~= nil then currentCamera.ViewportSize.X - 150 else 300, 1, 0)
				})
			end)
		end
	else
		local var10 = nil
	end
	t_2.renderCenter = var10
	t_1.Bar = createElement_1(headerBar, t_2)
	
	return createElement(var5, t, t_1)
end