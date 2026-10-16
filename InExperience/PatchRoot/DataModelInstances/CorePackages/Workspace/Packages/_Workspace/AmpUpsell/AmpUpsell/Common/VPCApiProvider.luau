local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local httpService = game:GetService("HttpService")
local VPCRequestTypeEnum = require(ampUpsell.Common.Enums).VPCRequestTypeEnum
local var1 = urlBuilder.new({
	path = "child-requests-api/v1/send-request-to-new-parent",
	base = urlBase.APIS
})
local var2 = urlBuilder.new({
	path = "child-requests-api/v1/send-request-to-all-parents",
	base = urlBase.APIS
})
local var3 = urlBuilder.new({
	path = "user-settings-api/v1/account-insights/parent-emails",
	base = urlBase.APIS
})

return {
	sendRequestToNewParent = function(p1, p2, p3, p4)
		-- upvalues: var1 (ref), VPCRequestTypeEnum (ref), httpService (ref)
		return p1(var1(), "POST", {
			postBody = httpService:JSONEncode({
				email = p2,
				requestType = if p3 == nil then VPCRequestTypeEnum.LinkToChild else p3[1],
				requestDetails = p4
			}),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):andThen(function(p5)
			return {
				sessionId = p5.responseBody.sessionId,
				lockedUntil = p5.responseBody.lockedUntil
			}
		end):catch(function(p5)
			-- upvalues: httpService (copy)
			local _, status = pcall(function()
				-- upvalues: httpService (copy), p5 (ref)
				return httpService:JSONDecode(p5.Body)
			end)
			error({ code = status.code, message = status.message })
		end)
	end,
	sendRequestToAllParents = function(p1, p2, p3)
		-- upvalues: var2 (ref), httpService (ref)
		return p1(var2(), "POST", {
			postBody = httpService:JSONEncode({ requestType = p2[1], requestDetails = p3 }),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):andThen(function(p4)
			return {
				sessionId = p4.responseBody.sessionId,
				lockedUntil = p4.responseBody.lockedUntil
			}
		end):catch(function(p4)
			-- upvalues: httpService (copy)
			local _, status = pcall(function()
				-- upvalues: httpService (copy), p4 (ref)
				return httpService:JSONDecode(p4.Body)
			end)
			error({ code = status.code, message = status.message })
		end)
	end,
	getLinkedParentEmails = function(p1)
		-- upvalues: var3 (ref)
		return p1(var3(), "GET", {
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):andThen(function(p2)
			return { parentEmails = p2.responseBody.parentEmails }
		end):catch(function(_)
			error({})
		end)
	end
}