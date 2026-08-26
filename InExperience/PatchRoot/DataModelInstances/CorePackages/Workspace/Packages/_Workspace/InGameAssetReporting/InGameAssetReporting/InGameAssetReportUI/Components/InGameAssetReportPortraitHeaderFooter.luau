local parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local withStyle = UIBloxModule.Style.withStyle

local function _(p1, _, _)
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	return function()
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), p1 (ref)
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
				onActivated = p1
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

local _ = function(_, p1, p2, p3, p4)
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	return function()
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), p3 (ref), p1 (ref), p4 (ref), p2 (ref)
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
				isDisabled = not p3,
				onActivated = p1
			}),
			RedoButton = reactModule.createElement(iconButton, {
				layoutOrder = 2,
				iconSize = iconSize.Medium,
				icon = images["icons/actions/edit/redo"],
				isDisabled = not p4,
				onActivated = p2
			})
		})
	end
end

return {
	PortraitModeHeader = function(p1)
		-- upvalues: reactModule (ref), headerBar (ref), iconButton (ref), iconSize (ref), images (ref), withStyle (ref)
		local isRedoEnabled = p1.isRedoEnabled or p1.isUndoEnabled
		local createElement = reactModule.createElement
		local var1 = "Frame"
		local t = {
			BorderSizePixel = 0,
			BackgroundTransparency = 0.1,
			LayoutOrder = 1,
			ZIndex = 2,
			BackgroundColor3 = Color3.fromHex("#000000"),
			Size = UDim2.new(1, 0, 0, 72)
		}
		local t_1 = {}
		local createElement_1 = reactModule.createElement
		local t_2 = {
			backgroundTransparency = 1,
			barHeight = 72,
			margin = 12,
			isSecondary = true
		}
		local backAction = p1.backAction
		local _ = p1.isRedoEnabled
		local _ = p1.isUndoEnabled
		
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
			local _ = p1.annotationPoints
			local undoAnnotationPoints = p1.undoAnnotationPoints
			local redoAnnotationPoints = p1.redoAnnotationPoints
			local isUndoEnabled = p1.isUndoEnabled
			local isRedoEnabled_1 = p1.isRedoEnabled
			
			local var2 = function()
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
			local var2 = function() end
		end
		t_2.renderRight = var2
		local titleText = p1.titleText
		
		function t_2.renderCenter()
			-- upvalues: withStyle (copy), reactModule (copy), titleText (ref)
			return withStyle(function(p2)
				-- upvalues: reactModule (copy), titleText (copy)
				local currentCamera = game.Workspace.CurrentCamera
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
					Size = UDim2.new(0, if currentCamera ~= nil then currentCamera.ViewportSize.X - 150 else 300, 1, 0)
				})
			end)
		end
		
		t_1.Bar = createElement_1(headerBar, t_2)
		
		return createElement(var1, t, t_1)
	end,
	PortraitModeFooter = function(p1)
		-- upvalues: reactModule (ref), buttonStack (ref), buttonType (ref)
		return reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0.1,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, 60),
			BackgroundColor3 = Color3.fromHex("#000000"),
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
							props = { onActivated = p1.nextAction, text = p1.nextText }
						}
					}
				})
			})
		})
	end
}