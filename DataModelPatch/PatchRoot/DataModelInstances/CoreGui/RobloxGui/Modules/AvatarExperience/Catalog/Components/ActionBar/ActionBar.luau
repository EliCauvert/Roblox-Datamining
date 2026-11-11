local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local FoundationModule = require(CorePackages.Packages.Foundation)
local TModule = require(CorePackages.Packages.t)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local CryoModule = require(CorePackages.Packages.Cryo)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ActionButtonModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionButton)
local ItemDetailMoreButtonModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ItemDetailMoreButton)
local MiddleButtonModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.MiddleButton)
local OwnedActionBar = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Checkout.OwnedActionBar
local BuyActionButtonTypeEnumModule = require(script.Parent.BuyActionBar.BuyActionButtonTypeEnum)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local ActionBarHeight = CatalogConstantsModule.ActionBar.ActionBarHeight
local ActionBarGradientHeight = CatalogConstantsModule.ActionBar.ActionBarGradientHeight
local XOffset: number = if FFlagAXMISEnableMultiShopping then 12 else 10
local ActionBar = RoactModule.PureComponent:extend("ActionBar")
local StrictInterfaceResult = TModule.strictInterface({
	buttonProps = TModule.table,
	bottomPadding = TModule.number,
	leftPadding = TModule.number,
	rightPadding = TModule.number,
	topPadding = TModule.optional(TModule.number),
	ZIndex = TModule.number,
	topComponent = TModule.optional(TModule.table),
	topComponentHeight = TModule.optional(TModule.number),
	showMoreButton = TModule.boolean,
	onMoreButtonActivated = TModule.optional(TModule.callback),
	isMoreButtonSelected = TModule.optional(TModule.boolean),
	bottomComponent = TModule.optional(TModule.table),
	bottomComponentHeight = TModule.optional(TModule.number),
	hideGradient = TModule.optional(TModule.boolean),
	showMiddleButton = TModule.optional(TModule.boolean),
	onMiddleButtonActivated = TModule.optional(TModule.callback),
	middleButtonIcon = TModule.optional(TModule.table),
	showSecondaryButton = if FFlagAXDurablesForMIS then TModule.optional(TModule.boolean) else nil,
	secondaryButtonText = if FFlagAXDurablesForMIS then TModule.optional(TModule.string) else nil,
	onSecondaryButtonActivated = if FFlagAXDurablesForMIS then TModule.optional(TModule.callback) else nil,
	deviceSafePadding = if FFlagEnableLeftNavOnConsole then TModule.table else nil
})
ActionBar.defaultProps = { topComponentHeight = 0 }

function ActionBar.init(p1)
	-- upvalues: RoactModule (copy)
	p1.moreButtonRef = RoactModule.createRef()
	p1.actionButtonRef = RoactModule.createRef()
	p1.bottomComponentRef = RoactModule.createRef()
	p1.middleButtonRef = RoactModule.createRef()
end

function ActionBar.renderWithStyle(p1, p2, _)
	-- upvalues: StrictInterfaceResult (copy), ActionBarHeight (copy), ActionBarGradientHeight (copy), XOffset (copy), FFlagAXMISEnableMultiShopping (copy), BuyActionButtonTypeEnumModule (copy), RoactModule (copy), ConstantsModule (copy), OwnedActionBar (copy), Focusable (copy), FFlagEnableLeftNavOnConsole (copy), ItemDetailMoreButtonModule (copy), FoundationModule (copy), FFlagAXDurablesForMIS (copy), MiddleButtonModule (copy), ActionButtonModule (copy)
	assert(StrictInterfaceResult(p1.props))
	local ZIndex = p1.props.ZIndex
	local LeftPadding = p1.props.leftPadding
	local RightPadding = p1.props.rightPadding
	local TopPadding = p1.props.topPadding
	local BottomPadding = p1.props.bottomPadding
	local ShowMoreButton = p1.props.showMoreButton
	local OnMoreButtonActivated = p1.props.onMoreButtonActivated
	local IsMoreButtonSelected = p1.props.isMoreButtonSelected
	local ShowMiddleButton = p1.props.showMiddleButton
	local OnMiddleButtonActivated = p1.props.onMiddleButtonActivated
	local MiddleButtonIcon = p1.props.middleButtonIcon
	local ButtonProps = p1.props.buttonProps
	local TopComponent = p1.props.topComponent
	local TopComponentHeight = p1.props.topComponentHeight
	local BottomComponent = p1.props.bottomComponent
	local BottomComponentHeight = p1.props.bottomComponentHeight or 0
	local NewActionBarHeight = ActionBarHeight + BottomPadding
	local YOffset = NewActionBarHeight + TopComponentHeight + BottomComponentHeight
	
	if not p1.props.hideGradient then
		YOffset += ActionBarGradientHeight
	end
	local Theme = p2.Theme
	local _Font = p2.Font
	local MoreButtonRef = if ShowMoreButton then p1.moreButtonRef else p1.actionButtonRef
	local BottomComponentRef = p1.bottomComponentRef
	local MoreButtonRef1 = p1.moreButtonRef
	
	if not BottomComponent then
		BottomComponentRef = nil
	end
	if not ShowMoreButton then
		MoreButtonRef1 = nil
	end
	local ShowMoreButton1 = ShowMoreButton or ShowMiddleButton
	local v1 = -((if ShowMoreButton and ShowMiddleButton then 2 elseif ShowMoreButton or ShowMiddleButton then 1 else 0) * 44) - (if ShowMoreButton1 then XOffset else 0)
	
	return if FFlagAXMISEnableMultiShopping and ButtonProps.buttonActionType == BuyActionButtonTypeEnumModule.CustomizeLink then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, (math.max(YOffset, ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE))),
		ZIndex = ZIndex
	}, {
		ActionBarFrame = RoactModule.createElement(OwnedActionBar, { onActivated = ButtonProps.onActivated })
	}) else RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, YOffset),
		ZIndex = ZIndex,
		defaultChild = MoreButtonRef
	}, {
		TopComponent = if TopComponent == nil then nil else RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, TopComponentHeight),
			Position = UDim2.new(0, 0, 1, -BottomComponentHeight - NewActionBarHeight - TopComponentHeight),
			BackgroundColor3 = Theme.BackgroundDefault.Color
		}, TopComponent) or nil,
		ActionBarFrame = RoactModule.createElement(Focusable.Frame, {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, if FFlagEnableLeftNavOnConsole then p1.props.deviceSafePadding.right else 0, 0, NewActionBarHeight),
			Position = UDim2.new(0, 0, 1, -BottomComponentHeight - NewActionBarHeight),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			NextSelectionDown = BottomComponentRef
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 0)
			}),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, LeftPadding),
				PaddingRight = UDim.new(0, RightPadding + (FFlagEnableLeftNavOnConsole and p1.props.deviceSafePadding.right or 0)),
				PaddingTop = if TopPadding then UDim.new(0, TopPadding) else nil
			}),
			MoreButton = not FFlagAXMISEnableMultiShopping and (ShowMoreButton and RoactModule.createElement(ItemDetailMoreButtonModule, {
				onActivated = OnMoreButtonActivated,
				isSelected = IsMoreButtonSelected,
				NextSelectionRight = if ShowMiddleButton then p1.middleButtonRef else p1.actionButtonRef,
				[RoactModule.Ref] = p1.moreButtonRef
			})),
			MoreButtonMIS = FFlagAXMISEnableMultiShopping and (ShowMoreButton and RoactModule.createElement(FoundationModule.Button, {
				icon = "circle-three-dots-horizontal",
				onActivated = OnMoreButtonActivated,
				variant = FoundationModule.Enums.ButtonVariant.Standard,
				size = FoundationModule.Enums.ButtonSize.Medium,
				LayoutOrder = if FFlagAXDurablesForMIS then 5 else 4
			})),
			MiddleButton = ShowMiddleButton and RoactModule.createElement(MiddleButtonModule, {
				onActivated = OnMiddleButtonActivated,
				icon = MiddleButtonIcon,
				NextSelectionRight = p1.actionButtonRef,
				NextSelectionLeft = if ShowMoreButton then p1.moreButtonRef else nil,
				[RoactModule.Ref] = p1.middleButtonRef
			}),
			Spacer = ShowMoreButton1 and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, XOffset, 0, 44),
				LayoutOrder = if FFlagAXDurablesForMIS then 4 else 3
			}),
			ActionButton = RoactModule.createElement(ActionButtonModule, {
				Size = UDim2.new(if FFlagAXDurablesForMIS and p1.props.showSecondaryButton then 0.5 else 1, if FFlagAXDurablesForMIS and p1.props.showSecondaryButton then v1 / 2 else v1, 0, NewActionBarHeight - BottomPadding),
				LayoutOrder = if FFlagAXMISEnableMultiShopping then 1 else 4,
				Font = _Font,
				buttonProps = ButtonProps,
				NextSelectionLeft = if ShowMiddleButton then p1.middleButtonRef else MoreButtonRef1,
				[RoactModule.Ref] = p1.actionButtonRef
			}),
			SecondaryButtonSpacer = if FFlagAXDurablesForMIS and p1.props.showSecondaryButton then RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(0, XOffset, 0, 44)
			}) else nil,
			SecondaryButton = if FFlagAXDurablesForMIS and p1.props.showSecondaryButton then RoactModule.createElement(FoundationModule.Button, {
				LayoutOrder = 3,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
				size = FoundationModule.Enums.ButtonSize.Medium,
				text = p1.props.secondaryButtonText,
				onActivated = p1.props.onSecondaryButtonActivated
			}) else nil
		}),
		BottomComponent = BottomComponent ~= nil and RoactModule.createElement(Focusable.Frame, {
			Size = UDim2.new(1, 0, 0, BottomComponentHeight),
			Position = UDim2.new(0, 0, 1, -BottomComponentHeight),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			[RoactModule.Ref] = p1.bottomComponentRef,
			NextSelectionUp = p1.actionButtonRef
		}, { BottomComponentContents = BottomComponent }),
		GamepadBottomBarComponent = RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, if FFlagEnableLeftNavOnConsole then p1.props.deviceSafePadding.right else 0, 0, ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = Theme.BackgroundDefault.Color
		}),
		Gradient = if p1.props.hideGradient then nil else RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png",
			Size = UDim2.new(1, 0, 0, ActionBarGradientHeight),
			Position = UDim2.new(0, 0, 1, -BottomComponentHeight - NewActionBarHeight - TopComponentHeight),
			AnchorPoint = Vector2.new(0, 1),
			ImageColor3 = Theme.BackgroundDefault.Color
		}) or nil
	})
end

function ActionBar.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithStyle(p2)
	end)
end

return if FFlagEnableLeftNavOnConsole then function(p1)
	-- upvalues: UseSignalStateFunction (copy), DisplayModule (copy), CryoModule (copy), RoactModule (copy), ActionBar (copy)
	return RoactModule.createElement(ActionBar, (CryoModule.Dictionary.join(p1, {
		deviceSafePadding = UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding)
	})))
end else ActionBar