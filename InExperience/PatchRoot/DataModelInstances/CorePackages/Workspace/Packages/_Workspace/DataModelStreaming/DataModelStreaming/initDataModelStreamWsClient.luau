game:DefineFastFlag("LuaAppEnableCompactDataModelPayload", false)
game:DefineFastFlag("LuaAppEnableWebViewStateTrackerInDataModelStreaming", false)
local LuaAppDisableDataModelStreamingInStudio = game:DefineFastFlag("LuaAppDisableDataModelStreamingInStudio", false)
local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppEnableInExperienceDataModelStreamStarter = SharedFlagsModule.FFlagLuaAppEnableInExperienceDataModelStreamStarter
local FFlagEnableWebViewStateTracker = SharedFlagsModule.FFlagEnableWebViewStateTracker
local DataModelStreaming = require(Parent.Loggers).Logger:new("DataModelStreaming")
local HttpService = game:GetService("HttpService")
local GetDataModelRootModule = require(script.Parent.getDataModelRoot)
local CompactDataModelPayloadModule = require(script.Parent.compactDataModelPayload)
local WebViewStateTracker = require(Parent.WebViewUtils).WebViewStateTracker
local v1 = require(script.Parent.getDataModelStreamAllowedHosts)()
local Count = 0
local v2 = nil
local WebSocketService = nil
local Success, _ = pcall(function() --[[ Line: 30 ]]
	-- upvalues: WebSocketService (ref)
	WebSocketService = game:GetService("WebSocketService")
end)

if Success then
	local function splitIntoChunks(Text: string, p1: number) --[[ Line: 40 ]]
		local List = {}
		
		for i = 1, #Text, p1 do
			table.insert(List, (string.sub(Text, i, i + p1 - 1)))
		end
		return List
	end
	
	local function streamDataModel(p2, RequestId, Properties) --[[ Line: 48 ]]
		-- upvalues: WebViewStateTracker (copy), FFlagEnableWebViewStateTracker (copy), HttpService (copy), CompactDataModelPayloadModule (copy), GetDataModelRootModule (copy), DataModelStreaming (copy), splitIntoChunks (copy)
		local Success, Result = pcall(function() --[[ Line: 49 ]]
			-- upvalues: WebViewStateTracker (upval), FFlagEnableWebViewStateTracker (upval), HttpService (upval), CompactDataModelPayloadModule (upval), GetDataModelRootModule (upval), Properties (copy)
			return if WebViewStateTracker and FFlagEnableWebViewStateTracker and game:GetFastFlag("LuaAppEnableWebViewStateTrackerInDataModelStreaming") and WebViewStateTracker.isOpen() then HttpService:JSONEncode({
				type = "webview",
				webViewMetadata = WebViewStateTracker.getWebViewMetadata()
			}) elseif game:GetFastFlag("LuaAppEnableCompactDataModelPayload") then HttpService:JSONEncode(CompactDataModelPayloadModule(GetDataModelRootModule(Properties))) else HttpService:JSONEncode(GetDataModelRootModule(Properties))
		end)
		
		if not Success then
			DataModelStreaming:error(`Error encoding data model: {Result}`)
			
			return
		end
		DataModelStreaming:info(`Streaming data model, total size: {#Result}`)
		local SplitIntoChunksResult = splitIntoChunks(Result, 262144)
		local CountSplitIntoChunksResult = #SplitIntoChunksResult
		
		for i, value in ipairs(SplitIntoChunksResult) do
			p2:Send(`DM_STREAM_CHUNK:{RequestId}:{CountSplitIntoChunksResult}:{i}:{value}`)
		end
	end
	
	local function _() --[[ Line: 83 | Named "getHostToTry" ]]
		-- upvalues: v2 (ref), Count (ref), v1 (copy)
		if v2 then
			return v2
		else
			Count += 1
			
			return if #v1 < Count then nil else v1[Count]
		end
	end
	
	local function startDataModelStreamWsClient(Text) --[[ Line: 96 ]]
		-- upvalues: v2 (ref), Count (ref), v1 (copy), WebSocketService (ref), DataModelStreaming (copy), startDataModelStreamWsClient (copy), HttpService (copy), streamDataModel (copy)
		local v3 = nil
		if v2 then
			v3 = v2
		else
			Count += 1
			v3 = if Count > #v1 then nil else v1[Count]
		end
		if not v3 then return end
		local Text1: string = v3
		
		if Text then
			Text1 ..= "/?source=" .. Text
		end
		local Result1 = nil
		local Success, Result = pcall(function() --[[ Line: 109 ]]
			-- upvalues: WebSocketService (upval), Text1 (ref)
			return WebSocketService:CreateClient(Text1)
		end)
		
		if Success and Result then
			Result1 = Result
			Result1.Closed:Connect(function() --[[ Line: 118 ]]
				-- upvalues: startDataModelStreamWsClient (upval), Text (copy)
				startDataModelStreamWsClient(Text)
			end)
			Result1.MessageReceived:Connect(function(Text) --[[ Line: 122 ]]
				-- upvalues: v2 (upval), v3 (copy), HttpService (upval), streamDataModel (upval), Result1 (ref)
				v2 = v3
				
				if Text:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") then
					print("[" .. "DataModelStreaming" .. "] uuid[" .. Text .. "]")
				end
				local Success, Result = pcall(function() --[[ Line: 133 ]]
					-- upvalues: HttpService (upval), Text (copy)
					return HttpService:JSONDecode(Text)
				end)
				
				if Success and Result.type == "data_model" then
					streamDataModel(Result1, if Result.request_id then Result.request_id else HttpService:GenerateGUID(false), Result.properties)
				end
			end)
			
			return
		else
			DataModelStreaming:error("Failed to create WebSocket client")
		end
	end
	
	local function initDataModelStreamWsClientWithVPNGate(p3) --[[ Line: 147 ]]
		-- upvalues: WebSocketService (ref), startDataModelStreamWsClient (copy)
		local Success, Result = pcall(function() --[[ Line: 148 ]]
			-- upvalues: WebSocketService (upval)
			return WebSocketService:CreateClient("ws://10.110.101.222:5052")
		end)
		
		if Success and Result then
			Result.MessageReceived:Connect(function(_) --[[ Line: 155 ]]
				-- upvalues: Result (copy), startDataModelStreamWsClient (upval), p3 (copy)
				pcall(function() --[[ Line: 156 ]]
					-- upvalues: Result (upval)
					Result:Close()
				end)
				startDataModelStreamWsClient(p3)
			end)
			
			return
		end
	end
	
	return function(p3) --[[ Line: 163 | Named "initDataModelStreamWsClient" ]]
		-- upvalues: FFlagLuaAppEnableInExperienceDataModelStreamStarter (copy), LuaAppDisableDataModelStreamingInStudio (copy), RunService (copy), initDataModelStreamWsClientWithVPNGate (copy)
		local P9 = if FFlagLuaAppEnableInExperienceDataModelStreamStarter then p3 or "ua" else nil
		
		if not LuaAppDisableDataModelStreamingInStudio or not RunService:IsStudio() then
			initDataModelStreamWsClientWithVPNGate(P9)
			
			return
		end
	end
else
	return function(_) --[[ Line: 35 ]]
		-- upvalues: DataModelStreaming (copy)
		DataModelStreaming:error("WebSocketService is not available...")
	end
end