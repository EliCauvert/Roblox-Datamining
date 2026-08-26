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

return reactModule.memo(reactModule.forwardRef(function(_, p1)
	-- upvalues: reactModule (ref), fIntMaximumTraversalHistoryItemsFetch (ref), useHistoryItems (ref), constants (ref), signalsReactModule (ref), reactPageSignalModule (ref), userInputService (ref), getInputModeStore (ref), input (ref), guiService (ref), cryoModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), default (ref), view (ref), fFlagIntegrateTraversalHistoryInSideSheet (ref), fFlagTraversalExpPagePaddingFixes (ref), historyPage (ref), traversalLeaveConfirmationModule (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p1, function()
		-- upvalues: var1 (ref)
		return var1.current
	end, {})
	local var2, var3 = reactModule.useState(fIntMaximumTraversalHistoryItemsFetch)
	local var4 = useHistoryItems(var2)
	local var5, var6 = reactModule.useState(constants.NO_UNIVERSE_ID)
	local var7 = signalsReactModule.useSignalState(reactPageSignalModule)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), getInputModeStore (copy), input (copy), var1 (ref), guiService (copy)
		local lastInputType = getInputModeStore().getLastInputType()
		
		if (if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true) and var1.current then
			guiService.SelectedCoreObject = var1.current
		end
	end, {})
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref)
		var6(p2)
	end, { var6 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), constants (copy), userInputService (copy), getInputModeStore (copy), input (copy), var1 (ref), guiService (copy)
		var6(constants.NO_UNIVERSE_ID)
		local lastInputType = getInputModeStore().getLastInputType()
		
		if (if lastInputType ~= input.Directional then lastInputType == input.Pointer and userInputService:GetLastInputType() == Enum.UserInputType.Keyboard else true) and var1.current then
			guiService.SelectedCoreObject = var1.current
		end
	end, {})
	local var10 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var4 (ref), getRbxThumb (copy), thumbnailType (copy), thumbnailSize (copy)
		return cryoModule.List.map(var4, function(p2)
			-- upvalues: getRbxThumb (copy), thumbnailType (copy), thumbnailSize (copy)
			return {
				placeId = p2.placeId,
				universeId = p2.universeId,
				name = p2.name,
				image = getRbxThumb(thumbnailType.GameIcon, p2.universeId, thumbnailSize.Medium),
				rating = p2.rating
			}
		end)
	end, { var4 })
	
	return next(var10) ~= nil and reactModule.createElement(view, {
		tag = "size-full " .. (if fFlagIntegrateTraversalHistoryInSideSheet then "" elseif fFlagTraversalExpPagePaddingFixes then "padding-top-medium" else "padding-large")
	}, {
		HistoryPage = reactModule.createElement(historyPage, {
			historyItems = var10,
			onHistoryClose = function()
				-- upvalues: var7 (ref)
				var7.setCurrentReactPage(nil)
			end,
			onCardItemActivated = var8,
			onLoadMoreHistory = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref), default (copy), var3 (ref)
				if #default:getUniverseHistory() <= var2 then
					return
				end
				var3(var2 + p2)
			end, { var2 }),
			ref = var1
		})
	}, {
		Dialog = reactModule.createElement(traversalLeaveConfirmationModule, {
			source = "history_landing_page",
			isDialogOpen = constants.NO_UNIVERSE_ID < var5,
			onCancel = var9,
			onClose = var9,
			universeId = var5
		})
	})
end))