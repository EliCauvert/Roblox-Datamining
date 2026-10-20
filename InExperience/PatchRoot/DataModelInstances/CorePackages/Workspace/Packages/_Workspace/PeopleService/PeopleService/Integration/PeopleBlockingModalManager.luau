local Parent = script:FindFirstAncestor("PeopleService").Parent
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SignalsModule = require(Parent.Signals)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local OnPersonBlockButtonActivatedModule = require(script.Parent.Parent.onPersonBlockButtonActivated)
local PeopleAnalyticsManagerModule = require(script.Parent.Parent.Analytics.PeopleAnalyticsManager)
local FocusNavigationServiceModule = require(script.Parent.Parent.FocusNavigationService)
local SettingsHubServiceModule = require(script.Parent.SettingsHubService)

return ((function()
	-- upvalues: Players (copy), SignalsModule (copy), FocusNavigationServiceModule (copy), ContextActionService (copy), OnPersonBlockButtonActivatedModule (copy), PeopleAnalyticsManagerModule (copy), UseSignalStateFunction (copy), ReactModule (copy), ReactFocusNavigationModule (copy), SettingsHubServiceModule (copy)
	local LocalPlayer = Players.LocalPlayer
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local v1 = nil
	
	return {
		closeModal = function()
			-- upvalues: FocusNavigationServiceModule (upval), Signal2 (copy), Signal2_1 (copy), ContextActionService (upval)
			FocusNavigationServiceModule.setBlockingModalRestoreMode(true)
			Signal2(false)
			Signal2_1(nil)
			ContextActionService:UnbindCoreAction("BlockingModalScreen")
		end,
		openModal = function(p1, p2, p3)
			-- upvalues: FocusNavigationServiceModule (upval), OnPersonBlockButtonActivatedModule (upval), PeopleAnalyticsManagerModule (upval), LocalPlayer (copy), v1 (ref), Signal2 (copy), Signal2_1 (copy), ContextActionService (upval)
			FocusNavigationServiceModule.saveScrollPosition()
			local OnPersonBlockButtonActivatedModuleResult = OnPersonBlockButtonActivatedModule(p1, PeopleAnalyticsManagerModule, LocalPlayer.UserId, p2, v1, p3)
			
			function OnPersonBlockButtonActivatedModuleResult.modalProps.closeModal()
				-- upvalues: OnPersonBlockButtonActivatedModuleResult (copy), FocusNavigationServiceModule (upval), Signal2 (upval), Signal2_1 (upval), ContextActionService (upval)
				OnPersonBlockButtonActivatedModuleResult.resolvePromise()
				FocusNavigationServiceModule.setBlockingModalRestoreMode(true)
				Signal2(false)
				Signal2_1(nil)
				ContextActionService:UnbindCoreAction("BlockingModalScreen")
			end
			
			Signal2_1(OnPersonBlockButtonActivatedModuleResult.modalProps)
			Signal2(true)
			
			return OnPersonBlockButtonActivatedModuleResult.promise
		end,
		getModalManager = function(p1, p2)
			-- upvalues: v1 (ref), UseSignalStateFunction (upval), Signal (copy), ReactModule (upval), ReactFocusNavigationModule (upval), Signal1 (copy), ContextActionService (upval), FocusNavigationServiceModule (upval), Signal2 (copy), Signal2_1 (copy), SettingsHubServiceModule (upval)
			v1 = p2
			
			return function()
				-- upvalues: UseSignalStateFunction (upval), Signal (upval), ReactModule (upval), ReactFocusNavigationModule (upval), Signal1 (upval), ContextActionService (upval), FocusNavigationServiceModule (upval), Signal2 (upval), Signal2_1 (upval), SettingsHubServiceModule (upval), p1 (copy)
				local UseSignalStateResult = UseSignalStateFunction(Signal)
				local UseContextResult = nil
				local UseRefResult = nil
				UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
				UseRefResult = ReactModule.useRef(false)
				local UseMemoResult = ReactModule.useMemo(function()
					-- upvalues: Signal1 (upval)
					return Signal1(false)
				end, { UseSignalStateResult })
				ReactModule.useEffect(function()
					-- upvalues: UseSignalStateResult (copy), ContextActionService (upval), FocusNavigationServiceModule (upval), Signal2 (upval), Signal2_1 (upval)
					if UseSignalStateResult then
						ContextActionService:BindCoreAction("BlockingModalScreen", function()
							-- upvalues: FocusNavigationServiceModule (upval), Signal2 (upval), Signal2_1 (upval), ContextActionService (upval)
							FocusNavigationServiceModule.setBlockingModalRestoreMode(true)
							Signal2(false)
							Signal2_1(nil)
							ContextActionService:UnbindCoreAction("BlockingModalScreen")
						end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
					else
						ContextActionService:UnbindCoreAction("BlockingModalScreen")
					end
					return function()
						-- upvalues: ContextActionService (upval)
						ContextActionService:UnbindCoreAction("BlockingModalScreen")
					end
				end, { UseSignalStateResult })
				ReactModule.useEffect(function()
					-- upvalues: UseRefResult (ref), UseSignalStateResult (copy), SettingsHubServiceModule (upval), UseContextResult (ref)
					if UseRefResult.current and not UseSignalStateResult then
						local PageRefResult = SettingsHubServiceModule.pageRef()
						
						if UseContextResult and PageRefResult then
							UseContextResult:focusGuiObject(PageRefResult, true)
						end
					end
					UseRefResult.current = UseSignalStateResult
				end, { UseSignalStateResult, UseContextResult })
				
				return if UseSignalStateResult and UseMemoResult then ReactModule.createElement(p1, UseMemoResult) else nil
			end
		end
	}
end)())