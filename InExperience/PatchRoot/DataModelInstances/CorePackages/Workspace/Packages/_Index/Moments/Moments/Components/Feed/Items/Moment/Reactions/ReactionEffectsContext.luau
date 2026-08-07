local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local usePreferences = foundationModule.Hooks.usePreferences
local MAX_CONCURRENT_EXPLOSIONS = require(script.Parent.reactionsConstants).MAX_CONCURRENT_EXPLOSIONS
local var3 = reactModule.createContext(nil)

return {
	Context = var3,
	Provider = function(p0) --[[ line: 56 ]]
		-- upvalues: usePreferences (ref), reactModule (ref), signalsModule (ref), MAX_CONCURRENT_EXPLOSIONS (ref), var3 (ref)
		local reducedMotion = usePreferences().reducedMotion
		local var4 = reactModule.useRef(0)
		local var5 = reactModule.useRef(nil)
		local var6 = reactModule.useRef(reducedMotion)
		var6.current = reducedMotion
		local var7 = reactModule.useMemo(function() --[[ line: 65 ]]
			-- upvalues: signalsModule (copy)
			local var8, var9 = signalsModule.createSignal({})
			
			return { get = var8, set = var9 }
		end, {})
		
		return reactModule.createElement(var3.Provider, {
			value = reactModule.useMemo(function() --[[ line: 70 ]]
				-- upvalues: var5 (ref), var6 (ref), var7 (ref), MAX_CONCURRENT_EXPLOSIONS (copy), var4 (ref)
				return {
					spawnExplosion = function(p1, p2) --[[ line: 71 ]]
						-- upvalues: var5 (copy), var6 (copy), var7 (copy), MAX_CONCURRENT_EXPLOSIONS (copy), var4 (copy)
						local current = var5.current
						
						if var6.current or current == nil then return end
						local var10 = var7.get(false)
						
						if MAX_CONCURRENT_EXPLOSIONS <= #var10 then
							return
						end
						local var11 = if p2 ~= nil then current.AbsoluteSize / 2 else p2 - current.AbsolutePosition
						var4.current += 1
						local cloned = table.clone(var10)
						table.insert(cloned, {
							id = var4.current,
							reactionType = p1,
							originLocal = var11
						})
						var7.set(cloned)
					end,
					getExplosions = var7.get,
					onExplosionComplete = function(p3) --[[ line: 101 ]]
						-- upvalues: var7 (copy)
						local t = {}
						
						for i, v in var7.get(false) do
							if v.id ~= p3 then
								table.insert(t, v)
							end
						end
						var7.set(t)
					end,
					layerRef = var5
				}
			end, { var7 })
		}, p0.children)
	end,
	useReactionEffects = function() --[[ line: 125 ]]
		-- upvalues: reactModule (ref), var3 (ref)
		return reactModule.useContext(var3)
	end
}