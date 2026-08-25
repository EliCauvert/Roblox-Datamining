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

function AddFriendsEntry(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), iconWithTextCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	
	return reactModule.createElement(iconWithTextCellModule, {
		showDivider = false,
		Size = UDim2.new(1, 0, 0, var7.cellHeight),
		primaryIcon = var7.iconImage,
		primaryIconSize = var7.iconSize,
		iconCellWidth = var7.iconCellWidth,
		Text = var7.Text,
		onActivated = var7.onActivated,
		LayoutOrder = var7.LayoutOrder,
		style = var7.style,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsListActionButton(var7.Text) else nil
	})
end

return memo(AddFriendsEntry)