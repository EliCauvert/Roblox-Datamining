local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local EnteredChatFromEntryPointModule = require(AppChat.Actions.EnteredChatFromEntryPoint)
local SetAppChatVisibleFunction = require(AppChat.App.AppChatVisible).setAppChatVisible
local ParentContainerContextModule = require(AppChat.Contexts.ParentContainer.ParentContainerContext)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagAppChatDistinctUnibarEntryPoint = SharedFlagsModule.FFlagAppChatDistinctUnibarEntryPoint
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: ReactModule (copy), ParentContainerContextModule (copy), UseDispatchFunction (copy), SetAppChatVisibleFunction (copy), FFlagExpChatEnableFriendsTab (copy), FFlagAppChatDistinctUnibarEntryPoint (copy), EnteredChatFromEntryPointModule (copy)
	local UseContextResult = ReactModule.useContext(ParentContainerContextModule)
	local VisibilitySignal = UseContextResult.visibilitySignal
	local GetShouldSetAppChatVisibleFunction = UseContextResult.getShouldSetAppChatVisible
	local EntryPoint = UseContextResult.entryPoint
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: VisibilitySignal (copy), GetShouldSetAppChatVisibleFunction (copy), SetAppChatVisibleFunction (upval), FFlagExpChatEnableFriendsTab (upval), FFlagAppChatDistinctUnibarEntryPoint (upval), EntryPoint (copy), UseDispatchResult (copy), EnteredChatFromEntryPointModule (upval)
		local Connection = nil
		Connection = VisibilitySignal:connect(function(p1, p2)
			-- upvalues: GetShouldSetAppChatVisibleFunction (upval), SetAppChatVisibleFunction (upval), FFlagExpChatEnableFriendsTab (upval), FFlagAppChatDistinctUnibarEntryPoint (upval), EntryPoint (upval), UseDispatchResult (upval), EnteredChatFromEntryPointModule (upval)
			if GetShouldSetAppChatVisibleFunction(p1) then
				SetAppChatVisibleFunction(true)
				UseDispatchResult(EnteredChatFromEntryPointModule((FFlagExpChatEnableFriendsTab or FFlagAppChatDistinctUnibarEntryPoint) and p2 or EntryPoint))
				
				return
			else
				SetAppChatVisibleFunction(false)
			end
		end)
		
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:disconnect()
			end
		end
	end, {
		SetAppChatVisibleFunction,
		UseDispatchResult,
		VisibilitySignal,
		GetShouldSetAppChatVisibleFunction,
		EntryPoint
	})
end