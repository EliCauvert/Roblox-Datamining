local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local colors = require(parent.Style).Colors
local reactionMapModule = require(script.Parent.ReactionMap)
local reactionListModule = require(script.Parent.ReactionList)
local detailListModule = require(script.Parent.DetailList)
local white = colors.White
local flint = colors.Flint
local arialBold = Enum.Font.ArialBold

local function Navigator(p1)
	-- upvalues: reactionListModule (ref), reactModule (ref), cryoModule (ref), roactModule (ref), flint (ref), reactionMapModule (ref), arialBold (ref), white (ref)
	local t = {}
	local var1 = 0
	local var2 = 1
	
	for i, v in p1.reactionData do
		var1 += #v
	end
	for i_1 in reactionListModule do
		if p1.reactionData[reactionListModule[i_1]] ~= nil then
			t[var2] = reactionListModule[i_1]
			var2 += 1
		end
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 80),
		LayoutOrder = p1.LayoutOrder
	}, {
		verticalLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
	}, {
		header = roactModule.createElement("TextLabel", {
			Text = "Reactions",
			TextSize = 20,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			TextColor3 = white,
			Font = arialBold,
			Size = UDim2.fromScale(1, 0.5)
		}),
		scroller = roactModule.createElement("ScrollingFrame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0.5),
			CanvasSize = UDim2.new(0, (#t + 1) * 54 + 10, 0, 0)
		}, {
			horizontalLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}, {
			padding = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, 5, 0, 5)
			}),
			allFilter = roactModule.createElement("TextButton", {
				Size = UDim2.new(0, 54, 0, 28),
				BackgroundColor3 = flint,
				BorderSizePixel = 0,
				Text = "All  " .. var8,
				Font = arialBold,
				TextColor3 = white,
				TextSize = 15,
				TextWrapped = true,
				LayoutOrder = 2,
				[reactModule.Event.Activated] = function()
					-- upvalues: p1 (ref)
					p1.setEmoji("All")
				end
			}, {
				corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.4, 0) })
			})
		}, reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), t (ref), roactModule (copy), flint (copy), reactModule (copy), p1 (ref), reactionMapModule (copy), arialBold (copy), white (copy)
			return cryoModule.List.map(t, function(p2, p3)
				-- upvalues: roactModule (copy), flint (copy), reactModule (copy), p1 (copy), reactionMapModule (copy), arialBold (copy), white (copy)
				return roactModule.createElement("TextButton", {
					Size = UDim2.new(0, 54, 0, 28),
					BackgroundColor3 = flint,
					BorderSizePixel = 0,
					Text = "",
					LayoutOrder = p3 + 2,
					[reactModule.Event.Activated] = function()
						-- upvalues: p1 (copy), p2 (ref)
						p1.setEmoji(p2)
					end
				}, {
					corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.4, 0) }),
					emoji = roactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 18, 0, 18),
						Position = UDim2.new(0.16, 0, 0.5, -9),
						Image = reactionMapModule[p2]
					}),
					count = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextSize = 15,
						TextWrapped = true,
						Size = UDim2.new(0.5, 0, 1, 0),
						Position = UDim2.new(0.5, 0, 0, 0),
						Name = p2 .. "Filter",
						Text = #p1.reactionData[p2],
						Font = arialBold,
						TextColor3 = white
					})
				})
			end)
		end, { t }))
	})
end

return function(p2)
	-- upvalues: reactModule (ref), roactModule (ref), flint (ref), Navigator (ref), colors (ref), detailListModule (ref)
	local all, all_1 = reactModule.useState("All")
	
	return {
		ReactionDetail = roactModule.createElement("Frame", {
			Size = UDim2.new(0, 300, 0, 375),
			BackgroundColor3 = flint
		}, {
			corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.05, 0) }),
			layout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
		}, {
			navigator = roactModule.createElement(Navigator, {
				LayoutOrder = 1,
				setEmoji = all_1,
				reactionData = p2.reactionData
			}),
			bar = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.fromScale(1, 0)
			}, {
				roactModule.createElement("Frame", {
					Size = UDim2.new(0.97, 0, 0, 0),
					BackgroundColor3 = colors.White,
					BorderColor3 = colors.White,
					Position = UDim2.new(0.015, 0, 0, 0)
				})
			}),
			padding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 10)
			}),
			detailList = roactModule.createElement(detailListModule, {
				LayoutOrder = 4,
				emoji = all,
				reactionData = p2.reactionData
			})
		})
	}
end