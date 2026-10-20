local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetCommentsSheetStoreModule = require(Moments.Components.Comments.Sheet.getCommentsSheetStore)
local config = {
	duration = require(script.Parent.MomentContext).SCRUB_FADE_SECONDS,
	easingStyle = Enum.EasingStyle.Quad
}

return function(FeedItemId)
	-- upvalues: ReactModule (copy), GetCommentsSheetStoreModule (copy), SignalsModule (copy), SignalsReactModule (copy), ReactOtterModule (copy), config (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: GetCommentsSheetStoreModule (upval), SignalsModule (upval), FeedItemId (copy)
		local CommentsSheetStoreModule = GetCommentsSheetStoreModule(false)
		
		return SignalsModule.createComputed(function(p1): boolean
			-- upvalues: FeedItemId (upval), CommentsSheetStoreModule (copy)
			return FeedItemId ~= nil and (CommentsSheetStoreModule.getIsOpen(p1) and CommentsSheetStoreModule.getFeedItemId(p1) == FeedItemId)
		end)
	end, { FeedItemId or false })))
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSignalStateResult)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if UseSignalStateResult then 1 else 0, (ReactModule.useCallback(function(p1: number)
		-- upvalues: UseStateResult2 (copy)
		if p1 <= 0 then
			UseStateResult2(false)
		end
	end, {})))
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseStateResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		if UseSignalStateResult then
			UseStateResult2(true)
		end
		UseAnimatedBindingResult2(ReactOtterModule.ease(if UseSignalStateResult then 1 else 0, config))
	end, { UseSignalStateResult })
	
	return if UseSignalStateResult or UseStateResult then UseAnimatedBindingResult else nil
end