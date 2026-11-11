local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local TopBarContextModule = require(AppChat.TopBarContext)

local function TopBarFromStore(p1)
	-- upvalues: GetTopBarStoreModule (copy), SignalsReactModule (copy), ReactModule (copy)
	local ScreenName = p1.screenName
	local RenderFunction = p1.render
	local TopBarStoreModule = GetTopBarStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState((TopBarStoreModule.getScreenTopBar(ScreenName)))
	
	return RenderFunction((ReactModule.useMemo(function()
		-- upvalues: ScreenName (copy), UseSignalStateResult (copy), TopBarStoreModule (copy)
		return {
			getScreenTopBar = function(ScreenName1)
				-- upvalues: ScreenName (upval), UseSignalStateResult (upval), TopBarStoreModule (upval)
				return if ScreenName1 == ScreenName then UseSignalStateResult else TopBarStoreModule.getScreenTopBar(ScreenName1)(false)
			end,
			setScreenTopBar = TopBarStoreModule.setScreenTopBar
		}
	end, { ScreenName, UseSignalStateResult })))
end

return if require(AppChat.Flags.FFlagAppChatTopBarSignalsStore) then TopBarFromStore else TopBarContextModule.Consumer