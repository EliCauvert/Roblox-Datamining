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

local _ = function(p1)
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	return function()
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), p1 (ref)
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
			})
		})
	end
end

local _ = function(p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), foundationModule (ref), button (ref), buttonVariant (ref), inputSize (ref)
	return function()
		-- upvalues: reactModule (copy), foundationModule (copy), p3 (ref), p4 (ref), p5 (ref), p6 (ref), button (copy), buttonVariant (copy), inputSize (copy), p1 (ref), p2 (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			CoachmarkWrapper = reactModule.createElement(foundationModule.Coachmark, {
				title = p3,
				text = p4,
				isOpen = p5 or false,
				side = foundationModule.Enums.PopoverSide.Bottom,
				align = foundationModule.Enums.PopoverAlign.End,
				onClose = p6
			}, {
				NextButton = reactModule.createElement(button, {
					variant = buttonVariant.Emphasis,
					inputSize = inputSize.Large,
					onActivated = p1,
					text = p2,
					width = UDim.new(0, 144)
				})
			})
		})
	end
end

return function(p1)
	-- upvalues: reactModule (ref), headerBar (ref), iconButton (ref), iconSize (ref), images (ref), foundationModule (ref), button (ref), buttonVariant (ref), inputSize (ref), withStyle (ref)
	local createElement = reactModule.createElement
	local var1 = "Frame"
	local t = {
		BorderSizePixel = 0,
		BackgroundTransparency = 0.1,
		LayoutOrder = 1,
		ZIndex = 2,
		BackgroundColor3 = Color3.fromHex("#000000"),
		Size = UDim2.new(1, 0, 0, 71)
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = { backgroundTransparency = 1, barHeight = 72 }
	local backAction = p1.backAction
	
	function t_2.renderLeft()
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), backAction (ref)
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
			})
		})
	end
	
	local nextAction = p1.nextAction
	local nextText = p1.nextText
	local coachmarkTitle = p1.coachmarkTitle
	local coachmarkText = p1.coachmarkText
	local isCoachmarkOpen = p1.isCoachmarkOpen
	local onCoachmarkClose = p1.onCoachmarkClose
	
	function t_2.renderRight()
		-- upvalues: reactModule (copy), foundationModule (copy), coachmarkTitle (ref), coachmarkText (ref), isCoachmarkOpen (ref), onCoachmarkClose (ref), button (copy), buttonVariant (copy), inputSize (copy), nextAction (ref), nextText (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			CoachmarkWrapper = reactModule.createElement(foundationModule.Coachmark, {
				title = coachmarkTitle,
				text = coachmarkText,
				isOpen = isCoachmarkOpen or false,
				side = foundationModule.Enums.PopoverSide.Bottom,
				align = foundationModule.Enums.PopoverAlign.End,
				onClose = onCoachmarkClose
			}, {
				NextButton = reactModule.createElement(button, {
					variant = buttonVariant.Emphasis,
					inputSize = inputSize.Large,
					onActivated = nextAction,
					text = nextText,
					width = UDim.new(0, 144)
				})
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