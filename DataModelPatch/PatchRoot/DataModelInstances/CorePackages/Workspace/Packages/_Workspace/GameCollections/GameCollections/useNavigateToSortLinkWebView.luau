local Parent = script:FindFirstAncestor("GameCollections").Parent
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local ReactModule = require(Parent.React)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local TModule = require(Parent.t)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local StrictInterfaceResult = TModule.strictInterface({
	action = TModule.string,
	linkPath = TModule.string,
	webViewSupported = TModule.boolean,
	gameSetTypeId = TModule.optional(TModule.string),
	durationInSeconds = TModule.optional(TModule.number)
})

local function _(p1)
	-- upvalues: StrictInterfaceResult (copy), MutedErrorFunction (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p1)
	
	if not StrictInterfaceResultResult then
		MutedErrorFunction(StrictInterfaceResultResult2)
	end
end

return function()
	-- upvalues: UseNavigationFunction (copy), UseAppPolicyFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), ReactModule (copy), StrictInterfaceResult (copy), MutedErrorFunction (copy), UrlBuilder (copy), Default (copy), AppPage (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getWebViewSupport()
	end)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	
	return ReactModule.useCallback(function(Text: string, p1, Title, GameSetTypeId, Callback)
		-- upvalues: UseAppPolicyResult (copy), StrictInterfaceResult (upval), MutedErrorFunction (upval), UseRoactServiceResult (copy), UrlBuilder (upval), Default (upval), UseNavigationResult (copy), AppPage (upval)
		local function _(Action, DurationInSeconds)
			-- upvalues: Text (copy), GameSetTypeId (copy), UseAppPolicyResult (upval), StrictInterfaceResult (upval), MutedErrorFunction (upval), UseRoactServiceResult (upval), p1 (copy)
			local config = {
				linkPath = Text,
				action = Action,
				gameSetTypeId = GameSetTypeId,
				webViewSupported = UseAppPolicyResult,
				durationInSeconds = DurationInSeconds
			}
			local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(config)
			
			if not StrictInterfaceResultResult then
				MutedErrorFunction(StrictInterfaceResultResult2)
			end
			UseRoactServiceResult:sendEventDeferred(p1, "navigateToSortLink", config)
		end
		
		local config = {
			action = "click",
			durationInSeconds = nil,
			linkPath = Text,
			gameSetTypeId = GameSetTypeId,
			webViewSupported = UseAppPolicyResult
		}
		local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(config)
		
		if not StrictInterfaceResultResult then
			MutedErrorFunction(StrictInterfaceResultResult2)
		end
		UseRoactServiceResult:sendEventDeferred(p1, "navigateToSortLink", config)
		
		if not UseAppPolicyResult then
			warn("WebView is not supported on this platform")
			
			return
		end
		local Detail = UrlBuilder.fromString(if string.find(Text, "/") == 1 then Text:gsub("/", "www:", 1) else Text)()
		local ClockTime = os.clock()
		local config1 = {
			action = "open",
			durationInSeconds = nil,
			linkPath = Text,
			gameSetTypeId = GameSetTypeId,
			webViewSupported = UseAppPolicyResult
		}
		local StrictInterfaceResultResult1, StrictInterfaceResultResult2_1 = StrictInterfaceResult(config1)
		
		if not StrictInterfaceResultResult1 then
			MutedErrorFunction(StrictInterfaceResultResult2_1)
		end
		UseRoactServiceResult:sendEventDeferred(p1, "navigateToSortLink", config1)
		Default:isURLRegistered(Detail):andThen(function(Result)
			-- upvalues: Default (upval), Detail (copy), UseNavigationResult (upval), AppPage (upval), Title (copy), ClockTime (copy), Text (copy), GameSetTypeId (copy), UseAppPolicyResult (upval), StrictInterfaceResult (upval), MutedErrorFunction (upval), UseRoactServiceResult (upval), p1 (copy), Callback (copy)
			if Result then
				Default:detectURL(Detail)
				
				return
			else
				UseNavigationResult.navigate(AppPage.GenericWebPage, {
					detail = Detail,
					extraProps = {
						title = Title,
						onClose = function()
							-- upvalues: ClockTime (upval), Text (upval), GameSetTypeId (upval), UseAppPolicyResult (upval), StrictInterfaceResult (upval), MutedErrorFunction (upval), UseRoactServiceResult (upval), p1 (upval), Callback (upval)
							local config = {
								action = "close",
								linkPath = Text,
								gameSetTypeId = GameSetTypeId,
								webViewSupported = UseAppPolicyResult,
								durationInSeconds = os.clock() - ClockTime
							}
							local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(config)
							
							if not StrictInterfaceResultResult then
								MutedErrorFunction(StrictInterfaceResultResult2)
							end
							UseRoactServiceResult:sendEventDeferred(p1, "navigateToSortLink", config)
							
							if Callback then
								Callback()
							end
						end
					}
				})
			end
		end)
	end, { UseNavigationResult, UseAppPolicyResult })
end