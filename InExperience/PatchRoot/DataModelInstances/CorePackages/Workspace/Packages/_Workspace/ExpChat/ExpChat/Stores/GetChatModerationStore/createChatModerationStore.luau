local chatService = game:GetService("Chat")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local signalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getChatStatusStoreModule = require(script.Parent.Parent.GetChatStatusStore)
local enableChatModerationModeLoggingRefactor = game:DefineFastFlag("EnableModerateChatUseChatService", false) and game:GetEngineFeature("EnableChatModerationModeLoggingRefactor")

return function()
	-- upvalues: createSignal (ref), getChatStatusStoreModule (ref), enableChatModerationModeLoggingRefactor (ref), chatService (ref), robloxReplicatedStorageService (ref), createComputed (ref)
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(false)
	local var5 = getChatStatusStoreModule(false)
	local var6 = nil
	
	local function setIsSettingEnabled(value)
		-- upvalues: enableChatModerationModeLoggingRefactor (copy), chatService (copy), var6 (write)
		if enableChatModerationModeLoggingRefactor then
			chatService:RequestModerationModeEnabled(value)
			
			return
		elseif var6 then
			var6:FireServer(value)
		end
	end
	
	local function initialize()
		-- upvalues: enableChatModerationModeLoggingRefactor (copy), chatService (copy), var6 (write)
		if enableChatModerationModeLoggingRefactor then
			chatService:RequestModerationModeEnabled(false)
			
			return
		elseif var6 then
			var6:FireServer(false)
		end
	end
	
	local var7 = nil
	
	if enableChatModerationModeLoggingRefactor then
		var7 = chatService:GetPropertyChangedSignal("ModerationMode"):Connect(function()
			-- upvalues: var2 (ref), chatService (copy), var4 (ref)
			var2(chatService.ModerationMode ~= "Unsupported")
			var4(chatService.ModerationMode == "Enabled")
		end)
		var2(chatService.ModerationMode ~= "Unsupported")
		var4(chatService.ModerationMode == "Enabled")
	else
		coroutine.wrap(function()
			-- upvalues: var6 (write), robloxReplicatedStorageService (copy), var2 (ref), var4 (ref)
			var6 = robloxReplicatedStorageService:WaitForChild("ModerateChatSettingUpdated", 10)
			
			if var6 then
				var6.OnClientEvent:Connect(function(p1)
					-- upvalues: var2 (copy), var4 (copy)
					var2(true)
					var4(p1)
				end)
			end
		end)()
	end
	return {
		getIsSettingVisible = createComputed(function(p1)
			-- upvalues: var1 (ref), var5 (ref)
			return var1(p1) and var5.getChatStatus(p1) == "Enabled"
		end),
		getIsSettingEnabled = createComputed(function(p1)
			-- upvalues: var3 (ref), var5 (ref)
			return var3(p1) and var5.getChatStatus(p1) == "Enabled"
		end),
		setIsSettingEnabled = setIsSettingEnabled,
		initialize = initialize,
		cleanup = function()
			-- upvalues: var7 (write)
			if var7 then
				var7:Disconnect()
				var7 = nil
			end
		end
	}
end