local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local panelsContextModule = require(script.Parent.PanelsContext)
local popoverManagerModule = require(script.Parent.Managers.PopoverManager)
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 27 | named "PanelsProvider" ]]
	-- upvalues: usePluginModule (ref), reactModule (ref), popoverManagerModule (ref), flagsModule (ref), panelsContextModule (ref)
	local var6 = usePluginModule()
	
	if var6 == nil then
		error("PanelsProvider must be used within a plugin context")
	end
	local var7 = reactModule.useMemo(function() --[[ line: 33 ]]
		-- upvalues: popoverManagerModule (copy), var6 (ref), p0 (ref)
		return popoverManagerModule.new(var6, p0.uriScope)
	end, { var6, p0.uriScope })
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: flagsModule (copy), var7 (ref)
		local var8 = if flagsModule.FoundationPopoverPluginPrewarmDepthPool then task.spawn(function() --[[ line: 40 ]]
			-- upvalues: var7 (copy)
			var7:prewarmPoolAsync(2)
		end) else nil
		
		return function() --[[ line: 45 ]]
			-- upvalues: var8 (write), var7 (copy)
			if var8 then
				task.cancel(var8)
			end
			var7:destroy()
		end
	end, { var7 })
	
	return reactModule.createElement(panelsContextModule.Provider, {
		value = {
			registerPopoverAsync = reactModule.useCallback(function(p1, p2, p3, p4, p5) --[[ line: 55 ]]
				-- upvalues: var7 (ref)
				local var9 = var7:openAtAsync({
					targetWidgetUri = p1,
					targetAnchorPoint = p2.targetAnchorPoint,
					subjectAnchorPoint = p2.subjectAnchorPoint,
					offset = p2.offset
				}, p3, p4, p5)
				
				return var9, function() --[[ line: 69 ]]
					-- upvalues: var9 (ref)
					var9.close()
				end
			end, { var7 })
		}
	}, p0.children)
end