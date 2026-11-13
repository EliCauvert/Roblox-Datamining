local AppChat = script:FindFirstAncestor("AppChat")
local GetConversationMessageListStoreModule = require(AppChat.Stores.GetConversationMessageListStore)
local GetConversationMessageStoreModule = require(AppChat.Stores.GetConversationMessageStore)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetUnreadMessageCountStoreModule = require(AppChat.Stores.GetUnreadMessageCountStore)
local SearchIntroducedConversationIdsModule = require(AppChat.Stores.searchIntroducedConversationIds)
local PortsModule = require(AppChat.AppChatData.Ports)
local CreateHttpPortModule = require(AppChat.AppChatData.Ports.createHttpPort)
local CreateFakeRealtimeModule = require(script.createFakeRealtime)
local CreateFakeServerModule = require(script.createFakeServer)
local Restore = nil

local function clearStores()
	-- upvalues: GetConversationStoreModule (copy), GetConversationMessageStoreModule (copy), GetConversationMessageListStoreModule (copy), GetUnreadMessageCountStoreModule (copy), SearchIntroducedConversationIdsModule (copy)
	GetConversationStoreModule(false).clear()
	GetConversationMessageStoreModule(false).clear()
	GetConversationMessageListStoreModule(false).clear()
	GetUnreadMessageCountStoreModule(false).reset()
	SearchIntroducedConversationIdsModule.clear()
end

return {
	install = function()
		-- upvalues: Restore (ref), PortsModule (copy), CreateFakeServerModule (copy), CreateFakeRealtimeModule (copy), CreateHttpPortModule (copy), clearStores (copy)
		assert(Restore == nil, "AppChatData.Testing.install() called again before restore()")
		local Current = PortsModule.current
		local FakeServerModule = CreateFakeServerModule()
		local FakeRealtimeModule = CreateFakeRealtimeModule()
		PortsModule.current = {
			http = CreateHttpPortModule(FakeServerModule.request),
			realtime = FakeRealtimeModule.port
		}
		clearStores()
		
		local function restore()
			-- upvalues: Restore (upval), restore (copy), PortsModule (upval), Current (copy), clearStores (upval)
			if Restore == restore then
				PortsModule.current = Current
				clearStores()
				Restore = nil
				
				return
			end
		end
		
		Restore = restore
		
		return {
			server = FakeServerModule,
			realtime = FakeRealtimeModule,
			restore = restore
		}
	end
}