local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local parent = appChatNetworking.Parent
local httpRequestModule = require(parent.HttpRequest)
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local var1 = require(parent.Loggers).Logger:new("AppChat.Networking")
local appChatNetworkingTelemetryModule = require(appChatNetworking.analytics.AppChatNetworkingTelemetry)
local getFFlagDebugUnfilteredThreads = require(parent.SharedFlags).getFFlagDebugUnfilteredThreads
local challengeRequestWrapper = require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper
local var2 = require(parent.SocialLuaAnalytics).Telemetry.new({
	name = "AppChat.NetworkResponse",
	description = "Event when a response is received from AppChat's networking layer",
	lastUpdated = { 2024, 10, 18 },
	backendsList = {
		{
			type = "RobloxTelemetryCounter",
			format = function(p1)
				return {
					endpoint = string.match(string.match(p1.url, ".%w+/(.*)") or "", "([^?#]+)") or "unknown",
					statusCode = tostring(p1.statusCode),
					isOK = p1.isOK
				}
			end
		}
	}
})

local function chunkAndLogString(p1)
	-- upvalues: var1 (ref)
	local t = {}
	
	for i = 1, #p1, 800 do
		table.insert(t, p1:sub(i, i + 800 - 1))
	end
	for i_1, v in t do
		var1:debug(v)
	end
end

return {
	default = challengeRequestWrapper(httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: var1 (ref), getFFlagDebugUnfilteredThreads (ref), chunkAndLogString (ref), httpRequestModule (ref)
			var1:info(`Fetching: [ requestMethod = "{p3}", url = "{p2}" ]`)
			
			if getFFlagDebugUnfilteredThreads() then
				local var3 = if p4 then p4.postBody else {}
				
				if string.find(p2, "get%-conversations") then
					local var4 = ""
					
					for i, v in var3.ids or {} do
						var4 = `{var4}, {v}`
					end
					chunkAndLogString(`FETCHING CONVERSATIONS{var4}`)
				elseif string.find(p2, "get%-modal%-sequence") then
					var1:debug(`FETCHING MODAL SEQUENCE sequence: {var3.modal_sequence} id: {var3.conversation_id or var3.friend_id}`)
				elseif string.find(p2, "record%-modal%-sequence%-response") then
					var1:debug(`RECORDING MODAL SEQUENCE RESPONSE action: {var3.action_type} sequence: {var3.modal_sequence} id: {var3.modal_id} variant: {var3.modal_variant} conversationId: {var3.conversation_id or var3.friend_id}`)
				end
			end
			return httpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end,
		postRequestFunction = function(p5, p6)
			-- upvalues: var1 (ref), appChatNetworkingTelemetryModule (ref), var2 (ref), getFFlagDebugUnfilteredThreads (ref), httpService (ref), chunkAndLogString (ref)
			var1:debug(`Returned: [ requestMethod = "{p6.requestMethod}", url = "{p6.url}", statusCode = {p5.StatusCode}{p5.HttpError ~= Enum.HttpError.OK and `, HttpError = {p5.HttpError}` or ""}]`)
			appChatNetworkingTelemetryModule.emit(var2, {
				url = p6.url,
				statusCode = p5.StatusCode,
				isOK = p5.HttpError == Enum.HttpError.OK
			})
			
			if getFFlagDebugUnfilteredThreads() then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p5 (ref)
					return httpService:JSONDecode(p5.Body)
				end)
				
				if not ok then return end
				local conversationId = p6.options and (p6.options.postBody and (p6.options.postBody.conversation_id or p6.options.postBody.friend_id))
				
				if string.find(p6.url, "get%-user%-conversations") or string.find(p6.url, "get%-conversations") then
					local var5 = ""
					
					for i, v in if status then status.conversations else {} do
						var5 = `{var5}, {v.id} {v.moderation_type} {v.user_pending_status}`
					end
					chunkAndLogString(`RETURNED CONVERSATIONS{var5}`)
					
					return
				elseif string.find(p6.url, "get%-modal%-sequence") then
					var1:debug(`RETURNED MODAL VARIANT sequence: {p6.options and (p6.options.postBody and p6.options.postBody.modal_sequence)} variant: {status and status.modal_variant} conversationId: {conversationId}`)
				end
			end
		end,
		maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("AppChatNetworkingHttpRetryCount", 4) else nil
	})),
	logger = var1
}