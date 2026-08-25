local chatService = game:GetService("Chat")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local signalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getChatStatusStoreModule = require(script.Parent.Parent.GetChatStatusStore)
local enableChatModerationModeLoggingRefactor = game:DefineFastFlag("EnableModerateChatUseChatService", false) and game:GetEngineFeature("EnableChatModerationModeLoggingRefactor")

return function()
	-- upvalues: createSignal (ref), getChatStatusStoreModule (ref), enableChatModerationModeLoggingRefactor (ref), chatService (ref), robloxReplicatedStorageService (ref), createComputed (ref)
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal(false)
	local var9 = getChatStatusStoreModule(false)
	local var10 = nil
	
	local function setIsSettingEnabled(value)
		-- upvalues: enableChatModerationModeLoggingRefactor (copy), chatService (copy), var10 (write)
		if enableChatModerationModeLoggingRefactor then
			chatService:RequestModerationModeEnabled(value)
			
			return
		elseif var10 then
			var10:FireServer(value)
		end
	end
	
	local function initialize()
		-- upvalues: enableChatModerationModeLoggingRefactor (copy), chatService (copy), var10 (write)
		if enableChatModerationModeLoggingRefactor then
			chatService:RequestModerationModeEnabled(false)
			
			return
		elseif var10 then
			var10:FireServer(false)
		end
	end
	
	local var13 = nil
	
	if enableChatModerationModeLoggingRefactor then
		var13 = chatService:GetPropertyChangedSignal("ModerationMode"):Connect(function()
			-- upvalues: var6 (ref), chatService (copy), var8 (ref)
			var6(chatService.ModerationMode ~= "Unsupported")
			var8(chatService.ModerationMode == "Enabled")
		end)
		var6(chatService.ModerationMode ~= "Unsupported")
		var8(chatService.ModerationMode == "Enabled")
	else
		coroutine.wrap(function()
			-- upvalues: var10 (write), robloxReplicatedStorageService (copy), var6 (ref), var8 (ref)
			var10 = robloxReplicatedStorageService:WaitForChild("ModerateChatSettingUpdated", 10)
			
			if var10 then
				var10.OnClientEvent:Connect(function(p0)
					-- upvalues: var6 (copy), var8 (copy)
					var6(true)
					var8(p0)
				end)
			end
		end)()
	end
	return {
		getIsSettingVisible = createComputed(function(p1)
			-- upvalues: var5 (ref), var9 (ref)
			return var5(p1) and var9.getChatStatus(p1) == "Enabled"
		end),
		getIsSettingEnabled = createComputed(function(p2)
			-- upvalues: var7 (ref), var9 (ref)
			return var7(p2) and var9.getChatStatus(p2) == "Enabled"
		end),
		setIsSettingEnabled = setIsSettingEnabled,
		initialize = initialize,
		cleanup = function()
			-- upvalues: var13 (write)
			if var13 then
				var13:Disconnect()
				var13 = nil
			end
		end
	}
end