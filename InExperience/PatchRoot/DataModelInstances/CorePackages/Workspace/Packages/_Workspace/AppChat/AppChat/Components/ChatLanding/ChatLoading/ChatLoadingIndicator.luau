local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local withStyle = require(parent.UIBlox).Style.withStyle
local loadingAvatarModule = require(script.Parent.LoadingAvatar)
local textPlaceholdersModule = require(script.Parent.TextPlaceholders)
local chatLoadingIndicator = roactModule.PureComponent:extend("ChatLoadingIndicator")
chatLoadingIndicator.defaultProps = { cellHeight = 64, avatarCellWidth = 60 }

function chatLoadingIndicator.init(p1)
	-- upvalues: withStyle (ref), roactModule (ref), loadingAvatarModule (ref), textPlaceholdersModule (ref)
	function p0.singleConversationPlaceholder(p2, p3)
		-- upvalues: withStyle (copy), roactModule (copy), p1 (ref), loadingAvatarModule (copy), textPlaceholdersModule (copy)
		return withStyle(function(p4)
			-- upvalues: roactModule (copy), p2 (ref), p1 (copy), loadingAvatarModule (copy), textPlaceholdersModule (copy), p3 (ref)
			return roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = p2,
				Size = UDim2.new(1, 0, 0, p1.props.cellHeight),
				BackgroundTransparency = p4.Tokens.Color.None.Transparency,
				BackgroundColor3 = p4.Theme.BackgroundDefault.Color
			}, {
				UIList = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 0),
					PaddingTop = UDim.new(0, 4)
				}),
				Content = roactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, -1)
				}, {
					UIList = roactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal
					}),
					avatar = roactModule.createElement(loadingAvatarModule, {
						LayoutOrder = 1,
						avatarImage = p1.props.avatarImage,
						cellWidth = p1.props.avatarCellWidth,
						cellHeight = p1.props.cellHeight
					}),
					textPlaceholders = roactModule.createElement(textPlaceholdersModule, {
						LayoutOrder = 2,
						avatarCellWidth = p1.props.avatarCellWidth
					})
				}),
				bottomLineContainer = not p3 and roactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					ZIndex = 2,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 0, 1)
				}, {
					Padding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, p1.props.avatarCellWidth) }),
					bottomLine = roactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundColor3 = p4.Theme.Divider.Color,
						Transparency = p4.Theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 1, 0)
					})
				})
			})
		end)
	end
	
	function p0.allConversationPlaceholdersList()
		-- upvalues: roactModule (copy), p1 (ref)
		local t = {
			UIList = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			})
		}
		table.insert(t, p1.singleConversationPlaceholder(1, false))
		table.insert(t, p1.singleConversationPlaceholder(2, false))
		table.insert(t, p1.singleConversationPlaceholder(3, true))
		
		return t
	end
end

function chatLoadingIndicator.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref)
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), p1 (ref)
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p2.Tokens.Color.None.Transparency
		}, p1.allConversationPlaceholdersList())
	end)
end

return chatLoadingIndicator