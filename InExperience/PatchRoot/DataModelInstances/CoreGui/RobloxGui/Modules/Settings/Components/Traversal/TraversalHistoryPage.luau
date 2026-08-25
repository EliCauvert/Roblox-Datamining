local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local reactPageSignalModule = require(script.Parent.Parent.Parent.ReactPageSignal)
local traversalLeaveConfirmationModule = require(script.Parent.TraversalLeaveConfirmation)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local thumbnailType = foundationModule.Enums.ThumbnailType
local view = foundationModule.View
local traversal = coreScriptsRoactCommonModule.Traversal
local default = traversal.LocalTraversalHistory.default
local getInputModeStore = responsiveModule.GetInputModeStore
local input = responsiveModule.Input
local constants = traversal.Constants
local historyPage = traversal.HistoryPage
local useHistoryItems = traversal.useHistoryItems
local fIntMaximumTraversalHistoryItemsFetch = traversal.Flags.FIntMaximumTraversalHistoryItemsFetch
local fFlagTraversalExpPagePaddingFixes = traversal.Flags.FFlagTraversalExpPagePaddingFixes
local fFlagIntegrateTraversalHistoryInSideSheet = sharedFlagsModule.FFlagIntegrateTraversalHistoryInSideSheet

return reactModule.memo(reactModule.forwardRef(function(_, p0)
	-- upvalues: reactModule (ref), fIntMaximumTraversalHistoryItemsFetch (ref), useHistoryItems (ref), constants (ref), signalsReactModule (ref), reactPageSignalModule (ref), userInputService (ref), getInputModeStore (ref), input (ref), guiService (ref), cryoModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), default (ref), view (ref), fFlagIntegrateTraversalHistoryInSideSheet (ref), fFlagTraversalExpPagePaddingFixes (ref), historyPage (ref), traversalLeaveConfirmationModule (ref)
	local var12 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p0, function()
		-- upvalues: var12 (ref)
		return var12.current
	end, {})
	local var13, var14 = reactModule.useState(fIntMaximumTraversalHistoryItemsFetch)
	local var15 = useHistoryItems(var13)
	local var16, var17 = reactModule.useState(constants.NO_UNIVERSE_ID)
	local var18 = signalsReactModule.useSignalState(reactPageSignalModule)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), getInputModeStore (copy), input (copy), var12 (ref), guiService (copy)
		local lastInputType = getInputModeStore().getLastInputType()
		
		if (if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true) and var12.current then
			guiService.SelectedCoreObject = var12.current
		end
	end, {})
	local var19 = reactModule.useCallback(function(p1)
		-- upvalues: var17 (ref)
		var17(p1)
	end, { var17 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), constants (copy), userInputService (copy), getInputModeStore (copy), input (copy), var12 (ref), guiService (copy)
		var17(constants.NO_UNIVERSE_ID)
		local lastInputType = getInputModeStore().getLastInputType()
		
		if (if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true) and var12.current then
			guiService.SelectedCoreObject = var12.current
		end
	end, {})
	local var21 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var15 (ref), getRbxThumb (copy), thumbnailType (copy), thumbnailSize (copy)
		return cryoModule.List.map(var15, function(p2)
			-- upvalues: getRbxThumb (copy), thumbnailType (copy), thumbnailSize (copy)
			return {
				placeId = p2.placeId,
				universeId = p2.universeId,
				name = p2.name,
				image = getRbxThumb(thumbnailType.GameIcon, p2.universeId, thumbnailSize.Medium),
				rating = p2.rating
			}
		end)
	end, { var15 })
	
	return next(var21) ~= nil and reactModule.createElement(view, {
		tag = "size-full " .. (if fFlagIntegrateTraversalHistoryInSideSheet then "" elseif fFlagTraversalExpPagePaddingFixes then "padding-top-medium" else "padding-large")
	}, {
		HistoryPage = reactModule.createElement(historyPage, {
			historyItems = var21,
			onHistoryClose = function()
				-- upvalues: var18 (ref)
				var18.setCurrentReactPage(nil)
			end,
			onCardItemActivated = var19,
			onLoadMoreHistory = reactModule.useCallback(function(p3)
				-- upvalues: var13 (ref), default (copy), var14 (ref)
				if #default:getUniverseHistory() <= var13 then
					return
				end
				var14(var13 + p3)
			end, { var13 }),
			ref = var12
		})
	}, {
		Dialog = reactModule.createElement(traversalLeaveConfirmationModule, {
			source = "history_landing_page",
			isDialogOpen = constants.NO_UNIVERSE_ID < var16,
			onCancel = var20,
			onClose = var20,
			universeId = var16
		})
	})
end))