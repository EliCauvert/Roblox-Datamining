local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local elevationModule = require(script.Parent.elevation)
local elevationLayerModule = require(foundation.Enums.ElevationLayer)
local var4 = reactModule.createContext(nil)
local var5 = reactModule.createContext(nil)

return {
	ElevationProvider = function(p0)
		-- upvalues: reactModule (ref), elevationLayerModule (ref), elevationModule (ref), var4 (ref)
		local var6 = reactModule.useRef({
			[elevationLayerModule.Popover] = 0,
			[elevationLayerModule.Drawer] = 0,
			[elevationLayerModule.Sheet] = 0,
			[elevationLayerModule.Dialog] = 0,
			[elevationLayerModule.Notification] = 0
		})
		
		return reactModule.createElement(var4.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: elevationModule (copy), var6 (ref)
				return {
					acquire = function(p1, p2)
						-- upvalues: elevationModule (copy), var6 (copy)
						local var10
						local var7 = elevationModule.ELEVATION_LAYERS[p1]
						local var8 = -1
						local _ = nil
						local var9 = true
						
						if p2.owner then
							var10 = p2.owner.zIndex + 1
							local _ = p2.owner.zIndex <= var7.finish
						elseif p2.reserve then
							local var11 = var6.current[p1] or 0
							var10 = var7.start + (var11 + 1) * var7.step
							var6.current[p1] = var11 + 1
							var8 = var11
						else
							var10 = var7.start
						end
						if var9 and var7.finish < var10 then
							warn(string.format("Layer '%s' capacity exceeded (%d/%d). Capping zIndex at %d.", tostring(p1), var10, var7.finish, var7.finish))
							var10 = var7.finish
						end
						return { layer = p1, index = var8, zIndex = var10 }
					end,
					peek = function(p3)
						-- upvalues: var6 (copy)
						return var6.current[p3] or 0
					end,
					releaseIfTop = function(p4, p5)
						-- upvalues: var6 (copy)
						local var12 = var6.current[p4] or 0
						
						if p5 ~= nil and p5 >= 0 and p5 == var12 - 1 then
							var6.current[p4] = var12 - 1
						end
					end
				}
			end, {})
		}, p0.children)
	end,
	ElevationOwnerScope = function(p6)
		-- upvalues: reactModule (ref), var5 (ref)
		return reactModule.createElement(var5.Provider, { value = p6.owner }, p6.children)
	end,
	useElevationManager = function()
		-- upvalues: reactModule (ref), var4 (ref)
		local var13 = reactModule.useContext(var4)
		
		if not var13 then
			error("useElevationManager must be used under <ElevationProvider>")
		end
		return var13
	end,
	useOwnerToken = function()
		-- upvalues: reactModule (ref), var5 (ref)
		return reactModule.useContext(var5)
	end
}