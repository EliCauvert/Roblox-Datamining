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
local fFlagTraversalHistoryMenuFocusNavFix = traversal.Flags.FFlagTraversalHistoryMenuFocusNavFix

local function historyToMenuItems(p0) --[[ line: 45 ]]
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

return reactModule.memo(reactModule.forwardRef(function(p1, _) --[[ line: 57 | named "TraversalHistoryMenu" ]]
	-- upvalues: reactModule (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref), useHistoryItems (ref), historyToMenuItems (ref), constants (ref), useTokens (ref), signalsReactModule (ref), reactPageSignalModule (ref), fFlagTraversalHistoryMenuFocusNavFix (ref), settingsShowSignal (ref), guiService (ref), userInputService (ref), getInputModeStore (ref), input (ref), utilityModule (ref), enumReactPageModule (ref), default (ref), view (ref), historyMenu (ref), traversalLeaveConfirmationModule (ref)
	local var16 = if fFlagAddTraversalHistoryReactMenuButtonsModule and p1.anchorRef then p1.anchorRef else reactModule.useRef(p1.anchorParent)
	local var17 = useHistoryItems()
	local var18 = reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: historyToMenuItems (copy), var17 (ref)
		return historyToMenuItems(var17)
	end, { var17 })
	local var19 = if p1.idleButtonStateIsDown ~= nil then constants.DEFAULT_CHEVRON_BUTTON_STATE else p1.idleButtonStateIsDown
	local var20, var21 = reactModule.useBinding(Enum.SelectionBehavior.Stop)
	local var22 = reactModule.useMemo(function() --[[ line: 69 ]]
		-- upvalues: var19 (ref), var20 (ref)
		return {
			SelectionBehaviorUp = if var19 then var20 else Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = if not var19 then var20 else Enum.SelectionBehavior.Stop
		}
	end, { var19 })
	local var23 = useTokens()
	local var24, var25 = reactModule.useState(constants.NO_UNIVERSE_ID)
	local var26 = signalsReactModule.useSignalState(reactPageSignalModule)
	local var27 = nil
	local _ = nil
	local var28 = nil
	
	if fFlagTraversalHistoryMenuFocusNavFix then
		var28 = reactModule.useCallback(function(p2) --[[ line: 81 ]]
			-- upvalues: settingsShowSignal (copy), fFlagAddTraversalHistoryReactMenuButtonsModule (copy), p1 (ref), guiService (copy)
			return {
				onSettingsVisible = settingsShowSignal:connect(function(p3) --[[ line: 83 ]]
					-- upvalues: p2 (ref)
					if not p3 then
						p2()
					end
				end),
				onPageChanged = if fFlagAddTraversalHistoryReactMenuButtonsModule and not p1.currentPageChangeSignal then nil else p1.currentPageChangeSignal:connect(function() --[[ line: 89 ]]
					-- upvalues: p2 (ref)
					p2()
				end),
				onNativeClose = guiService.NativeClose:Connect(function() --[[ line: 93 ]]
					-- upvalues: p2 (ref)
					p2()
				end)
			}
		end, {
			p1.currentPageChangeSignal,
			settingsShowSignal,
			guiService.NativeClose
		})
	else
		local var29, var30 = reactModule.useState(false)
		var27 = var29
		local var31 = var30
		reactModule.useEffect(function() --[[ line: 101 ]]
			-- upvalues: settingsShowSignal (copy), var31 (write), fFlagAddTraversalHistoryReactMenuButtonsModule (copy), p1 (ref), guiService (copy)
			local t = {
				onSettingsVisible = settingsShowSignal:connect(function(p4) --[[ line: 103 ]]
					-- upvalues: var31 (copy)
					if not p4 then
						var31(true)
					end
				end),
				onPageChanged = if fFlagAddTraversalHistoryReactMenuButtonsModule and not p1.currentPageChangeSignal then nil else p1.currentPageChangeSignal:connect(function() --[[ line: 109 ]]
					-- upvalues: var31 (copy)
					var31(true)
				end),
				onNativeClose = guiService.NativeClose:Connect(function() --[[ line: 113 ]]
					-- upvalues: var31 (copy)
					var31(true)
				end)
			}
			
			return function() --[[ line: 116 ]]
				-- upvalues: t (write)
				for i, v in t do
					v:Disconnect()
				end
				t = {}
			end
		end, {
			p1.currentPageChangeSignal,
			settingsShowSignal,
			guiService.NativeClose
		})
		reactModule.useEffect(function() --[[ line: 123 ]]
			-- upvalues: var27 (write), var31 (write)
			if var27 then
				var31(false)
			end
		end, { var27, var31 })
	end
	local var32 = reactModule.useCallback(function(p5) --[[ line: 131 ]]
		-- upvalues: var25 (ref), var21 (ref)
		var25(p5)
		var21(Enum.SelectionBehavior.Stop)
	end, { var25 })
	local var33 = reactModule.useCallback(function() --[[ line: 136 ]]
		-- upvalues: var25 (ref), constants (copy), userInputService (copy), getInputModeStore (copy), input (copy), var16 (write), guiService (copy)
		var25(constants.NO_UNIVERSE_ID)
		local lastInputType = getInputModeStore().getLastInputType()
		
		if (if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true) and var16.current then
			guiService.SelectedCoreObject = var16.current
		end
	end, {})
	local var34 = reactModule.useCallback(function(p6) --[[ line: 146 ]]
		-- upvalues: var21 (ref)
		if p6 then
			var21(Enum.SelectionBehavior.Escape)
			
			return
		end
		var21(Enum.SelectionBehavior.Stop)
	end, {})
	local var35 = reactModule.useMemo(function() --[[ line: 154 ]]
		-- upvalues: fFlagAddTraversalHistoryReactMenuButtonsModule (copy), p1 (ref), var23 (ref)
		return if fFlagAddTraversalHistoryReactMenuButtonsModule and p1.isDarkOnDarkMode then var23.Color.Surface.Surface_0 else {
			Transparency = 0.33,
			Color3 = var23.Color.Stroke.Default.Color3
		}
	end, {})
	local var36 = utilityModule:IsSmallTouchScreen()
	local var37 = reactModule.useMemo(function() --[[ line: 167 ]]
		-- upvalues: var36 (ref)
		return {
			["padding-small"] = var36,
			["padding-medium"] = not var36
		}
	end, { var36 })
	local var38 = reactModule.useCallback(function() --[[ line: 174 ]]
		-- upvalues: var26 (ref), enumReactPageModule (copy), fFlagTraversalHistoryMenuFocusNavFix (copy), var21 (ref)
		var26.setCurrentReactPage(enumReactPageModule.TraversalHistory)
		
		if fFlagTraversalHistoryMenuFocusNavFix then
			var21(Enum.SelectionBehavior.Stop)
		end
	end, { var26 })
	local var39 = reactModule.useMemo(function() --[[ line: 181 ]]
		-- upvalues: default (copy)
		return #default:getUniverseHistory() > 0
	end, {})
	
	if var39 then
		var39 = reactModule.createElement
		var39 = var39(view, {
			tag = "auto-xy row align-y-center size-0-full",
			selectionGroup = var22,
			ref = if fFlagAddTraversalHistoryReactMenuButtonsModule and not p1.anchorRef and not p1.anchorParent then var16 else nil
		}, {
			DividerLeft = reactModule.createElement(view, {
				Size = UDim2.new(0, var23.Stroke.Thick, 1, 0),
				backgroundStyle = var35
			}),
			HistoryMenu = reactModule.createElement(historyMenu, {
				historyButtonTags = var37,
				historyItems = var18,
				onHistorySelected = var38,
				onMenuItemSelected = var32,
				onMenuToggled = var34,
				forceMenuClose = if fFlagTraversalHistoryMenuFocusNavFix then nil else var27,
				closeMenuConn = if fFlagTraversalHistoryMenuFocusNavFix then var28 else nil,
				menuSide = p1.menuSide,
				ref = var16
			})
		}, {
			Dialog = reactModule.createElement(traversalLeaveConfirmationModule, {
				source = "history_dropdown",
				isDialogOpen = constants.NO_UNIVERSE_ID < var24,
				onCancel = var33,
				onClose = var33,
				universeId = var24
			})
		})
	end
	return var39
end))