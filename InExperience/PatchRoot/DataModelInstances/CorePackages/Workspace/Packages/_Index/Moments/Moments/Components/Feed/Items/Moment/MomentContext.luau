local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local momentsCommonModule = require(parent.MomentsCommon)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local createMomentStoreModule = require(script.Parent.createMomentStore)
local mediaPreloadProvider = momentsCommonModule.Media.MediaPreloadProvider
local t = { duration = 0.08, easingStyle = Enum.EasingStyle.Quad }
local var1 = reactModule.createContext(nil)

return table.freeze({
	Context = var1,
	Provider = function(p1)
		-- upvalues: reactModule (ref), createMomentStoreModule (ref), mediaPreloadProvider (ref), signalsModule (ref), reactOtterModule (ref), t (ref), var1 (ref)
		local data = p1.data
		local var2 = reactModule.useMemo(function()
			-- upvalues: createMomentStoreModule (copy), data (ref)
			return createMomentStoreModule(data)
		end, {})
		local var3 = mediaPreloadProvider.useMediaControllerProvider()
		local var4, var5 = reactModule.useState(nil)
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), var3 (ref), data (ref), var5 (ref)
			return signalsModule.createEffect(function(p2)
				-- upvalues: var3 (copy), data (copy), var5 (copy)
				if var3 == nil then return end
				local momentId = var3.getControllerMap(p2)[data.momentId]
				
				if momentId == nil then
					return
				end
				var5(momentId)
			end)
		end, { data.momentId, var3 })
		local var6, var7 = reactOtterModule.useAnimatedBinding(0)
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), var2 (ref), var7 (ref), reactOtterModule (copy), t (copy)
			return signalsModule.createEffect(function(p2)
				-- upvalues: var2 (copy), var7 (copy), reactOtterModule (copy), t (copy)
				var7(reactOtterModule.ease(if var2.getIsScrubbing(p2) then 1 else 0, t))
			end)
		end, { var2 })
		
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: data (ref), var4 (ref), var2 (ref), var6 (ref)
				return {
					momentId = data.momentId,
					controller = var4,
					store = var2,
					animationRatio = var6
				}
			end, { data.momentId, var4, var2, var6 })
		}, p1.children)
	end,
	useMoment = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		if var2 == nil then
			error("useMoment must be used within a MomentProvider")
		end
		return var2
	end,
	SCRUB_FADE_SECONDS = t.duration
})