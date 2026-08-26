local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local initialViewModule = require(parent.Components.InitialView)
local assetDetailsModule = require(parent.Components.AssetDetails)
local closeButtonModule = require(parent.Components.CloseButton)
local overlayModule = require(parent.Components.Overlay)
local noInventoryNoticeModule = require(parent.Components.NoInventoryNotice)
local colorsModule = require(parent.Colors)
local constantsModule = require(parent.Constants)
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local modules = game:GetService("CoreGui").RobloxGui.Modules
local themeModule = require(modules.Settings.Theme)
local constantsModule_1 = require(modules.TopBar.Constants)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local container = roactModule.PureComponent:extend("Container")

function container.init(p1)
	-- upvalues: roactModule (ref), signalsModule (ref), displayModule (ref)
	p1.frameRef = roactModule.createRef()
	p1.lastSavedSelectedCoreGui = nil
	p1.disposeUiScaleEffect = signalsModule.createEffect(function(p2)
		-- upvalues: displayModule (copy), p1 (ref)
		p1:setState({
			UiScale = displayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
end

function container.didMount(p1)
	-- upvalues: guiService (ref)
	local gamepadEnabled = p1.props.gamepadEnabled
	p1.selectedCoreObjectChangedSignal = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
		-- upvalues: p1 (ref), guiService (copy)
		if p1.props.visible and guiService.SelectedCoreObject then
			p1.lastSavedSelectedCoreGui = guiService.SelectedCoreObject
		end
	end)
	
	if gamepadEnabled then
		guiService:AddSelectionParent("InspectMenu", p1.frameRef.current)
	end
end

function container.didUpdate(p1, p2)
	-- upvalues: guiService (ref)
	local visible = p1.props.visible
	local gamepadEnabled = p1.props.gamepadEnabled
	
	if visible and gamepadEnabled and p1.frameRef.current then
		guiService:RemoveSelectionGroup("InspectMenu")
		guiService:AddSelectionParent("InspectMenu", p1.frameRef.current)
		
		if p1.lastSavedSelectedCoreGui then
			guiService.SelectedCoreObject = p1.lastSavedSelectedCoreGui
		end
	elseif not gamepadEnabled and p2.gamepadEnabled or not visible then
		guiService:RemoveSelectionGroup("InspectMenu")
	end
	if visible and not p2.visible then
		guiService.SelectedCoreObject = p1.lastSavedSelectedCoreGui
	end
end

function container.willUnmount(p1)
	-- upvalues: guiService (ref)
	p1.selectedCoreObjectChangedSignal:disconnect()
	guiService:RemoveSelectionGroup("InspectMenu")
	guiService.SelectedCoreObject = nil
	
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

function container.render(p1)
	-- upvalues: themeModule (ref), constantsModule_1 (ref), roactModule (ref), inspectAndBuyContextModule (ref), constantsModule (ref), guiService (ref), overlayModule (ref), colorsModule (ref), closeButtonModule (ref), initialViewModule (ref), assetDetailsModule (ref), noInventoryNoticeModule (ref)
	local view = p1.props.view
	local localPlayerModel = p1.props.localPlayerModel
	local visible = p1.props.visible
	local var1 = themeModule.UseInspectAndBuyPanel()
	local var2 = constantsModule_1.TopBarHeight * p1.state.UiScale
	local var3 = constantsModule_1.ScreenSideOffset * p1.state.UiScale
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: view (ref), p1 (ref), roactModule (copy), var1 (ref), var3 (ref), themeModule (copy), var2 (ref), visible (ref), constantsModule (copy), guiService (copy), overlayModule (copy), colorsModule (copy), closeButtonModule (copy), initialViewModule (copy), assetDetailsModule (copy), localPlayerModel (ref), noInventoryNoticeModule (copy)
			local var4 = p2[view]
			
			return roactModule.createElement("ImageButton", {
				Size = UDim2.new(1, if var1 then var3 * -2 else 0, 1, if var1 then themeModule.DefaultCornerRadius.Offset else var2),
				Position = UDim2.new(0, if var1 then var3 else 0, 0, if var1 then 0 else -var2),
				BackgroundColor3 = var4.ContainerBackgroundColor,
				BackgroundTransparency = var4.ContainerBackgroundTransparency,
				Visible = visible,
				Selectable = false,
				AutoButtonColor = false,
				AutoLocalize = false,
				[roactModule.Event.Activated] = function()
					-- upvalues: view (copy), constantsModule (copy), guiService (copy)
					if view == constantsModule.View.Wide then
						guiService:CloseInspectMenu()
					end
				end
			}, {
				UICorner = if var1 then roactModule.createElement("UICorner", { CornerRadius = themeModule.DefaultCornerRadius }) else nil,
				Overlay = roactModule.createElement(overlayModule),
				MainContainer = roactModule.createElement("ImageButton", {
					AnchorPoint = var4.ContainerAnchorPoint,
					Size = var4.ContainerSize(p1.state.UiScale),
					Position = var4.ContainerPosition(p1.state.UiScale),
					BackgroundColor3 = colorsModule.Carbon,
					BorderSizePixel = 0,
					Active = true,
					AutoButtonColor = false,
					Selectable = false,
					[roactModule.Ref] = p1.frameRef
				}, {
					AspectRatioConstraint = var4.UseContainerAspectRatio and roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = var4.ContainerAspectRatio }),
					CloseButton = roactModule.createElement(closeButtonModule),
					InitialView = roactModule.createElement(initialViewModule),
					AssetDetails = roactModule.createElement(assetDetailsModule, { localPlayerModel = localPlayerModel }),
					NoInventoryNotice = roactModule.createElement(noInventoryNoticeModule)
				})
			})
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		visible = p1.visible,
		gamepadEnabled = p1.gamepadEnabled
	}
end)(container)