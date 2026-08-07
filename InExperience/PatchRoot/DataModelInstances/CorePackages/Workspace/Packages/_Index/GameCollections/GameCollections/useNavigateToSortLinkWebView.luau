local parent = script:FindFirstAncestor("GameCollections").Parent
local useNavigation = require(parent.Navigation).useNavigation
local reactModule = require(parent.React)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local appPage = require(parent.RobloxAppEnums).AppPage
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local tModule = require(parent.t)
local mutedError = require(parent.Loggers).mutedError
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local var2 = tModule.strictInterface({
	action = tModule.string,
	linkPath = tModule.string,
	webViewSupported = tModule.boolean,
	gameSetTypeId = tModule.optional(tModule.string),
	durationInSeconds = tModule.optional(tModule.number)
})

local function _(p0) --[[ line: 28 | named "validateEventSchema" ]]
	-- upvalues: var2 (ref), mutedError (ref)
	local var3, var4 = var2(p0)
	
	if not var3 then
		mutedError(var4)
	end
end

return function() --[[ line: 36 | named "useNavigateToSortLinkWebView" ]]
	-- upvalues: useNavigation (ref), useAppPolicy (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), var2 (ref), mutedError (ref), urlBuilder (ref), default (ref), appPage (ref)
	local var5 = useNavigation()
	local var6 = useAppPolicy(function(p1) --[[ line: 38 ]]
		return p1.getWebViewSupport()
	end)
	local var7 = useRoactService(appEventIngestService)
	
	return reactModule.useCallback(function(p2, p3, p4, p5, p6) --[[ line: 44 ]]
		-- upvalues: var6 (ref), var2 (copy), mutedError (copy), var7 (ref), urlBuilder (copy), default (copy), var5 (ref), appPage (copy)
		local _ = function(p7, p8) --[[ line: 45 ]]
			-- upvalues: p2 (ref), p5 (ref), var6 (copy), var2 (copy), mutedError (copy), var7 (copy), p3 (ref)
			local t = {
				linkPath = p2,
				action = p7,
				gameSetTypeId = p5,
				webViewSupported = var6,
				durationInSeconds = p8
			}
			local var17, var18 = var2(t)
			
			if not var17 then
				mutedError(var18)
			end
			var7:sendEventDeferred(p3, "navigateToSortLink", t)
		end
		
		local t = {
			action = "click",
			durationInSeconds = nil,
			linkPath = p2,
			gameSetTypeId = p5,
			webViewSupported = var6
		}
		local var9, var10 = var2(t)
		
		if not var9 then
			mutedError(var10)
		end
		var7:sendEventDeferred(p3, "navigateToSortLink", t)
		
		if not var6 then
			warn("WebView is not supported on this platform")
			
			return
		end
		local var11 = urlBuilder.fromString(if string.find(p2, "/") == 1 then p2:gsub("/", "www:", 1) else p2)()
		local processTime = os.clock()
		local t_1 = {
			action = "open",
			durationInSeconds = nil,
			linkPath = p2,
			gameSetTypeId = p5,
			webViewSupported = var6
		}
		local var14, var15 = var2(t_1)
		
		if not var14 then
			mutedError(var15)
		end
		var7:sendEventDeferred(p3, "navigateToSortLink", t_1)
		default:isURLRegistered(var11):andThen(function(p9) --[[ line: 69 ]]
			-- upvalues: default (copy), var11 (ref), var5 (copy), appPage (copy), p4 (ref), processTime (ref), p2 (ref), p5 (ref), var6 (copy), var2 (copy), mutedError (copy), var7 (copy), p3 (ref), p6 (ref)
			if p9 then
				default:detectURL(var11)
				
				return
			end
			var5.navigate(appPage.GenericWebPage, {
				detail = var11,
				extraProps = {
					title = p4,
					onClose = function() --[[ line: 77 ]]
						-- upvalues: processTime (copy), p2 (copy), p5 (copy), var6 (copy), var2 (copy), mutedError (copy), var7 (copy), p3 (copy), p6 (copy)
						local t = {
							action = "close",
							linkPath = p2,
							gameSetTypeId = p5,
							webViewSupported = var6,
							durationInSeconds = os.clock() - processTime
						}
						local var20, var21 = var2(t)
						
						if not var20 then
							mutedError(var21)
						end
						var7:sendEventDeferred(p3, "navigateToSortLink", t)
						
						if p6 then
							p6()
						end
					end
				}
			})
		end)
	end, { var5, var6 })
end