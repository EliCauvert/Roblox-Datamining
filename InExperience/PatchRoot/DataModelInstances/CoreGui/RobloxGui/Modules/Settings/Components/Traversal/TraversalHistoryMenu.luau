local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local TraversalLeaveConfirmationModule = require(script.Parent.TraversalLeaveConfirmation)
local Parent = script.Parent.Parent.Parent
local EnumReactPageModule = require(Parent.EnumReactPage)
local ReactPageSignalModule = require(Parent.ReactPageSignal)
local UtilityModule = require(Parent.Utility)
local View = FoundationModule.View
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local Traversal = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal
local Default = Traversal.LocalTraversalHistory.default
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local Input = ResponsiveModule.Input
local Constants = Traversal.Constants
local HistoryMenu = Traversal.HistoryMenu
local UseHistoryItemsFunction = Traversal.useHistoryItems
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagAddTraversalHistoryReactMenuButtonsModule = require(Parent.Flags.FFlagAddTraversalHistoryReactMenuButtons)

local function historyToMenuItems(List)
	-- upvalues: GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, {
			universeId = value.universeId,
			text = value.name,
			icon = GetRbxThumbFunction(ThumbnailType.GameIcon, value.universeId, ThumbnailSize.Small)
		})
	end
	return List1
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, _)
	-- upvalues: ReactModule (copy), FFlagAddTraversalHistoryReactMenuButtonsModule (copy), UseHistoryItemsFunction (copy), historyToMenuItems (copy), Constants (copy), UseTokensFunction (copy), SignalsReactModule (copy), ReactPageSignalModule (copy), SettingsShowSignal (copy), GuiService (copy), UserInputService (copy), GetInputModeStoreFunction (copy), Input (copy), UtilityModule (copy), EnumReactPageModule (copy), Default (copy), View (copy), HistoryMenu (copy), TraversalLeaveConfirmationModule (copy)
	local AnchorRef = if FFlagAddTraversalHistoryReactMenuButtonsModule and p1.anchorRef then p1.anchorRef else ReactModule.useRef(p1.anchorParent)
	local UseHistoryItemsResult = UseHistoryItemsFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: historyToMenuItems (upval), UseHistoryItemsResult (copy)
		return (historyToMenuItems(UseHistoryItemsResult))
	end, { UseHistoryItemsResult })
	local DEFAULTCHEVRONBUTTONSTATE = if p1.idleButtonStateIsDown == nil then Constants.DEFAULT_CHEVRON_BUTTON_STATE else p1.idleButtonStateIsDown
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Enum.SelectionBehavior.Stop)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: DEFAULTCHEVRONBUTTONSTATE (copy), UseBindingResult (copy)
		return {
			SelectionBehaviorUp = if DEFAULTCHEVRONBUTTONSTATE then UseBindingResult else Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = if DEFAULTCHEVRONBUTTONSTATE then Enum.SelectionBehavior.Stop else UseBindingResult
		}
	end, { DEFAULTCHEVRONBUTTONSTATE })
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(Constants.NO_UNIVERSE_ID)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactPageSignalModule)
	local UseResult = ReactModule.useCallback(function(Callback)
		-- upvalues: SettingsShowSignal (upval), FFlagAddTraversalHistoryReactMenuButtonsModule (upval), p1 (copy), GuiService (upval)
		return {
			onSettingsVisible = SettingsShowSignal:connect(function(p2)
				-- upvalues: Callback (copy)
				if not p2 then
					Callback()
				end
			end),
			onPageChanged = if FFlagAddTraversalHistoryReactMenuButtonsModule and not p1.currentPageChangeSignal then nil else p1.currentPageChangeSignal:connect(function()
				-- upvalues: Callback (copy)
				Callback()
			end),
			onNativeClose = GuiService.NativeClose:Connect(function()
				-- upvalues: Callback (copy)
				Callback()
			end)
		}
	end, {
		p1.currentPageChangeSignal,
		SettingsShowSignal,
		GuiService.NativeClose
	})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), UseBindingResult2 (copy)
		UseStateResult2(p2)
		UseBindingResult2(Enum.SelectionBehavior.Stop)
	end, { UseStateResult2 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), Constants (upval), UserInputService (upval), GetInputModeStoreFunction (upval), Input (upval), AnchorRef (ref), GuiService (upval)
		UseStateResult2(Constants.NO_UNIVERSE_ID)
		local LastInputType = UserInputService:GetLastInputType()
		local LastInputType1 = GetInputModeStoreFunction().getLastInputType()
		
		if (LastInputType1 == Input.Directional or LastInputType1 == Input.Pointer and LastInputType == Enum.UserInputType.Keyboard) and AnchorRef.current then
			GuiService.SelectedCoreObject = AnchorRef.current
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult2 (copy)
		if p2 then
			UseBindingResult2(Enum.SelectionBehavior.Escape)
			
			return
		else
			UseBindingResult2(Enum.SelectionBehavior.Stop)
		end
	end, {})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: FFlagAddTraversalHistoryReactMenuButtonsModule (upval), p1 (copy), UseTokensResult (copy)
		return if FFlagAddTraversalHistoryReactMenuButtonsModule and p1.isDarkOnDarkMode then UseTokensResult.Color.Surface.Surface_0 else {
			Transparency = 0.33,
			Color3 = UseTokensResult.Color.Stroke.Default.Color3
		}
	end, {})
	local IsSmallTouchScreen = UtilityModule:IsSmallTouchScreen()
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: IsSmallTouchScreen (copy)
		return {
			["padding-small"] = IsSmallTouchScreen,
			["padding-medium"] = not IsSmallTouchScreen
		}
	end, { IsSmallTouchScreen })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy), EnumReactPageModule (upval), UseBindingResult2 (copy)
		UseSignalStateResult.setCurrentReactPage(EnumReactPageModule.TraversalHistory)
		UseBindingResult2(Enum.SelectionBehavior.Stop)
	end, { UseSignalStateResult })
	
	return ReactModule.useMemo(function(): boolean
		-- upvalues: Default (upval)
		return #Default:getUniverseHistory() > 0
	end, {}) and ReactModule.createElement(View, {
		tag = "auto-xy row align-y-center size-0-full",
		selectionGroup = UseMemoResult1,
		ref = if FFlagAddTraversalHistoryReactMenuButtonsModule and not p1.anchorRef and not p1.anchorParent then AnchorRef else nil
	}, {
		DividerLeft = ReactModule.createElement(View, {
			Size = UDim2.new(0, UseTokensResult.Stroke.Thick, 1, 0),
			backgroundStyle = UseMemoResult2
		}),
		HistoryMenu = ReactModule.createElement(HistoryMenu, {
			historyButtonTags = UseMemoResult3,
			historyItems = UseMemoResult,
			onHistorySelected = UseResult4,
			onMenuItemSelected = UseResult1,
			onMenuToggled = UseResult3,
			closeMenuConn = UseResult,
			menuSide = p1.menuSide,
			ref = AnchorRef
		})
	}, {
		Dialog = ReactModule.createElement(TraversalLeaveConfirmationModule, {
			source = "history_dropdown",
			isDialogOpen = Constants.NO_UNIVERSE_ID < UseStateResult,
			onCancel = UseResult2,
			onClose = UseResult2,
			universeId = UseStateResult
		})
	})
end))