local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SignalsModule = require(Parent.Signals)
local CreateMomentStoreModule = require(script.Parent.createMomentStore)
local MediaPreloadProvider = require(Parent.MomentsCommon).Media.MediaPreloadProvider
local config = { duration = 0.08, easingStyle = Enum.EasingStyle.Quad }
local Context = ReactModule.createContext(nil)

return table.freeze({
	Context = Context,
	Provider = function(p1)
		-- upvalues: ReactModule (copy), CreateMomentStoreModule (copy), MediaPreloadProvider (copy), SignalsModule (copy), ReactOtterModule (copy), config (copy), Context (copy)
		local Data = p1.data
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: CreateMomentStoreModule (upval), Data (copy)
			return CreateMomentStoreModule(Data)
		end, {})
		local UseMediaControllerProviderResult = MediaPreloadProvider.useMediaControllerProvider()
		local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
		ReactModule.useEffect(function()
			-- upvalues: SignalsModule (upval), UseMediaControllerProviderResult (copy), Data (copy), UseStateResult2 (copy)
			return (SignalsModule.createEffect(function(p2)
				-- upvalues: UseMediaControllerProviderResult (upval), Data (upval), UseStateResult2 (upval)
				if UseMediaControllerProviderResult == nil then return end
				local Controller = UseMediaControllerProviderResult.getControllerMap(p2)[Data.momentId]
				
				if Controller ~= nil then
					UseStateResult2(Controller)
					
					return
				end
			end))
		end, { Data.momentId, UseMediaControllerProviderResult })
		local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
		ReactModule.useEffect(function()
			-- upvalues: SignalsModule (upval), UseMemoResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
			return (SignalsModule.createEffect(function(p2)
				-- upvalues: UseMemoResult (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
				UseAnimatedBindingResult2(ReactOtterModule.ease(if UseMemoResult.getIsScrubbing(p2) then 1 else 0, config))
			end))
		end, { UseMemoResult })
		
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: Data (copy), UseStateResult (copy), UseMemoResult (copy), UseAnimatedBindingResult (copy)
				return {
					momentId = Data.momentId,
					controller = UseStateResult,
					store = UseMemoResult,
					animationRatio = UseAnimatedBindingResult
				}
			end, {
				Data.momentId,
				UseStateResult,
				UseMemoResult,
				UseAnimatedBindingResult
			})
		}, p1.children)
	end,
	useMoment = function()
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if UseContextResult == nil then
			error("useMoment must be used within a MomentProvider")
		end
		return UseContextResult
	end,
	SCRUB_FADE_SECONDS = config.duration
})