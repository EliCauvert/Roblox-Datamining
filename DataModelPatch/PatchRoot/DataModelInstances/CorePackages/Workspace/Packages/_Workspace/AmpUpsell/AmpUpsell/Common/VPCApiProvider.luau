local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local HttpService = game:GetService("HttpService")
local VPCRequestTypeEnum = require(AmpUpsell.Common.Enums).VPCRequestTypeEnum
local NewUrlBuilder = UrlBuilder.new({
	path = "child-requests-api/v1/send-request-to-new-parent",
	base = UrlBase.APIS
})
local NewUrlBuilder1 = UrlBuilder.new({
	path = "child-requests-api/v1/send-request-to-all-parents",
	base = UrlBase.APIS
})
local NewUrlBuilder2 = UrlBuilder.new({
	path = "user-settings-api/v1/account-insights/parent-emails",
	base = UrlBase.APIS
})

return {
	sendRequestToNewParent = function(Callback, Email, Entry, RequestDetails)
		-- upvalues: NewUrlBuilder (copy), VPCRequestTypeEnum (copy), HttpService (copy)
		return Callback(NewUrlBuilder(), "POST", {
			postBody = HttpService:JSONEncode({
				email = Email,
				requestType = Entry == nil and VPCRequestTypeEnum.LinkToChild or Entry[1],
				requestDetails = RequestDetails
			}),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):andThen(function(Result)
			return {
				sessionId = Result.responseBody.sessionId,
				lockedUntil = Result.responseBody.lockedUntil
			}
		end):catch(function(Err)
			-- upvalues: HttpService (upval)
			local _, Result = pcall(function()
				-- upvalues: HttpService (upval), Err (copy)
				return HttpService:JSONDecode(Err.Body)
			end)
			error({ code = Result.code, message = Result.message })
		end)
	end,
	sendRequestToAllParents = function(Callback, Entry, RequestDetails)
		-- upvalues: NewUrlBuilder1 (copy), HttpService (copy)
		return Callback(NewUrlBuilder1(), "POST", {
			postBody = HttpService:JSONEncode({ requestType = Entry[1], requestDetails = RequestDetails }),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):andThen(function(Result)
			return {
				sessionId = Result.responseBody.sessionId,
				lockedUntil = Result.responseBody.lockedUntil
			}
		end):catch(function(Err)
			-- upvalues: HttpService (upval)
			local _, Result = pcall(function()
				-- upvalues: HttpService (upval), Err (copy)
				return HttpService:JSONDecode(Err.Body)
			end)
			error({ code = Result.code, message = Result.message })
		end)
	end,
	getLinkedParentEmails = function(Callback)
		-- upvalues: NewUrlBuilder2 (copy)
		return Callback(NewUrlBuilder2(), "GET", {
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):andThen(function(Result)
			return { parentEmails = Result.responseBody.parentEmails }
		end):catch(function(_)
			error({})
		end)
	end
}