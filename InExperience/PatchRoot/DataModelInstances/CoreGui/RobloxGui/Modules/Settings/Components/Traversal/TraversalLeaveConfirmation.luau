local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local dataHydrationModule = require(corePackagesService.Workspace.Packages.DataHydration)
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local localizationModule = require(corePackagesService.Workspace.Packages.Localization)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local view = foundationModule.View
local getGameInfoStore = dataHydrationModule.Game.getGameInfoStore
local traversal = coreScriptsRoactCommonModule.Traversal
local constants = traversal.Constants
local teleportLeaveConfirmation = traversal.TeleportLeaveConfirmation
local useLocalization = localizationModule.Hooks.useLocalization
local getInputModeStore = responsiveModule.GetInputModeStore
local input = responsiveModule.Input

return reactModule.memo(function(p0) --[[ line: 36 | named "TraversalLeaveConfirmation" ]]
	-- upvalues: reactModule (ref), useLocalization (ref), signalsReactModule (ref), getGameInfoStore (ref), signalsModule (ref), userInputService (ref), getInputModeStore (ref), input (ref), constants (ref), contextActionService (ref), guiService (ref), view (ref), teleportLeaveConfirmation (ref)
	local name
	local var12 = reactModule.useRef(nil)
	local var13 = useLocalization({
		previous = "CoreScripts.TopBar.Traversal.BackButtonDefault"
	})
	local var14 = signalsReactModule.useSignalState(getGameInfoStore(false).getAndFetchGameInfo(tostring(p0.universeId)).data)
	local _ = nil
	local var15 = nil
	
	if typeof(var14) == "table" then
		name = var14.name
		var15 = tonumber(var14.rootPlaceId)
	else
		name = var13.previous
	end
	local var16 = reactModule.useCallback(function(_, p1) --[[ line: 53 ]]
		-- upvalues: p0 (ref)
		if p1 == Enum.UserInputState.End then
			p0.onCancel()
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, { p0.onCancel })
	reactModule.useEffect(function() --[[ line: 61 ]]
		-- upvalues: signalsModule (copy), userInputService (copy), getInputModeStore (copy), input (copy), var15 (write), constants (copy), contextActionService (copy), var16 (ref), guiService (copy), var12 (ref)
		local var17 = signalsModule.createEffect(function(p2) --[[ line: 62 ]]
			-- upvalues: userInputService (copy), getInputModeStore (copy), input (copy), var15 (copy), constants (copy), contextActionService (copy), var16 (copy), guiService (copy), var12 (copy)
			local lastInputType = getInputModeStore(p2).getLastInputType(p2)
			local var19 = if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true
			
			if var15 ~= nil and constants.NO_PLACE_ID < var15 then
				if var19 then
					contextActionService:BindCoreAction("FREEZE_CONTROLLER", function() --[[ line: 68 ]] end, false, Enum.UserInputType.Gamepad1)
					contextActionService:BindCoreAction("EXIT_DIALOG", var16, false, Enum.KeyCode.ButtonB)
					guiService.SelectedCoreObject = var12.current
					
					return
				end
			elseif var19 then
				contextActionService:UnbindCoreAction("FREEZE_CONTROLLER")
				contextActionService:UnbindCoreAction("EXIT_DIALOG")
			end
		end)
		
		return function() --[[ line: 79 ]]
			-- upvalues: var17 (ref)
			var17()
		end
	end, { var15 })
	
	return p0.isDialogOpen and (var15 and reactModule.createElement("ScreenGui", {
		DisplayOrder = 10,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		NoEscapeZone = reactModule.createElement(view, {
			tag = "auto-xy size-full",
			selectionGroup = {
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			}
		}, {
			Dialog = reactModule.createElement(teleportLeaveConfirmation, {
				onCancel = p0.onCancel,
				onClose = p0.onClose,
				placeId = var15,
				teleportName = name,
				source = p0.source,
				ref = var12
			})
		})
	}))
end)