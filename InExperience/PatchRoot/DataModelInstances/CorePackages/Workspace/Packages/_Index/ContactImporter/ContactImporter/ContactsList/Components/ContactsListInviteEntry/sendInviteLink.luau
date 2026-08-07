local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local useDispatch = dependenciesModule.useDispatch
local shareLinksNetworking = dependenciesModule.ShareLinksNetworking
local shareLinksRodux = dependenciesModule.ShareLinksRodux
local textKeysModule = require(contactImporter.Common.TextKeys)
local useLocalization = dependenciesModule.useLocalization
local roduxContacts = dependenciesModule.RoduxContacts
local react = dependenciesModule.React
local promise = dependenciesModule.Promise
local useAnalyticsModule = require(contactImporter.Analytics.useAnalytics)
local eventNamesModule = require(contactImporter.Analytics.Enums.EventNames)

local _ = function(p0) --[[ line: 20 ]]
	-- upvalues: promise (ref)
	return function(p1) --[[ line: 21 ]]
		-- upvalues: p0 (ref), promise (copy)
		return p0.smsProtocol:supportsSMS():andThen(function(p2) --[[ line: 22 ]]
			-- upvalues: p0 (copy), p1 (ref), promise (copy)
			return if p2 then p0.smsProtocol:sendSMS({ address = p0.address, message = p1 }) else promise.reject()
		end)
	end
end

return function(p3) --[[ line: 32 ]]
	-- upvalues: useDispatch (ref), react (ref), useAnalyticsModule (ref), eventNamesModule (ref), useLocalization (ref), textKeysModule (ref), shareLinksNetworking (ref), shareLinksRodux (ref), promise (ref), roduxContacts (ref)
	local var5 = useDispatch()
	local var6, var7 = react.useState(false)
	
	local var8 = function() --[[ line: 35 ]]
		-- upvalues: var7 (ref)
		var7(false)
	end
	
	local var9 = useAnalyticsModule()
	local var10 = nil
	
	local var11 = function() --[[ line: 41 ]]
		-- upvalues: var9 (ref), eventNamesModule (copy), var10 (write), var7 (ref)
		var9.fireAnalyticsEvent(eventNamesModule.InviteContact, { offNetworkFriendRequestLinkId = var10 })
		var7(false)
	end
	
	local var12 = useLocalization({ rootMessage = textKeysModule.SMS_DEFAULT_MESSAGE })
	
	local _ = function(p4) --[[ line: 51 ]]
		-- upvalues: var10 (write)
		return function(p5) --[[ line: 52 ]]
			-- upvalues: var10 (copy), p4 (ref)
			var10 = p5.responseBody.linkId
			
			return p5.responseBody.shortUrl .. "\n\n" .. p4.rootMessage
		end
	end
	
	return {
		sendInvite = function() --[[ line: 61 ]]
			-- upvalues: var7 (ref), var5 (ref), shareLinksNetworking (copy), shareLinksRodux (copy), var12 (ref), var10 (write), p3 (ref), promise (copy), roduxContacts (copy), var11 (ref), var8 (ref)
			var7(true)
			
			return var5(shareLinksNetworking.GenerateLink.API({
				linkType = shareLinksRodux.Enums.LinkType.FriendInvite.rawValue()
			})):andThen(function(p8) --[[ line: 52 ]]
				-- upvalues: var10 (copy), var12 (ref)
				var10 = p8.responseBody.linkId
				
				return p8.responseBody.shortUrl .. "\n\n" .. var12.rootMessage
			end):andThen(function(p6) --[[ line: 21 ]]
				-- upvalues: p3 (ref), promise (copy)
				return p3.smsProtocol:supportsSMS():andThen(function(p7) --[[ line: 22 ]]
					-- upvalues: p3 (copy), p6 (ref), promise (copy)
					return if p7 then p3.smsProtocol:sendSMS({ address = p3.address, message = p6 }) else promise.reject()
				end)
			end):andThen(var5(roduxContacts.Actions.RequestSent({ id = p3.deviceContactId }))):andThen(var11):catch(var8)
		end,
		isLoading = var6
	}
end