local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local RecipientListsModule = require(script.Parent.RecipientLists)
local _ = require(ShareSheet.Types)
local _ = require(script.Parent.RecipientSource)
local config = {
	getResult = require(Parent.Signals).createSignal({
		nextPageToken = nil,
		isFetchingNextPage = false,
		recipients = {},
		status = require(script.Parent.ListRecipientsStatus).Ready
	}),
	refresh = function() end,
	loadMore = function(_) end
}

return function(p1, p2)
	-- upvalues: ReactModule (copy), RecipientListsModule (copy), config (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p2 (copy), RecipientListsModule (upval), p1 (copy), config (upval)
		return if p2 then RecipientListsModule[p1]() else config
	end, { p1, p2 })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.getResult)
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		UseMemoResult.refresh()
	end, { UseMemoResult })
	
	return UseSignalStateResult, UseMemoResult
end