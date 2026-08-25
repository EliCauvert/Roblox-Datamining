local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)

return if require(appChat.Flags.FFlagAppChatTopBarSignalsStore) then function(p0)
	-- upvalues: getTopBarStoreModule (ref), signalsReactModule (ref), reactModule (ref)
	local screenName = p0.screenName
	local render = p0.render
	local var4 = getTopBarStoreModule(false)
	local var5 = signalsReactModule.useSignalState(var4.getScreenTopBar(screenName))
	
	return render(reactModule.useMemo(function()
		-- upvalues: screenName (ref), var5 (ref), var4 (ref)
		return {
			getScreenTopBar = function(p1)
				-- upvalues: screenName (copy), var5 (copy), var4 (copy)
				return if p1 == screenName then var5 else var4.getScreenTopBar(p1)(false)
			end,
			setScreenTopBar = var4.setScreenTopBar
		}
	end, { screenName, var5 }))
end else require(appChat.TopBarContext).Consumer