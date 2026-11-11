local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local EquipSlotsModule = require(Modules.AvatarExperience.AvatarEditor.Components.EquipSlots)
local ItemsListModule = require(Modules.AvatarExperience.AvatarEditor.Components.ItemsList)
local SetSelectedEmoteSlotModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetSelectedEmoteSlot)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local LogOnOverlayClosedFunction = AvatarExperienceNavigationModule.Debug.logOnOverlayClosed
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXTTIEditorEnableMilestones = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXTTIEditorEnableMilestones
local EditorInventoryTTIMilestoneManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).EditorInventoryTTIMilestoneManager
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

local function selectAvatarType(p1)
	return p1.AvatarExperience.AvatarEditor.Character.AvatarType
end

local function _(p1)
	return function(p2)
		-- upvalues: p1 (copy)
		return p2.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[p1] or {}
	end
end

local _ = function(p1)
	-- upvalues: FFlagAXTTIEditorEnableMilestones (copy), RetrievalStatusModule (copy), PerformFetch (copy)
	return function(p2)
		-- upvalues: FFlagAXTTIEditorEnableMilestones (upval), p1 (copy), RetrievalStatusModule (upval), PerformFetch (upval)
		return if FFlagAXTTIEditorEnableMilestones and #p1 == 0 then RetrievalStatusModule.NotStarted else PerformFetch.GetStatus(p2, p1)
	end
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ReactModule (copy), ResponsiveModule (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseSelectorFunction (copy), selectAvatarType (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), UseTokensFunction (copy), FFlagAXTTIEditorEnableMilestones (copy), RetrievalStatusModule (copy), PerformFetch (copy), EditorInventoryTTIMilestoneManager (copy), AvatarScreen (copy), LogOnOverlayClosedFunction (copy), ConstantsModule (copy), SetSelectedEmoteSlotModule (copy), Focusable (copy), EquipSlotsModule (copy), ItemsListModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseSelectorResult = UseSelectorFunction(selectAvatarType)
	local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useFocusController()
	local UseTokensResult = UseTokensFunction()
	
	if FFlagAXTTIEditorEnableMilestones then
		local SearchUuid = p1.categoryInfo.SearchUuid or ""
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: SearchUuid (copy), FFlagAXTTIEditorEnableMilestones (upval), RetrievalStatusModule (upval), PerformFetch (upval)
			return function(p2)
				-- upvalues: FFlagAXTTIEditorEnableMilestones (upval), SearchUuid (copy), RetrievalStatusModule (upval), PerformFetch (upval)
				return if FFlagAXTTIEditorEnableMilestones and #SearchUuid == 0 then RetrievalStatusModule.NotStarted else PerformFetch.GetStatus(p2, SearchUuid)
			end
		end, { SearchUuid })
		local UseSelectorResult1 = UseSelectorFunction((ReactModule.useMemo(function()
			-- upvalues: SearchUuid (copy)
			return function(p2)
				-- upvalues: SearchUuid (copy)
				return p2.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[SearchUuid] or {}
			end
		end, { SearchUuid })))
		local UseSelectorResult2 = UseSelectorFunction(UseMemoResult)
		local UseRefResult2 = ReactModule.useRef(false)
		local UseRefResult3 = ReactModule.useRef(false)
		ReactModule.useEffect(function()
			-- upvalues: UseSelectorResult2 (copy), RetrievalStatusModule (upval), UseRefResult2 (copy), EditorInventoryTTIMilestoneManager (upval), UseRefResult3 (copy), UseSelectorResult1 (copy)
			if UseSelectorResult2 == RetrievalStatusModule.Fetching then
				UseRefResult2.current = true
			end
			if EditorInventoryTTIMilestoneManager and UseRefResult2.current and not UseRefResult3.current and UseSelectorResult2 == RetrievalStatusModule.Done and UseSelectorResult1 ~= nil and #UseSelectorResult1 > 0 then
				UseRefResult3.current = true
				EditorInventoryTTIMilestoneManager.endTilesTracking()
			end
		end, { UseSelectorResult2, UseSelectorResult1 })
	end
	local IsUsePreferredInputResultMatch = UsePreferredInputResult == ResponsiveModule.Input.Directional
	local IsNameMatch: boolean = IsUsePreferredInputResultMatch and UseAvatarRouteResult.current.name == AvatarScreen.ItemDetails
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		defaultChild = UseRefResult,
		restorePreviousChildFocus = p1.restorePreviousChildFocus,
		ref = Ref
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		EquipSlots = ReactModule.createElement(EquipSlotsModule, {
			LayoutOrder = 1,
			slotsCount = p1.categoryInfo.EquipSlotsCount,
			lockNavigationCallback = p1.lockNavigationCallback,
			unlockNavigationCallback = p1.unlockNavigationCallback,
			onActivated = ReactModule.useCallback(function(p2)
				-- upvalues: LogOnOverlayClosedFunction (upval), IsUsePreferredInputResultMatch (copy), FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusControllerResult (copy), UseSelectorResult (copy), ConstantsModule (upval), UseNavigationResult (copy), AvatarScreen (upval), UseDispatchResult (copy), SetSelectedEmoteSlotModule (upval)
				local function OnOverlayClosed()
					-- upvalues: LogOnOverlayClosedFunction (upval), IsUsePreferredInputResultMatch (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusControllerResult (upval)
					LogOnOverlayClosedFunction("EmotesPage", IsUsePreferredInputResultMatch)
					
					if not FFlagAXMigrateAXToGlobalAutofocus and IsUsePreferredInputResultMatch then
						UseFocusControllerResult.captureFocus()
					end
				end
				
				if UseSelectorResult == ConstantsModule.AvatarType.R6 then
					UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, {
						bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt",
						onOverlayClosed = OnOverlayClosed
					})
				end
				UseDispatchResult(SetSelectedEmoteSlotModule(p2))
			end, {
				UseSelectorResult,
				UseNavigationResult,
				UseDispatchResult,
				if FFlagAXMigrateAXToGlobalAutofocus then nil else UseFocusControllerResult,
				IsUsePreferredInputResultMatch
			}),
			NextSelectionUp = p1.NextSelectionUp,
			itemsListRef = UseRefResult1,
			ref = UseRefResult,
			onFocusChanged = ReactModule.useCallback(function(p2)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(p2)
			end, {}),
			itemsListFocused = UseStateResult1,
			darkenItemsGrid = IsNameMatch
		}),
		Tiles = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1, -72)
		}, {
			GamepadDarkOverlay = UseStateResult and ReactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = UseTokensResult.Color.Extended.Black.Black_50.Transparency,
				BackgroundColor3 = UseTokensResult.Color.Extended.Black.Black_50.Color3
			}),
			ItemsList = ReactModule.createElement(ItemsListModule, {
				buttonBInputRef = UseRefResult,
				ref = UseRefResult1,
				onFocusChanged = ReactModule.useCallback(function(p2)
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1(p2)
				end, {}),
				darkenItemsGrid = IsNameMatch,
				tagBasedImpressionsDetectorExtensions = {},
				NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then UseRefResult else nil
			})
		})
	})
end))