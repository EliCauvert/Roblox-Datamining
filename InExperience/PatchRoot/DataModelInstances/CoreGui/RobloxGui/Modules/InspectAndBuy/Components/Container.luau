local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local InitialViewModule = require(Parent.Components.InitialView)
local AssetDetailsModule = require(Parent.Components.AssetDetails)
local CloseButtonModule = require(Parent.Components.CloseButton)
local OverlayModule = require(Parent.Components.Overlay)
local NoInventoryNoticeModule = require(Parent.Components.NoInventoryNotice)
local ColorsModule = require(Parent.Colors)
local ConstantsModule = require(Parent.Constants)
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ThemeModule = require(Modules.Settings.Theme)
local ConstantsModule1 = require(Modules.TopBar.Constants)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local Container = RoactModule.PureComponent:extend("Container")

function Container.init(p1)
	-- upvalues: RoactModule (copy), SignalsModule (copy), DisplayModule (copy)
	p1.frameRef = RoactModule.createRef()
	p1.lastSavedSelectedCoreGui = nil
	p1.disposeUiScaleEffect = SignalsModule.createEffect(function(p2)
		-- upvalues: DisplayModule (upval), p1 (copy)
		p1:setState({
			UiScale = DisplayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
end

function Container.didMount(p1)
	-- upvalues: GuiService (copy)
	local GamepadEnabled = p1.props.gamepadEnabled
	p1.selectedCoreObjectChangedSignal = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
		-- upvalues: p1 (copy), GuiService (upval)
		if p1.props.visible and GuiService.SelectedCoreObject then
			p1.lastSavedSelectedCoreGui = GuiService.SelectedCoreObject
		end
	end)
	
	if GamepadEnabled then
		GuiService:AddSelectionParent("InspectMenu", p1.frameRef.current)
	end
end

function Container.didUpdate(p1, p2)
	-- upvalues: GuiService (copy)
	local Visible = p1.props.visible
	local GamepadEnabled = p1.props.gamepadEnabled
	
	if Visible and GamepadEnabled and p1.frameRef.current then
		GuiService:RemoveSelectionGroup("InspectMenu")
		GuiService:AddSelectionParent("InspectMenu", p1.frameRef.current)
		
		if p1.lastSavedSelectedCoreGui then
			GuiService.SelectedCoreObject = p1.lastSavedSelectedCoreGui
		end
	elseif not GamepadEnabled and p2.gamepadEnabled or not Visible then
		GuiService:RemoveSelectionGroup("InspectMenu")
	end
	if Visible and not p2.visible then
		GuiService.SelectedCoreObject = p1.lastSavedSelectedCoreGui
	end
end

function Container.willUnmount(p1)
	-- upvalues: GuiService (copy)
	p1.selectedCoreObjectChangedSignal:disconnect()
	GuiService:RemoveSelectionGroup("InspectMenu")
	GuiService.SelectedCoreObject = nil
	
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

function Container.render(p1)
	-- upvalues: ThemeModule (copy), ConstantsModule1 (copy), RoactModule (copy), InspectAndBuyContextModule (copy), ConstantsModule (copy), GuiService (copy), OverlayModule (copy), ColorsModule (copy), CloseButtonModule (copy), InitialViewModule (copy), AssetDetailsModule (copy), NoInventoryNoticeModule (copy)
	local View = p1.props.view
	local LocalPlayerModel = p1.props.localPlayerModel
	local Visible = p1.props.visible
	local UseInspectAndBuyPanelResult = ThemeModule.UseInspectAndBuyPanel()
	local ScaledTopBarHeight = ConstantsModule1.TopBarHeight * p1.state.UiScale
	local ScaledScreenSideOffset = ConstantsModule1.ScreenSideOffset * p1.state.UiScale
	
	return RoactModule.createElement(InspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: View (copy), p1 (copy), RoactModule (upval), UseInspectAndBuyPanelResult (copy), ScaledScreenSideOffset (copy), ThemeModule (upval), ScaledTopBarHeight (copy), Visible (copy), ConstantsModule (upval), GuiService (upval), OverlayModule (upval), ColorsModule (upval), CloseButtonModule (upval), InitialViewModule (upval), AssetDetailsModule (upval), LocalPlayerModel (copy), NoInventoryNoticeModule (upval)
			local v1 = p2[View]
			
			return RoactModule.createElement("ImageButton", {
				Size = UDim2.new(1, if UseInspectAndBuyPanelResult then ScaledScreenSideOffset * -2 else 0, 1, if UseInspectAndBuyPanelResult then ThemeModule.DefaultCornerRadius.Offset else ScaledTopBarHeight),
				Position = UDim2.new(0, if UseInspectAndBuyPanelResult then ScaledScreenSideOffset else 0, 0, if UseInspectAndBuyPanelResult then 0 else -ScaledTopBarHeight),
				BackgroundColor3 = v1.ContainerBackgroundColor,
				BackgroundTransparency = v1.ContainerBackgroundTransparency,
				Visible = Visible,
				Selectable = false,
				AutoButtonColor = false,
				AutoLocalize = false,
				[RoactModule.Event.Activated] = function()
					-- upvalues: View (upval), ConstantsModule (upval), GuiService (upval)
					if View == ConstantsModule.View.Wide then
						GuiService:CloseInspectMenu()
					end
				end
			}, {
				UICorner = if UseInspectAndBuyPanelResult then RoactModule.createElement("UICorner", { CornerRadius = ThemeModule.DefaultCornerRadius }) else nil,
				Overlay = RoactModule.createElement(OverlayModule),
				MainContainer = RoactModule.createElement("ImageButton", {
					AnchorPoint = v1.ContainerAnchorPoint,
					Size = v1.ContainerSize(p1.state.UiScale),
					Position = v1.ContainerPosition(p1.state.UiScale),
					BackgroundColor3 = ColorsModule.Carbon,
					BorderSizePixel = 0,
					Active = true,
					AutoButtonColor = false,
					Selectable = false,
					[RoactModule.Ref] = p1.frameRef
				}, {
					AspectRatioConstraint = v1.UseContainerAspectRatio and RoactModule.createElement("UIAspectRatioConstraint", { AspectRatio = v1.ContainerAspectRatio }),
					CloseButton = RoactModule.createElement(CloseButtonModule),
					InitialView = RoactModule.createElement(InitialViewModule),
					AssetDetails = RoactModule.createElement(AssetDetailsModule, { localPlayerModel = LocalPlayerModel }),
					NoInventoryNotice = RoactModule.createElement(NoInventoryNoticeModule)
				})
			})
		end
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		visible = p1.visible,
		gamepadEnabled = p1.gamepadEnabled
	}
end)(Container)