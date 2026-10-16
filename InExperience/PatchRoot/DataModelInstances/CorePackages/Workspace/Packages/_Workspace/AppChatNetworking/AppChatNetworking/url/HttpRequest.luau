local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local Parent = AppChatNetworking.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local AppChatNetworking1 = require(Parent.Loggers).Logger:new("AppChat.Networking")
local AppChatNetworkingTelemetryModule = require(AppChatNetworking.analytics.AppChatNetworkingTelemetry)
local GetFFlagDebugUnfilteredThreadsFunction = require(Parent.SharedFlags).getFFlagDebugUnfilteredThreads
local AppChatNetworkResponse = require(Parent.SocialLuaAnalytics).Telemetry.new({
	name = "AppChat.NetworkResponse",
	description = "Event when a response is received from AppChat's networking layer",
	lastUpdated = { 2024, 10, 18 },
	backendsList = {
		{
			type = "RobloxTelemetryCounter",
			format = function(p1) --[[ Line: 23 ]]
				return {
					endpoint = string.match(string.match(p1.url, ".%w+/(.*)") or "", "([^?#]+)") or "unknown",
					statusCode = tostring(p1.statusCode),
					isOK = p1.isOK
				}
			end
		}
	}
})

local function chunkAndLogString(CONVERSATIONSName: string) --[[ Line: 41 ]]
	-- upvalues: AppChatNetworking1 (copy)
	local List = {}
	
	for i = 1, #CONVERSATIONSName, 800 do
		table.insert(List, CONVERSATIONSName:sub(i, i + 800 - 1))
	end
	for _, value in List do
		AppChatNetworking1:debug(value)
	end
end

return {
	default = require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper((HttpRequestModule.config({
		requestFunction = function(Text: string, p1, p2) --[[ Line: 53 ]]
			-- upvalues: AppChatNetworking1 (copy), GetFFlagDebugUnfilteredThreadsFunction (copy), chunkAndLogString (copy), HttpRequestModule (copy)
			AppChatNetworking1:info(`Fetching: [ requestMethod = "{p2}", url = "{Text}" ]`)
			
			if GetFFlagDebugUnfilteredThreadsFunction() then
				local PostBody = p2 and p2.postBody or {}
				
				if string.find(Text, "get%-conversations") then
					local v1 = ""
					
					for _, value in PostBody.ids or {} do
						v1 = `{v1}, {value}`
					end
					chunkAndLogString(`FETCHING CONVERSATIONS{v1}`)
				elseif string.find(Text, "get%-modal%-sequence") then
					AppChatNetworking1:debug(`FETCHING MODAL SEQUENCE sequence: {PostBody.modal_sequence} id: {PostBody.conversation_id or PostBody.friend_id}`)
				elseif string.find(Text, "record%-modal%-sequence%-response") then
					AppChatNetworking1:debug(`RECORDING MODAL SEQUENCE RESPONSE action: {PostBody.action_type} sequence: {PostBody.modal_sequence} id: {PostBody.modal_id} variant: {PostBody.modal_variant} conversationId: {PostBody.conversation_id or PostBody.friend_id}`)
				end
			end
			return HttpRequestModule.requestFunctions.RequestInternal(Text, p1, p2)
		end,
		postRequestFunction = function(p3, p4) --[[ Line: 78 ]]
			-- upvalues: AppChatNetworking1 (copy), AppChatNetworkingTelemetryModule (copy), AppChatNetworkResponse (copy), GetFFlagDebugUnfilteredThreadsFunction (copy), HttpService (copy), chunkAndLogString (copy)
			AppChatNetworking1:debug(`Returned: [ requestMethod = "{p5.requestMethod}", url = "{p5.url}", statusCode = {p3.StatusCode}{if p3.HttpError == Enum.HttpError.OK then "" else `, HttpError = {p3.HttpError}` or ""}]`)
			AppChatNetworkingTelemetryModule.emit(AppChatNetworkResponse, {
				url = p4.url,
				statusCode = p3.StatusCode,
				isOK = p3.HttpError == Enum.HttpError.OK
			})
			
			if GetFFlagDebugUnfilteredThreadsFunction() then
				local Success, Result = pcall(function() --[[ Line: 90 ]]
					-- upvalues: HttpService (upval), p3 (copy)
					return HttpService:JSONDecode(p3.Body)
				end)
				
				if not Success then return end
				local ConversationId = p4.options and (p4.options.postBody and (p4.options.postBody.conversation_id or p4.options.postBody.friend_id))
				
				if string.find(p4.url, "get%-user%-conversations") or string.find(p4.url, "get%-conversations") then
					local v2 = ""
					
					for _, value in Result and Result.conversations or {} do
						v2 = `{v2}, {value.id} {value.moderation_type} {value.user_pending_status}`
					end
					chunkAndLogString(`RETURNED CONVERSATIONS{v2}`)
					
					return
				elseif string.find(p4.url, "get%-modal%-sequence") then
					AppChatNetworking1:debug(`RETURNED MODAL VARIANT sequence: {p4.options and (p4.options.postBody and p4.options.postBody.modal_sequence)} variant: {Result and Result.modal_variant} conversationId: {ConversationId}`)
				end
			end
		end,
		maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("AppChatNetworkingHttpRetryCount", 4) else nil
	}))),
	logger = AppChatNetworking1
}