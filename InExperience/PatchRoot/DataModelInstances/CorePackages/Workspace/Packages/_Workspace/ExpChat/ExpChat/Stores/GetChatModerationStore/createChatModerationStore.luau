local Chat = game:GetService("Chat")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local SignalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local GetChatStatusStoreModule = require(script.Parent.Parent.GetChatStatusStore)
local EnableChatModerationModeLoggingRefactorEngineFeature = game:GetEngineFeature("EnableChatModerationModeLoggingRefactor")

return function()
	-- upvalues: CreateSignalFunction (copy), GetChatStatusStoreModule (copy), EnableChatModerationModeLoggingRefactorEngineFeature (copy), Chat (copy), RobloxReplicatedStorage (copy), CreateComputedFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local ChatStatusStoreModule = GetChatStatusStoreModule(false)
	local ModerateChatSettingUpdated = nil
	
	local function setIsSettingEnabled(Enabled)
		-- upvalues: EnableChatModerationModeLoggingRefactorEngineFeature (upval), Chat (upval), ModerateChatSettingUpdated (ref)
		if EnableChatModerationModeLoggingRefactorEngineFeature then
			Chat:RequestModerationModeEnabled(Enabled)
			
			return
		end
		if ModerateChatSettingUpdated then
			ModerateChatSettingUpdated:FireServer(Enabled)
		end
	end
	
	local function initialize()
		-- upvalues: EnableChatModerationModeLoggingRefactorEngineFeature (upval), Chat (upval), ModerateChatSettingUpdated (ref)
		if EnableChatModerationModeLoggingRefactorEngineFeature then
			Chat:RequestModerationModeEnabled(false)
			
			return
		end
		if ModerateChatSettingUpdated then
			ModerateChatSettingUpdated:FireServer(false)
		end
	end
	
	local Connection = nil
	
	if EnableChatModerationModeLoggingRefactorEngineFeature then
		Connection = Chat:GetPropertyChangedSignal("ModerationMode"):Connect(function()
			-- upvalues: Signal2 (copy), Chat (upval), Signal2_1 (copy)
			Signal2(Chat.ModerationMode ~= "Unsupported")
			Signal2_1(Chat.ModerationMode == "Enabled")
		end)
		Signal2(Chat.ModerationMode ~= "Unsupported")
		Signal2_1(Chat.ModerationMode == "Enabled")
	else
		coroutine.wrap(function()
			-- upvalues: ModerateChatSettingUpdated (ref), RobloxReplicatedStorage (upval), Signal2 (copy), Signal2_1 (copy)
			ModerateChatSettingUpdated = RobloxReplicatedStorage:WaitForChild("ModerateChatSettingUpdated", 10)
			
			if ModerateChatSettingUpdated then
				ModerateChatSettingUpdated.OnClientEvent:Connect(function(p1)
					-- upvalues: Signal2 (upval), Signal2_1 (upval)
					Signal2(true)
					Signal2_1(p1)
				end)
			end
		end)()
	end
	return {
		getIsSettingVisible = CreateComputedFunction(function(p1): boolean
			-- upvalues: Signal (copy), ChatStatusStoreModule (copy)
			return Signal(p1) and ChatStatusStoreModule.getChatStatus(p1) == "Enabled"
		end),
		getIsSettingEnabled = CreateComputedFunction(function(p1): boolean
			-- upvalues: Signal1 (copy), ChatStatusStoreModule (copy)
			return Signal1(p1) and ChatStatusStoreModule.getChatStatus(p1) == "Enabled"
		end),
		setIsSettingEnabled = setIsSettingEnabled,
		initialize = initialize,
		cleanup = function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	}
end