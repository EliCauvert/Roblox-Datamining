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

local function _(p0, _, _) --[[ line: 30 | named "renderHeaderBarLeft" ]]
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	return function() --[[ line: 31 ]]
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

local _ = function(p1) --[[ line: 52 | named "renderHeaderBarCenter" ]]
	-- upvalues: withStyle (ref), reactModule (ref)
	return function() --[[ line: 53 ]]
		-- upvalues: withStyle (copy), reactModule (copy), p1 (ref)
		return withStyle(function(p2) --[[ line: 54 ]]
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

local _ = function(_, p3, p4, p5, p6) --[[ line: 81 | named "renderHeaderBarRight" ]]
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	return function() --[[ line: 88 ]]
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

return {
	PortraitModeHeader = function(p7) --[[ line: 117 ]]
		-- upvalues: reactModule (ref), headerBar (ref), iconButton (ref), iconSize (ref), images (ref), withStyle (ref)
		local isRedoEnabled = p7.isRedoEnabled or p7.isUndoEnabled
		local createElement = reactModule.createElement
		local var3 = "Frame"
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
		local backAction = p7.backAction
		local _ = p7.isRedoEnabled
		local _ = p7.isUndoEnabled
		
		function t_2.renderLeft() --[[ line: 31 ]]
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
			
			local var7 = function() --[[ line: 88 ]]
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
			local var7 = function() --[[ line: 141 ]] end
		end
		t_2.renderRight = var7
		local titleText = p7.titleText
		
		function t_2.renderCenter() --[[ line: 53 ]]
			-- upvalues: withStyle (copy), reactModule (copy), titleText (ref)
			return withStyle(function(p8) --[[ line: 54 ]]
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
		
		t_1.Bar = createElement_1(headerBar, t_2)
		
		return createElement(var3, t, t_1)
	end,
	PortraitModeFooter = function(p9) --[[ line: 148 ]]
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
							props = { onActivated = p9.nextAction, text = p9.nextText }
						}
					}
				})
			})
		})
	end
}