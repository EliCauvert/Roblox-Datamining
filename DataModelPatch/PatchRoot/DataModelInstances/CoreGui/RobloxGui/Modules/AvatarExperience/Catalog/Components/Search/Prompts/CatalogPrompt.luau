local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local NavigationUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local CatalogPrompt = RoactModule.PureComponent:extend("CatalogPrompt")

function CatalogPrompt.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = { apply = false }
	p1.buttonStackRef = RoactModule.createRef()
end

CatalogPrompt.validateProps = TModule.strictInterface({
	title = TModule.string,
	onApply = TModule.callback,
	contentPadding = TModule.optional(TModule.UDim),
	[RoactModule.Children] = TModule.table,
	secondaryButtonProps = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	disablePrimaryButton = TModule.optional(TModule.boolean),
	overlayFocusController = TModule.optional(TModule.table),
	isPortrait = TModule.boolean,
	screenSize = TModule.Vector2,
	navigation = TModule.table
})
CatalogPrompt.defaultProps = {
	disablePrimaryButton = false,
	contentPadding = UDim.new(0, 0)
}

function CatalogPrompt.onClose(p1, p2)
	-- upvalues: NavigationUtilsModule (copy)
	if p2 then
		p1.props.onApply()
	end
	NavigationUtilsModule.closeOverlay(p1.props.navigation)
end

function CatalogPrompt.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), ButtonType (copy), RoactModule (copy), Focusable (copy), PartialPageModal (copy)
	return WithStyleFunction(function(_)
		-- upvalues: WithLocalizationFunction (upval), p1 (copy), ButtonType (upval), RoactModule (upval), Focusable (upval), PartialPageModal (upval)
		return WithLocalizationFunction({ apply = "CommonUI.Messages.Action.Apply" })(function(p2)
			-- upvalues: p1 (upval), ButtonType (upval), RoactModule (upval), Focusable (upval), PartialPageModal (upval)
			local _UDim2 = nil
			local _Vector2 = nil
			if p1.props.isPortrait then
				_UDim2 = UDim2.new(0.5, 0, 1, 0)
				_Vector2 = Vector2.new(0.5, 1)
			else
				_UDim2 = UDim2.new(0.5, 0, 0.5, 0)
				_Vector2 = Vector2.new(0.5, 0.5)
			end
			local List = {}
			
			if p1.props.secondaryButtonProps then
				table.insert(List, p1.props.secondaryButtonProps)
			end
			table.insert(List, {
				buttonType = ButtonType.PrimarySystem,
				props = {
					isDisabled = p1.props.disablePrimaryButton,
					onActivated = function()
						-- upvalues: p1 (upval)
						p1:onClose(true)
					end,
					text = p2.apply
				}
			})
			
			return RoactModule.createElement(Focusable.Frame, {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				[RoactModule.Ref] = p1.props.forwardRef,
				defaultChild = p1.buttonStackRef
			}, {
				PartialPageModal = RoactModule.createElement(PartialPageModal, {
					title = p1.props.title,
					screenSize = p1.props.screenSize,
					position = _UDim2,
					anchorPoint = _Vector2,
					contentPadding = p1.props.contentPadding,
					buttonStackProps = {
						buttons = List,
						frameRef = p1.buttonStackRef,
						NextSelectionUp = p1.props.NextSelectionUp
					},
					onCloseClicked = function()
						-- upvalues: p1 (upval)
						p1:onClose()
					end
				}, p1.props[RoactModule.Children])
			})
		end)
	end)
end

local WithNavigationResult = WithNavigationFunction((RoactRoduxModule.connect(function(p1)
	-- upvalues: DeviceOrientationMode (copy)
	return {
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait,
		screenSize = p1.ScreenSize
	}
end, nil)(CatalogPrompt)))

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), WithNavigationResult (ref), CryoModule (copy)
	return RoactModule.createElement(WithNavigationResult, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)