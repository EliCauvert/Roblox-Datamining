local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local iconWithTextCellModule = require(appChat.Components.Cells.IconWithTextCell)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local t = {
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
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), iconWithTextCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = if var1.isDisabled then var1.style.Tokens.Size.Size_300 else 0
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = var1.LayoutOrder,
		Size = UDim2.fromScale(1, 0)
	}, {
		padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var2),
			PaddingBottom = UDim.new(0, var1.paddingBottom)
		})
	}, {
		IconWithText = reactModule.createElement(iconWithTextCellModule, {
			showDivider = false,
			LayoutOrder = 1,
			primaryIcon = if var1.isDisabled then nil else var1.iconImage,
			Text = var1.groupNameText,
			iconCellWidth = var1.iconCellWidth,
			isDisabled = var1.isDisabled,
			onActivated = var1.onActivated,
			Size = UDim2.new(1, -var2, 0, var1.cellHeight),
			style = var1.style,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsListActionButton(var1.groupNameText) else nil
		})
	})
end

return memo(GroupNameEntryCell)