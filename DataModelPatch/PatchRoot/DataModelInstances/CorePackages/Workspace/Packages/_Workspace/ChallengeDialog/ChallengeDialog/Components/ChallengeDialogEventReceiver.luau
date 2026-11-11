local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local Parent = ChallengeDialog.Parent
local ReactModule = require(Parent.React)
local HttpRequestModule = require(Parent.HttpRequest)
local NavigateSidewaysFunction = require(Parent.NavigationRodux).Thunks.NavigateSideways
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ModalStateModule = require(ChallengeDialog.Enum.ModalState)
local FetchDialogModule = require(ChallengeDialog.Thunks.FetchDialog)
local GetFIntLuaAppChallengeDialogEventReceiverRetryIntervalSecondsModule = require(ChallengeDialog.Flags.GetFIntLuaAppChallengeDialogEventReceiverRetryIntervalSeconds)
local GetFIntLuaAppChallengeDialogEventReceiverRetryTimesModule = require(ChallengeDialog.Flags.GetFIntLuaAppChallengeDialogEventReceiverRetryTimes)
local GetFFlagLuaAppChallengeDialogFetchDialogConditionallyModule = require(ChallengeDialog.Flags.GetFFlagLuaAppChallengeDialogFetchDialogConditionally)
local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("ChallengeDialogEventReceiverHttpRetryCount", 4) else nil
})

return require(Parent.RoactRodux).connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateSidewaysFunction (copy), FetchDialogModule (copy)
	return {
		navigateToPage = function(p1, p2)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateSidewaysFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.sideways(NavigationCommands.fromLegacyPage(p1), p2) else Callback(NavigateSidewaysFunction(p1, p2))
		end,
		fetchDialog = function(ConfigResult)
			-- upvalues: Callback (copy), FetchDialogModule (upval)
			return Callback(FetchDialogModule(ConfigResult))
		end
	}
end)(function(p1)
	-- upvalues: ConfigResult (copy), ModalStateModule (copy), AppPage (copy), ReactModule (copy), GetFFlagLuaAppChallengeDialogFetchDialogConditionallyModule (copy), GetFIntLuaAppChallengeDialogEventReceiverRetryIntervalSecondsModule (copy), GetFIntLuaAppChallengeDialogEventReceiverRetryTimesModule (copy)
	local RobloxEventReceiver = p1.RobloxEventReceiver
	local ChallengeDialogNotification = 0
	local Flag = false
	
	local function v16()
		-- upvalues: p1 (copy), ConfigResult (upval), ModalStateModule (upval), AppPage (upval)
		p1.fetchDialog(ConfigResult):andThen(function(Result)
			-- upvalues: ModalStateModule (upval), p1 (upval), AppPage (upval)
			local Dialog = Result.dialogs[1]
			
			if Dialog ~= nil then
				p1.navigateToPage({
					name = AppPage.ChallengeDialogModalContainer,
					extraProps = {
						modalState = Dialog.isExpired and ModalStateModule.ChallengeDialogExpired or ModalStateModule.ChallengeDialogApproval,
						dialogItem = Dialog
					}
				})
			end
		end):catch(function(_) end):await()
	end
	
	ReactModule.useEffect(function()
		-- upvalues: RobloxEventReceiver (copy), GetFFlagLuaAppChallengeDialogFetchDialogConditionallyModule (upval), v16 (copy), ChallengeDialogNotification (ref), Flag (ref), GetFIntLuaAppChallengeDialogEventReceiverRetryIntervalSecondsModule (upval), GetFIntLuaAppChallengeDialogEventReceiverRetryTimesModule (upval)
		local list = {
			RobloxEventReceiver:observeEvent("signalR", function(ConnectionState, _, p2)
				-- upvalues: GetFFlagLuaAppChallengeDialogFetchDialogConditionallyModule (upval), v16 (upval), ChallengeDialogNotification (upval), Flag (upval)
				if ConnectionState == Enum.ConnectionState.Connected then
					if not GetFFlagLuaAppChallengeDialogFetchDialogConditionallyModule() then
						v16()
						
						return
					end
					if p2 and p2.ChallengeDialogNotification then
						if ChallengeDialogNotification ~= p2.ChallengeDialogNotification and not Flag then
							v16()
						end
						ChallengeDialogNotification = p2.ChallengeDialogNotification
					end
				end
			end),
			RobloxEventReceiver:observeEvent("ChallengeDialogNotification", function(p2)
				-- upvalues: ChallengeDialogNotification (upval), Flag (upval), v16 (upval)
				ChallengeDialogNotification = p2.SequenceNumber
				
				if not Flag then
					v16()
				end
			end),
			RobloxEventReceiver:observeEvent("AppInput", function(_, p2)
				-- upvalues: Flag (upval), GetFIntLuaAppChallengeDialogEventReceiverRetryIntervalSecondsModule (upval), GetFIntLuaAppChallengeDialogEventReceiverRetryTimesModule (upval), v16 (upval)
				if p2 == "Focused" then
					Flag = false
					local FIntLuaAppChallengeDialogEventReceiverRetryIntervalSecondsModule = GetFIntLuaAppChallengeDialogEventReceiverRetryIntervalSecondsModule()
					
					for i = 1, GetFIntLuaAppChallengeDialogEventReceiverRetryTimesModule() + 1 do
						task.delay(i * FIntLuaAppChallengeDialogEventReceiverRetryIntervalSecondsModule, v16)
					end
					return
				elseif p2 == "Unfocused" then
					Flag = true
					
					return
				else
					Flag = false
				end
			end)
		}
		
		return function()
			-- upvalues: list (copy)
			for _, value in pairs(list) do
				value:disconnect()
			end
		end
	end, {})
	
	return nil
end)