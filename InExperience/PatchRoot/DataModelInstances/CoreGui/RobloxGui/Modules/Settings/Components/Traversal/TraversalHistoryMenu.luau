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

local function historyToMenuItems(p0) --[[ line: 44 ]]
	-- upvalues: getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref)
	local t = {}
	
	for i, v in p0 do
		table.insert(t, {
			universeId = v.universeId,
			text = v.name,
			icon = getRbxThumb(thumbnailType.GameIcon, v.universeId, thumbnailSize.Small)
		})
	end
	return t
end

return reactModule.memo(reactModule.forwardRef(function(p1, _) --[[ line: 56 | named "TraversalHistoryMenu" ]]
	-- upvalues: reactModule (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref), useHistoryItems (ref), historyToMenuItems (ref), constants (ref), useTokens (ref), signalsReactModule (ref), reactPageSignalModule (ref), settingsShowSignal (ref), guiService (ref), userInputService (ref), getInputModeStore (ref), input (ref), utilityModule (ref), enumReactPageModule (ref), default (ref), view (ref), historyMenu (ref), traversalLeaveConfirmationModule (ref)
	local var16 = if fFlagAddTraversalHistoryReactMenuButtonsModule and p1.anchorRef then p1.anchorRef else reactModule.useRef(p1.anchorParent)
	local var17 = useHistoryItems()
	local var18 = reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: historyToMenuItems (copy), var17 (ref)
		return historyToMenuItems(var17)
	end, { var17 })
	local var19 = if p1.idleButtonStateIsDown ~= nil then constants.DEFAULT_CHEVRON_BUTTON_STATE else p1.idleButtonStateIsDown
	local var20, var21 = reactModule.useBinding(Enum.SelectionBehavior.Stop)
	local var22 = reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: var19 (ref), var20 (ref)
		return {
			SelectionBehaviorUp = if var19 then var20 else Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = if not var19 then var20 else Enum.SelectionBehavior.Stop
		}
	end, { var19 })
	local var23 = useTokens()
	local var24, var25 = reactModule.useState(constants.NO_UNIVERSE_ID)
	local var26 = signalsReactModule.useSignalState(reactPageSignalModule)
	local var27 = reactModule.useCallback(function(p2) --[[ line: 77 ]]
		-- upvalues: settingsShowSignal (copy), fFlagAddTraversalHistoryReactMenuButtonsModule (copy), p1 (ref), guiService (copy)
		return {
			onSettingsVisible = settingsShowSignal:connect(function(p3) --[[ line: 79 ]]
				-- upvalues: p2 (ref)
				if not p3 then
					p2()
				end
			end),
			onPageChanged = if fFlagAddTraversalHistoryReactMenuButtonsModule and not p1.currentPageChangeSignal then nil else p1.currentPageChangeSignal:connect(function() --[[ line: 85 ]]
				-- upvalues: p2 (ref)
				p2()
			end),
			onNativeClose = guiService.NativeClose:Connect(function() --[[ line: 89 ]]
				-- upvalues: p2 (ref)
				p2()
			end)
		}
	end, {
		p1.currentPageChangeSignal,
		settingsShowSignal,
		guiService.NativeClose
	})
	local var28 = reactModule.useCallback(function(p4) --[[ line: 96 ]]
		-- upvalues: var25 (ref), var21 (ref)
		var25(p4)
		var21(Enum.SelectionBehavior.Stop)
	end, { var25 })
	local var29 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var25 (ref), constants (copy), userInputService (copy), getInputModeStore (copy), input (copy), var16 (write), guiService (copy)
		var25(constants.NO_UNIVERSE_ID)
		local lastInputType = getInputModeStore().getLastInputType()
		
		if (if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true) and var16.current then
			guiService.SelectedCoreObject = var16.current
		end
	end, {})
	local var30 = reactModule.useCallback(function(p5) --[[ line: 111 ]]
		-- upvalues: var21 (ref)
		if p5 then
			var21(Enum.SelectionBehavior.Escape)
			
			return
		end
		var21(Enum.SelectionBehavior.Stop)
	end, {})
	local var31 = reactModule.useMemo(function() --[[ line: 119 ]]
		-- upvalues: fFlagAddTraversalHistoryReactMenuButtonsModule (copy), p1 (ref), var23 (ref)
		return if fFlagAddTraversalHistoryReactMenuButtonsModule and p1.isDarkOnDarkMode then var23.Color.Surface.Surface_0 else {
			Transparency = 0.33,
			Color3 = var23.Color.Stroke.Default.Color3
		}
	end, {})
	local var32 = utilityModule:IsSmallTouchScreen()
	local var33 = reactModule.useMemo(function() --[[ line: 132 ]]
		-- upvalues: var32 (ref)
		return {
			["padding-small"] = var32,
			["padding-medium"] = not var32
		}
	end, { var32 })
	local var34 = reactModule.useCallback(function() --[[ line: 139 ]]
		-- upvalues: var26 (ref), enumReactPageModule (copy), var21 (ref)
		var26.setCurrentReactPage(enumReactPageModule.TraversalHistory)
		var21(Enum.SelectionBehavior.Stop)
	end, { var26 })
	local var35 = reactModule.useMemo(function() --[[ line: 144 ]]
		-- upvalues: default (copy)
		return #default:getUniverseHistory() > 0
	end, {})
	
	if var35 then
		var35 = reactModule.createElement
		var35 = var35(view, {
			tag = "auto-xy row align-y-center size-0-full",
			selectionGroup = var22,
			ref = if fFlagAddTraversalHistoryReactMenuButtonsModule and not p1.anchorRef and not p1.anchorParent then var16 else nil
		}, {
			DividerLeft = reactModule.createElement(view, {
				Size = UDim2.new(0, var23.Stroke.Thick, 1, 0),
				backgroundStyle = var31
			}),
			HistoryMenu = reactModule.createElement(historyMenu, {
				historyButtonTags = var33,
				historyItems = var18,
				onHistorySelected = var34,
				onMenuItemSelected = var28,
				onMenuToggled = var30,
				closeMenuConn = var27,
				menuSide = p1.menuSide,
				ref = var16
			})
		}, {
			Dialog = reactModule.createElement(traversalLeaveConfirmationModule, {
				source = "history_dropdown",
				isDialogOpen = constants.NO_UNIVERSE_ID < var24,
				onCancel = var29,
				onClose = var29,
				universeId = var24
			})
		})
	end
	return var35
end))