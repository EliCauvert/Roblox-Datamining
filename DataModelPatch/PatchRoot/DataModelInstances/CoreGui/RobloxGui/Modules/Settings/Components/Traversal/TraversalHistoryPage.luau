local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local CryoModule = require(CorePackages.Packages.Cryo)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local ReactPageSignalModule = require(script.Parent.Parent.Parent.ReactPageSignal)
local TraversalLeaveConfirmationModule = require(script.Parent.TraversalLeaveConfirmation)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local View = FoundationModule.View
local Traversal = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal
local Default = Traversal.LocalTraversalHistory.default
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local Input = ResponsiveModule.Input
local Constants = Traversal.Constants
local HistoryPage = Traversal.HistoryPage
local UseHistoryItemsFunction = Traversal.useHistoryItems
local FIntMaximumTraversalHistoryItemsFetch = Traversal.Flags.FIntMaximumTraversalHistoryItemsFetch
local FFlagTraversalExpPagePaddingFixes = Traversal.Flags.FFlagTraversalExpPagePaddingFixes
local FFlagFixTraversalHistoryMenuFixesV3 = Traversal.Flags.FFlagFixTraversalHistoryMenuFixesV3

return ReactModule.memo(ReactModule.forwardRef(function(_, p1)
	-- upvalues: ReactModule (copy), FIntMaximumTraversalHistoryItemsFetch (copy), UseHistoryItemsFunction (copy), Constants (copy), SignalsReactModule (copy), ReactPageSignalModule (copy), FFlagFixTraversalHistoryMenuFixesV3 (copy), UserInputService (copy), GetInputModeStoreFunction (copy), Input (copy), GuiService (copy), CryoModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), Default (copy), View (copy), FFlagTraversalExpPagePaddingFixes (copy), HistoryPage (copy), TraversalLeaveConfirmationModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useImperativeHandle(p1, function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, {})
	local UseStateResult, UseStateResult2 = ReactModule.useState(FIntMaximumTraversalHistoryItemsFetch)
	local UseHistoryItemsResult = UseHistoryItemsFunction(UseStateResult)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Constants.NO_UNIVERSE_ID)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactPageSignalModule)
	
	if FFlagFixTraversalHistoryMenuFixesV3 then
		ReactModule.useEffect(function()
			-- upvalues: UserInputService (upval), GetInputModeStoreFunction (upval), Input (upval), UseRefResult (copy), GuiService (upval)
			local LastInputType = UserInputService:GetLastInputType()
			local LastInputType1 = GetInputModeStoreFunction().getLastInputType()
			
			if (LastInputType1 == Input.Directional or LastInputType1 == Input.Pointer and LastInputType == Enum.UserInputType.Keyboard) and UseRefResult.current then
				GuiService.SelectedCoreObject = UseRefResult.current
			end
		end, {})
	end
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p2)
	end, { UseStateResult2_1 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), Constants (upval), UserInputService (upval), GetInputModeStoreFunction (upval), Input (upval), UseRefResult (copy), GuiService (upval)
		UseStateResult2_1(Constants.NO_UNIVERSE_ID)
		local LastInputType = UserInputService:GetLastInputType()
		local LastInputType1 = GetInputModeStoreFunction().getLastInputType()
		
		if (LastInputType1 == Input.Directional or LastInputType1 == Input.Pointer and LastInputType == Enum.UserInputType.Keyboard) and UseRefResult.current then
			GuiService.SelectedCoreObject = UseRefResult.current
		end
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseHistoryItemsResult (copy), GetRbxThumbFunction (upval), ThumbnailType (upval), ThumbnailSize (upval)
		return (CryoModule.List.map(UseHistoryItemsResult, function(p2)
			-- upvalues: GetRbxThumbFunction (upval), ThumbnailType (upval), ThumbnailSize (upval)
			return {
				placeId = p2.placeId,
				universeId = p2.universeId,
				name = p2.name,
				image = GetRbxThumbFunction(ThumbnailType.GameIcon, p2.universeId, ThumbnailSize.Medium),
				rating = p2.rating
			}
		end))
	end, { UseHistoryItemsResult })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult (copy), Default (upval), UseStateResult2 (copy)
		if #Default:getUniverseHistory() > UseStateResult then
			UseStateResult2(UseStateResult + p2)
			
			return
		end
	end, { UseStateResult })
	
	return next(UseMemoResult) ~= nil and ReactModule.createElement(View, {
		tag = "size-full " .. (if FFlagTraversalExpPagePaddingFixes then "padding-top-medium" else "padding-large")
	}, {
		HistoryPage = ReactModule.createElement(HistoryPage, {
			historyItems = UseMemoResult,
			onHistoryClose = function()
				-- upvalues: UseSignalStateResult (copy)
				UseSignalStateResult.setCurrentReactPage(nil)
			end,
			onCardItemActivated = UseResult,
			onLoadMoreHistory = UseResult2,
			ref = UseRefResult
		})
	}, {
		Dialog = ReactModule.createElement(TraversalLeaveConfirmationModule, {
			source = "history_landing_page",
			isDialogOpen = Constants.NO_UNIVERSE_ID < UseStateResult1,
			onCancel = UseResult1,
			onClose = UseResult1,
			universeId = UseStateResult1
		})
	})
end))