local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local CryoModule = require(CorePackages.Packages.Cryo)
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local EquipSlotsModule = require(Modules.AvatarExperience.AvatarEditor.Components.EquipSlots)
local ItemsListModule = require(Modules.AvatarExperience.AvatarEditor.Components.ItemsList)
local SetSelectedEmoteSlotModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetSelectedEmoteSlot)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local EmotesPage = RoactModule.PureComponent:extend("EmotesPage")

function EmotesPage.init(p1)
	-- upvalues: RoactModule (copy), UserInputService (copy), WasLastInputGamepadFunction (copy), LogOnOverlayClosedFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ConstantsModule (copy), AvatarScreen (copy)
	p1.equipSlotsRef = RoactModule.createRef()
	p1.itemsListRef = RoactModule.createRef()
	p1:setState({
		equipSlotsFocused = false,
		itemsListFocused = false,
		lastInputType = UserInputService:GetLastInputType()
	})
	
	function p1.onEquipSlotsFocusChanged(EquipSlotsFocused)
		-- upvalues: p1 (copy)
		p1:setState({ equipSlotsFocused = EquipSlotsFocused })
	end
	
	function p1.onItemsListFocusChanged(ItemsListFocused)
		-- upvalues: p1 (copy)
		p1:setState({ itemsListFocused = ItemsListFocused })
	end
	
	function p1.onSlotActivated(p2)
		-- upvalues: WasLastInputGamepadFunction (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (copy), ConstantsModule (upval), AvatarScreen (upval)
		local function OnOverlayClosed()
			-- upvalues: WasLastInputGamepadFunction (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (upval)
			local WasLastInputGamepadResult = WasLastInputGamepadFunction()
			LogOnOverlayClosedFunction("EmotesPage", WasLastInputGamepadResult)
			
			if not FFlagAXMigrateAXToGlobalAutofocus and WasLastInputGamepadResult then
				p1.props.focusController.captureFocus()
			end
		end
		
		if p1.props.avatarType == ConstantsModule.AvatarType.R6 then
			p1.props.navigation.navigate(AvatarScreen.R15UpgradePrompt, {
				bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt",
				onOverlayClosed = OnOverlayClosed
			})
		end
		p1.props.setSelectedEmoteSlot(p2)
	end
end

function EmotesPage.render(p1)
	-- upvalues: WithStyleFunction (copy), IsGamepadInputFunction (copy), AvatarScreen (copy), RoactModule (copy), Focusable (copy), EquipSlotsModule (copy), ItemsListModule (copy), ExternalEventConnection (copy), UserInputService (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), IsGamepadInputFunction (upval), AvatarScreen (upval), RoactModule (upval), Focusable (upval), EquipSlotsModule (upval), ItemsListModule (upval), ExternalEventConnection (upval), UserInputService (upval)
		local Overlay = p2.Theme.Overlay
		local LockNavigationCallback = p1.props.lockNavigationCallback
		local UnlockNavigationCallback = p1.props.unlockNavigationCallback
		local CategoryInfo = p1.props.categoryInfo
		local OnSlotActivated = p1.onSlotActivated
		local IsNameMatch: boolean = IsGamepadInputFunction(p1.state.lastInputType) and p1.props.avatarRoute.current.name == AvatarScreen.ItemDetails
		
		return RoactModule.createElement(Focusable.Frame, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			defaultChild = p1.equipSlotsRef,
			restorePreviousChildFocus = p1.props.restorePreviousChildFocus
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 0)
			}),
			EquipSlots = RoactModule.createElement(EquipSlotsModule, {
				slotsCount = CategoryInfo.EquipSlotsCount,
				lockNavigationCallback = LockNavigationCallback,
				unlockNavigationCallback = UnlockNavigationCallback,
				onActivated = OnSlotActivated,
				LayoutOrder = 1,
				NextSelectionUp = p1.props.NextSelectionUp,
				itemsListRef = p1.itemsListRef,
				[RoactModule.Ref] = p1.equipSlotsRef,
				onFocusChanged = p1.onEquipSlotsFocusChanged,
				itemsListFocused = p1.state.itemsListFocused,
				darkenItemsGrid = IsNameMatch
			}),
			Tiles = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 1, -72)
			}, {
				GamepadDarkOverlay = p1.state.equipSlotsFocused and RoactModule.createElement("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = Overlay.Transparency,
					BackgroundColor3 = Overlay.Color
				}),
				ItemsList = RoactModule.createElement(ItemsListModule, {
					buttonBInputRef = p1.equipSlotsRef,
					[RoactModule.Ref] = p1.itemsListRef,
					onFocusChanged = p1.onItemsListFocusChanged,
					darkenItemsGrid = IsNameMatch
				})
			}),
			LastInputChangedListener = RoactModule.createElement(ExternalEventConnection, {
				event = UserInputService.LastInputTypeChanged,
				callback = function(LastInputType)
					-- upvalues: p1 (upval)
					p1:setState({ lastInputType = LastInputType })
				end
			})
		})
	end)
end

local WithAvatarRouteModuleResult = WithAvatarRouteModule((WithNavigationFunction(RoactRoduxModule.connect(function(p1, _)
	return {
		avatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType
	}
end, function(Callback)
	-- upvalues: SetSelectedEmoteSlotModule (copy)
	return {
		setSelectedEmoteSlot = function(p1)
			-- upvalues: Callback (copy), SetSelectedEmoteSlotModule (upval)
			Callback(SetSelectedEmoteSlotModule(p1))
		end
	}
end)(EmotesPage), nil)))

return if FFlagAXMigrateAXToGlobalAutofocus then WithAvatarRouteModuleResult else function(p1)
	-- upvalues: RoactGamepadModule (copy), RoactModule (copy), WithAvatarRouteModuleResult (ref), CryoModule (copy)
	return RoactGamepadModule.withFocusController(function(FocusController)
		-- upvalues: RoactModule (upval), WithAvatarRouteModuleResult (upval), CryoModule (upval), p1 (copy)
		return RoactModule.createElement(WithAvatarRouteModuleResult, CryoModule.Dictionary.join(p1, { focusController = FocusController }))
	end)
end