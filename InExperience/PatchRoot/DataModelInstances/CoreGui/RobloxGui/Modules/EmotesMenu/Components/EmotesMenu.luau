local contextActionService = game:GetService("ContextActionService")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local workspaceService = game:GetService("Workspace")
local playersService = game:GetService("Players")
local VRService = game:GetService("VRService")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local parent = script.Parent
local parent_1 = parent.Parent
local actions = parent_1.Actions
local thunks = parent_1.Thunks
local hideMenuModule = require(actions.HideMenu)
local setLayoutModule = require(actions.SetLayout)
local showErrorModule = require(actions.ShowError)
local hideErrorModule = require(actions.HideError)
local openMenuModule = require(thunks.OpenMenu)
local emotesWheelModule = require(parent.EmotesWheel)
local errorMessageModule = require(parent.ErrorMessage)
local constantsModule = require(parent_1.Constants)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local localPlayer = playersService.LocalPlayer
local var19 = nil
local emotesMenu = roactModule.PureComponent:extend("EmotesMenu")

function emotesMenu.init(p0)
	p0.savedSelectedCoreObject = nil
	p0.savedSelectedObject = nil
end

function emotesMenu.displayVisitShopMessage(p1)
	-- upvalues: robloxTranslatorModule (ref), constantsModule (ref)
	p1.props.showError(robloxTranslatorModule:FormatByKeyForLocale(constantsModule.LocalizationKeys.VisitShopToGetEmotes, p1.props.locale))
	delay(constantsModule.ErrorDisplayTimeSeconds, function()
		-- upvalues: p1 (ref)
		p1.props.hideError()
	end)
end

function emotesMenu.bindActions(p2)
	-- upvalues: guiService (ref), userInputService (ref), contextActionService (ref), constantsModule (ref)
	contextActionService:BindAction(constantsModule.ToggleMenuAction, function(_, p3, _)
		-- upvalues: guiService (copy), userInputService (copy), p2 (ref)
		if guiService.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		elseif userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then
			return Enum.ContextActionResult.Pass
		elseif p3 == Enum.UserInputState.Begin then
			if p2.props.displayOptions.menuVisible then
				p2.props.hideMenu()
			else
				p2.props.openMenu()
			end
		end
		return nil
	end, false, constantsModule.EmoteMenuOpenKey)
end

function emotesMenu.unbindActions(_)
	-- upvalues: contextActionService (ref), constantsModule (ref)
	contextActionService:UnbindAction(constantsModule.ToggleMenuAction)
end

function emotesMenu.saveSelectedObject(p4)
	-- upvalues: guiService (ref)
	p4.savedSelectedCoreObject = guiService.SelectedCoreObject
	guiService.SelectedCoreObject = nil
	p4.savedSelectedObject = guiService.SelectedObject
	guiService.SelectedObject = nil
end

function emotesMenu.resetSelectedObject(value)
	-- upvalues: guiService (ref), coreGuiService (ref), var19 (write), localPlayer (ref)
	if guiService.SelectedCoreObject == nil then
		if if value.savedSelectedCoreObject ~= nil then value.savedSelectedCoreObject:IsDescendantOf(coreGuiService) else true then
			guiService.SelectedCoreObject = value.savedSelectedCoreObject
		end
	end
	if guiService.SelectedObject == nil then
		if var19 == nil then
			var19 = localPlayer:FindFirstChildOfClass("PlayerGui")
		end
		if if var19 then if value.savedSelectedObject ~= nil then value.savedSelectedObject:IsDescendantOf(var19) else true else false then
			guiService.SelectedObject = value.savedSelectedObject
		end
	end
end

function emotesMenu.viewPortSizeChanged(p5)
	-- upvalues: constantsModule (ref), workspaceService (ref)
	if p5.props.layout == constantsModule.Layout.TenFoot then return end
	local currentCamera = workspaceService.CurrentCamera
	
	if not currentCamera then return end
	local viewportSize = currentCamera.ViewportSize
	
	if viewportSize == Vector2.new(1, 1) then return end
	local large = constantsModule.Layout.Large
	
	if viewportSize.X < constantsModule.SmallScreenMaxSize.X or viewportSize.Y < constantsModule.SmallScreenMaxSize.Y then
		large = constantsModule.Layout.Small
	end
	p5.props.setLayout(large)
end

function emotesMenu.currentCameraChanged(p6)
	-- upvalues: workspaceService (ref)
	if p6.viewportSizeChangedConn then
		p6.viewportSizeChangedConn:Disconnect()
	end
	local currentCamera = workspaceService.CurrentCamera
	
	if currentCamera then
		p6.viewportSizeChangedConn = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: p6 (ref)
			p6:viewPortSizeChanged()
		end)
		p6:viewPortSizeChanged()
	end
end

function emotesMenu.didMount(p7)
	-- upvalues: workspaceService (ref), guiService (ref), VRService (ref), userInputService (ref)
	p7.currentCameraChangedConn = workspaceService:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: p7 (ref)
		p7:currentCameraChanged()
	end)
	p7:currentCameraChanged()
	p7.menuOpenedConn = guiService.MenuOpened:Connect(function()
		-- upvalues: p7 (ref), VRService (copy)
		if p7.props.displayOptions.menuVisible and not VRService.VREnabled then
			p7.props.hideMenu()
		end
	end)
	p7.inputOutsideMenuConn = userInputService.InputBegan:Connect(function(p8, p9)
		-- upvalues: p7 (ref)
		if p9 then return end
		if not p7.props.displayOptions.menuVisible then return end
		local userInputType = p8.UserInputType
		
		if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
			p7.props.hideMenu()
		end
	end)
	p7:bindActions()
end

function emotesMenu.willUnmount(p10)
	p10.currentCameraChangedConn:Disconnect()
	p10.viewportSizeChangedConn:Disconnect()
	p10.menuOpenedConn:Disconnect()
	p10.inputOutsideMenuConn:Disconnect()
	p10.currentCameraChangedConn = nil
	p10.viewportSizeChangedConn = nil
	p10.menuOpenedConn = nil
	p10.inputOutsideMenuConn = nil
	p10:unbindActions()
end

function emotesMenu.didUpdate(p11, p12, _)
	if p11.props.displayOptions.menuVisible ~= p12.displayOptions.menuVisible then
		if p11.props.displayOptions.menuVisible then
			p11:saveSelectedObject()
			
			return
		end
		p11:resetSelectedObject()
	end
end

function emotesMenu.render(p13)
	-- upvalues: constantsModule (ref), roactModule (ref), emotesWheelModule (ref), errorMessageModule (ref)
	local layout = constantsModule.Layouts[p13.props.layout]
	local guiInset = p13.props.displayOptions.guiInset
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutoLocalize = false,
		Position = UDim2.new(0, 0, 0, -guiInset),
		Size = UDim2.new(1, 0, 1, guiInset),
		ZIndex = constantsModule.EmotesMenuZIndex
	}, {
		Main = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = constantsModule.ScreenAvailable
		}, {
			AsspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 }),
			SizeConstraint = roactModule.createElement("UISizeConstraint", {
				MinSize = layout.EmotesWheelMinSize,
				MaxSize = layout.EmotesWheelMaxSize
			}),
			EmotesWheel = roactModule.createElement(emotesWheelModule)
		}),
		ErrorMessage = roactModule.createElement(errorMessageModule)
	})
end

return roactRoduxModule.connect(function(p14)
	return {
		displayOptions = p14.displayOptions,
		emotesInfo = p14.emotesPage.emotesInfo,
		layout = p14.layout,
		locale = p14.locale
	}
end, function(p15)
	-- upvalues: openMenuModule (ref), hideMenuModule (ref), setLayoutModule (ref), showErrorModule (ref), hideErrorModule (ref)
	return {
		openMenu = function()
			-- upvalues: p15 (ref), openMenuModule (copy)
			return p15(openMenuModule())
		end,
		hideMenu = function()
			-- upvalues: p15 (ref), hideMenuModule (copy)
			return p15(hideMenuModule())
		end,
		setLayout = function(value)
			-- upvalues: p15 (ref), setLayoutModule (copy)
			return p15(setLayoutModule(value))
		end,
		showError = function(p16)
			-- upvalues: p15 (ref), showErrorModule (copy)
			return p15(showErrorModule(p16))
		end,
		hideError = function()
			-- upvalues: p15 (ref), hideErrorModule (copy)
			return p15(hideErrorModule())
		end
	}
end)(emotesMenu)