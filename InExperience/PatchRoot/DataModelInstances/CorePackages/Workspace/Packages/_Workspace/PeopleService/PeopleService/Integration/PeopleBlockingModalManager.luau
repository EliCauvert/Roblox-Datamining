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

return (function() --[[ line: 34 | named "createPeopleBlockingModalManager" ]]
	-- upvalues: playersService (ref), signalsModule (ref), focusNavigationServiceModule (ref), contextActionService (ref), onPersonBlockButtonActivatedModule (ref), peopleAnalyticsManagerModule (ref), useSignalState (ref), fFlagIEMFocusNavPeoplePageToButtons (ref), reactModule (ref), reactFocusNavigationModule (ref), settingsHubServiceModule (ref)
	local localPlayer = playersService.LocalPlayer
	local var9, var10 = signalsModule.createSignal(false)
	local var11, var12 = signalsModule.createSignal(nil)
	local var13 = nil
	
	return {
		closeModal = function() --[[ line: 46 ]]
			-- upvalues: focusNavigationServiceModule (copy), var10 (ref), var12 (ref), contextActionService (copy)
			focusNavigationServiceModule.setBlockingModalRestoreMode(true)
			var10(false)
			var12(nil)
			contextActionService:UnbindCoreAction("BlockingModalScreen")
		end,
		openModal = function(p0, p1, p2) --[[ line: 53 ]]
			-- upvalues: focusNavigationServiceModule (copy), onPersonBlockButtonActivatedModule (copy), peopleAnalyticsManagerModule (copy), localPlayer (ref), var13 (write), var10 (ref), var12 (ref), contextActionService (copy)
			focusNavigationServiceModule.saveScrollPosition()
			local var14 = onPersonBlockButtonActivatedModule(p0, peopleAnalyticsManagerModule, localPlayer.UserId, p1, var13, p2)
			
			function var14.modalProps.closeModal() --[[ line: 65 ]]
				-- upvalues: var14 (ref), focusNavigationServiceModule (copy), var10 (copy), var12 (copy), contextActionService (copy)
				var14.resolvePromise()
				focusNavigationServiceModule.setBlockingModalRestoreMode(true)
				var10(false)
				var12(nil)
				contextActionService:UnbindCoreAction("BlockingModalScreen")
			end
			
			var12(var14.modalProps)
			var10(true)
			
			return var14.promise
		end,
		getModalManager = function(p3, p4) --[[ line: 76 ]]
			-- upvalues: var13 (write), useSignalState (copy), var9 (ref), fFlagIEMFocusNavPeoplePageToButtons (copy), reactModule (copy), reactFocusNavigationModule (copy), var11 (ref), contextActionService (copy), focusNavigationServiceModule (copy), var10 (ref), var12 (ref), settingsHubServiceModule (copy)
			var13 = p4
			
			return function() --[[ line: 80 | named "BlockingModalManager" ]]
				-- upvalues: useSignalState (copy), var9 (copy), fFlagIEMFocusNavPeoplePageToButtons (copy), reactModule (copy), reactFocusNavigationModule (copy), var11 (copy), contextActionService (copy), focusNavigationServiceModule (copy), var10 (copy), var12 (copy), settingsHubServiceModule (copy), p3 (ref)
				local var15 = useSignalState(var9)
				local var16 = nil
				local var17 = nil
				
				if fFlagIEMFocusNavPeoplePageToButtons then
					var16 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
					var17 = reactModule.useRef(false)
				end
				local var18 = reactModule.useMemo(function() --[[ line: 89 ]]
					-- upvalues: var11 (copy)
					return var11(false)
				end, { var15 })
				reactModule.useEffect(function() --[[ line: 94 ]]
					-- upvalues: var15 (ref), contextActionService (copy), focusNavigationServiceModule (copy), var10 (copy), var12 (copy)
					if var15 then
						contextActionService:BindCoreAction("BlockingModalScreen", function() --[[ line: 96 ]]
							-- upvalues: focusNavigationServiceModule (copy), var10 (copy), var12 (copy), contextActionService (copy)
							focusNavigationServiceModule.setBlockingModalRestoreMode(true)
							var10(false)
							var12(nil)
							contextActionService:UnbindCoreAction("BlockingModalScreen")
						end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
					else
						contextActionService:UnbindCoreAction("BlockingModalScreen")
					end
					return function() --[[ line: 103 ]]
						-- upvalues: contextActionService (copy)
						contextActionService:UnbindCoreAction("BlockingModalScreen")
					end
				end, { var15 })
				
				if fFlagIEMFocusNavPeoplePageToButtons then
					reactModule.useEffect(function() --[[ line: 114 ]]
						-- upvalues: var17 (write), var15 (ref), settingsHubServiceModule (copy), var16 (write)
						if var17.current and not var15 then
							local var19 = settingsHubServiceModule.pageRef()
							
							if var16 and var19 then
								var16:focusGuiObject(var19, true)
							end
						end
						var17.current = var15
					end, { var15, var16 })
				end
				return if var15 and var18 then reactModule.createElement(p3, var18) else nil
			end
		end
	}
end)()