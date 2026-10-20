local ContactImporter = script:FindFirstAncestor("ContactImporter")
local DependenciesModule = require(ContactImporter.dependencies)
local UseDispatchFunction = DependenciesModule.useDispatch
local ShareLinksNetworking = DependenciesModule.ShareLinksNetworking
local ShareLinksRodux = DependenciesModule.ShareLinksRodux
local TextKeysModule = require(ContactImporter.Common.TextKeys)
local UseLocalizationFunction = DependenciesModule.useLocalization
local RoduxContacts = DependenciesModule.RoduxContacts
local React = DependenciesModule.React
local Promise = DependenciesModule.Promise
local UseAnalyticsModule = require(ContactImporter.Analytics.useAnalytics)
local EventNamesModule = require(ContactImporter.Analytics.Enums.EventNames)

local function _(p1)
	-- upvalues: Promise (copy)
	return function(Result)
		-- upvalues: p1 (copy), Promise (upval)
		return p1.smsProtocol:supportsSMS():andThen(function(Result1)
			-- upvalues: p1 (upval), Result (copy), Promise (upval)
			return if Result1 then p1.smsProtocol:sendSMS({ address = p1.address, message = Result }) else Promise.reject()
		end)
	end
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), React (copy), UseAnalyticsModule (copy), EventNamesModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ShareLinksNetworking (copy), ShareLinksRodux (copy), Promise (copy), RoduxContacts (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = React.useState(false)
	
	local function v14()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end
	
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local LinkId = nil
	
	local function v17()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), LinkId (ref), UseStateResult2 (copy)
		UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.InviteContact, { offNetworkFriendRequestLinkId = LinkId })
		UseStateResult2(false)
	end
	
	local UseLocalizationResult = UseLocalizationFunction({ rootMessage = TextKeysModule.SMS_DEFAULT_MESSAGE })
	
	local function _(p2)
		-- upvalues: LinkId (ref)
		return function(Result): string
			-- upvalues: LinkId (upval), p2 (copy)
			LinkId = Result.responseBody.linkId
			
			return Result.responseBody.shortUrl .. "\n\n" .. p2.rootMessage
		end
	end
	
	return {
		sendInvite = function()
			-- upvalues: UseStateResult2 (copy), UseDispatchResult (copy), ShareLinksNetworking (upval), ShareLinksRodux (upval), UseLocalizationResult (copy), LinkId (ref), p1 (copy), Promise (upval), RoduxContacts (upval), v17 (copy), v14 (copy)
			UseStateResult2(true)
			
			return UseDispatchResult(ShareLinksNetworking.GenerateLink.API({
				linkType = ShareLinksRodux.Enums.LinkType.FriendInvite.rawValue()
			})):andThen(function(Result): string
				-- upvalues: LinkId (upval), UseLocalizationResult (copy)
				LinkId = Result.responseBody.linkId
				
				return Result.responseBody.shortUrl .. "\n\n" .. UseLocalizationResult.rootMessage
			end):andThen(function(Result)
				-- upvalues: p1 (copy), Promise (upval)
				return p1.smsProtocol:supportsSMS():andThen(function(Result1)
					-- upvalues: p1 (upval), Result (copy), Promise (upval)
					return if Result1 then p1.smsProtocol:sendSMS({ address = p1.address, message = Result }) else Promise.reject()
				end)
			end):andThen(UseDispatchResult(RoduxContacts.Actions.RequestSent({ id = p1.deviceContactId }))):andThen(v17):catch(v14)
		end,
		isLoading = UseStateResult
	}
end