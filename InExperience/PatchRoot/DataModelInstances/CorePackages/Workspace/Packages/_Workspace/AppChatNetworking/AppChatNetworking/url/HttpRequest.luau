local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local parent = appChatNetworking.Parent
local httpRequestModule = require(parent.HttpRequest)
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local var3 = require(parent.Loggers).Logger:new("AppChat.Networking")
local appChatNetworkingTelemetryModule = require(appChatNetworking.analytics.AppChatNetworkingTelemetry)
local getFFlagDebugUnfilteredThreads = require(parent.SharedFlags).getFFlagDebugUnfilteredThreads
local challengeRequestWrapper = require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper
local var5 = require(parent.SocialLuaAnalytics).Telemetry.new({
	name = "AppChat.NetworkResponse",
	description = "Event when a response is received from AppChat's networking layer",
	lastUpdated = { 2024, 10, 18 },
	backendsList = {
		{
			type = "RobloxTelemetryCounter",
			format = function(p0)
				return {
					endpoint = string.match(string.match(p0.url, ".%w+/(.*)") or "", "([^?#]+)") or "unknown",
					statusCode = tostring(p0.statusCode),
					isOK = p0.isOK
				}
			end
		}
	}
})

local function chunkAndLogString(p1)
	-- upvalues: var3 (ref)
	local t = {}
	
	for i = 1, #p1, 800 do
		table.insert(t, p1:sub(i, i + 800 - 1))
	end
	for i_1, v in t do
		var3:debug(v)
	end
end

return {
	default = challengeRequestWrapper(httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: var3 (ref), getFFlagDebugUnfilteredThreads (ref), chunkAndLogString (ref), httpRequestModule (ref)
			var3:info(`Fetching: [ requestMethod = "{p3}", url = "{p2}" ]`)
			
			if getFFlagDebugUnfilteredThreads() then
				local var8 = if p4 then p4.postBody else {}
				
				if string.find(p2, "get%-conversations") then
					local var9 = ""
					
					for i, v in var8.ids or {} do
						var9 = `{var9}, {v}`
					end
					chunkAndLogString(`FETCHING CONVERSATIONS{var9}`)
				elseif string.find(p2, "get%-modal%-sequence") then
					var3:debug(`FETCHING MODAL SEQUENCE sequence: {var8.modal_sequence} id: {var8.conversation_id or var8.friend_id}`)
				elseif string.find(p2, "record%-modal%-sequence%-response") then
					var3:debug(`RECORDING MODAL SEQUENCE RESPONSE action: {var8.action_type} sequence: {var8.modal_sequence} id: {var8.modal_id} variant: {var8.modal_variant} conversationId: {var8.conversation_id or var8.friend_id}`)
				end
			end
			return httpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end,
		postRequestFunction = function(p5, p6)
			-- upvalues: var3 (ref), appChatNetworkingTelemetryModule (ref), var5 (ref), getFFlagDebugUnfilteredThreads (ref), httpService (ref), chunkAndLogString (ref)
			var3:debug(`Returned: [ requestMethod = "{p6.requestMethod}", url = "{p6.url}", statusCode = {p5.StatusCode}{if p5.HttpError ~= Enum.HttpError.OK then `, HttpError = {p5.HttpError}` else ""}]`)
			appChatNetworkingTelemetryModule.emit(var5, {
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
					local var11 = ""
					
					for i, v in if status then status.conversations else {} do
						var11 = `{var11}, {v.id} {v.moderation_type} {v.user_pending_status}`
					end
					chunkAndLogString(`RETURNED CONVERSATIONS{var11}`)
					
					return
				elseif string.find(p6.url, "get%-modal%-sequence") then
					var3:debug(`RETURNED MODAL VARIANT sequence: {p6.options and (p6.options.postBody and p6.options.postBody.modal_sequence)} variant: {status and status.modal_variant} conversationId: {conversationId}`)
				end
			end
		end,
		maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("AppChatNetworkingHttpRetryCount", 4) else nil
	})),
	logger = var3
}