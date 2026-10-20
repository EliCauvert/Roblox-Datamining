local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local IconWithTextCellModule = require(AppChat.Components.Cells.IconWithTextCell)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local config = {
	groupNameText = "groupName",
	iconImage = nil,
	onActivated = nil,
	LayoutOrder = 1,
	iconCellWidth = 60,
	isDisabled = false,
	cellHeight = 36,
	style = nil,
	paddingBottom = 12
}

function GroupNameEntryCell(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), IconWithTextCellModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Size300 = if JoinResult.isDisabled then JoinResult.style.Tokens.Size.Size_300 else 0
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = JoinResult.LayoutOrder,
		Size = UDim2.fromScale(1, 0)
	}, {
		padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Size300),
			PaddingBottom = UDim.new(0, JoinResult.paddingBottom)
		})
	}, {
		IconWithText = ReactModule.createElement(IconWithTextCellModule, {
			showDivider = false,
			LayoutOrder = 1,
			primaryIcon = if JoinResult.isDisabled then nil else JoinResult.iconImage,
			Text = JoinResult.groupNameText,
			iconCellWidth = JoinResult.iconCellWidth,
			isDisabled = JoinResult.isDisabled,
			onActivated = JoinResult.onActivated,
			Size = UDim2.new(1, -Size300, 0, JoinResult.cellHeight),
			style = JoinResult.style,
			testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatDetailsListActionButton(JoinResult.groupNameText) else nil
		})
	})
end

return MemoFunction(GroupNameEntryCell)