local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local withStyle = require(parent.UIBlox).Style.withStyle
local loadingAvatarModule = require(script.Parent.LoadingAvatar)
local textPlaceholdersModule = require(script.Parent.TextPlaceholders)
local chatLoadingIndicator = roactModule.PureComponent:extend("ChatLoadingIndicator")
chatLoadingIndicator.defaultProps = { cellHeight = 64, avatarCellWidth = 60 }

function chatLoadingIndicator.init(p0) --[[ line: 19 ]]
	-- upvalues: withStyle (ref), roactModule (ref), loadingAvatarModule (ref), textPlaceholdersModule (ref)
	function p0.singleConversationPlaceholder(p1, p2) --[[ line: 20 ]]
		-- upvalues: withStyle (copy), roactModule (copy), p0 (ref), loadingAvatarModule (copy), textPlaceholdersModule (copy)
		return withStyle(function(p3) --[[ line: 21 ]]
			-- upvalues: roactModule (copy), p1 (ref), p0 (copy), loadingAvatarModule (copy), textPlaceholdersModule (copy), p2 (ref)
			return roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = p1,
				Size = UDim2.new(1, 0, 0, p0.props.cellHeight),
				BackgroundTransparency = p3.Tokens.Color.None.Transparency,
				BackgroundColor3 = p3.Theme.BackgroundDefault.Color
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
						avatarImage = p0.props.avatarImage,
						cellWidth = p0.props.avatarCellWidth,
						cellHeight = p0.props.cellHeight
					}),
					textPlaceholders = roactModule.createElement(textPlaceholdersModule, {
						LayoutOrder = 2,
						avatarCellWidth = p0.props.avatarCellWidth
					})
				}),
				bottomLineContainer = not p2 and roactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					ZIndex = 2,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 0, 1)
				}, {
					Padding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, p0.props.avatarCellWidth) }),
					bottomLine = roactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundColor3 = p3.Theme.Divider.Color,
						Transparency = p3.Theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 1, 0)
					})
				})
			})
		end)
	end
	
	function p0.allConversationPlaceholdersList() --[[ line: 78 ]]
		-- upvalues: roactModule (copy), p0 (ref)
		local t = {
			UIList = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			})
		}
		table.insert(t, p0.singleConversationPlaceholder(1, false))
		table.insert(t, p0.singleConversationPlaceholder(2, false))
		table.insert(t, p0.singleConversationPlaceholder(3, true))
		
		return t
	end
end

function chatLoadingIndicator.render(p4) --[[ line: 92 ]]
	-- upvalues: withStyle (ref), roactModule (ref)
	return withStyle(function(p5) --[[ line: 93 ]]
		-- upvalues: roactModule (copy), p4 (ref)
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p5.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p5.Tokens.Color.None.Transparency
		}, p4.allConversationPlaceholdersList())
	end)
end

return chatLoadingIndicator