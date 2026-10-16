local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local IconWithTextCellModule = require(AppChat.Components.Cells.IconWithTextCell)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local config = {
	Text = "(translated 'add friends' text here)",
	iconImage = nil,
	iconSize = 36,
	iconCellWidth = 60,
	cellHeight = 64,
	onActivated = nil,
	LayoutOrder = 0,
	style = nil
}

function AddFriendsEntry(p1) --[[ Line: 36 ]]
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), IconWithTextCellModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	
	return ReactModule.createElement(IconWithTextCellModule, {
		showDivider = false,
		Size = UDim2.new(1, 0, 0, JoinResult.cellHeight),
		primaryIcon = JoinResult.iconImage,
		primaryIconSize = JoinResult.iconSize,
		iconCellWidth = JoinResult.iconCellWidth,
		Text = JoinResult.Text,
		onActivated = JoinResult.onActivated,
		LayoutOrder = JoinResult.LayoutOrder,
		style = JoinResult.style,
		testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatDetailsListActionButton(JoinResult.Text) else nil
	})
end

return MemoFunction(AddFriendsEntry)