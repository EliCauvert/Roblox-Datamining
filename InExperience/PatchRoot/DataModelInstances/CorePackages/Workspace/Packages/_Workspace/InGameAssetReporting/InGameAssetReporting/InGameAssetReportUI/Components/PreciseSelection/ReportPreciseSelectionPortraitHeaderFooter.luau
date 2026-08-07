local parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local withStyle = UIBloxModule.Style.withStyle

local function _(p0) --[[ line: 36 | named "renderHeaderBarLeft" ]]
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	return function() --[[ line: 37 ]]
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

local _ = function(p1) --[[ line: 58 | named "renderHeaderBarCenter" ]]
	-- upvalues: withStyle (ref), reactModule (ref)
	return function() --[[ line: 59 ]]
		-- upvalues: withStyle (copy), reactModule (copy), p1 (ref)
		return withStyle(function(p2) --[[ line: 60 ]]
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

local _ = function() --[[ line: 87 | named "renderHeaderBarRight" ]]
	-- upvalues: reactModule (ref)
	return function() --[[ line: 88 ]]
		-- upvalues: reactModule (copy)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 60, 1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		})
	end
end

return {
	PortraitModeHeader = function(p3) --[[ line: 103 ]]
		-- upvalues: reactModule (ref), headerBar (ref), iconButton (ref), iconSize (ref), images (ref), withStyle (ref)
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
		local backAction = p3.backAction
		
		function t_2.renderLeft() --[[ line: 37 ]]
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
		
		function t_2.renderRight() --[[ line: 88 ]]
			-- upvalues: reactModule (copy)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 60, 1, 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				})
			})
		end
		
		local titleText = p3.titleText
		
		function t_2.renderCenter() --[[ line: 59 ]]
			-- upvalues: withStyle (copy), reactModule (copy), titleText (ref)
			return withStyle(function(p4) --[[ line: 60 ]]
				-- upvalues: reactModule (copy), titleText (copy)
				local currentCamera = game.Workspace.CurrentCamera
				local theme = p4.Theme
				
				return reactModule.createElement("TextLabel", {
					TextSize = 20,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Text = titleText,
					Font = p4.Font.Header2.Font,
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
	PortraitModeFooter = function(p5) --[[ line: 124 ]]
		-- upvalues: reactModule (ref), foundationModule (ref), button (ref), buttonVariant (ref), inputSize (ref)
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
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			CoachmarkWrapper = reactModule.createElement(foundationModule.Coachmark, {
				title = p5.coachmarkTitle,
				text = p5.coachmarkText,
				isOpen = p5.isCoachmarkOpen or false,
				side = foundationModule.Enums.PopoverSide.Top,
				align = foundationModule.Enums.PopoverAlign.Center,
				onClose = p5.onCoachmarkClose
			}, {
				NextButton = reactModule.createElement(button, {
					variant = buttonVariant.Emphasis,
					inputSize = inputSize.Large,
					width = UDim.new(0, 400),
					onActivated = p5.nextAction,
					text = p5.nextText
				})
			})
		})
	end
}