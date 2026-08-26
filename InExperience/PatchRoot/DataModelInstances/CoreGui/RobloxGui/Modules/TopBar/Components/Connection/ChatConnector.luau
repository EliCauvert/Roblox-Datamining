local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent.Parent

if require(parent.Flags.FFlagTopBarDeprecateChatRodux) then
	return nil
end
local updateChatVisibleModule = require(parent.Actions.UpdateChatVisible)
local updateChatMessagesModule = require(parent.Actions.UpdateChatMessages)
local chatSelectorModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.ChatSelector)
local gameSettings = UserSettings().GameSettings
local chatConnector = roactModule.PureComponent:extend("ChatConnector")
chatConnector.validateProps = tModule.strictInterface({
	isSmallTouchScreen = tModule.boolean,
	updateChatVisible = tModule.callback,
	updateChatMessages = tModule.callback
})

function chatConnector.didMount(p1)
	-- upvalues: gameSettings (ref), chatSelectorModule (ref)
	chatSelectorModule:SetVisible(if p1.props.isSmallTouchScreen then false else gameSettings.ChatVisible)
	p1.props.updateChatMessages(chatSelectorModule:GetMessageCount())
	p1.props.updateChatVisible(chatSelectorModule:GetVisibility())
	p1.chatVisibleConnection = chatSelectorModule.VisibilityStateChanged:connect(function(p2)
		-- upvalues: p1 (ref)
		p1.props.updateChatVisible(p2)
	end)
	p1.chatMessagesConnection = chatSelectorModule.MessagesChanged:connect(function(p2)
		-- upvalues: p1 (ref)
		p1.props.updateChatMessages(p2)
	end)
end

function chatConnector.render(_)
	return nil
end

function chatConnector.willUnmount(p1)
	p1.chatVisibleConnection:disconnect()
	p1.chatMessagesConnection:disconnect()
end

return roactRoduxModule.UNSTABLE_connect2(function(p1)
	return {
		isSmallTouchScreen = p1.displayOptions.isSmallTouchDevice
	}
end, function(p1)
	-- upvalues: updateChatVisibleModule (ref), updateChatMessagesModule (ref)
	return {
		updateChatVisible = function(p2)
			-- upvalues: p1 (ref), updateChatVisibleModule (copy)
			return p1(updateChatVisibleModule(p2))
		end,
		updateChatMessages = function(p2)
			-- upvalues: p1 (ref), updateChatMessagesModule (copy)
			return p1(updateChatMessagesModule(p2))
		end
	}
end)(chatConnector)