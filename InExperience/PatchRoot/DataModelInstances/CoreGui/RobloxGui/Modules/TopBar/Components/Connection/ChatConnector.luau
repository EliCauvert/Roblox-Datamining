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

function chatConnector.didMount(p0)
	-- upvalues: gameSettings (ref), chatSelectorModule (ref)
	chatSelectorModule:SetVisible(if p0.props.isSmallTouchScreen then false else gameSettings.ChatVisible)
	p0.props.updateChatMessages(chatSelectorModule:GetMessageCount())
	p0.props.updateChatVisible(chatSelectorModule:GetVisibility())
	p0.chatVisibleConnection = chatSelectorModule.VisibilityStateChanged:connect(function(p1)
		-- upvalues: p0 (ref)
		p0.props.updateChatVisible(p1)
	end)
	p0.chatMessagesConnection = chatSelectorModule.MessagesChanged:connect(function(p2)
		-- upvalues: p0 (ref)
		p0.props.updateChatMessages(p2)
	end)
end

function chatConnector.render(_)
	return nil
end

function chatConnector.willUnmount(p3)
	p3.chatVisibleConnection:disconnect()
	p3.chatMessagesConnection:disconnect()
end

return roactRoduxModule.UNSTABLE_connect2(function(p4)
	return {
		isSmallTouchScreen = p4.displayOptions.isSmallTouchDevice
	}
end, function(p5)
	-- upvalues: updateChatVisibleModule (ref), updateChatMessagesModule (ref)
	return {
		updateChatVisible = function(p6)
			-- upvalues: p5 (ref), updateChatVisibleModule (copy)
			return p5(updateChatVisibleModule(p6))
		end,
		updateChatMessages = function(p7)
			-- upvalues: p5 (ref), updateChatMessagesModule (copy)
			return p5(updateChatMessagesModule(p7))
		end
	}
end)(chatConnector)