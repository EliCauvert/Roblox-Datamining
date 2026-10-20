local CorePackages = game:GetService("CorePackages")
local SendGameLinkMessageModule = require(script.Parent.Thunks.SendGameLinkMessage)
local ApiFetchGameDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails
local ApiFetchGameIconsFunction = require(CorePackages.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons
local ApiFetchPlaceInfosFunction = require(CorePackages.Workspace.Packages.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos
local SetAppLoadedModule = require(CorePackages.Workspace.Packages.AppChat.SetAppLoaded)
local RequestOlderConversationsModule = require(script:FindFirstAncestor("ShareTargetGame").ChatConversations.Thunks.requestOlderConversations)
local DEPRECATEDGetLocalUserConversationsModule = require(CorePackages.Workspace.Packages.AppChat.DEPRECATED_getLocalUserConversations)

return function(Callback)
	-- upvalues: DEPRECATEDGetLocalUserConversationsModule (copy), SendGameLinkMessageModule (copy), ApiFetchGameIconsFunction (copy), ApiFetchGameDetails (copy), SetAppLoadedModule (copy), ApiFetchPlaceInfosFunction (copy), RequestOlderConversationsModule (copy)
	local function FetchConversations(p1)
		-- upvalues: Callback (copy), DEPRECATEDGetLocalUserConversationsModule (upval)
		return Callback(DEPRECATEDGetLocalUserConversationsModule(p1, 30))
	end
	
	return {
		sendGameLinkToConversation = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), SendGameLinkMessageModule (upval)
			return Callback(SendGameLinkMessageModule(p1, p2, p3 or false, p4 or 0, p5 or 0))
		end,
		fetchGameData = function(p1, p2)
			-- upvalues: Callback (copy), ApiFetchGameIconsFunction (upval), ApiFetchGameDetails (upval)
			Callback(ApiFetchGameIconsFunction(p1, { p2 }))
			Callback(ApiFetchGameDetails.Fetch(p1, { p2 }))
		end,
		fetchConversations = FetchConversations,
		setAppLoaded = function()
			-- upvalues: Callback (copy), SetAppLoadedModule (upval)
			return Callback(SetAppLoadedModule(true))
		end,
		fetchPlaceInfos = function(p1, p2)
			-- upvalues: Callback (copy), ApiFetchPlaceInfosFunction (upval)
			return Callback(ApiFetchPlaceInfosFunction(p1, { p2 }))
		end,
		conversationListScrollTouchedBottom = function()
			-- upvalues: Callback (copy), RequestOlderConversationsModule (upval), FetchConversations (copy)
			return Callback(RequestOlderConversationsModule(FetchConversations, 30))
		end
	}
end