local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local FitFrameHorizontal = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal
local WithStyleFunction = UIBloxModule.Style.withStyle
local SpringAnimatedItem = UIBloxModule.Utility.SpringAnimatedItem
local GamepadBottomBarContentModule = require(Modules.AvatarExperience.Common.Components.GamepadBottomBarContent)
local GamepadBottomBarElementModule = require(Modules.AvatarExperience.Common.Components.GamepadBottomBarElement)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ScreenGuiWithBlurControlModule = require(Modules.LuaApp.Components.ScreenGuiWithBlurControl)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local SpringOptions = { dampingRatio = 1, frequency = 2.5 }
local GamepadBottomBar = RoactModule.PureComponent:extend("GamepadBottomBar")
GamepadBottomBar.validateProps = TModule.strictInterface({
	displayOrder = TModule.number,
	hideGamepadBottomBar = TModule.optional(TModule.boolean),
	boundInputs = TModule.table,
	screenSize = TModule.Vector2
})
GamepadBottomBar.defaultProps = { hideGamepadBottomBar = false }

function GamepadBottomBar.getDerivedStateFromProps(p1, _)
	-- upvalues: UtilsModule (copy), ConstantsModule (copy)
	local IsNumElementsWithKeyFieldAbove = UtilsModule.getNumElementsWithKeyField(p1.boundInputs) > 0
	
	return {
		showBar = IsNumElementsWithKeyFieldAbove,
		height = IsNumElementsWithKeyFieldAbove and ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE or ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE / 2
	}
end

function GamepadBottomBar.renderWithLocalization(p1, p2)
	-- upvalues: WithStyleFunction (copy), Text (copy), UIBloxModule (copy), RoactModule (copy), CoreGui (copy), ScreenGuiWithBlurControlModule (copy), SpringAnimatedItem (copy), ConstantsModule (copy), SpringOptions (copy), GamepadBottomBarElementModule (copy), FitFrameHorizontal (copy), GamepadBottomBarContentModule (copy)
	return if p1.state.showBar then WithStyleFunction(function(p3)
		-- upvalues: p2 (copy), Text (upval), UIBloxModule (upval), RoactModule (upval), CoreGui (upval), ScreenGuiWithBlurControlModule (upval), p1 (copy), SpringAnimatedItem (upval), ConstantsModule (upval), SpringOptions (upval), GamepadBottomBarElementModule (upval), FitFrameHorizontal (upval), GamepadBottomBarContentModule (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local BText = p2.bText or p2.backText
		local NewRegular = 24 + (UIBloxModule.App.Constant.IconSize.Regular + Text.GetTextWidth(BText, _Font.Header2.Font, _Font.BaseSize * _Font.Header2.RelativeSize) + 8) + 36
		
		return RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
			PortalUIForGamepadBottomBar = RoactModule.createElement(ScreenGuiWithBlurControlModule, {
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				DisplayOrder = p1.props.displayOrder,
				Enabled = not p1.props.hideGamepadBottomBar
			}, {
				AnimatedFrame = RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
					regularProps = {
						ZIndex = 3,
						AnchorPoint = Vector2.new(0, 0),
						Position = UDim2.new(0, 0, 0, 0),
						BackgroundColor3 = Theme.BackgroundUIContrast.Color,
						BackgroundTransparency = Theme.BackgroundUIContrast.Transparency,
						Size = UDim2.new(1, 0, 0, ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE)
					},
					animatedValues = { positionY = p1.state.height },
					mapValuesToProps = function(p4)
						return { Position = UDim2.new(0, 0, 1, -p4.positionY) }
					end,
					springOptions = SpringOptions
				}, {
					BackElement = RoactModule.createElement(GamepadBottomBarElementModule, {
						elementIcon = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png",
						elementText = BText,
						position = UDim2.new(0, 24, 0, 0)
					}),
					UIElementsFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						ClipsDescendants = true,
						Position = UDim2.new(0, NewRegular, 0, 0),
						Size = UDim2.new(1, -NewRegular, 1, 0)
					}, {
						UIElements = RoactModule.createElement(FitFrameHorizontal, {
							BackgroundTransparency = 1,
							height = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Horizontal,
							AnchorPoint = Vector2.new(1, 0),
							Position = UDim2.new(1, -24, 0, 0),
							contentPadding = UDim.new(0, 36)
						}, {
							GamepadBottomBarElements = RoactModule.createElement(GamepadBottomBarContentModule, {
								width = p1.props.screenSize.X - NewRegular,
								boundInputs = p1.props.boundInputs
							})
						})
					})
				})
			})
		})
	end) else nil
end

function GamepadBottomBar.render(p1)
	-- upvalues: CryoModule (copy), WithLocalizationFunction (copy)
	local JoinResult = { backText = "CommonUI.Controls.Action.Back" }
	local BoundInput = p1.props.boundInputs[Enum.KeyCode.ButtonB]
	
	if BoundInput and BoundInput.key then
		JoinResult = CryoModule.Dictionary.join(JoinResult, { bText = BoundInput.key })
	end
	return WithLocalizationFunction(JoinResult)(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithLocalization(p2)
	end)
end

return (RoactRoduxModule.connect(function(p1, _)
	return {
		boundInputs = p1.GamepadBottomBar.boundInputs,
		screenSize = p1.ScreenSize
	}
end)(GamepadBottomBar))