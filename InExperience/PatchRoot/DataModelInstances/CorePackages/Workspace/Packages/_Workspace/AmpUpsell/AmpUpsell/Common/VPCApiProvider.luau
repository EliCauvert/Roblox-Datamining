local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local httpService = game:GetService("HttpService")
local VPCRequestTypeEnum = require(ampUpsell.Common.Enums).VPCRequestTypeEnum
local var2 = urlBuilder.new({
	path = "child-requests-api/v1/send-request-to-new-parent",
	base = urlBase.APIS
})
local var3 = urlBuilder.new({
	path = "child-requests-api/v1/send-request-to-all-parents",
	base = urlBase.APIS
})
local var4 = urlBuilder.new({
	path = "user-settings-api/v1/account-insights/parent-emails",
	base = urlBase.APIS
})

return {
	sendRequestToNewParent = function(p0, p1, p2, p3)
		-- upvalues: var2 (ref), VPCRequestTypeEnum (ref), httpService (ref)
		return p0(var2(), "POST", {
			postBody = httpService:JSONEncode({
				email = p1,
				requestType = if p2 == nil then VPCRequestTypeEnum.LinkToChild else p2[1],
				requestDetails = p3
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
		end):catch(function(p4)
			-- upvalues: httpService (copy)
			local _, status = pcall(function()
				-- upvalues: httpService (copy), p4 (ref)
				return httpService:JSONDecode(p4.Body)
			end)
			error({ code = status.code, message = status.message })
		end)
	end,
	sendRequestToAllParents = function(p6, p7, p8)
		-- upvalues: var3 (ref), httpService (ref)
		return p6(var3(), "POST", {
			postBody = httpService:JSONEncode({ requestType = p7[1], requestDetails = p8 }),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):andThen(function(p10)
			return {
				sessionId = p10.responseBody.sessionId,
				lockedUntil = p10.responseBody.lockedUntil
			}
		end):catch(function(p9)
			-- upvalues: httpService (copy)
			local _, status = pcall(function()
				-- upvalues: httpService (copy), p9 (ref)
				return httpService:JSONDecode(p9.Body)
			end)
			error({ code = status.code, message = status.message })
		end)
	end,
	getLinkedParentEmails = function(p11)
		-- upvalues: var4 (ref)
		return p11(var4(), "GET", {
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):andThen(function(p12)
			return { parentEmails = p12.responseBody.parentEmails }
		end):catch(function(_)
			error({})
		end)
	end
}