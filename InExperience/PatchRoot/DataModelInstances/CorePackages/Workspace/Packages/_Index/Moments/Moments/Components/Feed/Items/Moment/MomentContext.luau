local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local momentsCommonModule = require(parent.MomentsCommon)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local createMomentStoreModule = require(script.Parent.createMomentStore)
local mediaPreloadProvider = momentsCommonModule.Media.MediaPreloadProvider
local t = { duration = 0.08, easingStyle = Enum.EasingStyle.Quad }
local var6 = reactModule.createContext(nil)

return table.freeze({
	Context = var6,
	Provider = function(p0)
		-- upvalues: reactModule (ref), createMomentStoreModule (ref), mediaPreloadProvider (ref), signalsModule (ref), reactOtterModule (ref), t (ref), var6 (ref)
		local data = p0.data
		local var7 = reactModule.useMemo(function()
			-- upvalues: createMomentStoreModule (copy), data (ref)
			return createMomentStoreModule(data)
		end, {})
		local var8 = mediaPreloadProvider.useMediaControllerProvider()
		local var9, var10 = reactModule.useState(nil)
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), var8 (ref), data (ref), var10 (ref)
			return signalsModule.createEffect(function(p1)
				-- upvalues: var8 (copy), data (copy), var10 (copy)
				if var8 == nil then return end
				local momentId = var8.getControllerMap(p1)[data.momentId]
				
				if momentId == nil then
					return
				end
				var10(momentId)
			end)
		end, { data.momentId, var8 })
		local var11, var12 = reactOtterModule.useAnimatedBinding(0)
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), var7 (ref), var12 (ref), reactOtterModule (copy), t (copy)
			return signalsModule.createEffect(function(p2)
				-- upvalues: var7 (copy), var12 (copy), reactOtterModule (copy), t (copy)
				var12(reactOtterModule.ease(if var7.getIsScrubbing(p2) then 1 else 0, t))
			end)
		end, { var7 })
		
		return reactModule.createElement(var6.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: data (ref), var9 (ref), var7 (ref), var11 (ref)
				return {
					momentId = data.momentId,
					controller = var9,
					store = var7,
					animationRatio = var11
				}
			end, { data.momentId, var9, var7, var11 })
		}, p0.children)
	end,
	useMoment = function()
		-- upvalues: reactModule (ref), var6 (ref)
		local var13 = reactModule.useContext(var6)
		
		if var13 == nil then
			error("useMoment must be used within a MomentProvider")
		end
		return var13
	end,
	SCRUB_FADE_SECONDS = t.duration
})