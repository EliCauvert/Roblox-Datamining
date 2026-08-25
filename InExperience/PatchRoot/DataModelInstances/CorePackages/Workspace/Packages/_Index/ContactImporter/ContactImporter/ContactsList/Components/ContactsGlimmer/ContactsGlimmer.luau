local dependenciesModule = require(script:FindFirstAncestor("ContactImporter").dependencies)
local roact = dependenciesModule.Roact
local skeleton = dependenciesModule.Foundation.Skeleton
local withStyle = dependenciesModule.UIBlox.Style.withStyle
local contactsGlimmer = roact.PureComponent:extend("ContactsGlimmer")

function contactsGlimmer.render(p0)
	-- upvalues: withStyle (ref), roact (ref), skeleton (ref)
	local props = p0.props
	
	return withStyle(function(p1)
		-- upvalues: roact (copy), props (ref), p0 (ref), skeleton (copy)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = props.layoutOrder,
			Size = UDim2.new(1, 0, 0, 72)
		}, {
			entryContent = roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				Layout = roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				middleGroup = roact.createElement("Frame", {
					Size = UDim2.new(1, -68, 1, 0),
					BackgroundTransparency = 1,
					[roact.Event.Activated] = p0.openBlankProfileView,
					LayoutOrder = 2,
					BackgroundColor3 = Color3.fromRGB(222, 22, 222)
				}, {
					Layout = roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 10)
					}),
					Padding = roact.createElement("UIPadding", { PaddingLeft = UDim.new(0, 12) }),
					PlayerName = roact.createElement(skeleton, { LayoutOrder = 1, Size = UDim2.fromOffset(90, 14) }),
					ContextualInfo = roact.createElement(skeleton, { LayoutOrder = 2, Size = UDim2.fromOffset(160, 14) })
				})
			}),
			Divider = roact.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = p1.Theme.Divider.Color,
				BackgroundTransparency = p1.Theme.Divider.Transparency
			})
		})
	end)
end

return contactsGlimmer