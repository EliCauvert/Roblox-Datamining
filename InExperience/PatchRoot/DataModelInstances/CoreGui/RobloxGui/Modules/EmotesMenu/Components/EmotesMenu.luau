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
local var1 = nil
local emotesMenu = roactModule.PureComponent:extend("EmotesMenu")

function emotesMenu.init(p1)
	p1.savedSelectedCoreObject = nil
	p1.savedSelectedObject = nil
end

function emotesMenu.displayVisitShopMessage(p1)
	-- upvalues: robloxTranslatorModule (ref), constantsModule (ref)
	p1.props.showError(robloxTranslatorModule:FormatByKeyForLocale(constantsModule.LocalizationKeys.VisitShopToGetEmotes, p1.props.locale))
	delay(constantsModule.ErrorDisplayTimeSeconds, function()
		-- upvalues: p1 (ref)
		p1.props.hideError()
	end)
end

function emotesMenu.bindActions(p1)
	-- upvalues: guiService (ref), userInputService (ref), contextActionService (ref), constantsModule (ref)
	contextActionService:BindAction(constantsModule.ToggleMenuAction, function(_, p2, _)
		-- upvalues: guiService (copy), userInputService (copy), p1 (ref)
		if guiService.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		elseif userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then
			return Enum.ContextActionResult.Pass
		elseif p2 == Enum.UserInputState.Begin then
			if p1.props.displayOptions.menuVisible then
				p1.props.hideMenu()
			else
				p1.props.openMenu()
			end
		end
		return nil
	end, false, constantsModule.EmoteMenuOpenKey)
end

function emotesMenu.unbindActions(_)
	-- upvalues: contextActionService (ref), constantsModule (ref)
	contextActionService:UnbindAction(constantsModule.ToggleMenuAction)
end

function emotesMenu.saveSelectedObject(p1)
	-- upvalues: guiService (ref)
	p1.savedSelectedCoreObject = guiService.SelectedCoreObject
	guiService.SelectedCoreObject = nil
	p1.savedSelectedObject = guiService.SelectedObject
	guiService.SelectedObject = nil
end

function emotesMenu.resetSelectedObject(value)
	-- upvalues: guiService (ref), coreGuiService (ref), var1 (write), localPlayer (ref)
	if guiService.SelectedCoreObject == nil then
		if if value.savedSelectedCoreObject ~= nil then value.savedSelectedCoreObject:IsDescendantOf(coreGuiService) else true then
			guiService.SelectedCoreObject = value.savedSelectedCoreObject
		end
	end
	if guiService.SelectedObject == nil then
		if var1 == nil then
			var1 = localPlayer:FindFirstChildOfClass("PlayerGui")
		end
		if if var1 then if value.savedSelectedObject ~= nil then value.savedSelectedObject:IsDescendantOf(var1) else true else false then
			guiService.SelectedObject = value.savedSelectedObject
		end
	end
end

function emotesMenu.viewPortSizeChanged(p1)
	-- upvalues: constantsModule (ref), workspaceService (ref)
	if p1.props.layout == constantsModule.Layout.TenFoot then return end
	local currentCamera = workspaceService.CurrentCamera
	
	if not currentCamera then return end
	local viewportSize = currentCamera.ViewportSize
	
	if viewportSize == Vector2.new(1, 1) then return end
	local large = constantsModule.Layout.Large
	
	if viewportSize.X < constantsModule.SmallScreenMaxSize.X or viewportSize.Y < constantsModule.SmallScreenMaxSize.Y then
		large = constantsModule.Layout.Small
	end
	p1.props.setLayout(large)
end

function emotesMenu.currentCameraChanged(p1)
	-- upvalues: workspaceService (ref)
	if p1.viewportSizeChangedConn then
		p1.viewportSizeChangedConn:Disconnect()
	end
	local currentCamera = workspaceService.CurrentCamera
	
	if currentCamera then
		p1.viewportSizeChangedConn = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: p1 (ref)
			p1:viewPortSizeChanged()
		end)
		p1:viewPortSizeChanged()
	end
end

function emotesMenu.didMount(p1)
	-- upvalues: workspaceService (ref), guiService (ref), VRService (ref), userInputService (ref)
	p1.currentCameraChangedConn = workspaceService:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: p1 (ref)
		p1:currentCameraChanged()
	end)
	p1:currentCameraChanged()
	p1.menuOpenedConn = guiService.MenuOpened:Connect(function()
		-- upvalues: p1 (ref), VRService (copy)
		if p1.props.displayOptions.menuVisible and not VRService.VREnabled then
			p1.props.hideMenu()
		end
	end)
	p1.inputOutsideMenuConn = userInputService.InputBegan:Connect(function(p2, p3)
		-- upvalues: p1 (ref)
		if p3 then return end
		if not p1.props.displayOptions.menuVisible then return end
		local userInputType = p2.UserInputType
		
		if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
			p1.props.hideMenu()
		end
	end)
	p1:bindActions()
end

function emotesMenu.willUnmount(p1)
	p1.currentCameraChangedConn:Disconnect()
	p1.viewportSizeChangedConn:Disconnect()
	p1.menuOpenedConn:Disconnect()
	p1.inputOutsideMenuConn:Disconnect()
	p1.currentCameraChangedConn = nil
	p1.viewportSizeChangedConn = nil
	p1.menuOpenedConn = nil
	p1.inputOutsideMenuConn = nil
	p1:unbindActions()
end

function emotesMenu.didUpdate(p1, p2, _)
	if p1.props.displayOptions.menuVisible ~= p2.displayOptions.menuVisible then
		if p1.props.displayOptions.menuVisible then
			p1:saveSelectedObject()
			
			return
		end
		p1:resetSelectedObject()
	end
end

function emotesMenu.render(p1)
	-- upvalues: constantsModule (ref), roactModule (ref), emotesWheelModule (ref), errorMessageModule (ref)
	local layout = constantsModule.Layouts[p1.props.layout]
	local guiInset = p1.props.displayOptions.guiInset
	
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

return roactRoduxModule.connect(function(p1)
	return {
		displayOptions = p1.displayOptions,
		emotesInfo = p1.emotesPage.emotesInfo,
		layout = p1.layout,
		locale = p1.locale
	}
end, function(p1)
	-- upvalues: openMenuModule (ref), hideMenuModule (ref), setLayoutModule (ref), showErrorModule (ref), hideErrorModule (ref)
	return {
		openMenu = function()
			-- upvalues: p1 (ref), openMenuModule (copy)
			return p1(openMenuModule())
		end,
		hideMenu = function()
			-- upvalues: p1 (ref), hideMenuModule (copy)
			return p1(hideMenuModule())
		end,
		setLayout = function(value)
			-- upvalues: p1 (ref), setLayoutModule (copy)
			return p1(setLayoutModule(value))
		end,
		showError = function(p2)
			-- upvalues: p1 (ref), showErrorModule (copy)
			return p1(showErrorModule(p2))
		end,
		hideError = function()
			-- upvalues: p1 (ref), hideErrorModule (copy)
			return p1(hideErrorModule())
		end
	}
end)(emotesMenu)