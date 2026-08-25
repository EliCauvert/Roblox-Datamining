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
local var8 = getDataModelStreamAllowedHostsModule()
local var9 = 0
local var10 = nil
local var11 = nil
local ok, _ = pcall(function()
	-- upvalues: var11 (write)
	var11 = game:GetService("WebSocketService")
end)

if ok then
	local function splitIntoChunks(p0, p1)
		local t = {}
		
		for i = 1, #p0, p1 do
			table.insert(t, string.sub(p0, i, i + p1 - 1))
		end
		return t
	end
	
	local function streamDataModel(p2, p3, p4)
		-- upvalues: webViewStateTracker (ref), fFlagEnableWebViewStateTracker (ref), httpService (ref), compactDataModelPayloadModule (ref), getDataModelRootModule (ref), dataModelStreaming (ref), splitIntoChunks (ref)
		local ok, status = pcall(function()
			-- upvalues: webViewStateTracker (copy), fFlagEnableWebViewStateTracker (copy), httpService (copy), compactDataModelPayloadModule (copy), getDataModelRootModule (copy), p4 (ref)
			return if webViewStateTracker and fFlagEnableWebViewStateTracker and (game:GetFastFlag("LuaAppEnableWebViewStateTrackerInDataModelStreaming") and webViewStateTracker.isOpen()) then httpService:JSONEncode({
				type = "webview",
				webViewMetadata = webViewStateTracker.getWebViewMetadata()
			}) elseif game:GetFastFlag("LuaAppEnableCompactDataModelPayload") then httpService:JSONEncode(compactDataModelPayloadModule(getDataModelRootModule(p4))) else httpService:JSONEncode(getDataModelRootModule(p4))
		end)
		
		if not ok then
			dataModelStreaming:error(`Error encoding data model: {status}`)
			
			return
		end
		dataModelStreaming:info(`Streaming data model, total size: {#status}`)
		local var17 = splitIntoChunks(status, 262144)
		local var17Count = #var17
		
		for i, v in ipairs(var17) do
			p2:Send(`DM_STREAM_CHUNK:{p3}:{var17Count}:{i}:{v}`)
		end
	end
	
	local function _()
		-- upvalues: var10 (write), var9 (write), var8 (ref)
		if var10 then
			return var10
		end
		var9 += 1
		
		return if #var8 < var9 then nil else var8[var9]
	end
	
	local function startDataModelStreamWsClient(p5)
		-- upvalues: var10 (write), var9 (write), var8 (ref), var11 (write), dataModelStreaming (ref), startDataModelStreamWsClient (ref), httpService (ref), streamDataModel (ref)
		local var19
		if var10 then
			var19 = var10
		else
			var9 += 1
			var19 = if #var8 < var9 then nil else var8[var9]
		end
		if not var19 then return end
		local var20 = var19
		
		if p5 then
			var20 ..= "/?source=" .. p5
		end
		local _ = nil
		local ok, status = pcall(function()
			-- upvalues: var11 (copy), var20 (write)
			return var11:CreateClient(var20)
		end)
		
		if ok and status then
			local var21 = status
			var21.Closed:Connect(function()
				-- upvalues: startDataModelStreamWsClient (copy), p5 (ref)
				startDataModelStreamWsClient(p5)
			end)
			var21.MessageReceived:Connect(function(p6)
				-- upvalues: var10 (copy), var19 (ref), httpService (copy), streamDataModel (copy), var21 (write)
				var10 = var19
				
				if p6:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") then
					print("[" .. "DataModelStreaming" .. "] uuid[" .. p6 .. "]")
				end
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p6 (ref)
					return httpService:JSONDecode(p6)
				end)
				
				if ok and status.type == "data_model" then
					streamDataModel(var21, if status.request_id then status.request_id else httpService:GenerateGUID(false), status.properties)
				end
			end)
			
			return
		end
		dataModelStreaming:error("Failed to create WebSocket client")
	end
	
	local function initDataModelStreamWsClientWithVPNGate(p7)
		-- upvalues: var11 (write), startDataModelStreamWsClient (ref)
		local ok, status = pcall(function()
			-- upvalues: var11 (copy)
			return var11:CreateClient("ws://10.110.101.222:5052")
		end)
		
		if ok and status then
			status.MessageReceived:Connect(function(_)
				-- upvalues: status (ref), startDataModelStreamWsClient (copy), p7 (ref)
				pcall(function()
					-- upvalues: status (copy)
					status:Close()
				end)
				startDataModelStreamWsClient(p7)
			end)
			
			return
		end
	end
	
	return function(p8)
		-- upvalues: fFlagLuaAppEnableInExperienceDataModelStreamStarter (ref), luaAppDisableDataModelStreamingInStudio (ref), runService (ref), initDataModelStreamWsClientWithVPNGate (ref)
		p8 = if fFlagLuaAppEnableInExperienceDataModelStreamStarter then p8 or "ua" else nil
		
		if luaAppDisableDataModelStreamingInStudio and runService:IsStudio() then
			return
		end
		initDataModelStreamWsClientWithVPNGate(p8)
	end
end
return function(_)
	-- upvalues: dataModelStreaming (ref)
	dataModelStreaming:error("WebSocketService is not available...")
end