local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local Colors = require(Parent.Style).Colors
local ReactionMapModule = require(script.Parent.ReactionMap)
local ReactionListModule = require(script.Parent.ReactionList)
local DetailListModule = require(script.Parent.DetailList)
local White = Colors.White
local Flint = Colors.Flint
local ArialBold = Enum.Font.ArialBold

local function Navigator(Frame)
	-- upvalues: ReactionListModule (copy), ReactModule (copy), CryoModule (copy), RoactModule (copy), Flint (copy), ReactionMapModule (copy), ArialBold (copy), White (copy)
	local t = {}
	local Total = 0
	local Count = 1
	
	for i, value in Frame.reactionData do
		Total += #value
	end
	for i in ReactionListModule do
		if Frame.reactionData[ReactionListModule[i]] ~= nil then
			t[Count] = ReactionListModule[i]
			Count += 1
		end
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 80),
		LayoutOrder = Frame.LayoutOrder
	}, {
		verticalLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
	}, {
		header = RoactModule.createElement("TextLabel", {
			Text = "Reactions",
			TextSize = 20,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			TextColor3 = White,
			Font = ArialBold,
			Size = UDim2.fromScale(1, 0.5)
		}),
		scroller = RoactModule.createElement("ScrollingFrame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0.5),
			CanvasSize = UDim2.new(0, (#t + 1) * 54 + 10, 0, 0)
		}, {
			horizontalLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}, {
			padding = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, 5, 0, 5)
			}),
			allFilter = RoactModule.createElement("TextButton", {
				Size = UDim2.new(0, 54, 0, 28),
				BackgroundColor3 = Flint,
				BorderSizePixel = 0,
				Text = "All  " .. Total,
				Font = ArialBold,
				TextColor3 = White,
				TextSize = 15,
				TextWrapped = true,
				LayoutOrder = 2,
				[ReactModule.Event.Activated] = function()
					-- upvalues: Frame (copy)
					Frame.setEmoji("All")
				end
			}, {
				corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.4, 0) })
			})
		}, (ReactModule.useMemo(function()
			-- upvalues: CryoModule (upval), t (copy), RoactModule (upval), Flint (upval), ReactModule (upval), Frame (copy), ReactionMapModule (upval), ArialBold (upval), White (upval)
			return CryoModule.List.map(t, function(Text, p1: number)
				-- upvalues: RoactModule (upval), Flint (upval), ReactModule (upval), Frame (upval), ReactionMapModule (upval), ArialBold (upval), White (upval)
				return RoactModule.createElement("TextButton", {
					Size = UDim2.new(0, 54, 0, 28),
					BackgroundColor3 = Flint,
					BorderSizePixel = 0,
					Text = "",
					LayoutOrder = p1 + 2,
					[ReactModule.Event.Activated] = function()
						-- upvalues: Frame (upval), Text (copy)
						Frame.setEmoji(Text)
					end
				}, {
					corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.4, 0) }),
					emoji = RoactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 18, 0, 18),
						Position = UDim2.new(0.16, 0, 0.5, -9),
						Image = ReactionMapModule[Text]
					}),
					count = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextSize = 15,
						TextWrapped = true,
						Size = UDim2.new(0.5, 0, 1, 0),
						Position = UDim2.new(0.5, 0, 0, 0),
						Name = Text .. "Filter",
						Text = #Frame.reactionData[Text],
						Font = ArialBold,
						TextColor3 = White
					})
				})
			end)
		end, { t })))
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), RoactModule (copy), Flint (copy), Navigator (copy), Colors (copy), DetailListModule (copy)
	local All, All2 = ReactModule.useState("All")
	
	return {
		ReactionDetail = RoactModule.createElement("Frame", {
			Size = UDim2.new(0, 300, 0, 375),
			BackgroundColor3 = Flint
		}, {
			corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.05, 0) }),
			layout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
		}, {
			navigator = RoactModule.createElement(Navigator, {
				LayoutOrder = 1,
				setEmoji = All2,
				reactionData = p1.reactionData
			}),
			bar = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.fromScale(1, 0)
			}, {
				RoactModule.createElement("Frame", {
					Size = UDim2.new(0.97, 0, 0, 0),
					BackgroundColor3 = Colors.White,
					BorderColor3 = Colors.White,
					Position = UDim2.new(0.015, 0, 0, 0)
				})
			}),
			padding = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 10)
			}),
			detailList = RoactModule.createElement(DetailListModule, {
				LayoutOrder = 4,
				emoji = All,
				reactionData = p1.reactionData
			})
		})
	}
end