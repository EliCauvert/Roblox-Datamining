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

local function makeInterpolators(p0) --[[ line: 60 ]]
	-- upvalues: clientSettingsUtilityModule (ref)
	return {
		getBackgroundColor = function(value) --[[ line: 62 ]]
			-- upvalues: clientSettingsUtilityModule (copy), p0 (ref)
			return clientSettingsUtilityModule.getBackgroundColor(value, p0)
		end,
		getBackgroundTransparency = function(value) --[[ line: 65 ]]
			-- upvalues: clientSettingsUtilityModule (copy), p0 (ref)
			return clientSettingsUtilityModule.getBackgroundTransparency(value, p0)
		end
	}
end

return function(p1) --[[ line: 71 | named "ChatPlatformProvider" ]]
	-- upvalues: reactModule (ref), clientSettingsModule (ref), fFlagExpChatUseChatConfigStore (ref), signalsReactModule (ref), getChatConfigurationStoreModule (ref), useSelector (ref), makeInterpolators (ref), usePropSignal (ref), t (ref), getTransparencyStoreModule (ref), provider (ref)
	local var13 = reactModule.useContext(clientSettingsModule)
	local var14 = usePropSignal(if fFlagExpChatUseChatConfigStore then signalsReactModule.useSignalState(getChatConfigurationStoreModule(false).getChatInputBarSettings) else useSelector(function(p2) --[[ line: 78 ]]
		return p2.ChatLayout.ChatInputBarSettings
	end))
	local var15 = usePropSignal(reactModule.useMemo(function() --[[ line: 85 ]]
		-- upvalues: makeInterpolators (copy), var13 (ref)
		return makeInterpolators(var13)
	end, { var13 }))
	
	return reactModule.createElement(provider, {
		value = reactModule.useMemo(function() --[[ line: 92 ]]
			-- upvalues: var14 (ref), t (copy), var15 (ref), getTransparencyStoreModule (copy)
			return {
				getChatInputBarSettings = var14,
				chatWindowSettings = t,
				getInterpolators = var15,
				getTransparencyStore = getTransparencyStoreModule
			}
		end, { var14, var15 })
	}, p1.children)
end