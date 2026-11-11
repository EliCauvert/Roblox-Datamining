local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ConfigModule = require(ExpChat.Config)
local ClientSettingsModule = require(ExpChat.ClientSettings)
local ClientSettingsUtilityModule = require(ExpChat.ClientSettings.ClientSettingsUtility)
local GetChatConfigurationStoreModule = require(ExpChat.Stores.GetChatConfigurationStore)
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local Provider = require(Parent.ExpChatIntegration.ChatPlatformContext).Provider
local UsePropSignalFunction = require(Parent.ChatUIPrimitives).Hooks.usePropSignal
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagExpChatUseChatConfigStore = require(Parent.SharedFlags).FFlagExpChatUseChatConfigStore
local ChatWindowSettings = {
	ChatWindowBackgroundColor3 = ConfigModule.ChatWindowBackgroundColor3,
	ChatWindowBackgroundTransparency = ConfigModule.ChatWindowBackgroundTransparency,
	ChatWindowMaxWidth = ConfigModule.ChatWindowMaxWidth,
	ChatWindowMaxHeight = ConfigModule.ChatWindowMaxHeight
}

local function makeInterpolators(UseContextResult)
	-- upvalues: ClientSettingsUtilityModule (copy)
	return {
		getBackgroundColor = function(p1)
			-- upvalues: ClientSettingsUtilityModule (upval), UseContextResult (copy)
			return ClientSettingsUtilityModule.getBackgroundColor(p1, UseContextResult)
		end,
		getBackgroundTransparency = function(p1)
			-- upvalues: ClientSettingsUtilityModule (upval), UseContextResult (copy)
			return ClientSettingsUtilityModule.getBackgroundTransparency(p1, UseContextResult)
		end
	}
end

return function(p1)
	-- upvalues: ReactModule (copy), ClientSettingsModule (copy), FFlagExpChatUseChatConfigStore (copy), SignalsReactModule (copy), GetChatConfigurationStoreModule (copy), UseSelectorFunction (copy), makeInterpolators (copy), UsePropSignalFunction (copy), ChatWindowSettings (copy), GetTransparencyStoreModule (copy), Provider (copy)
	local UseContextResult = ReactModule.useContext(ClientSettingsModule)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: makeInterpolators (upval), UseContextResult (copy)
		return (makeInterpolators(UseContextResult))
	end, { UseContextResult })
	local UsePropSignalResult = UsePropSignalFunction(if FFlagExpChatUseChatConfigStore then SignalsReactModule.useSignalState(GetChatConfigurationStoreModule(false).getChatInputBarSettings) else UseSelectorFunction(function(p2)
		return p2.ChatLayout.ChatInputBarSettings
	end))
	local UsePropSignalResult1 = UsePropSignalFunction(UseMemoResult)
	
	return ReactModule.createElement(Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UsePropSignalResult (copy), ChatWindowSettings (upval), UsePropSignalResult1 (copy), GetTransparencyStoreModule (upval)
			return {
				getChatInputBarSettings = UsePropSignalResult,
				chatWindowSettings = ChatWindowSettings,
				getInterpolators = UsePropSignalResult1,
				getTransparencyStore = GetTransparencyStoreModule
			}
		end, { UsePropSignalResult, UsePropSignalResult1 })
	}, p1.children)
end