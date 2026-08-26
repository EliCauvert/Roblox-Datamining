local parent = script:FindFirstAncestor("PeopleService").Parent
local contextActionService = game:GetService("ContextActionService")
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagIEMFocusNavPeoplePageToButtons = require(parent.SharedFlags).FFlagIEMFocusNavPeoplePageToButtons
local onPersonBlockButtonActivatedModule = require(script.Parent.Parent.onPersonBlockButtonActivated)
local peopleAnalyticsManagerModule = require(script.Parent.Parent.Analytics.PeopleAnalyticsManager)
local focusNavigationServiceModule = require(script.Parent.Parent.FocusNavigationService)
local settingsHubServiceModule = require(script.Parent.SettingsHubService)

return (function()
	-- upvalues: playersService (ref), signalsModule (ref), focusNavigationServiceModule (ref), contextActionService (ref), onPersonBlockButtonActivatedModule (ref), peopleAnalyticsManagerModule (ref), useSignalState (ref), fFlagIEMFocusNavPeoplePageToButtons (ref), reactModule (ref), reactFocusNavigationModule (ref), settingsHubServiceModule (ref)
	local localPlayer = playersService.LocalPlayer
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5 = nil
	
	return {
		closeModal = function()
			-- upvalues: focusNavigationServiceModule (copy), var2 (ref), var4 (ref), contextActionService (copy)
			focusNavigationServiceModule.setBlockingModalRestoreMode(true)
			var2(false)
			var4(nil)
			contextActionService:UnbindCoreAction("BlockingModalScreen")
		end,
		openModal = function(p1, p2, p3)
			-- upvalues: focusNavigationServiceModule (copy), onPersonBlockButtonActivatedModule (copy), peopleAnalyticsManagerModule (copy), localPlayer (ref), var5 (write), var2 (ref), var4 (ref), contextActionService (copy)
			focusNavigationServiceModule.saveScrollPosition()
			local var6 = onPersonBlockButtonActivatedModule(p1, peopleAnalyticsManagerModule, localPlayer.UserId, p2, var5, p3)
			
			function var14.modalProps.closeModal()
				-- upvalues: var6 (ref), focusNavigationServiceModule (copy), var2 (copy), var4 (copy), contextActionService (copy)
				var6.resolvePromise()
				focusNavigationServiceModule.setBlockingModalRestoreMode(true)
				var2(false)
				var4(nil)
				contextActionService:UnbindCoreAction("BlockingModalScreen")
			end
			
			var4(var6.modalProps)
			var2(true)
			
			return var6.promise
		end,
		getModalManager = function(p1, p2)
			-- upvalues: var5 (write), useSignalState (copy), var1 (ref), fFlagIEMFocusNavPeoplePageToButtons (copy), reactModule (copy), reactFocusNavigationModule (copy), var3 (ref), contextActionService (copy), focusNavigationServiceModule (copy), var2 (ref), var4 (ref), settingsHubServiceModule (copy)
			var5 = p2
			
			return function()
				-- upvalues: useSignalState (copy), var1 (copy), fFlagIEMFocusNavPeoplePageToButtons (copy), reactModule (copy), reactFocusNavigationModule (copy), var3 (copy), contextActionService (copy), focusNavigationServiceModule (copy), var2 (copy), var4 (copy), settingsHubServiceModule (copy), p1 (ref)
				local var6 = useSignalState(var1)
				local var7 = nil
				local var8 = nil
				
				if fFlagIEMFocusNavPeoplePageToButtons then
					var7 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
					var8 = reactModule.useRef(false)
				end
				local var9 = reactModule.useMemo(function()
					-- upvalues: var3 (copy)
					return var3(false)
				end, { var6 })
				reactModule.useEffect(function()
					-- upvalues: var6 (ref), contextActionService (copy), focusNavigationServiceModule (copy), var2 (copy), var4 (copy)
					if var6 then
						contextActionService:BindCoreAction("BlockingModalScreen", function()
							-- upvalues: focusNavigationServiceModule (copy), var2 (copy), var4 (copy), contextActionService (copy)
							focusNavigationServiceModule.setBlockingModalRestoreMode(true)
							var2(false)
							var4(nil)
							contextActionService:UnbindCoreAction("BlockingModalScreen")
						end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
					else
						contextActionService:UnbindCoreAction("BlockingModalScreen")
					end
					return function()
						-- upvalues: contextActionService (copy)
						contextActionService:UnbindCoreAction("BlockingModalScreen")
					end
				end, { var6 })
				
				if fFlagIEMFocusNavPeoplePageToButtons then
					reactModule.useEffect(function()
						-- upvalues: var8 (write), var6 (ref), settingsHubServiceModule (copy), var7 (write)
						if var8.current and not var6 then
							local var10 = settingsHubServiceModule.pageRef()
							
							if var7 and var10 then
								var7:focusGuiObject(var10, true)
							end
						end
						var8.current = var6
					end, { var6, var7 })
				end
				return if var6 and var9 then reactModule.createElement(p1, var9) else nil
			end
		end
	}
end)()