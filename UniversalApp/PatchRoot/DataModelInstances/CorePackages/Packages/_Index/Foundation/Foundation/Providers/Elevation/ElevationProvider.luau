local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ElevationModule = require(script.Parent.elevation)
local ElevationLayerModule = require(Foundation.Enums.ElevationLayer)
local Context = ReactModule.createContext(nil)
local Context1 = ReactModule.createContext(nil)

return {
	ElevationProvider = function(p1) --[[ Line: 24 ]]
		-- upvalues: ReactModule (copy), ElevationLayerModule (copy), ElevationModule (copy), Context (copy)
		local UseRefResult = ReactModule.useRef({
			[ElevationLayerModule.Popover] = 0,
			[ElevationLayerModule.Drawer] = 0,
			[ElevationLayerModule.Sheet] = 0,
			[ElevationLayerModule.Dialog] = 0,
			[ElevationLayerModule.Notification] = 0
		})
		
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useMemo(function() --[[ Line: 33 ]]
				-- upvalues: ElevationModule (upval), UseRefResult (copy)
				return {
					acquire = function(Layer, p2) --[[ Line: 35 ]]
						-- upvalues: ElevationModule (upval), UseRefResult (upval)
						local ELEVATIONLAYER = ElevationModule.ELEVATION_LAYERS[Layer]
						local Index = -1
						local IsZIndexBelow = true
						local NewZIndex = nil
						
						if p2.owner then
							NewZIndex = p2.owner.zIndex + 1
							IsZIndexBelow = p2.owner.zIndex <= ELEVATIONLAYER.finish
						elseif p2.reserve then
							local CurrentEntry = UseRefResult.current[Layer] or 0
							NewZIndex = ELEVATIONLAYER.start + (CurrentEntry + 1) * ELEVATIONLAYER.step
							UseRefResult.current[Layer] = CurrentEntry + 1
							Index = CurrentEntry
						else
							NewZIndex = ELEVATIONLAYER.start
						end
						if IsZIndexBelow and ELEVATIONLAYER.finish < NewZIndex then
							warn(string.format("Layer '%s' capacity exceeded (%d/%d). Capping zIndex at %d.", tostring(Layer), NewZIndex, ELEVATIONLAYER.finish, ELEVATIONLAYER.finish))
							NewZIndex = ELEVATIONLAYER.finish
						end
						return { layer = Layer, index = Index, zIndex = NewZIndex }
					end,
					peek = function(p2) --[[ Line: 68 ]]
						-- upvalues: UseRefResult (upval)
						return UseRefResult.current[p2] or 0
					end,
					releaseIfTop = function(p2, p3: number) --[[ Line: 71 ]]
						-- upvalues: UseRefResult (upval)
						local CurrentEntry = UseRefResult.current[p2] or 0
						
						if p3 ~= nil and p3 >= 0 and p3 == CurrentEntry - 1 then
							UseRefResult.current[p2] = CurrentEntry - 1
						end
					end
				}
			end, {})
		}, p1.children)
	end,
	ElevationOwnerScope = function(p1) --[[ Line: 86 ]]
		-- upvalues: ReactModule (copy), Context1 (copy)
		return ReactModule.createElement(Context1.Provider, { value = p1.owner }, p1.children)
	end,
	useElevationManager = function() --[[ Line: 90 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if not UseContextResult then
			error("useElevationManager must be used under <ElevationProvider>")
		end
		return UseContextResult
	end,
	useOwnerToken = function() --[[ Line: 100 ]]
		-- upvalues: ReactModule (copy), Context1 (copy)
		return (ReactModule.useContext(Context1))
	end
}