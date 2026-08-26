local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local iconWithTextCellModule = require(appChat.Components.Cells.IconWithTextCell)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local t = {
	Text = "(translated 'add friends' text here)",
	iconImage = nil,
	iconSize = 36,
	iconCellWidth = 60,
	cellHeight = 64,
	onActivated = nil,
	LayoutOrder = 0,
	style = nil
}

function AddFriendsEntry(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), iconWithTextCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	
	return reactModule.createElement(iconWithTextCellModule, {
		showDivider = false,
		Size = UDim2.new(1, 0, 0, var1.cellHeight),
		primaryIcon = var1.iconImage,
		primaryIconSize = var1.iconSize,
		iconCellWidth = var1.iconCellWidth,
		Text = var1.Text,
		onActivated = var1.onActivated,
		LayoutOrder = var1.LayoutOrder,
		style = var1.style,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsListActionButton(var1.Text) else nil
	})
end

return memo(AddFriendsEntry)