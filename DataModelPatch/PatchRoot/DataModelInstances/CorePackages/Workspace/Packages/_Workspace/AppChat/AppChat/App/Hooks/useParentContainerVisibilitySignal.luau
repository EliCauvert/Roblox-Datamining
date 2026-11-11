local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local EnteredChatFromEntryPointModule = require(AppChat.Actions.EnteredChatFromEntryPoint)
local SetAppChatVisibleFunction = require(AppChat.App.AppChatVisible).setAppChatVisible
local ParentContainerContextModule = require(AppChat.Contexts.ParentContainer.ParentContainerContext)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: ReactModule (copy), ParentContainerContextModule (copy), UseDispatchFunction (copy), SetAppChatVisibleFunction (copy), EnteredChatFromEntryPointModule (copy)
	local UseContextResult = ReactModule.useContext(ParentContainerContextModule)
	local VisibilitySignal = UseContextResult.visibilitySignal
	local GetShouldSetAppChatVisibleFunction = UseContextResult.getShouldSetAppChatVisible
	local EntryPoint = UseContextResult.entryPoint
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: VisibilitySignal (copy), GetShouldSetAppChatVisibleFunction (copy), SetAppChatVisibleFunction (upval), UseDispatchResult (copy), EnteredChatFromEntryPointModule (upval), EntryPoint (copy)
		local Connection = nil
		Connection = VisibilitySignal:connect(function(...)
			-- upvalues: GetShouldSetAppChatVisibleFunction (upval), SetAppChatVisibleFunction (upval), UseDispatchResult (upval), EnteredChatFromEntryPointModule (upval), EntryPoint (upval)
			if GetShouldSetAppChatVisibleFunction(...) then
				SetAppChatVisibleFunction(true)
				UseDispatchResult(EnteredChatFromEntryPointModule(EntryPoint))
				
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