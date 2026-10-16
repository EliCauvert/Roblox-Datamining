local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UsePreferencesFunction = require(Parent.Foundation).Hooks.usePreferences
local MAXCONCURRENTEXPLOSIONS = require(script.Parent.reactionsConstants).MAX_CONCURRENT_EXPLOSIONS
local Context = ReactModule.createContext(nil)

return {
	Context = Context,
	Provider = function(p1) --[[ Line: 56 ]]
		-- upvalues: UsePreferencesFunction (copy), ReactModule (copy), SignalsModule (copy), MAXCONCURRENTEXPLOSIONS (copy), Context (copy)
		local ReducedMotion = UsePreferencesFunction().reducedMotion
		local UseRefResult = ReactModule.useRef(0)
		local UseRefResult1 = ReactModule.useRef(nil)
		local UseRefResult2 = ReactModule.useRef(ReducedMotion)
		UseRefResult2.current = ReducedMotion
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 65 ]]
			-- upvalues: SignalsModule (upval)
			local Signal, Signal2 = SignalsModule.createSignal({})
			
			return { get = Signal, set = Signal2 }
		end, {})
		
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useMemo(function() --[[ Line: 70 ]]
				-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), UseMemoResult (copy), MAXCONCURRENTEXPLOSIONS (upval), UseRefResult (copy)
				return {
					spawnExplosion = function(ReactionType, p2) --[[ Line: 71 ]]
						-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), UseMemoResult (upval), MAXCONCURRENTEXPLOSIONS (upval), UseRefResult (upval)
						local Current = UseRefResult1.current
						
						if UseRefResult2.current or Current == nil then return end
						local GetResult = UseMemoResult.get(false)
						
						if MAXCONCURRENTEXPLOSIONS > #GetResult then
							local AbsoluteSizeRatio = if p2 == nil then Current.AbsoluteSize / 2 else p2 - Current.AbsolutePosition
							UseRefResult.current += 1
							local Copy = table.clone(GetResult)
							table.insert(Copy, {
								id = UseRefResult.current,
								reactionType = ReactionType,
								originLocal = AbsoluteSizeRatio
							})
							UseMemoResult.set(Copy)
							
							return
						end
					end,
					getExplosions = UseMemoResult.get,
					onExplosionComplete = function(Id) --[[ Line: 101 ]]
						-- upvalues: UseMemoResult (upval)
						local List = {}
						
						for _, value in UseMemoResult.get(false) do
							if value.id ~= Id then
								table.insert(List, value)
							end
						end
						UseMemoResult.set(List)
					end,
					layerRef = UseRefResult1
				}
			end, { UseMemoResult })
		}, p1.children)
	end,
	useReactionEffects = function() --[[ Line: 125 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}