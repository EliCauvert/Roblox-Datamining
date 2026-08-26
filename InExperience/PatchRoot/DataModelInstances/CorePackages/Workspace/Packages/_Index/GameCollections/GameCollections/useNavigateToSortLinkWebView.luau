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
local var1 = tModule.strictInterface({
	action = tModule.string,
	linkPath = tModule.string,
	webViewSupported = tModule.boolean,
	gameSetTypeId = tModule.optional(tModule.string),
	durationInSeconds = tModule.optional(tModule.number)
})

local function _(p1)
	-- upvalues: var1 (ref), mutedError (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		mutedError(var3)
	end
end

return function()
	-- upvalues: useNavigation (ref), useAppPolicy (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), var1 (ref), mutedError (ref), urlBuilder (ref), default (ref), appPage (ref)
	local var2 = useNavigation()
	local var3 = useAppPolicy(function(p1)
		return p1.getWebViewSupport()
	end)
	local var4 = useRoactService(appEventIngestService)
	
	return reactModule.useCallback(function(p1, p2, p3, p4, p5)
		-- upvalues: var3 (ref), var1 (copy), mutedError (copy), var4 (ref), urlBuilder (copy), default (copy), var2 (ref), appPage (copy)
		local _ = function(p6, p7)
			-- upvalues: p1 (ref), p4 (ref), var3 (copy), var1 (copy), mutedError (copy), var4 (copy), p2 (ref)
			local t = {
				linkPath = p1,
				action = p6,
				gameSetTypeId = p4,
				webViewSupported = var3,
				durationInSeconds = p7
			}
			local var5, var6 = var1(t)
			
			if not var5 then
				mutedError(var6)
			end
			var4:sendEventDeferred(p2, "navigateToSortLink", t)
		end
		
		local t = {
			action = "click",
			durationInSeconds = nil,
			linkPath = p1,
			gameSetTypeId = p4,
			webViewSupported = var3
		}
		local var5, var6 = var1(t)
		
		if not var5 then
			mutedError(var6)
		end
		var4:sendEventDeferred(p2, "navigateToSortLink", t)
		
		if not var3 then
			warn("WebView is not supported on this platform")
			
			return
		end
		local var7 = urlBuilder.fromString(if string.find(p1, "/") == 1 then p1:gsub("/", "www:", 1) else p1)()
		local processTime = os.clock()
		local t_1 = {
			action = "open",
			durationInSeconds = nil,
			linkPath = p1,
			gameSetTypeId = p4,
			webViewSupported = var3
		}
		local var8, var9 = var1(t_1)
		
		if not var8 then
			mutedError(var9)
		end
		var4:sendEventDeferred(p2, "navigateToSortLink", t_1)
		default:isURLRegistered(var7):andThen(function(p6)
			-- upvalues: default (copy), var7 (ref), var2 (copy), appPage (copy), p3 (ref), processTime (ref), p1 (ref), p4 (ref), var3 (copy), var1 (copy), mutedError (copy), var4 (copy), p2 (ref), p5 (ref)
			if p6 then
				default:detectURL(var7)
				
				return
			end
			var2.navigate(appPage.GenericWebPage, {
				detail = var7,
				extraProps = {
					title = p3,
					onClose = function()
						-- upvalues: processTime (copy), p1 (copy), p4 (copy), var3 (copy), var1 (copy), mutedError (copy), var4 (copy), p2 (copy), p5 (copy)
						local t = {
							action = "close",
							linkPath = p1,
							gameSetTypeId = p4,
							webViewSupported = var3,
							durationInSeconds = os.clock() - processTime
						}
						local var10, var11 = var1(t)
						
						if not var10 then
							mutedError(var11)
						end
						var4:sendEventDeferred(p2, "navigateToSortLink", t)
						
						if p5 then
							p5()
						end
					end
				}
			})
		end)
	end, { var2, var3 })
end