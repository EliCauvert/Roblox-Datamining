local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local LoadingAvatarModule = require(script.Parent.LoadingAvatar)
local TextPlaceholdersModule = require(script.Parent.TextPlaceholders)
local ChatLoadingIndicator = RoactModule.PureComponent:extend("ChatLoadingIndicator")
ChatLoadingIndicator.defaultProps = { cellHeight = 64, avatarCellWidth = 60 }

function ChatLoadingIndicator.init(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), LoadingAvatarModule (copy), TextPlaceholdersModule (copy)
	function p1.singleConversationPlaceholder(LayoutOrder, p2)
		-- upvalues: WithStyleFunction (upval), RoactModule (upval), p1 (copy), LoadingAvatarModule (upval), TextPlaceholdersModule (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: RoactModule (upval), LayoutOrder (copy), p1 (upval), LoadingAvatarModule (upval), TextPlaceholdersModule (upval), p2 (copy)
			return RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(1, 0, 0, p1.props.cellHeight),
				BackgroundTransparency = p3.Tokens.Color.None.Transparency,
				BackgroundColor3 = p3.Theme.BackgroundDefault.Color
			}, {
				UIList = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 0),
					PaddingTop = UDim.new(0, 4)
				}),
				Content = RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, -1)
				}, {
					UIList = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal
					}),
					avatar = RoactModule.createElement(LoadingAvatarModule, {
						LayoutOrder = 1,
						avatarImage = p1.props.avatarImage,
						cellWidth = p1.props.avatarCellWidth,
						cellHeight = p1.props.cellHeight
					}),
					textPlaceholders = RoactModule.createElement(TextPlaceholdersModule, {
						LayoutOrder = 2,
						avatarCellWidth = p1.props.avatarCellWidth
					})
				}),
				bottomLineContainer = not p2 and RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					ZIndex = 2,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 0, 1)
				}, {
					Padding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, p1.props.avatarCellWidth) }),
					bottomLine = RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundColor3 = p3.Theme.Divider.Color,
						Transparency = p3.Theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 1, 0)
					})
				})
			})
		end)
	end
	
	function p1.allConversationPlaceholdersList()
		-- upvalues: RoactModule (upval), p1 (copy)
		local List = {
			UIList = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			})
		}
		table.insert(List, p1.singleConversationPlaceholder(1, false))
		table.insert(List, p1.singleConversationPlaceholder(2, false))
		table.insert(List, p1.singleConversationPlaceholder(3, true))
		
		return List
	end
end

function ChatLoadingIndicator.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy)
	local PageBackgroundTransparency = p1.props.pageBackgroundTransparency
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), PageBackgroundTransparency (copy), p1 (copy)
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = if PageBackgroundTransparency == nil then p2.Tokens.Color.None.Transparency else PageBackgroundTransparency
		}, p1.allConversationPlaceholdersList())
	end)
end

return ChatLoadingIndicator