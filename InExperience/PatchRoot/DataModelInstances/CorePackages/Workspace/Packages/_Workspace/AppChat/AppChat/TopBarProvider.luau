local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)

return function(p1)
	-- upvalues: getTopBarStoreModule (ref), signalsReactModule (ref), reactModule (ref)
	local screenName = p1.screenName
	local render = p1.render
	local var1 = getTopBarStoreModule(false)
	local var2 = signalsReactModule.useSignalState(var1.getScreenTopBar(screenName))
	
	return render(reactModule.useMemo(function()
		-- upvalues: screenName (ref), var2 (ref), var1 (ref)
		return {
			getScreenTopBar = function(p2)
				-- upvalues: screenName (copy), var2 (copy), var1 (copy)
				return if p2 == screenName then var2 else var1.getScreenTopBar(p2)(false)
			end,
			setScreenTopBar = var1.setScreenTopBar
		}
	end, {
		screenName,
		var2,
		var1.getScreenTopBar,
		var1.setScreenTopBar
	}))
end