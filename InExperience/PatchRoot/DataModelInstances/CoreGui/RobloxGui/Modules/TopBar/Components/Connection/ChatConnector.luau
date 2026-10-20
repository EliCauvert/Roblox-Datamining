local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent.Parent

if require(Parent.Flags.FFlagTopBarDeprecateChatRodux) then
	return nil
else
	local UpdateChatVisibleModule = require(Parent.Actions.UpdateChatVisible)
	local UpdateChatMessagesModule = require(Parent.Actions.UpdateChatMessages)
	local ChatSelectorModule = require(CoreGui:WaitForChild("RobloxGui").Modules.ChatSelector)
	local GameSettings = UserSettings().GameSettings
	local ChatConnector = RoactModule.PureComponent:extend("ChatConnector")
	ChatConnector.validateProps = TModule.strictInterface({
		isSmallTouchScreen = TModule.boolean,
		updateChatVisible = TModule.callback,
		updateChatMessages = TModule.callback
	})
	
	function ChatConnector.didMount(p1)
		-- upvalues: GameSettings (copy), ChatSelectorModule (copy)
		ChatSelectorModule:SetVisible(not p1.props.isSmallTouchScreen and GameSettings.ChatVisible)
		p1.props.updateChatMessages(ChatSelectorModule:GetMessageCount())
		p1.props.updateChatVisible(ChatSelectorModule:GetVisibility())
		p1.chatVisibleConnection = ChatSelectorModule.VisibilityStateChanged:connect(function(p2)
			-- upvalues: p1 (copy)
			p1.props.updateChatVisible(p2)
		end)
		p1.chatMessagesConnection = ChatSelectorModule.MessagesChanged:connect(function(p2)
			-- upvalues: p1 (copy)
			p1.props.updateChatMessages(p2)
		end)
	end
	
	function ChatConnector:render()
		return nil
	end
	
	function ChatConnector.willUnmount(p1)
		p1.chatVisibleConnection:disconnect()
		p1.chatMessagesConnection:disconnect()
	end
	
	return RoactRoduxModule.UNSTABLE_connect2(function(p1)
		return {
			isSmallTouchScreen = p1.displayOptions.isSmallTouchDevice
		}
	end, function(Callback)
		-- upvalues: UpdateChatVisibleModule (copy), UpdateChatMessagesModule (copy)
		return {
			updateChatVisible = function(p1)
				-- upvalues: Callback (copy), UpdateChatVisibleModule (upval)
				return Callback(UpdateChatVisibleModule(p1))
			end,
			updateChatMessages = function(p1)
				-- upvalues: Callback (copy), UpdateChatMessagesModule (upval)
				return Callback(UpdateChatMessagesModule(p1))
			end
		}
	end)(ChatConnector)
end