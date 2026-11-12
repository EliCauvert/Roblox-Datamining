local Parent = script:FindFirstAncestor("SponsoredTiles").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local LinkingProtocolModule = require(Parent.LinkingProtocol)
local DeepLinkSource = LinkingProtocolModule.Enums.DeepLinkSource
local Default = LinkingProtocolModule.LinkingProtocol.default

local function openWebView(p1, Detail)
	-- upvalues: AppPage (copy)
	p1.navigate(AppPage.GenericWebPage, {
		detail = Detail,
		extraProps = { showDomainAsTitle = true }
	})
end

return function(p1, Detail)
	-- upvalues: Default (copy), DiscoveryEventErrorLogger (copy), openWebView (copy), DeepLinkSource (copy)
	Default:isURLRegistered(Detail):catch(function(Err): boolean
		-- upvalues: DiscoveryEventErrorLogger (upval)
		DiscoveryEventErrorLogger.reportError("AdClickout_IsUrlRegisteredFailed", (tostring(Err)))
		
		return false
	end):andThen(function(Result)
		-- upvalues: openWebView (upval), p1 (copy), Detail (copy), Default (upval), DeepLinkSource (upval), DiscoveryEventErrorLogger (upval)
		if not Result then
			openWebView(p1, Detail)
			
			return
		end
		if Default:isInternalDlicEnabled() then
			local InternalDlic = Default:createInternalDlic(Detail, DeepLinkSource.LuaInternal)
			
			if InternalDlic ~= nil and InternalDlic ~= "" then
				Default:detectDeeplinkIntent(InternalDlic)
				
				return
			end
			DiscoveryEventErrorLogger.reportError("AdClickout_CreateInternalDlicFailed", Detail)
		end
		Default:detectURL(Detail)
	end):catch(function(Err)
		-- upvalues: DiscoveryEventErrorLogger (upval)
		DiscoveryEventErrorLogger.reportError("AdClickout_DeeplinkFailed", (tostring(Err)))
	end)
end