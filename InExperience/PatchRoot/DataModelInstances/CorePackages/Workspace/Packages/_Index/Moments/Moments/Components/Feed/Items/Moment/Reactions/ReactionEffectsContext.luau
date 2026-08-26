local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local usePreferences = foundationModule.Hooks.usePreferences
local MAX_CONCURRENT_EXPLOSIONS = require(script.Parent.reactionsConstants).MAX_CONCURRENT_EXPLOSIONS
local var1 = reactModule.createContext(nil)

return {
	Context = var1,
	Provider = function(p1)
		-- upvalues: usePreferences (ref), reactModule (ref), signalsModule (ref), MAX_CONCURRENT_EXPLOSIONS (ref), var1 (ref)
		local reducedMotion = usePreferences().reducedMotion
		local var2 = reactModule.useRef(0)
		local var3 = reactModule.useRef(nil)
		local var4 = reactModule.useRef(reducedMotion)
		var4.current = reducedMotion
		local var5 = reactModule.useMemo(function()
			-- upvalues: signalsModule (copy)
			local var6, var7 = signalsModule.createSignal({})
			
			return { get = var6, set = var7 }
		end, {})
		
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: var3 (ref), var4 (ref), var5 (ref), MAX_CONCURRENT_EXPLOSIONS (copy), var2 (ref)
				return {
					spawnExplosion = function(p2, p3)
						-- upvalues: var3 (copy), var4 (copy), var5 (copy), MAX_CONCURRENT_EXPLOSIONS (copy), var2 (copy)
						local current = var3.current
						
						if var4.current or current == nil then return end
						local var6 = var5.get(false)
						
						if MAX_CONCURRENT_EXPLOSIONS <= #var6 then
							return
						end
						local var7 = if p3 ~= nil then current.AbsoluteSize / 2 else p3 - current.AbsolutePosition
						var2.current += 1
						local cloned = table.clone(var6)
						table.insert(cloned, {
							id = var2.current,
							reactionType = p2,
							originLocal = var7
						})
						var5.set(cloned)
					end,
					getExplosions = var5.get,
					onExplosionComplete = function(p2)
						-- upvalues: var5 (copy)
						local t = {}
						
						for i, v in var5.get(false) do
							if v.id ~= p2 then
								table.insert(t, v)
							end
						end
						var5.set(t)
					end,
					layerRef = var3
				}
			end, { var5 })
		}, p1.children)
	end,
	useReactionEffects = function()
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}