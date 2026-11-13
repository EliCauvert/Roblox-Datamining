local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetMessageReactionsViewModelStoreModule = require(AppChat.Stores.GetMessageReactionsViewModelStore)

return function(p1)
	-- upvalues: ReactModule (copy), GetMessageReactionsViewModelStoreModule (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetMessageReactionsViewModelStoreModule (upval), p1 (copy)
		return GetMessageReactionsViewModelStoreModule(false).getReactionCounts(p1)
	end, { p1 })
	SignalsReactModule.useSignalState(UseMemoResult)
	
	return UseMemoResult(false)
end