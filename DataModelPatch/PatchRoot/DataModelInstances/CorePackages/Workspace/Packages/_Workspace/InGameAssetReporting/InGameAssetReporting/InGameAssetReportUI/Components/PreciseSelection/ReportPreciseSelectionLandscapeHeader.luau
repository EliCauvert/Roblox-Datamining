local Parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Style.withStyle

local function _(Text)
	-- upvalues: WithStyleFunction (copy), ReactModule (copy)
	return function()
		-- upvalues: WithStyleFunction (upval), ReactModule (upval), Text (copy)
		return WithStyleFunction(function(p1)
			-- upvalues: ReactModule (upval), Text (upval)
			local Theme = p1.Theme
			
			return ReactModule.createElement("TextLabel", {
				TextSize = 20,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = Text,
				Font = p1.Font.Header2.Font,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		end)
	end
end

local _ = function(OnActivated)
	-- upvalues: ReactModule (copy), IconButton (copy), IconSize (copy), Images (copy)
	return function()
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), OnActivated (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 120, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			BackButton = ReactModule.createElement(IconButton, {
				layoutOrder = 1,
				iconSize = IconSize.Medium,
				icon = Images["icons/navigation/pushBack"],
				onActivated = OnActivated
			})
		})
	end
end

local _ = function(OnActivated, Text, Title, Text1, p1, OnClose)
	-- upvalues: ReactModule (copy), FoundationModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	return function()
		-- upvalues: ReactModule (upval), FoundationModule (upval), Title (copy), Text1 (copy), p1 (copy), OnClose (copy), Button (upval), ButtonVariant (upval), InputSize (upval), OnActivated (copy), Text (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			CoachmarkWrapper = ReactModule.createElement(FoundationModule.Coachmark, {
				title = Title,
				text = Text1,
				isOpen = p1 or false,
				side = FoundationModule.Enums.PopoverSide.Bottom,
				align = FoundationModule.Enums.PopoverAlign.End,
				onClose = OnClose
			}, {
				NextButton = ReactModule.createElement(Button, {
					variant = ButtonVariant.Emphasis,
					inputSize = InputSize.Large,
					onActivated = OnActivated,
					text = Text,
					width = UDim.new(0, 144)
				})
			})
		})
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), HeaderBar (copy), IconButton (copy), IconSize (copy), Images (copy), FoundationModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy), WithStyleFunction (copy)
	local BackAction = p1.backAction
	
	local function RenderLeft()
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), BackAction (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 120, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			BackButton = ReactModule.createElement(IconButton, {
				layoutOrder = 1,
				iconSize = IconSize.Medium,
				icon = Images["icons/navigation/pushBack"],
				onActivated = BackAction
			})
		})
	end
	
	local NextAction = p1.nextAction
	local NextText = p1.nextText
	local CoachmarkTitle = p1.coachmarkTitle
	local CoachmarkText = p1.coachmarkText
	local IsCoachmarkOpen = p1.isCoachmarkOpen
	local OnCoachmarkClose = p1.onCoachmarkClose
	
	local function RenderRight()
		-- upvalues: ReactModule (upval), FoundationModule (upval), CoachmarkTitle (copy), CoachmarkText (copy), IsCoachmarkOpen (copy), OnCoachmarkClose (copy), Button (upval), ButtonVariant (upval), InputSize (upval), NextAction (copy), NextText (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			CoachmarkWrapper = ReactModule.createElement(FoundationModule.Coachmark, {
				title = CoachmarkTitle,
				text = CoachmarkText,
				isOpen = IsCoachmarkOpen or false,
				side = FoundationModule.Enums.PopoverSide.Bottom,
				align = FoundationModule.Enums.PopoverAlign.End,
				onClose = OnCoachmarkClose
			}, {
				NextButton = ReactModule.createElement(Button, {
					variant = ButtonVariant.Emphasis,
					inputSize = InputSize.Large,
					onActivated = NextAction,
					text = NextText,
					width = UDim.new(0, 144)
				})
			})
		})
	end
	
	local TitleText = p1.titleText
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 0.1,
		LayoutOrder = 1,
		ZIndex = 2,
		BackgroundColor3 = Color3.fromHex("#000000"),
		Size = UDim2.new(1, 0, 0, 71)
	}, {
		Bar = ReactModule.createElement(HeaderBar, {
			backgroundTransparency = 1,
			barHeight = 72,
			renderLeft = RenderLeft,
			renderRight = RenderRight,
			renderCenter = function()
				-- upvalues: WithStyleFunction (upval), ReactModule (upval), TitleText (copy)
				return WithStyleFunction(function(p2)
					-- upvalues: ReactModule (upval), TitleText (upval)
					local Theme = p2.Theme
					
					return ReactModule.createElement("TextLabel", {
						TextSize = 20,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Text = TitleText,
						Font = p2.Font.Header2.Font,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center,
						Size = UDim2.new(1, 0, 1, 0)
					})
				end)
			end
		})
	})
end