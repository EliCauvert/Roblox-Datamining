-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local panelsContextModule = require(script.Parent.PanelsContext)
local popoverManagerModule = require(script.Parent.Managers.PopoverManager)
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 26 | named "PanelsProvider" ]]
	-- upvalues: usePluginModule (ref), reactModule (ref), popoverManagerModule (ref), panelsContextModule (ref)
	local var5 = usePluginModule()
	
	if var5 == nil then
		error("PanelsProvider must be used within a plugin context")
	end
	local var6 = reactModule.useMemo(function() --[[ line: 32 ]]
		-- upvalues: popoverManagerModule (copy), var5 (ref), p0 (ref)
		return popoverManagerModule.new(var5, p0.uriScope)
	end, { var5, p0.uriScope })
	reactModule.useEffect(function() --[[ line: 36 ]]
		-- upvalues: var6 (ref)
		local thread = task.spawn(function() --[[ line: 37 ]]
			-- upvalues: var6 (copy)
			var6:prewarmPoolAsync(2)
		end)
		
		return function() --[[ line: 41 ]]
			-- upvalues: thread (ref), var6 (copy)
			if thread then
				task.cancel(thread)
			end
			var6:destroy()
		end
	end, { var6 })
	
	return reactModule.createElement(panelsContextModule.Provider, {
		value = {
			registerPopoverAsync = reactModule.useCallback(function(p1, p2, p3, p4, p5) --[[ line: 51 ]]
				-- upvalues: var6 (ref)
				local var8 = var6:openAtAsync({
					targetWidgetUri = p1,
					targetAnchorPoint = p2.targetAnchorPoint,
					subjectAnchorPoint = p2.subjectAnchorPoint,
					offset = p2.offset
				}, p3, p4, p5)
				
				return var8, function() --[[ line: 65 ]]
					-- upvalues: var8 (ref)
					var8.close()
				end
			end, { var6 })
		}
	}, p0.children)
end