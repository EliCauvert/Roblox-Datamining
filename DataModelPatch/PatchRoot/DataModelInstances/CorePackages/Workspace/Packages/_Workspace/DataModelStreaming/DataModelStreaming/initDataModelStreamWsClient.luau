game:DefineFastFlag("LuaAppEnableCompactDataModelPayload", false)
game:DefineFastFlag("LuaAppEnableWebViewStateTrackerInDataModelStreaming", false)
local LuaAppDisableDataModelStreamingInStudio = game:DefineFastFlag("LuaAppDisableDataModelStreamingInStudio", false)
local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent.Parent.Parent
local DataModelStreaming = require(Parent.Loggers).Logger:new("DataModelStreaming")
local HttpService = game:GetService("HttpService")
local GetDataModelRootModule = require(script.Parent.getDataModelRoot)
local CompactDataModelPayloadModule = require(script.Parent.compactDataModelPayload)
local WebViewStateTracker = require(Parent.WebViewUtils).WebViewStateTracker
local FFlagEnableWebViewStateTracker = require(Parent.SharedFlags).FFlagEnableWebViewStateTracker
local v1 = require(script.Parent.getDataModelStreamAllowedHosts)()
local Count = 0
local v2 = nil
local WebSocketService = nil
local Success, _ = pcall(function()
	-- upvalues: WebSocketService (ref)
	WebSocketService = game:GetService("WebSocketService")
end)

if Success then
	local function splitIntoChunks(Text: string, p1: number)
		local List = {}
		
		for i = 1, #Text, p1 do
			table.insert(List, (string.sub(Text, i, i + p1 - 1)))
		end
		return List
	end
	
	local function streamDataModel(p2, RequestId, Properties)
		-- upvalues: FFlagEnableWebViewStateTracker (copy), WebViewStateTracker (copy), HttpService (copy), CompactDataModelPayloadModule (copy), GetDataModelRootModule (copy), DataModelStreaming (copy), splitIntoChunks (copy)
		local Success, Result = pcall(function()
			-- upvalues: FFlagEnableWebViewStateTracker (upval), WebViewStateTracker (upval), HttpService (upval), CompactDataModelPayloadModule (upval), GetDataModelRootModule (upval), Properties (copy)
			return if FFlagEnableWebViewStateTracker and game:GetFastFlag("LuaAppEnableWebViewStateTrackerInDataModelStreaming") and WebViewStateTracker.isOpen() then HttpService:JSONEncode({
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
	
	local function _()
		-- upvalues: v2 (ref), Count (ref), v1 (copy)
		if v2 then
			return v2
		else
			Count += 1
			
			return if #v1 < Count then nil else v1[Count]
		end
	end
	
	local function startDataModelStreamWsClient()
		-- upvalues: v2 (ref), Count (ref), v1 (copy), WebSocketService (ref), DataModelStreaming (copy), startDataModelStreamWsClient (copy), HttpService (copy), streamDataModel (copy)
		local Uri = nil
		if v2 then
			Uri = v2
		else
			Count += 1
			Uri = if Count > #v1 then nil else v1[Count]
		end
		if not Uri then return end
		local Result1 = nil
		local Success, Result = pcall(function()
			-- upvalues: WebSocketService (upval), Uri (copy)
			return WebSocketService:CreateClient(Uri)
		end)
		
		if Success and Result then
			Result1 = Result
			Result1.Closed:Connect(function()
				-- upvalues: startDataModelStreamWsClient (upval)
				startDataModelStreamWsClient()
			end)
			Result1.MessageReceived:Connect(function(Text)
				-- upvalues: v2 (upval), Uri (copy), HttpService (upval), streamDataModel (upval), Result1 (ref)
				v2 = Uri
				
				if Text:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") then
					print("[" .. "DataModelStreaming" .. "] uuid[" .. Text .. "]")
				end
				local Success, Result = pcall(function()
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
	
	local function initDataModelStreamWsClientWithVPNGate()
		-- upvalues: WebSocketService (ref), startDataModelStreamWsClient (copy)
		local Success, Result = pcall(function()
			-- upvalues: WebSocketService (upval)
			return WebSocketService:CreateClient("ws://10.110.101.222:5052")
		end)
		
		if Success and Result then
			Result.MessageReceived:Connect(function(_)
				-- upvalues: Result (copy), startDataModelStreamWsClient (upval)
				pcall(function()
					-- upvalues: Result (upval)
					Result:Close()
				end)
				startDataModelStreamWsClient()
			end)
			
			return
		end
	end
	
	return function()
		-- upvalues: LuaAppDisableDataModelStreamingInStudio (copy), RunService (copy), initDataModelStreamWsClientWithVPNGate (copy)
		if not LuaAppDisableDataModelStreamingInStudio or not RunService:IsStudio() then
			initDataModelStreamWsClientWithVPNGate()
			
			return
		end
	end
else
	return function()
		-- upvalues: DataModelStreaming (copy)
		DataModelStreaming:error("WebSocketService is not available...")
	end
end