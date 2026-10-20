local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(ShareSheet.Types)
local Signal = require(Parent.Signals).createSignal(nil)

return function(p1, p2)
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), Signal (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p2 (copy), p1 (copy)
		return if p2 == "" or p1.search == nil then nil else p1.search(p2)
	end, { p1, p2 })
	local UseSignalStateResult = SignalsReactModule.useSignalState(if UseMemoResult then UseMemoResult.getResult else Signal)
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		if UseMemoResult then
			UseMemoResult.refresh()
		end
	end, { UseMemoResult })
	
	return {
		clientFilterQuery = if UseMemoResult then "" else p2,
		pageList = UseMemoResult or p1,
		result = if UseMemoResult then UseSignalStateResult else nil
	}
end