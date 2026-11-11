local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local WithStyleFunction = UIBloxModule.Style.withStyle
local GetPageMarginFunction = UIBloxModule.App.Container.getPageMargin
local Images = UIBloxModule.App.ImageSet.Images
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local FitTextLabel = require(CorePackages.Packages.FitFrame).FitTextLabel
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXFixGamepadNavigationOnOutfitManagement = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixGamepadNavigationOnOutfitManagement
local AssetManagementConstantsModule = require(script.Parent.AssetManagementConstants)
local IconsActionsEditEdit = Images["icons/actions/edit/edit"]
local IconsActionsEditDelete = Images["icons/actions/edit/delete"]
local ManageActionBar = RoactModule.PureComponent:extend("ManageActionBar")
ManageActionBar.validateProps = TModule.strictInterface({
	gradientFade = TModule.optional(TModule.boolean),
	multiSelect = TModule.optional(TModule.boolean),
	selectedOutfits = TModule.array(TModule.string),
	deleteOutfit = TModule.callback,
	renameOutfit = TModule.callback,
	bottomPadding = TModule.optional(TModule.number),
	ZIndex = TModule.integer,
	NextSelectionUp = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table),
	showCustomOutfitNames = TModule.boolean,
	isPortrait = TModule.boolean
})
ManageActionBar.defaultProps = { gradientFade = false, multiSelect = false }

function ManageActionBar.init(p1)
	-- upvalues: RoactModule (copy), GetPageMarginFunction (copy)
	p1.renameButtonRef = RoactModule.createRef()
	p1.deleteButtonRef = RoactModule.createRef()
	p1.marginBinding, p1.updateMarginBinding = RoactModule.createBinding(UDim.new(0, 24))
	
	function p1.absoluteSizeChanged(Frame)
		-- upvalues: GetPageMarginFunction (upval), p1 (copy)
		p1.updateMarginBinding(UDim.new(0, (GetPageMarginFunction(Frame.AbsoluteSize.X))))
	end
end

function ManageActionBar.renderBarItems(p1, p2, p3, _)
	-- upvalues: RoactModule (copy), FitTextLabel (copy), IconButton (copy), IconsActionsEditEdit (copy), IconSize (copy), IconsActionsEditDelete (copy)
	local config = {
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingLeft = p1.marginBinding,
			PaddingRight = p1.marginBinding
		})
	}
	local Theme = p3.Theme
	
	if p1.props.gradientFade then
		config.UIGradient = RoactModule.createElement("UIGradient", {
			Rotation = 270,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, Theme.BackgroundDefault.Transparency),
				NumberSequenceKeypoint.new(0.8, Theme.BackgroundDefault.Transparency),
				NumberSequenceKeypoint.new(1, 1)
			})
		})
	end
	if p1.props.multiSelect then
		config.SelectedCountTextLabel = RoactModule.createElement(FitTextLabel, {
			BackgroundTransparency = 1,
			width = FitTextLabel.Width.FitToText,
			Text = if #p1.props.selectedOutfits > 0 then p2.countSelected else p2.selectItem,
			Font = p3.Font.Header2.Font,
			Position = UDim2.fromScale(0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			TextColor3 = p3.Theme.TextEmphasis.Color,
			TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize
		})
	elseif p1.props.showCustomOutfitNames then
		config.RenameButton = RoactModule.createElement(IconButton, {
			anchorPoint = Vector2.new(0, 0.5),
			position = UDim2.fromScale(0, 0.5),
			size = UDim2.new(0, 44, 1, 0),
			icon = IconsActionsEditEdit,
			iconSize = IconSize.Medium,
			iconColor3 = Theme.SystemPrimaryDefault.Color,
			iconTransparency = Theme.SystemPrimaryDefault.Transparency,
			onActivated = p1.props.renameOutfit,
			buttonRef = p1.renameButtonRef,
			NextSelectionRight = p1.deleteButtonRef
		})
	end
	local v1 = #p1.props.selectedOutfits > 0
	config.DeleteButton = RoactModule.createElement(IconButton, {
		anchorPoint = Vector2.new(1, 0.5),
		position = UDim2.fromScale(1, 0.5),
		size = UDim2.new(0, 44, 1, 0),
		icon = IconsActionsEditDelete,
		iconSize = IconSize.Medium,
		iconColor3 = Theme.SystemPrimaryDefault.Color,
		iconTransparency = v1 and Theme.SystemPrimaryDefault.Transparency or 0.5,
		onActivated = v1 and p1.props.deleteOutfit or nil,
		buttonRef = p1.deleteButtonRef,
		NextSelectionLeft = if p1.props.multiSelect then nil else p1.renameButtonRef or nil
	})
	
	return config
end

function ManageActionBar.renderWithProviders(p1, p2, p3, p4)
	-- upvalues: AssetManagementConstantsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXFixGamepadNavigationOnOutfitManagement (copy), RoactModule (copy), Focusable (copy)
	local Theme = p3.Theme
	local ActionBarHeight = AssetManagementConstantsModule.ActionBarHeight
	
	if p1.props.isPortrait then
		ActionBarHeight += 24
	end
	if p1.props.bottomPadding then
		ActionBarHeight += p1.props.bottomPadding
	end
	local DeleteButtonRef = if p1.props.multiSelect or not p1.props.showCustomOutfitNames then p1.deleteButtonRef else p1.renameButtonRef
	local BottomPadding = if FFlagAXFixGamepadNavigationOnOutfitManagement then if p1.props.isPortrait then 24 elseif p1.props.bottomPadding then p1.props.bottomPadding else nil else nil
	
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, ActionBarHeight),
		Position = UDim2.fromScale(0, 1),
		AnchorPoint = Vector2.new(0, 1),
		ZIndex = p1.props.ZIndex,
		[RoactModule.Change.AbsoluteSize] = p1.absoluteSizeChanged,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else DeleteButtonRef,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionUp,
		[RoactModule.Ref] = p1.props.forwardRef
	}, {
		Background = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			Size = UDim2.new(1, 0, 0, AssetManagementConstantsModule.ActionBarHeight)
		}, (p1:renderBarItems(p2, p3, if FFlagAXMigrateAXToGlobalAutofocus then nil else p4))),
		GapFiller = if FFlagAXFixGamepadNavigationOnOutfitManagement and BottomPadding then RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			Size = UDim2.new(1, 0, 0, BottomPadding),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1)
		}) elseif p1.props.isPortrait then RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			Size = UDim2.new(1, 0, 0, 24),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1)
		}) else nil
	})
end

function ManageActionBar.render(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy)
	return WithLocalizationFunction({
		selectItem = "Feature.Avatar.Label.SelectItem",
		countSelected = {
			"Feature.Avatar.Label.CountSelected",
			itemCount = #p1.props.selectedOutfits
		}
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (copy), RoactGamepadModule (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (upval), p2 (copy), RoactGamepadModule (upval)
			return if FFlagAXMigrateAXToGlobalAutofocus then p1:renderWithProviders(p2, p3) else RoactGamepadModule.withFocusController(function(p4)
				-- upvalues: p1 (upval), p2 (upval), p3 (copy)
				return p1:renderWithProviders(p2, p3, p4)
			end)
		end)
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	-- upvalues: DeviceOrientationMode (copy)
	return {
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait
	}
end, nil)((RoactAppPolicy.connect(function(p1, _)
	return { showCustomOutfitNames = p1.getCustomOutfitNames() }
end)(ManageActionBar)))

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)