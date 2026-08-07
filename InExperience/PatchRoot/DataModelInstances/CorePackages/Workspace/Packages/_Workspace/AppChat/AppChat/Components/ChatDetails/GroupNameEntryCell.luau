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

function GroupNameEntryCell(p0) --[[ line: 40 ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), iconWithTextCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	local var8 = if var7.isDisabled then var7.style.Tokens.Size.Size_300 else 0
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = var7.LayoutOrder,
		Size = UDim2.fromScale(1, 0)
	}, {
		padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var8),
			PaddingBottom = UDim.new(0, var7.paddingBottom)
		})
	}, {
		IconWithText = reactModule.createElement(iconWithTextCellModule, {
			showDivider = false,
			LayoutOrder = 1,
			primaryIcon = if var7.isDisabled then nil else var7.iconImage,
			Text = var7.groupNameText,
			iconCellWidth = var7.iconCellWidth,
			isDisabled = var7.isDisabled,
			onActivated = var7.onActivated,
			Size = UDim2.new(1, -var8, 0, var7.cellHeight),
			style = var7.style,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsListActionButton(var7.groupNameText) else nil
		})
	})
end

return memo(GroupNameEntryCell)