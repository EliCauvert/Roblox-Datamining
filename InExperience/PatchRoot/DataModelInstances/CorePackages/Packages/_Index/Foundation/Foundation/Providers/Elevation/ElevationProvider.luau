local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local elevationModule = require(script.Parent.elevation)
local elevationLayerModule = require(foundation.Enums.ElevationLayer)
local var1 = reactModule.createContext(nil)
local var2 = reactModule.createContext(nil)

return {
	ElevationProvider = function(p1)
		-- upvalues: reactModule (ref), elevationLayerModule (ref), elevationModule (ref), var1 (ref)
		local var3 = reactModule.useRef({
			[elevationLayerModule.Popover] = 0,
			[elevationLayerModule.Drawer] = 0,
			[elevationLayerModule.Sheet] = 0,
			[elevationLayerModule.Dialog] = 0,
			[elevationLayerModule.Notification] = 0
		})
		
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: elevationModule (copy), var3 (ref)
				return {
					acquire = function(p2, p3)
						-- upvalues: elevationModule (copy), var3 (copy)
						local var4
						local var5 = elevationModule.ELEVATION_LAYERS[p2]
						local var6 = -1
						local _ = nil
						local var7 = true
						
						if p3.owner then
							var4 = p3.owner.zIndex + 1
							local _ = p3.owner.zIndex <= var5.finish
						elseif p3.reserve then
							local var8 = var3.current[p2] or 0
							var4 = var5.start + (var8 + 1) * var5.step
							var3.current[p2] = var8 + 1
							var6 = var8
						else
							var4 = var5.start
						end
						if var7 and var5.finish < var4 then
							warn(string.format("Layer '%s' capacity exceeded (%d/%d). Capping zIndex at %d.", tostring(p2), var4, var5.finish, var5.finish))
							var4 = var5.finish
						end
						return { layer = p2, index = var6, zIndex = var4 }
					end,
					peek = function(p2)
						-- upvalues: var3 (copy)
						return var3.current[p2] or 0
					end,
					releaseIfTop = function(p2, p3)
						-- upvalues: var3 (copy)
						local var4 = var3.current[p2] or 0
						
						if p3 ~= nil and p3 >= 0 and p3 == var4 - 1 then
							var3.current[p2] = var4 - 1
						end
					end
				}
			end, {})
		}, p1.children)
	end,
	ElevationOwnerScope = function(p1)
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.createElement(var2.Provider, { value = p1.owner }, p1.children)
	end,
	useElevationManager = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var3 = reactModule.useContext(var1)
		
		if not var3 then
			error("useElevationManager must be used under <ElevationProvider>")
		end
		return var3
	end,
	useOwnerToken = function()
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.useContext(var2)
	end
}