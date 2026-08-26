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

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), signalsReactModule (ref), getGameInfoStore (ref), signalsModule (ref), userInputService (ref), getInputModeStore (ref), input (ref), constants (ref), contextActionService (ref), guiService (ref), view (ref), teleportLeaveConfirmation (ref)
	local name
	local var1 = reactModule.useRef(nil)
	local var2 = useLocalization({
		previous = "CoreScripts.TopBar.Traversal.BackButtonDefault"
	})
	local var3 = signalsReactModule.useSignalState(getGameInfoStore(false).getAndFetchGameInfo(tostring(p1.universeId)).data)
	local _ = nil
	local var4 = nil
	
	if typeof(var3) == "table" then
		name = var3.name
		var4 = tonumber(var3.rootPlaceId)
	else
		name = var2.previous
	end
	local var5 = reactModule.useCallback(function(_, p2)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.End then
			p1.onCancel()
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, { p1.onCancel })
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), userInputService (copy), getInputModeStore (copy), input (copy), var4 (write), constants (copy), contextActionService (copy), var5 (ref), guiService (copy), var1 (ref)
		local var6 = signalsModule.createEffect(function(p2)
			-- upvalues: userInputService (copy), getInputModeStore (copy), input (copy), var4 (copy), constants (copy), contextActionService (copy), var5 (copy), guiService (copy), var1 (copy)
			local lastInputType = getInputModeStore(p2).getLastInputType(p2)
			local var7 = if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true
			
			if var4 ~= nil and constants.NO_PLACE_ID < var4 then
				if var7 then
					contextActionService:BindCoreAction("FREEZE_CONTROLLER", function() end, false, Enum.UserInputType.Gamepad1)
					contextActionService:BindCoreAction("EXIT_DIALOG", var5, false, Enum.KeyCode.ButtonB)
					guiService.SelectedCoreObject = var1.current
					
					return
				end
			elseif var7 then
				contextActionService:UnbindCoreAction("FREEZE_CONTROLLER")
				contextActionService:UnbindCoreAction("EXIT_DIALOG")
			end
		end)
		
		return function()
			-- upvalues: var6 (ref)
			var6()
		end
	end, { var4 })
	
	return p1.isDialogOpen and (var4 and reactModule.createElement("ScreenGui", {
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
				onCancel = p1.onCancel,
				onClose = p1.onClose,
				placeId = var4,
				teleportName = name,
				source = p1.source,
				ref = var1
			})
		})
	}))
end)