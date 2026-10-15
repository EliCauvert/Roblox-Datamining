local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local listRecipientsStatusModule = require(script.Parent.ListRecipientsStatus)
local recipientListsModule = require(script.Parent.RecipientLists)
local _ = require(shareSheet.Types)
local _ = require(script.Parent.RecipientSource)
local t = {
	getResult = signalsModule.createSignal({
		nextPageToken = nil,
		isFetchingNextPage = false,
		recipients = {},
		status = listRecipientsStatusModule.Ready
	}),
	refresh = function() end,
	loadMore = function(_) end
}

return function(p1, p2)
	-- upvalues: reactModule (ref), recipientListsModule (ref), t (ref), signalsReactModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), recipientListsModule (copy), p1 (ref), t (copy)
		return if p2 then recipientListsModule[p1]() else t
	end, { p1, p2 })
	local var2 = signalsReactModule.useSignalState(var1.getResult)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.refresh()
	end, { var1 })
	
	return var2, var1
end