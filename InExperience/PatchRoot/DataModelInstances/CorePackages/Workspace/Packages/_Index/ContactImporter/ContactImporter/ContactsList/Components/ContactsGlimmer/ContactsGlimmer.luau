local DependenciesModule = require(script:FindFirstAncestor("ContactImporter").dependencies)
local Roact = DependenciesModule.Roact
local Skeleton = DependenciesModule.Foundation.Skeleton
local WithStyleFunction = DependenciesModule.UIBlox.Style.withStyle
local ContactsGlimmer = Roact.PureComponent:extend("ContactsGlimmer")

function ContactsGlimmer.render(p1) --[[ Line: 25 ]]
	-- upvalues: WithStyleFunction (copy), Roact (copy), Skeleton (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(p2) --[[ Line: 28 ]]
		-- upvalues: Roact (upval), Props (copy), p1 (copy), Skeleton (upval)
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = Props.layoutOrder,
			Size = UDim2.new(1, 0, 0, 72)
		}, {
			entryContent = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				Layout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				middleGroup = Roact.createElement("Frame", {
					Size = UDim2.new(1, -68, 1, 0),
					BackgroundTransparency = 1,
					[Roact.Event.Activated] = p1.openBlankProfileView,
					LayoutOrder = 2,
					BackgroundColor3 = Color3.fromRGB(222, 22, 222)
				}, {
					Layout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 10)
					}),
					Padding = Roact.createElement("UIPadding", { PaddingLeft = UDim.new(0, 12) }),
					PlayerName = Roact.createElement(Skeleton, { LayoutOrder = 1, Size = UDim2.fromOffset(90, 14) }),
					ContextualInfo = Roact.createElement(Skeleton, { LayoutOrder = 2, Size = UDim2.fromOffset(160, 14) })
				})
			}),
			Divider = Roact.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = p2.Theme.Divider.Color,
				BackgroundTransparency = p2.Theme.Divider.Transparency
			})
		})
	end)
end

return ContactsGlimmer