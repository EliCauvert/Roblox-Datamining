local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
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
local fFlagFixTraversalHistoryMenuFixesV3 = traversal.Flags.FFlagFixTraversalHistoryMenuFixesV3

return reactModule.memo(reactModule.forwardRef(function(_, p0) --[[ line: 35 | named "TraversalHistoryPage" ]]
	-- upvalues: reactModule (ref), fIntMaximumTraversalHistoryItemsFetch (ref), useHistoryItems (ref), constants (ref), signalsReactModule (ref), reactPageSignalModule (ref), fFlagFixTraversalHistoryMenuFixesV3 (ref), userInputService (ref), getInputModeStore (ref), input (ref), guiService (ref), cryoModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), default (ref), view (ref), fFlagTraversalExpPagePaddingFixes (ref), historyPage (ref), traversalLeaveConfirmationModule (ref)
	local var11 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p0, function() --[[ line: 37 ]]
		-- upvalues: var11 (ref)
		return var11.current
	end, {})
	local var12, var13 = reactModule.useState(fIntMaximumTraversalHistoryItemsFetch)
	local var14 = useHistoryItems(var12)
	local var15, var16 = reactModule.useState(constants.NO_UNIVERSE_ID)
	local var17 = signalsReactModule.useSignalState(reactPageSignalModule)
	
	if fFlagFixTraversalHistoryMenuFixesV3 then
		reactModule.useEffect(function() --[[ line: 46 ]]
			-- upvalues: userInputService (copy), getInputModeStore (copy), input (copy), var11 (ref), guiService (copy)
			local lastInputType = getInputModeStore().getLastInputType()
			
			if (if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true) and var11.current then
				guiService.SelectedCoreObject = var11.current
			end
		end, {})
	end
	local var18 = reactModule.useCallback(function(p1) --[[ line: 56 ]]
		-- upvalues: var16 (ref)
		var16(p1)
	end, { var16 })
	local var19 = reactModule.useCallback(function() --[[ line: 60 ]]
		-- upvalues: var16 (ref), constants (copy), userInputService (copy), getInputModeStore (copy), input (copy), var11 (ref), guiService (copy)
		var16(constants.NO_UNIVERSE_ID)
		local lastInputType = getInputModeStore().getLastInputType()
		
		if (if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true) and var11.current then
			guiService.SelectedCoreObject = var11.current
		end
	end, {})
	local var20 = reactModule.useMemo(function() --[[ line: 70 ]]
		-- upvalues: cryoModule (copy), var14 (ref), getRbxThumb (copy), thumbnailType (copy), thumbnailSize (copy)
		return cryoModule.List.map(var14, function(p2) --[[ line: 71 ]]
			-- upvalues: getRbxThumb (copy), thumbnailType (copy), thumbnailSize (copy)
			return {
				placeId = p2.placeId,
				universeId = p2.universeId,
				name = p2.name,
				image = getRbxThumb(thumbnailType.GameIcon, p2.universeId, thumbnailSize.Medium),
				rating = p2.rating
			}
		end)
	end, { var14 })
	
	return next(var20) ~= nil and reactModule.createElement(view, {
		tag = "size-full " .. (if fFlagTraversalExpPagePaddingFixes then "padding-top-medium" else "padding-large")
	}, {
		HistoryPage = reactModule.createElement(historyPage, {
			historyItems = var20,
			onHistoryClose = function() --[[ line: 95 ]]
				-- upvalues: var17 (ref)
				var17.setCurrentReactPage(nil)
			end,
			onCardItemActivated = var18,
			onLoadMoreHistory = reactModule.useCallback(function(p3) --[[ line: 83 ]]
				-- upvalues: var12 (ref), default (copy), var13 (ref)
				if #default:getUniverseHistory() <= var12 then
					return
				end
				var13(var12 + p3)
			end, { var12 }),
			ref = var11
		})
	}, {
		Dialog = reactModule.createElement(traversalLeaveConfirmationModule, {
			source = "history_landing_page",
			isDialogOpen = constants.NO_UNIVERSE_ID < var15,
			onCancel = var19,
			onClose = var19,
			universeId = var15
		})
	})
end))