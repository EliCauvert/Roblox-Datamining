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

function container.init(p0) --[[ line: 26 ]]
	-- upvalues: roactModule (ref), signalsModule (ref), displayModule (ref)
	p0.frameRef = roactModule.createRef()
	p0.lastSavedSelectedCoreGui = nil
	p0.disposeUiScaleEffect = signalsModule.createEffect(function(p1) --[[ line: 29 ]]
		-- upvalues: displayModule (copy), p0 (ref)
		p0:setState({
			UiScale = displayModule.GetDisplayStore(p1).getUIScale(p1)
		})
	end)
end

function container.didMount(p2) --[[ line: 37 ]]
	-- upvalues: guiService (ref)
	local gamepadEnabled = p2.props.gamepadEnabled
	p2.selectedCoreObjectChangedSignal = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 40 ]]
		-- upvalues: p2 (ref), guiService (copy)
		if p2.props.visible and guiService.SelectedCoreObject then
			p2.lastSavedSelectedCoreGui = guiService.SelectedCoreObject
		end
	end)
	
	if gamepadEnabled then
		guiService:AddSelectionParent("InspectMenu", p2.frameRef.current)
	end
end

function container.didUpdate(p3, p4) --[[ line: 52 ]]
	-- upvalues: guiService (ref)
	local visible = p3.props.visible
	local gamepadEnabled = p3.props.gamepadEnabled
	
	if visible and gamepadEnabled and p3.frameRef.current then
		guiService:RemoveSelectionGroup("InspectMenu")
		guiService:AddSelectionParent("InspectMenu", p3.frameRef.current)
		
		if p3.lastSavedSelectedCoreGui then
			guiService.SelectedCoreObject = p3.lastSavedSelectedCoreGui
		end
	elseif not gamepadEnabled and p4.gamepadEnabled or not visible then
		guiService:RemoveSelectionGroup("InspectMenu")
	end
	if visible and not p4.visible then
		guiService.SelectedCoreObject = p3.lastSavedSelectedCoreGui
	end
end

function container.willUnmount(p5) --[[ line: 72 ]]
	-- upvalues: guiService (ref)
	p5.selectedCoreObjectChangedSignal:disconnect()
	guiService:RemoveSelectionGroup("InspectMenu")
	guiService.SelectedCoreObject = nil
	
	if p5.disposeUiScaleEffect then
		p5.disposeUiScaleEffect()
	end
end

function container.render(p6) --[[ line: 81 ]]
	-- upvalues: themeModule (ref), constantsModule_1 (ref), roactModule (ref), inspectAndBuyContextModule (ref), constantsModule (ref), guiService (ref), overlayModule (ref), colorsModule (ref), closeButtonModule (ref), initialViewModule (ref), assetDetailsModule (ref), noInventoryNoticeModule (ref)
	local view = p6.props.view
	local localPlayerModel = p6.props.localPlayerModel
	local visible = p6.props.visible
	local var17 = themeModule.UseInspectAndBuyPanel()
	local var18 = constantsModule_1.TopBarHeight * p6.state.UiScale
	local var19 = constantsModule_1.ScreenSideOffset * p6.state.UiScale
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p7) --[[ line: 90 ]]
			-- upvalues: view (ref), p6 (ref), roactModule (copy), var17 (ref), var19 (ref), themeModule (copy), var18 (ref), visible (ref), constantsModule (copy), guiService (copy), overlayModule (copy), colorsModule (copy), closeButtonModule (copy), initialViewModule (copy), assetDetailsModule (copy), localPlayerModel (ref), noInventoryNoticeModule (copy)
			local var20 = p7[view]
			
			return roactModule.createElement("ImageButton", {
				Size = UDim2.new(1, if var17 then var19 * -2 else 0, 1, if var17 then themeModule.DefaultCornerRadius.Offset else var18),
				Position = UDim2.new(0, if var17 then var19 else 0, 0, if var17 then 0 else -var18),
				BackgroundColor3 = var20.ContainerBackgroundColor,
				BackgroundTransparency = var20.ContainerBackgroundTransparency,
				Visible = visible,
				Selectable = false,
				AutoButtonColor = false,
				AutoLocalize = false,
				[roactModule.Event.Activated] = function() --[[ line: 114 ]]
					-- upvalues: view (copy), constantsModule (copy), guiService (copy)
					if view == constantsModule.View.Wide then
						guiService:CloseInspectMenu()
					end
				end
			}, {
				UICorner = if var17 then roactModule.createElement("UICorner", { CornerRadius = themeModule.DefaultCornerRadius }) else nil,
				Overlay = roactModule.createElement(overlayModule),
				MainContainer = roactModule.createElement("ImageButton", {
					AnchorPoint = var20.ContainerAnchorPoint,
					Size = var20.ContainerSize(p6.state.UiScale),
					Position = var20.ContainerPosition(p6.state.UiScale),
					BackgroundColor3 = colorsModule.Carbon,
					BorderSizePixel = 0,
					Active = true,
					AutoButtonColor = false,
					Selectable = false,
					[roactModule.Ref] = p6.frameRef
				}, {
					AspectRatioConstraint = var20.UseContainerAspectRatio and roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = var20.ContainerAspectRatio }),
					CloseButton = roactModule.createElement(closeButtonModule),
					InitialView = roactModule.createElement(initialViewModule),
					AssetDetails = roactModule.createElement(assetDetailsModule, { localPlayerModel = localPlayerModel }),
					NoInventoryNotice = roactModule.createElement(noInventoryNoticeModule)
				})
			})
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p8, _) --[[ line: 153 ]]
	return {
		view = p8.view,
		visible = p8.visible,
		gamepadEnabled = p8.gamepadEnabled
	}
end)(container)