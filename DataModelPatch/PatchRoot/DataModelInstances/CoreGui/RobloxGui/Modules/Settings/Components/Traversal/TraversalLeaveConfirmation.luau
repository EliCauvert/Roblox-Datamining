local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local View = require(CorePackages.Packages.Foundation).View
local GetGameInfoStoreFunction = require(CorePackages.Workspace.Packages.DataHydration).Game.getGameInfoStore
local Traversal = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal
local Constants = Traversal.Constants
local TeleportLeaveConfirmation = Traversal.TeleportLeaveConfirmation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local Input = ResponsiveModule.Input

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), SignalsReactModule (copy), GetGameInfoStoreFunction (copy), SignalsModule (copy), UserInputService (copy), GetInputModeStoreFunction (copy), Input (copy), Constants (copy), ContextActionService (copy), GuiService (copy), View (copy), TeleportLeaveConfirmation (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		previous = "CoreScripts.TopBar.Traversal.BackButtonDefault"
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetGameInfoStoreFunction(false).getAndFetchGameInfo((tostring(p1.universeId))).data)
	local Number: number? = nil
	local Name = nil
	
	if typeof(UseSignalStateResult) == "table" then
		Name = UseSignalStateResult.name
		Number = tonumber(UseSignalStateResult.rootPlaceId)
	else
		Name = UseLocalizationResult.previous
	end
	local UseResult = ReactModule.useCallback(function(_, UserInputState)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.End then
			p1.onCancel()
			
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end, { p1.onCancel })
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UserInputService (upval), GetInputModeStoreFunction (upval), Input (upval), Number (ref), Constants (upval), ContextActionService (upval), UseResult (copy), GuiService (upval), UseRefResult (copy)
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: UserInputService (upval), GetInputModeStoreFunction (upval), Input (upval), Number (upval), Constants (upval), ContextActionService (upval), UseResult (upval), GuiService (upval), UseRefResult (upval)
			local LastInputType = UserInputService:GetLastInputType()
			local LastInputType1 = GetInputModeStoreFunction(p2).getLastInputType(p2)
			local IsLastInputTypeMatch: boolean = LastInputType1 == Input.Directional or LastInputType1 == Input.Pointer and LastInputType == Enum.UserInputType.Keyboard
			
			if Number == nil or Constants.NO_PLACE_ID >= Number then
				if IsLastInputTypeMatch then
					ContextActionService:UnbindCoreAction("FREEZE_CONTROLLER")
					ContextActionService:UnbindCoreAction("EXIT_DIALOG")
				end
			elseif IsLastInputTypeMatch then
				ContextActionService:BindCoreAction("FREEZE_CONTROLLER", function() end, false, Enum.UserInputType.Gamepad1)
				ContextActionService:BindCoreAction("EXIT_DIALOG", UseResult, false, Enum.KeyCode.ButtonB)
				GuiService.SelectedCoreObject = UseRefResult.current
				
				return
			end
		end)
		
		return function()
			-- upvalues: Effect (copy)
			Effect()
		end
	end, { Number })
	
	return p1.isDialogOpen and (Number and ReactModule.createElement("ScreenGui", {
		DisplayOrder = 10,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		NoEscapeZone = ReactModule.createElement(View, {
			tag = "auto-xy size-full",
			selectionGroup = {
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			}
		}, {
			Dialog = ReactModule.createElement(TeleportLeaveConfirmation, {
				onCancel = p1.onCancel,
				onClose = p1.onClose,
				placeId = Number,
				teleportName = Name,
				source = p1.source,
				ref = UseRefResult
			})
		})
	}))
end)