local Parent = script.Parent.Parent
local LinkingProtocolModule = require(Parent.LinkingProtocol)
local DeepLinkSource = LinkingProtocolModule.Enums.DeepLinkSource
local Default = LinkingProtocolModule.LinkingProtocol.default
local IsSubjectToDesktopPoliciesFunction = require(Parent.SharedFlags).isSubjectToDesktopPolicies

return function(p1, p2)
	-- upvalues: Default (copy), DeepLinkSource (copy), IsSubjectToDesktopPoliciesFunction (copy)
	return pcall(function()
		-- upvalues: p2 (copy), Default (upval), p1 (copy), DeepLinkSource (upval), IsSubjectToDesktopPoliciesFunction (upval)
		if not p2 then
			Default:isURLRegistered(p1):andThen(function(Result)
				-- upvalues: Default (upval), p1 (upval), DeepLinkSource (upval)
				if not Result then return end
				if Default:isInternalDlicEnabled() then
					Default:detectDeeplinkIntent((Default:createInternalDlic(p1, DeepLinkSource.LuaInternal)))
					
					return
				else
					Default:detectURL(p1)
				end
			end)
			
			return
		end
		if Default:isInternalDlicEnabled() then
			local InternalDlic = Default:createInternalDlic(p1, DeepLinkSource.LuaInternal)
			
			if not IsSubjectToDesktopPoliciesFunction() then
				game:Shutdown()
			end
			Default:isURLRegistered(p1):andThen(function(Result)
				-- upvalues: Default (upval), InternalDlic (copy)
				if Result then
					Default:detectDeeplinkIntent(InternalDlic)
					
					return
				else
					game:Shutdown()
					Default:detectDeeplinkIntent(InternalDlic)
				end
			end)
			
			return
		else
			if not IsSubjectToDesktopPoliciesFunction() then
				game:Shutdown()
			end
			Default:isURLRegistered(p1):andThen(function(Result)
				-- upvalues: Default (upval), p1 (upval)
				if Result then
					Default:detectURL(p1)
					
					return
				else
					game:Shutdown()
					Default:detectURL(p1)
				end
			end)
		end
	end)
end