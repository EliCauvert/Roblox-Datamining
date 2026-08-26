local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useDesignTokens = require(parent.Style).useDesignTokens
local playerName = UIBloxModule.App.Indicator.PlayerName
local playerContext = UIBloxModule.App.Indicator.PlayerContext
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), button (ref), buttonType (ref), playerName (ref), playerContext (ref)
	local var1 = useDesignTokens(function(p2)
		return {
			contextTextSpacing = p2.Size.Size_150,
			joinEventSpacing = p2.Size.Size_300,
			padding = p2.Size.Size_400,
			joinEventButtonHeight = p2.Size.Size_1200
		}
	end)
	
	return reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: p1 (ref)
			p1.onHeaderHeightChanged(p2.AbsoluteSize.Y)
		end
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var1.padding),
			PaddingBottom = UDim.new(0, var1.padding),
			PaddingLeft = UDim.new(0, var1.padding),
			PaddingRight = UDim.new(0, var1.padding)
		}),
		PlayerName = reactModule.createElement(playerName, {
			layoutOrder = 1,
			automaticSize = Enum.AutomaticSize.XY,
			displayNameItem = p1.displayNameItem,
			userNameItem = p1.userNameItem,
			vendorNameItem = p1.vendorNameItem
		}),
		ContextTextSpacing = if p1.contextText then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var1.contextTextSpacing)
		}) else nil,
		PlayerContext = if p1.contextText then reactModule.createElement(playerContext, {
			layoutOrder = 3,
			Selectable = false,
			icon = p1.contextIcon,
			iconColor = p1.contextIconColor,
			iconTransparency = p1.contextIconTransparency,
			text = p1.contextText
		}) else nil,
		JoinButton = (function()
			-- upvalues: p1 (ref), reactModule (copy), var1 (ref), button (copy), buttonType (copy)
			return if p1.renderJoinEventButton or p1.joinEventText then reactModule.createElement("Frame", {
				LayoutOrder = 5,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				JoinEventSpacing = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var1.joinEventSpacing)
				}),
				JoinButton = if p1.renderJoinEventButton then p1.renderJoinEventButton() else reactModule.createElement(button, {
					isLoading = false,
					layoutOrder = 5,
					buttonType = buttonType.PrimaryContextual,
					onActivated = p1.joinEventOnActivated,
					size = UDim2.new(1, 0, 0, var1.joinEventButtonHeight),
					text = p1.joinEventText
				})
			}) else nil
		end)()
	})
end