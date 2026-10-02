local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getCommentsSheetStoreModule = require(moments.Components.Comments.Sheet.getCommentsSheetStore)
local t = {
	duration = require(script.Parent.MomentContext).SCRUB_FADE_SECONDS,
	easingStyle = Enum.EasingStyle.Quad
}

return function(p1)
	-- upvalues: reactModule (ref), getCommentsSheetStoreModule (ref), signalsModule (ref), signalsReactModule (ref), reactOtterModule (ref), t (ref)
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: getCommentsSheetStoreModule (copy), signalsModule (copy), p1 (ref)
		local var2 = getCommentsSheetStoreModule(false)
		
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy), var2 (ref)
			return p1 ~= nil and (var2.getIsOpen(p2) and var2.getFeedItemId(p2) == p1)
		end)
	end, { p1 or false }))
	local var2, var3 = reactModule.useState(var1)
	local var4, var5 = reactOtterModule.useAnimatedBinding(if var1 then 1 else 0, reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		if p2 <= 0 then
			var3(false)
		end
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), var5 (ref), reactOtterModule (copy), t (copy)
		if var1 then
			var3(true)
		end
		var5(reactOtterModule.ease(if var1 then 1 else 0, t))
	end, { var1 })
	
	return if var1 or var2 then var4 else nil
end