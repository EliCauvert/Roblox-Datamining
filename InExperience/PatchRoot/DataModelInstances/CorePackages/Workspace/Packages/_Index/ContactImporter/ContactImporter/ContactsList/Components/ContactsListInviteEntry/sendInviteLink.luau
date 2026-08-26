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

local _ = function(p1)
	-- upvalues: promise (ref)
	return function(p2)
		-- upvalues: p1 (ref), promise (copy)
		return p1.smsProtocol:supportsSMS():andThen(function(p3)
			-- upvalues: p1 (copy), p2 (ref), promise (copy)
			return if p3 then p1.smsProtocol:sendSMS({ address = p1.address, message = p2 }) else promise.reject()
		end)
	end
end

return function(p1)
	-- upvalues: useDispatch (ref), react (ref), useAnalyticsModule (ref), eventNamesModule (ref), useLocalization (ref), textKeysModule (ref), shareLinksNetworking (ref), shareLinksRodux (ref), promise (ref), roduxContacts (ref)
	local var1 = useDispatch()
	local var2, var3 = react.useState(false)
	
	local var4 = function()
		-- upvalues: var3 (ref)
		var3(false)
	end
	
	local var5 = useAnalyticsModule()
	local var6 = nil
	
	local var7 = function()
		-- upvalues: var5 (ref), eventNamesModule (copy), var6 (write), var3 (ref)
		var5.fireAnalyticsEvent(eventNamesModule.InviteContact, { offNetworkFriendRequestLinkId = var6 })
		var3(false)
	end
	
	local var8 = useLocalization({ rootMessage = textKeysModule.SMS_DEFAULT_MESSAGE })
	
	local _ = function(p2)
		-- upvalues: var6 (write)
		return function(p3)
			-- upvalues: var6 (copy), p2 (ref)
			var6 = p3.responseBody.linkId
			
			return p3.responseBody.shortUrl .. "\n\n" .. p4.rootMessage
		end
	end
	
	return {
		sendInvite = function()
			-- upvalues: var3 (ref), var1 (ref), shareLinksNetworking (copy), shareLinksRodux (copy), var8 (ref), var6 (write), p1 (ref), promise (copy), roduxContacts (copy), var7 (ref), var4 (ref)
			var3(true)
			
			return var1(shareLinksNetworking.GenerateLink.API({
				linkType = shareLinksRodux.Enums.LinkType.FriendInvite.rawValue()
			})):andThen(function(p2)
				-- upvalues: var6 (copy), var8 (ref)
				var6 = p2.responseBody.linkId
				
				return p2.responseBody.shortUrl .. "\n\n" .. var12.rootMessage
			end):andThen(function(p2)
				-- upvalues: p1 (ref), promise (copy)
				return p1.smsProtocol:supportsSMS():andThen(function(p3)
					-- upvalues: p1 (copy), p2 (ref), promise (copy)
					return if p3 then p1.smsProtocol:sendSMS({ address = p1.address, message = p2 }) else promise.reject()
				end)
			end):andThen(var1(roduxContacts.Actions.RequestSent({ id = p1.deviceContactId }))):andThen(var7):catch(var4)
		end,
		isLoading = var2
	}
end