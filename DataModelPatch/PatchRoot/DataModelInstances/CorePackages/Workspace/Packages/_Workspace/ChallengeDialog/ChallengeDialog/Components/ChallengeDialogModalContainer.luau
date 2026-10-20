local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local Parent = ChallengeDialog.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local HttpRequestModule = require(Parent.HttpRequest)
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local ModalStateModule = require(ChallengeDialog.Enum.ModalState)
local FetchDialogModule = require(ChallengeDialog.Thunks.FetchDialog)
local GetFIntLuaAppChallengeDialogPollingIntervalSecondsModule = require(ChallengeDialog.Flags.GetFIntLuaAppChallengeDialogPollingIntervalSeconds)
local EventServiceModule = require(ChallengeDialog.Analytics.EventService)
local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("ChallengeDialogModalContainerHttpRetryCount", 4) else nil
})
local config = {
	[ModalStateModule.ChallengeDialogApproval] = require(ChallengeDialog.Components.ModalChallengeDialogApproval),
	[ModalStateModule.ChallengeDialogDenied] = require(ChallengeDialog.Components.ModalChallengeDialogDenied),
	[ModalStateModule.ChallengeDialogExpired] = require(ChallengeDialog.Components.ModalChallengeDialogExpired),
	[ModalStateModule.ChallengeDialogAlreadyCompleted] = require(ChallengeDialog.Components.ModalChallengeDialogAlreadyCompleted)
}

return require(Parent.RoactRodux).connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), FetchDialogModule (copy)
	return {
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackFunction())
		end,
		fetchDialog = function(ConfigResult)
			-- upvalues: Callback (copy), FetchDialogModule (upval)
			return Callback(FetchDialogModule(ConfigResult))
		end
	}
end)(function(p1)
	-- upvalues: ReactModule (copy), ModalStateModule (copy), EventServiceModule (copy), ConfigResult (copy), GetFIntLuaAppChallengeDialogPollingIntervalSecondsModule (copy), config (copy), CryoModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), ModalStateModule (upval), EventServiceModule (upval), p1 (copy)
		if UseStateResult.modalState == ModalStateModule.ChallengeDialogApproval or UseStateResult.modalState == ModalStateModule.ChallengeDialogExpired then
			EventServiceModule.sendDialogOpenedEvent(p1.dialogItem.type, p1.dialogItem.typeInternalId, p1.dialogItem.isExpired)
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), ModalStateModule (upval), p1 (copy), ConfigResult (upval), UseStateResult2 (copy), GetFIntLuaAppChallengeDialogPollingIntervalSecondsModule (upval)
		local SpawnedThread = task.spawn(function()
			-- upvalues: UseStateResult (upval), ModalStateModule (upval), p1 (upval), ConfigResult (upval), UseStateResult2 (upval), GetFIntLuaAppChallengeDialogPollingIntervalSecondsModule (upval)
			while UseStateResult.modalState == ModalStateModule.ChallengeDialogApproval or UseStateResult.modalState == ModalStateModule.ChallengeDialogExpired do
				p1.fetchDialog(ConfigResult):andThen(function(Result)
					-- upvalues: UseStateResult (upval), ModalStateModule (upval), UseStateResult2 (upval), p1 (upval)
					local Dialog = Result.dialogs[1]
					
					if Dialog == nil then
						p1.navigateBack()
					elseif UseStateResult.modalState == ModalStateModule.ChallengeDialogApproval and Dialog.isExpired then
						UseStateResult2({
							modalState = ModalStateModule.ChallengeDialogExpired,
							dialogItem = Dialog
						})
						
						return
					end
				end):catch(function(_) end):await()
				task.wait((GetFIntLuaAppChallengeDialogPollingIntervalSecondsModule()))
			end
		end)
		
		return function()
			-- upvalues: SpawnedThread (copy)
			task.cancel(SpawnedThread)
		end
	end, { UseStateResult.modalState })
	
	local function CloseModal()
		-- upvalues: p1 (copy), ConfigResult (upval), ModalStateModule (upval), UseStateResult2 (copy)
		p1.fetchDialog(ConfigResult):andThen(function(Result)
			-- upvalues: ModalStateModule (upval), UseStateResult2 (upval), p1 (upval)
			local Dialog = Result.dialogs[1]
			
			if Dialog == nil then
				p1.navigateBack()
				
				return
			else
				UseStateResult2({
					modalState = Dialog.isExpired and ModalStateModule.ChallengeDialogExpired or ModalStateModule.ChallengeDialogApproval,
					dialogItem = Dialog
				})
			end
		end):catch(function(_)
			-- upvalues: p1 (upval)
			p1.navigateBack()
		end):await()
	end
	
	local Entry = config[UseStateResult.modalState]
	
	return Entry and ReactModule.createElement(Entry, CryoModule.Dictionary.join(UseStateResult, {
		navigateToModalState = UseStateResult2,
		closeModal = CloseModal
	}))
end)