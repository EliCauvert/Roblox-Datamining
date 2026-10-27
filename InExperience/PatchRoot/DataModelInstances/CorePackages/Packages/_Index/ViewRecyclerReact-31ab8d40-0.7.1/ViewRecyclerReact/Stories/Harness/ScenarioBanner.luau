local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(ViewRecyclerReact ~= nil, "ScenarioBanner must be mounted under view-recycler-react")
local CreateElementFunction = require(ViewRecyclerReact.Parent.React).createElement

return function(p1)
	-- upvalues: CreateElementFunction (copy)
	return CreateElementFunction("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(31, 33, 43),
		Size = UDim2.new(1, 0, 0, p1.height or 140)
	}, {
		Title = CreateElementFunction("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 19,
			Font = Enum.Font.BuilderSansBold,
			Position = UDim2.fromOffset(12, 8),
			Size = UDim2.new(1, -24, 0, 24),
			Text = p1.title,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Instructions = CreateElementFunction("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 14,
			TextWrapped = true,
			Font = Enum.Font.BuilderSans,
			Position = UDim2.fromOffset(12, 34),
			Size = UDim2.new(1, -24, 0, 36),
			Text = `Instructions: {p1.instructions}`,
			TextColor3 = Color3.fromRGB(215, 216, 224),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}),
		ItemUpdate = CreateElementFunction("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 13,
			Font = Enum.Font.BuilderSans,
			Position = UDim2.fromOffset(12, 72),
			Size = UDim2.new(1, -24, 0, 20),
			Text = `Item updates: {p1.itemUpdate}`,
			TextColor3 = Color3.fromRGB(174, 197, 255),
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		AcceptanceCriteria = CreateElementFunction("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 14,
			TextWrapped = true,
			Font = Enum.Font.BuilderSans,
			Position = UDim2.fromOffset(12, 96),
			Size = UDim2.new(1, -24, 0, 36),
			Text = `Acceptance: {p1.acceptanceCriteria}`,
			TextColor3 = Color3.fromRGB(153, 223, 176),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		})
	})
end