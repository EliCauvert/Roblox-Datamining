local ContextActionService = game:GetService("ContextActionService")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local VRService = game:GetService("VRService")
local CoreGui = game:GetService("CoreGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent
local Parent1 = Parent.Parent
local Actions = Parent1.Actions
local HideMenuModule = require(Actions.HideMenu)
local SetLayoutModule = require(Actions.SetLayout)
local ShowErrorModule = require(Actions.ShowError)
local HideErrorModule = require(Actions.HideError)
local OpenMenuModule = require(Parent1.Thunks.OpenMenu)
local EmotesWheelModule = require(Parent.EmotesWheel)
local ErrorMessageModule = require(Parent.ErrorMessage)
local ConstantsModule = require(Parent1.Constants)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerGui = nil
local EmotesMenu = RoactModule.PureComponent:extend("EmotesMenu")

function EmotesMenu.init(p1)
	p1.savedSelectedCoreObject = nil
	p1.savedSelectedObject = nil
end

function EmotesMenu.displayVisitShopMessage(p1)
	-- upvalues: RobloxTranslatorModule (copy), ConstantsModule (copy)
	p1.props.showError((RobloxTranslatorModule:FormatByKeyForLocale(ConstantsModule.LocalizationKeys.VisitShopToGetEmotes, p1.props.locale)))
	delay(ConstantsModule.ErrorDisplayTimeSeconds, function()
		-- upvalues: p1 (copy)
		p1.props.hideError()
	end)
end

function EmotesMenu.bindActions(p1)
	-- upvalues: GuiService (copy), UserInputService (copy), ContextActionService (copy), ConstantsModule (copy)
	ContextActionService:BindAction(ConstantsModule.ToggleMenuAction, function(_, InputState, _)
		-- upvalues: GuiService (upval), UserInputService (upval), p1 (copy)
		if GuiService.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
			return Enum.ContextActionResult.Pass
		end
		if InputState == Enum.UserInputState.Begin then
			if p1.props.displayOptions.menuVisible then
				p1.props.hideMenu()
			else
				p1.props.openMenu()
			end
		end
		return nil
	end, false, ConstantsModule.EmoteMenuOpenKey)
end

function EmotesMenu:unbindActions()
	-- upvalues: ContextActionService (copy), ConstantsModule (copy)
	ContextActionService:UnbindAction(ConstantsModule.ToggleMenuAction)
end

function EmotesMenu.saveSelectedObject(p1)
	-- upvalues: GuiService (copy)
	p1.savedSelectedCoreObject = GuiService.SelectedCoreObject
	GuiService.SelectedCoreObject = nil
	p1.savedSelectedObject = GuiService.SelectedObject
	GuiService.SelectedObject = nil
end

function EmotesMenu.resetSelectedObject(p1)
	-- upvalues: GuiService (copy), CoreGui (copy), PlayerGui (ref), LocalPlayer (copy)
	if GuiService.SelectedCoreObject == nil and (p1.savedSelectedCoreObject == nil or p1.savedSelectedCoreObject:IsDescendantOf(CoreGui)) then
		GuiService.SelectedCoreObject = p1.savedSelectedCoreObject
	end
	if GuiService.SelectedObject == nil then
		if PlayerGui == nil then
			PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		end
		if if PlayerGui then p1.savedSelectedObject == nil or p1.savedSelectedObject:IsDescendantOf(PlayerGui) else false then
			GuiService.SelectedObject = p1.savedSelectedObject
		end
	end
end

function EmotesMenu.viewPortSizeChanged(p1)
	-- upvalues: ConstantsModule (copy), Workspace (copy)
	if p1.props.layout == ConstantsModule.Layout.TenFoot then return end
	local CurrentCamera = Workspace.CurrentCamera
	
	if not CurrentCamera then return end
	local ViewportSize = CurrentCamera.ViewportSize
	
	if ViewportSize == Vector2.new(1, 1) then return end
	local Large = ConstantsModule.Layout.Large
	local IsYBelow = ViewportSize.Y < ConstantsModule.SmallScreenMaxSize.Y
	
	if ViewportSize.X < ConstantsModule.SmallScreenMaxSize.X or IsYBelow then
		Large = ConstantsModule.Layout.Small
	end
	p1.props.setLayout(Large)
end

function EmotesMenu.currentCameraChanged(p1)
	-- upvalues: Workspace (copy)
	if p1.viewportSizeChangedConn then
		p1.viewportSizeChangedConn:Disconnect()
	end
	local CurrentCamera = Workspace.CurrentCamera
	
	if CurrentCamera then
		p1.viewportSizeChangedConn = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: p1 (copy)
			p1:viewPortSizeChanged()
		end)
		p1:viewPortSizeChanged()
	end
end

function EmotesMenu.didMount(p1)
	-- upvalues: Workspace (copy), GuiService (copy), VRService (copy), UserInputService (copy)
	p1.currentCameraChangedConn = Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: p1 (copy)
		p1:currentCameraChanged()
	end)
	p1:currentCameraChanged()
	p1.menuOpenedConn = GuiService.MenuOpened:Connect(function()
		-- upvalues: p1 (copy), VRService (upval)
		if p1.props.displayOptions.menuVisible and not VRService.VREnabled then
			p1.props.hideMenu()
		end
	end)
	p1.inputOutsideMenuConn = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
		-- upvalues: p1 (copy)
		if GameProcessed then return end
		if not p1.props.displayOptions.menuVisible then return end
		local UserInputType = Input.UserInputType
		
		if UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch then
			p1.props.hideMenu()
		end
	end)
	p1:bindActions()
end

function EmotesMenu.willUnmount(p1)
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

function EmotesMenu.didUpdate(p1, p2, _)
	if p1.props.displayOptions.menuVisible ~= p2.displayOptions.menuVisible then
		if p1.props.displayOptions.menuVisible then
			p1:saveSelectedObject()
			
			return
		end
		p1:resetSelectedObject()
	end
end

function EmotesMenu.render(p1)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), EmotesWheelModule (copy), ErrorMessageModule (copy)
	local Layout = ConstantsModule.Layouts[p1.props.layout]
	local GuiInset = p1.props.displayOptions.guiInset
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutoLocalize = false,
		Position = UDim2.new(0, 0, 0, -GuiInset),
		Size = UDim2.new(1, 0, 1, GuiInset),
		ZIndex = ConstantsModule.EmotesMenuZIndex
	}, {
		Main = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = ConstantsModule.ScreenAvailable
		}, {
			AsspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 }),
			SizeConstraint = RoactModule.createElement("UISizeConstraint", {
				MinSize = Layout.EmotesWheelMinSize,
				MaxSize = Layout.EmotesWheelMaxSize
			}),
			EmotesWheel = RoactModule.createElement(EmotesWheelModule)
		}),
		ErrorMessage = RoactModule.createElement(ErrorMessageModule)
	})
end

return RoactRoduxModule.connect(function(p1)
	return {
		displayOptions = p1.displayOptions,
		emotesInfo = p1.emotesPage.emotesInfo,
		layout = p1.layout,
		locale = p1.locale
	}
end, function(Callback)
	-- upvalues: OpenMenuModule (copy), HideMenuModule (copy), SetLayoutModule (copy), ShowErrorModule (copy), HideErrorModule (copy)
	return {
		openMenu = function()
			-- upvalues: Callback (copy), OpenMenuModule (upval)
			return Callback(OpenMenuModule())
		end,
		hideMenu = function()
			-- upvalues: Callback (copy), HideMenuModule (upval)
			return Callback(HideMenuModule())
		end,
		setLayout = function(p1)
			-- upvalues: Callback (copy), SetLayoutModule (upval)
			return Callback(SetLayoutModule(p1))
		end,
		showError = function(p1)
			-- upvalues: Callback (copy), ShowErrorModule (upval)
			return Callback(ShowErrorModule(p1))
		end,
		hideError = function()
			-- upvalues: Callback (copy), HideErrorModule (upval)
			return Callback(HideErrorModule())
		end
	}
end)(EmotesMenu)