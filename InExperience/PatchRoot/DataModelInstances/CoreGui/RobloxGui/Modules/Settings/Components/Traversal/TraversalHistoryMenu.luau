local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local coreScriptsCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsCommon)
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local traversalLeaveConfirmationModule = require(script.Parent.TraversalLeaveConfirmation)
local parent = script.Parent.Parent.Parent
local enumReactPageModule = require(parent.EnumReactPage)
local reactPageSignalModule = require(parent.ReactPageSignal)
local utilityModule = require(parent.Utility)
local view = foundationModule.View
local thumbnailType = foundationModule.Enums.ThumbnailType
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local getRbxThumb = foundationModule.Utility.getRbxThumb
local settingsShowSignal = coreScriptsCommonModule.SettingsShowSignal
local traversal = coreScriptsRoactCommonModule.Traversal
local default = traversal.LocalTraversalHistory.default
local getInputModeStore = responsiveModule.GetInputModeStore
local input = responsiveModule.Input
local constants = traversal.Constants
local historyMenu = traversal.HistoryMenu
local useHistoryItems = traversal.useHistoryItems
local useTokens = foundationModule.Hooks.useTokens
local fFlagAddTraversalHistoryReactMenuButtonsModule = require(parent.Flags.FFlagAddTraversalHistoryReactMenuButtons)

local function historyToMenuItems(p1)
	-- upvalues: getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, {
			universeId = v.universeId,
			text = v.name,
			icon = getRbxThumb(thumbnailType.GameIcon, v.universeId, thumbnailSize.Small)
		})
	end
	return t
end

return reactModule.memo(reactModule.forwardRef(function(p2, _)
	-- upvalues: reactModule (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref), useHistoryItems (ref), historyToMenuItems (ref), constants (ref), useTokens (ref), signalsReactModule (ref), reactPageSignalModule (ref), settingsShowSignal (ref), guiService (ref), userInputService (ref), getInputModeStore (ref), input (ref), utilityModule (ref), enumReactPageModule (ref), default (ref), view (ref), historyMenu (ref), traversalLeaveConfirmationModule (ref)
	local var1 = if fFlagAddTraversalHistoryReactMenuButtonsModule and p2.anchorRef then p2.anchorRef else reactModule.useRef(p2.anchorParent)
	local var2 = useHistoryItems()
	local var3 = reactModule.useMemo(function()
		-- upvalues: historyToMenuItems (copy), var2 (ref)
		return historyToMenuItems(var2)
	end, { var2 })
	local var4 = if p2.idleButtonStateIsDown ~= nil then constants.DEFAULT_CHEVRON_BUTTON_STATE else p2.idleButtonStateIsDown
	local var5, var6 = reactModule.useBinding(Enum.SelectionBehavior.Stop)
	local var7 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var5 (ref)
		return {
			SelectionBehaviorUp = if var4 then var5 else Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = if not var4 then var5 else Enum.SelectionBehavior.Stop
		}
	end, { var4 })
	local var8 = useTokens()
	local var9, var10 = reactModule.useState(constants.NO_UNIVERSE_ID)
	local var11 = signalsReactModule.useSignalState(reactPageSignalModule)
	local var12 = reactModule.useCallback(function(p3)
		-- upvalues: settingsShowSignal (copy), fFlagAddTraversalHistoryReactMenuButtonsModule (copy), p2 (ref), guiService (copy)
		return {
			onSettingsVisible = settingsShowSignal:connect(function(p4)
				-- upvalues: p3 (ref)
				if not p4 then
					p3()
				end
			end),
			onPageChanged = if fFlagAddTraversalHistoryReactMenuButtonsModule and not p2.currentPageChangeSignal then nil else p2.currentPageChangeSignal:connect(function()
				-- upvalues: p3 (ref)
				p3()
			end),
			onNativeClose = guiService.NativeClose:Connect(function()
				-- upvalues: p3 (ref)
				p3()
			end)
		}
	end, {
		p2.currentPageChangeSignal,
		settingsShowSignal,
		guiService.NativeClose
	})
	local var13 = reactModule.useCallback(function(p3)
		-- upvalues: var10 (ref), var6 (ref)
		var10(p3)
		var6(Enum.SelectionBehavior.Stop)
	end, { var10 })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), constants (copy), userInputService (copy), getInputModeStore (copy), input (copy), var1 (write), guiService (copy)
		var10(constants.NO_UNIVERSE_ID)
		local lastInputType = getInputModeStore().getLastInputType()
		
		if (if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true) and var1.current then
			guiService.SelectedCoreObject = var1.current
		end
	end, {})
	local var15 = reactModule.useCallback(function(p3)
		-- upvalues: var6 (ref)
		if p3 then
			var6(Enum.SelectionBehavior.Escape)
			
			return
		end
		var6(Enum.SelectionBehavior.Stop)
	end, {})
	local var16 = reactModule.useMemo(function()
		-- upvalues: fFlagAddTraversalHistoryReactMenuButtonsModule (copy), p2 (ref), var8 (ref)
		return if fFlagAddTraversalHistoryReactMenuButtonsModule and p2.isDarkOnDarkMode then var8.Color.Surface.Surface_0 else {
			Transparency = 0.33,
			Color3 = var8.Color.Stroke.Default.Color3
		}
	end, {})
	local var17 = utilityModule:IsSmallTouchScreen()
	local var18 = reactModule.useMemo(function()
		-- upvalues: var17 (ref)
		return {
			["padding-small"] = var17,
			["padding-medium"] = not var17
		}
	end, { var17 })
	local var19 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), enumReactPageModule (copy), var6 (ref)
		var11.setCurrentReactPage(enumReactPageModule.TraversalHistory)
		var6(Enum.SelectionBehavior.Stop)
	end, { var11 })
	local var20 = reactModule.useMemo(function()
		-- upvalues: default (copy)
		return #default:getUniverseHistory() > 0
	end, {})
	
	if var20 then
		var20 = reactModule.createElement
		var20 = var20(view, {
			tag = "auto-xy row align-y-center size-0-full",
			selectionGroup = var7,
			ref = if fFlagAddTraversalHistoryReactMenuButtonsModule and not p2.anchorRef and not p2.anchorParent then var1 else nil
		}, {
			DividerLeft = reactModule.createElement(view, {
				Size = UDim2.new(0, var8.Stroke.Thick, 1, 0),
				backgroundStyle = var16
			}),
			HistoryMenu = reactModule.createElement(historyMenu, {
				historyButtonTags = var18,
				historyItems = var3,
				onHistorySelected = var19,
				onMenuItemSelected = var13,
				onMenuToggled = var15,
				closeMenuConn = var12,
				menuSide = p2.menuSide,
				ref = var1
			})
		}, {
			Dialog = reactModule.createElement(traversalLeaveConfirmationModule, {
				source = "history_dropdown",
				isDialogOpen = constants.NO_UNIVERSE_ID < var9,
				onCancel = var14,
				onClose = var14,
				universeId = var9
			})
		})
	end
	return var20
end))