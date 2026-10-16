local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)

return function(p1) --[[ Line: 17 | Named "TopBarFromStore" ]]
	-- upvalues: GetTopBarStoreModule (copy), SignalsReactModule (copy), ReactModule (copy)
	local ScreenName = p1.screenName
	local RenderFunction = p1.render
	local TopBarStoreModule = GetTopBarStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState((TopBarStoreModule.getScreenTopBar(ScreenName)))
	
	return RenderFunction((ReactModule.useMemo(function() --[[ Line: 25 ]]
		-- upvalues: ScreenName (copy), UseSignalStateResult (copy), TopBarStoreModule (copy)
		return {
			getScreenTopBar = function(ScreenName1) --[[ Line: 27 ]]
				-- upvalues: ScreenName (upval), UseSignalStateResult (upval), TopBarStoreModule (upval)
				return if ScreenName1 == ScreenName then UseSignalStateResult else TopBarStoreModule.getScreenTopBar(ScreenName1)(false)
			end,
			setScreenTopBar = TopBarStoreModule.setScreenTopBar
		}
	end, {
		ScreenName,
		UseSignalStateResult,
		TopBarStoreModule.getScreenTopBar,
		TopBarStoreModule.setScreenTopBar
	})))
end