game:DefineFastFlag("LuaAppEnableCompactDataModelPayload", false)
game:DefineFastFlag("LuaAppEnableWebViewStateTrackerInDataModelStreaming", false)
local luaAppDisableDataModelStreamingInStudio = game:DefineFastFlag("LuaAppDisableDataModelStreamingInStudio", false)
local runService = game:GetService("RunService")
local parent = script.Parent.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppEnableInExperienceDataModelStreamStarter = sharedFlagsModule.FFlagLuaAppEnableInExperienceDataModelStreamStarter
local fFlagEnableWebViewStateTracker = sharedFlagsModule.FFlagEnableWebViewStateTracker
local dataModelStreaming = require(parent.Loggers).Logger:new("DataModelStreaming")
local httpService = game:GetService("HttpService")
local getDataModelStreamAllowedHostsModule = require(script.Parent.getDataModelStreamAllowedHosts)
local getDataModelRootModule = require(script.Parent.getDataModelRoot)
local compactDataModelPayloadModule = require(script.Parent.compactDataModelPayload)
local webViewStateTracker = require(parent.WebViewUtils).WebViewStateTracker
local var1 = getDataModelStreamAllowedHostsModule()
local var2 = 0
local var3 = nil
local var4 = nil
local ok, _ = pcall(function()
	-- upvalues: var4 (write)
	var4 = game:GetService("WebSocketService")
end)

if ok then
	local function splitIntoChunks(p1, p2)
		local t = {}
		
		for i = 1, #p1, p2 do
			table.insert(t, string.sub(p1, i, i + p2 - 1))
		end
		return t
	end
	
	local function streamDataModel(p3, p4, p5)
		-- upvalues: webViewStateTracker (ref), fFlagEnableWebViewStateTracker (ref), httpService (ref), compactDataModelPayloadModule (ref), getDataModelRootModule (ref), dataModelStreaming (ref), splitIntoChunks (ref)
		local ok, status = pcall(function()
			-- upvalues: webViewStateTracker (copy), fFlagEnableWebViewStateTracker (copy), httpService (copy), compactDataModelPayloadModule (copy), getDataModelRootModule (copy), p5 (ref)
			return if webViewStateTracker and fFlagEnableWebViewStateTracker and (game:GetFastFlag("LuaAppEnableWebViewStateTrackerInDataModelStreaming") and webViewStateTracker.isOpen()) then httpService:JSONEncode({
				type = "webview",
				webViewMetadata = webViewStateTracker.getWebViewMetadata()
			}) elseif game:GetFastFlag("LuaAppEnableCompactDataModelPayload") then httpService:JSONEncode(compactDataModelPayloadModule(getDataModelRootModule(p5))) else httpService:JSONEncode(getDataModelRootModule(p5))
		end)
		
		if not ok then
			dataModelStreaming:error(`Error encoding data model: {status}`)
			
			return
		end
		dataModelStreaming:info(`Streaming data model, total size: {#status}`)
		local var5 = splitIntoChunks(status, 262144)
		local var17Count = #var5
		
		for i, v in ipairs(var5) do
			p3:Send(`DM_STREAM_CHUNK:{p4}:{var17Count}:{i}:{v}`)
		end
	end
	
	local function _()
		-- upvalues: var3 (write), var2 (write), var1 (ref)
		if var3 then
			return var3
		end
		var2 += 1
		
		return if #var1 < var2 then nil else var1[var2]
	end
	
	local function startDataModelStreamWsClient(p6)
		-- upvalues: var3 (write), var2 (write), var1 (ref), var4 (write), dataModelStreaming (ref), startDataModelStreamWsClient (ref), httpService (ref), streamDataModel (ref)
		local var6
		if var3 then
			var6 = var3
		else
			var2 += 1
			var6 = if #var1 < var2 then nil else var1[var2]
		end
		if not var6 then return end
		local var7 = var6
		
		if p6 then
			var7 ..= "/?source=" .. p5
		end
		local _ = nil
		local ok, status = pcall(function()
			-- upvalues: var4 (copy), var7 (write)
			return var4:CreateClient(var7)
		end)
		
		if ok and status then
			local var8 = status
			var8.Closed:Connect(function()
				-- upvalues: startDataModelStreamWsClient (copy), p6 (ref)
				startDataModelStreamWsClient(p6)
			end)
			var8.MessageReceived:Connect(function(p7)
				-- upvalues: var3 (copy), var6 (ref), httpService (copy), streamDataModel (copy), var8 (write)
				var3 = var6
				
				if p7:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") then
					print("[" .. "DataModelStreaming" .. "] uuid[" .. p6 .. "]")
				end
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p7 (ref)
					return httpService:JSONDecode(p7)
				end)
				
				if ok and status.type == "data_model" then
					streamDataModel(var8, if status.request_id then status.request_id else httpService:GenerateGUID(false), status.properties)
				end
			end)
			
			return
		end
		dataModelStreaming:error("Failed to create WebSocket client")
	end
	
	local function initDataModelStreamWsClientWithVPNGate(p6)
		-- upvalues: var4 (write), startDataModelStreamWsClient (ref)
		local ok, status = pcall(function()
			-- upvalues: var4 (copy)
			return var4:CreateClient("ws://10.110.101.222:5052")
		end)
		
		if ok and status then
			status.MessageReceived:Connect(function(_)
				-- upvalues: status (ref), startDataModelStreamWsClient (copy), p6 (ref)
				pcall(function()
					-- upvalues: status (copy)
					status:Close()
				end)
				startDataModelStreamWsClient(p6)
			end)
			
			return
		end
	end
	
	return function(p6)
		-- upvalues: fFlagLuaAppEnableInExperienceDataModelStreamStarter (ref), luaAppDisableDataModelStreamingInStudio (ref), runService (ref), initDataModelStreamWsClientWithVPNGate (ref)
		p6 = if fFlagLuaAppEnableInExperienceDataModelStreamStarter then p6 or "ua" else nil
		
		if luaAppDisableDataModelStreamingInStudio and runService:IsStudio() then
			return
		end
		initDataModelStreamWsClientWithVPNGate(p6)
	end
end
return function(_)
	-- upvalues: dataModelStreaming (ref)
	dataModelStreaming:error("WebSocketService is not available...")
end