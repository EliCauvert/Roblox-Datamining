local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local configModule = require(expChat.Config)
local clientSettingsModule = require(expChat.ClientSettings)
local clientSettingsUtilityModule = require(expChat.ClientSettings.ClientSettingsUtility)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local provider = require(parent.ExpChatIntegration.ChatPlatformContext).Provider
local usePropSignal = chatUIPrimitivesModule.Hooks.usePropSignal
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local t = {
	ChatWindowBackgroundColor3 = configModule.ChatWindowBackgroundColor3,
	ChatWindowBackgroundTransparency = configModule.ChatWindowBackgroundTransparency,
	ChatWindowMaxWidth = configModule.ChatWindowMaxWidth,
	ChatWindowMaxHeight = configModule.ChatWindowMaxHeight
}

local function makeInterpolators(p1)
	-- upvalues: clientSettingsUtilityModule (ref)
	return {
		getBackgroundColor = function(value)
			-- upvalues: clientSettingsUtilityModule (copy), p1 (ref)
			return clientSettingsUtilityModule.getBackgroundColor(value, p1)
		end,
		getBackgroundTransparency = function(value)
			-- upvalues: clientSettingsUtilityModule (copy), p1 (ref)
			return clientSettingsUtilityModule.getBackgroundTransparency(value, p1)
		end
	}
end

return function(p1)
	-- upvalues: reactModule (ref), clientSettingsModule (ref), fFlagExpChatUseChatConfigStore (ref), signalsReactModule (ref), getChatConfigurationStoreModule (ref), useSelector (ref), makeInterpolators (ref), usePropSignal (ref), t (ref), getTransparencyStoreModule (ref), provider (ref)
	local var1 = reactModule.useContext(clientSettingsModule)
	local var2 = usePropSignal(if fFlagExpChatUseChatConfigStore then signalsReactModule.useSignalState(getChatConfigurationStoreModule(false).getChatInputBarSettings) else useSelector(function(p2)
		return p2.ChatLayout.ChatInputBarSettings
	end))
	local var3 = usePropSignal(reactModule.useMemo(function()
		-- upvalues: makeInterpolators (copy), var1 (ref)
		return makeInterpolators(var1)
	end, { var1 }))
	
	return reactModule.createElement(provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var2 (ref), t (copy), var3 (ref), getTransparencyStoreModule (copy)
			return {
				getChatInputBarSettings = var2,
				chatWindowSettings = t,
				getInterpolators = var3,
				getTransparencyStore = getTransparencyStoreModule
			}
		end, { var2, var3 })
	}, p1.children)
end