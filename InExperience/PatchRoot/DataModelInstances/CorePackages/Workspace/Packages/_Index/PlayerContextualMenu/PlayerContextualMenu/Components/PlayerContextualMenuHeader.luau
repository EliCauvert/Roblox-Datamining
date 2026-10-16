local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local PlayerName = UIBloxModule.App.Indicator.PlayerName
local PlayerContext = UIBloxModule.App.Indicator.PlayerContext
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1) --[[ Line: 40 ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), Button (copy), ButtonType (copy), PlayerName (copy), PlayerContext (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(function(p2) --[[ Line: 41 ]]
		return {
			contextTextSpacing = p2.Size.Size_150,
			joinEventSpacing = p2.Size.Size_300,
			padding = p2.Size.Size_400,
			joinEventButtonHeight = p2.Size.Size_1200
		}
	end)
	
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		[ReactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 88 ]]
			-- upvalues: p1 (copy)
			p1.onHeaderHeightChanged(Frame.AbsoluteSize.Y)
		end
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.padding),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.padding),
			PaddingLeft = UDim.new(0, UseDesignTokensResult.padding),
			PaddingRight = UDim.new(0, UseDesignTokensResult.padding)
		}),
		PlayerName = ReactModule.createElement(PlayerName, {
			layoutOrder = 1,
			automaticSize = Enum.AutomaticSize.XY,
			displayNameItem = p1.displayNameItem,
			userNameItem = p1.userNameItem,
			vendorNameItem = p1.vendorNameItem
		}),
		ContextTextSpacing = if p1.contextText then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, UseDesignTokensResult.contextTextSpacing)
		}) else nil,
		PlayerContext = if p1.contextText then ReactModule.createElement(PlayerContext, {
			layoutOrder = 3,
			Selectable = false,
			icon = p1.contextIcon,
			iconColor = p1.contextIconColor,
			iconTransparency = p1.contextIconTransparency,
			text = p1.contextText
		}) else nil,
		JoinButton = (function() --[[ Line: 50 ]]
			-- upvalues: p1 (copy), ReactModule (upval), UseDesignTokensResult (copy), Button (upval), ButtonType (upval)
			return if p1.renderJoinEventButton or p1.joinEventText then ReactModule.createElement("Frame", {
				LayoutOrder = 5,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				JoinEventSpacing = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.joinEventSpacing)
				}),
				JoinButton = if p1.renderJoinEventButton then p1.renderJoinEventButton() else ReactModule.createElement(Button, {
					isLoading = false,
					layoutOrder = 5,
					buttonType = ButtonType.PrimaryContextual,
					onActivated = p1.joinEventOnActivated,
					size = UDim2.new(1, 0, 0, UseDesignTokensResult.joinEventButtonHeight),
					text = p1.joinEventText
				})
			}) else nil
		end)()
	})
end