local HttpService = game:GetService("HttpService")
local TimeToInteractiveTracker = require(script:FindFirstAncestor("PurchasingPerformance").Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local BridgeModule = require(script.Parent.Bridge)
local FFlagSimulateBuyRobuxPageWebTTIPayloadModule = require(script.Parent.Flags.FFlagSimulateBuyRobuxPageWebTTIPayload)
local UnixTimestampMillis = nil

local function _(p1, p2)
	-- upvalues: TimeToInteractiveTracker (copy)
	TimeToInteractiveTracker.trackMilestone("BuyRobux_WebView_TTI", p1, p2)
end

local function handleBridgePayload(p1)
	-- upvalues: BridgeModule (copy), Milestone (copy), TimeToInteractiveTracker (copy), UnixTimestampMillis (ref)
	if typeof(p1) ~= "table" then return end
	if p1.feature ~= BridgeModule.FEATURE then return end
	if p1.eventName ~= "BuyRobux_WebView_TTI" then return end
	if typeof(p1.milestones) ~= "table" then return end
	TimeToInteractiveTracker.trackMilestone("BuyRobux_WebView_TTI", Milestone.PrimaryDataReady.Name, { id = BridgeModule.UA_ID })
	local RecordWebViewMilestonesFunction: (any, any) -> () = TimeToInteractiveTracker.recordWebViewMilestones
	
	if RecordWebViewMilestonesFunction ~= nil then
		RecordWebViewMilestonesFunction("BuyRobux_WebView_TTI", p1.milestones)
	end
	TimeToInteractiveTracker.trackEnd("BuyRobux_WebView_TTI")
	UnixTimestampMillis = nil
end

return {
	EVENT_NAME = "BuyRobux_WebView_TTI",
	startTracking = function()
		-- upvalues: UnixTimestampMillis (ref), TimeToInteractiveTracker (copy)
		UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		TimeToInteractiveTracker.trackStart("BuyRobux_WebView_TTI", true)
	end,
	getTtiStartMs = function()
		-- upvalues: UnixTimestampMillis (ref)
		return UnixTimestampMillis
	end,
	appendTtiStartMsToUrl = function(Text: string): string
		-- upvalues: UnixTimestampMillis (ref), BridgeModule (copy)
		local UnixTimestampMillis1 = UnixTimestampMillis
		
		return if UnixTimestampMillis1 == nil then Text else Text .. (if string.find(Text, "?", 1, true) then "&" else "?") .. BridgeModule.TTI_START_MS_QUERY_PARAM .. "=" .. tostring(UnixTimestampMillis1)
	end,
	L2 = {
		renderStartedUA = function()
			-- upvalues: Milestone (copy), BridgeModule (copy), TimeToInteractiveTracker (copy)
			TimeToInteractiveTracker.trackMilestone("BuyRobux_WebView_TTI", Milestone.RenderStarted, { id = BridgeModule.UA_ID })
		end,
		surfaceMountedUA = function()
			-- upvalues: Milestone (copy), BridgeModule (copy), TimeToInteractiveTracker (copy)
			TimeToInteractiveTracker.trackMilestone("BuyRobux_WebView_TTI", Milestone.SurfaceMounted, { id = BridgeModule.UA_ID })
		end,
		primaryDataStartedUA = function()
			-- upvalues: Milestone (copy), BridgeModule (copy), TimeToInteractiveTracker (copy)
			TimeToInteractiveTracker.trackMilestone("BuyRobux_WebView_TTI", Milestone.PrimaryDataStarted.Name, { id = BridgeModule.UA_ID })
		end
	},
	handleBridgePayload = handleBridgePayload,
	simulateWebPayload = function()
		-- upvalues: FFlagSimulateBuyRobuxPageWebTTIPayloadModule (copy), HttpService (copy), handleBridgePayload (copy)
		if FFlagSimulateBuyRobuxPageWebTTIPayloadModule then
			task.delay(1, function()
				-- upvalues: HttpService (upval), handleBridgePayload (upval)
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, "{\n    \"feature\": \"TTIComplete\",\n    \"eventName\": \"BuyRobux_WebView_TTI\",\n    \"milestones\": [\n        { \"name\": \"PrimaryDataReady\",       \"id\": \"web\", \"deltaMs\": 412, \"subphases\": [{ \"name\": \"ResponseReceived\", \"deltaMs\": 380 }] },\n        { \"name\": \"DataProcessingStarted\",  \"id\": \"web\", \"deltaMs\": 430 },\n        { \"name\": \"RenderStarted\",          \"id\": \"web\", \"deltaMs\": 510 },\n        { \"name\": \"SurfaceMounted\",         \"id\": \"web\", \"deltaMs\": 580 },\n        { \"name\": \"DataProcessingCompleted\",\"id\": \"web\", \"deltaMs\": 720, \"subphases\": [{ \"name\": \"Decode\", \"deltaMs\": 700 }, { \"name\": \"TreeBuild\", \"deltaMs\": 720 }] },\n        { \"name\": \"FunctionallyReady\",      \"id\": \"web\", \"deltaMs\": 800 },\n        { \"name\": \"SurfaceReady\",           \"id\": \"web\", \"deltaMs\": 850 }\n    ]\n}")
				
				if Success and typeof(Result) == "table" then
					handleBridgePayload(Result)
					
					return
				end
			end)
			
			return
		end
	end
}