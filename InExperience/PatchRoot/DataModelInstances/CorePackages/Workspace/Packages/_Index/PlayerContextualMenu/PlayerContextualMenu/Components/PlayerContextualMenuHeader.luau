local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useDesignTokens = require(parent.Style).useDesignTokens
local playerName = UIBloxModule.App.Indicator.PlayerName
local playerContext = UIBloxModule.App.Indicator.PlayerContext
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p0)
	-- upvalues: useDesignTokens (ref), reactModule (ref), button (ref), buttonType (ref), playerName (ref), playerContext (ref)
	local var2 = useDesignTokens(function(p1)
		return {
			contextTextSpacing = p1.Size.Size_150,
			joinEventSpacing = p1.Size.Size_300,
			padding = p1.Size.Size_400,
			joinEventButtonHeight = p1.Size.Size_1200
		}
	end)
	
	return reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: p0 (ref)
			p0.onHeaderHeightChanged(p2.AbsoluteSize.Y)
		end
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var2.padding),
			PaddingBottom = UDim.new(0, var2.padding),
			PaddingLeft = UDim.new(0, var2.padding),
			PaddingRight = UDim.new(0, var2.padding)
		}),
		PlayerName = reactModule.createElement(playerName, {
			layoutOrder = 1,
			automaticSize = Enum.AutomaticSize.XY,
			displayNameItem = p0.displayNameItem,
			userNameItem = p0.userNameItem,
			vendorNameItem = p0.vendorNameItem
		}),
		ContextTextSpacing = if p0.contextText then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var2.contextTextSpacing)
		}) else nil,
		PlayerContext = if p0.contextText then reactModule.createElement(playerContext, {
			layoutOrder = 3,
			Selectable = false,
			icon = p0.contextIcon,
			iconColor = p0.contextIconColor,
			iconTransparency = p0.contextIconTransparency,
			text = p0.contextText
		}) else nil,
		JoinButton = (function()
			-- upvalues: p0 (ref), reactModule (copy), var2 (ref), button (copy), buttonType (copy)
			return if p0.renderJoinEventButton or p0.joinEventText then reactModule.createElement("Frame", {
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
					Size = UDim2.new(1, 0, 0, var2.joinEventSpacing)
				}),
				JoinButton = if p0.renderJoinEventButton then p0.renderJoinEventButton() else reactModule.createElement(button, {
					isLoading = false,
					layoutOrder = 5,
					buttonType = buttonType.PrimaryContextual,
					onActivated = p0.joinEventOnActivated,
					size = UDim2.new(1, 0, 0, var2.joinEventButtonHeight),
					text = p0.joinEventText
				})
			}) else nil
		end)()
	})
end