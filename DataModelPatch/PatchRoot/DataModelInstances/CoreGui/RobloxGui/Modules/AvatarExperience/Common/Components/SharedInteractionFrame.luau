local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local TModule = require(CorePackages.Packages.t)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local WithAppRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)
local AxScene = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.scene")
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXPhotoboothReplacesFullview = AvatarExperienceFlagsModule.FFlagAXPhotoboothReplacesFullview
local FFlagAXPhotoboothAnalytics = AvatarExperienceFlagsModule.FFlagAXPhotoboothAnalytics
local SendUnifiedEventLogForInstanceFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventLogForInstance
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums

local function _(Input)
	local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseButton1
	local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.MouseButton2
	
	return Input.UserInputType == Enum.UserInputType.Touch, IsUserInputTypeMatch or IsUserInputTypeMatch1, IsUserInputTypeMatch, IsUserInputTypeMatch1
end

local function isDoubleTapToZoomEnabled(Name): boolean
	-- upvalues: AvatarScreen (copy), FFlagAXPhotoboothReplacesFullview (copy), GetFFlagAXEnableSlotBasedEditorModule (copy)
	return Name == AvatarScreen.AvatarEditor or (Name == AvatarScreen.Catalog or (Name == AvatarScreen.ProfilePictureEditorEmotes or (Name == AvatarScreen.CatalogSearch or (Name == AvatarScreen.MySharedAvatars or (FFlagAXPhotoboothReplacesFullview and Name == AvatarScreen.Photobooth or (GetFFlagAXEnableSlotBasedEditorModule() and Name == AvatarScreen.AvatarSwitcher or GetFFlagAXEnableSlotBasedEditorModule() and Name == AvatarScreen.EditEmotes))))))
end

local Callback = if FFlagAXPhotoboothReplacesFullview then function(AvatarEditor): boolean
	-- upvalues: AvatarScreen (copy), GetFFlagAXEnableSlotBasedEditorModule (copy)
	return AvatarEditor == AvatarScreen.AvatarEditor or (AvatarEditor == AvatarScreen.Photobooth or GetFFlagAXEnableSlotBasedEditorModule() and AvatarEditor == AvatarScreen.AvatarSwitcher)
end else nil
local SharedInteractionFrame = RoactModule.PureComponent:extend("SharedInteractionFrame")
SharedInteractionFrame.validateProps = TModule.interface({
	panByPixels = TModule.callback,
	rotateByPixels = TModule.callback,
	setAngularVelocityByPixels = TModule.callback,
	zoomToPoint = TModule.callback,
	Size = TModule.optional(TModule.UDim2),
	Position = TModule.optional(TModule.UDim2),
	ZIndex = TModule.optional(TModule.number),
	fullView = TModule.optional(TModule.userdata),
	setFullView = TModule.callback,
	analytics = TModule.table
})

function SharedInteractionFrame.disconnectEvents(p1)
	p1.inputChangedConnection:Disconnect()
	p1.inputEndedConnection:Disconnect()
	p1.renderSteppedConnection:Disconnect()
	p1.inputChangedConnection = nil
	p1.inputEndedConnection = nil
	p1.renderSteppedConnection = nil
end

function SharedInteractionFrame.getActiveInput(p1, Input)
	local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseButton2
	local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.Touch
	local IsUserInputTypeMatch2: boolean = Input.UserInputType == Enum.UserInputType.MouseButton1 or IsUserInputTypeMatch
	local IsUserInputTypeMatch3: boolean = Input.UserInputType == Enum.UserInputType.MouseMovement or IsUserInputTypeMatch2
	
	if not IsUserInputTypeMatch3 and not IsUserInputTypeMatch1 then return end
	local ActiveMouseInput = nil
	
	if IsUserInputTypeMatch3 then
		ActiveMouseInput = p1.activeMouseInput
		
		return ActiveMouseInput
	end
	if IsUserInputTypeMatch1 then
		ActiveMouseInput = p1.activeTouchInputs[Input]
	end
	return ActiveMouseInput
end

function SharedInteractionFrame.removeActivePointerInput(p1, Input, p2)
	-- upvalues: UserInputService (copy)
	if p2 then
		if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
		p1.activeMouseInput = nil
	else
		p1.activeTouchInputs[Input] = nil
		p1.numActiveTouchInputs -= 1
	end
	p1.numActiveInputs -= 1
	
	if p1.numActiveInputs == 0 then
		p1:disconnectEvents()
	end
end

function SharedInteractionFrame.doubleTapToggleFullView(p1)
	-- upvalues: isDoubleTapToZoomEnabled (copy), FFlagAXPhotoboothReplacesFullview (copy), Callback (ref), AvatarScreen (copy), FFlagAXPhotoboothAnalytics (copy), SendUnifiedEventLogForInstanceFunction (copy), UnifiedEventLogEnums (copy), FullView (copy)
	local Name = p1.props.avatarRoute.opaque.name
	
	if not isDoubleTapToZoomEnabled(Name) then return end
	if not FFlagAXPhotoboothReplacesFullview or not Callback(Name) then
		p1.props.setFullView(p1.props.analytics, Name, p1.props.fullView == FullView.None and FullView.SceneFullView or FullView.None)
		
		return
	end
	if Name == AvatarScreen.Photobooth then
		p1.props.navigation.goBack()
		
		return
	end
	if FFlagAXPhotoboothAnalytics and p1.frameRef and p1.frameRef.current then
		SendUnifiedEventLogForInstanceFunction(p1.frameRef.current, {
			elementName = "Photobooth_Opened",
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK
		})
	end
	p1.props.navigation.navigate(AvatarScreen.Photobooth)
end

function SharedInteractionFrame.handleDoubleTap(p1, Input, LastPrimaryPointerInputBeganTime)
	if p1.lastPrimaryPointerInputBeganPosition then
		local LastPrimaryPointerInputBeganTimeDelta = LastPrimaryPointerInputBeganTime - p1.lastPrimaryPointerInputBeganTime
		
		if (p1.lastPrimaryPointerInputBeganPosition - Input.Position).Magnitude < 30 and LastPrimaryPointerInputBeganTimeDelta < 0.25 then
			p1:doubleTapToggleFullView()
		end
	end
	p1.lastPrimaryPointerInputBeganPosition = Input.Position
	p1.lastPrimaryPointerInputBeganTime = LastPrimaryPointerInputBeganTime
end

function SharedInteractionFrame.addActivePointerInput(p1, Input, p2, LastTime)
	-- upvalues: CryoModule (copy), UserInputService (copy), RunService (copy)
	if p1:getActiveInput(Input) then return end
	local ActiveMouseInput = { lastPosition = Input.Position, lastTime = LastTime }
	
	if p2 then
		p1.activeMouseInput = ActiveMouseInput
	else
		p1.activeTouchInputs[Input] = CryoModule.Dictionary.join(ActiveMouseInput, {
			lastDeltaTime = 0,
			lastDeltaPosition = vector.create(0, 0, 0)
		})
		p1.numActiveTouchInputs += 1
	end
	p1.numActiveInputs += 1
	
	if p1.numActiveInputs == 1 then
		p1.props.setAngularVelocityByPixels(0)
		p1.inputChangedConnection = UserInputService.InputChanged:Connect(p1.onInputChanged)
		p1.inputEndedConnection = UserInputService.InputEnded:Connect(p1.onInputEnded)
		p1.renderSteppedConnection = RunService.RenderStepped:Connect(p1.setInputNotChanged)
	end
end

function SharedInteractionFrame.init(p1)
	-- upvalues: RoactModule (copy), UserInputService (copy)
	p1.inputChangedConnection = nil
	p1.inputEndedConnection = nil
	p1.frameRef = RoactModule.createRef()
	p1.lastPinchDistance = 1
	p1.lastPanTime = 0
	p1.lastPrimaryPointerInputBeganTime = 0
	p1.lastPrimaryPointerInputBeganPosition = nil
	p1.activeTouchInputs = {}
	p1.numActiveTouchInputs = 0
	p1.activeMouseInput = nil
	p1.numActiveInputs = 0
	
	function p1:handleScroll(Input)
		-- upvalues: p1 (copy), UserInputService (upval)
		if Input.UserInputType == Enum.UserInputType.MouseWheel then
			p1.props.zoomToPoint(-Input.Position.Z, UserInputService:GetMouseLocation())
		end
	end
	
	function p1:setInputNotChanged()
		-- upvalues: p1 (copy)
		for _, activeTouchInput in p1.activeTouchInputs do
			activeTouchInput.changedThisFrame = false
		end
	end
	
	function p1.onInputChanged(Input, _)
		-- upvalues: p1 (copy), UserInputService (upval)
		local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseMovement
		local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.Touch
		
		if not IsUserInputTypeMatch and not IsUserInputTypeMatch1 then return end
		local ActiveInput = p1:getActiveInput(Input)
		
		if not ActiveInput then return end
		local CurrentTime = tick()
		local CurrentTimeDelta = CurrentTime - ActiveInput.lastTime
		local PositionDelta = Input.Position - ActiveInput.lastPosition
		local ScaledVector = Vector2.new(PositionDelta.X, PositionDelta.Y) * Vector2.new(-1, 1)
		local IsMouseButtonPressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
		local IsMouseButtonPressed1 = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
		local IsCurrentTimeAbove = CurrentTime - p1.lastPanTime > 0.1
		
		if (IsUserInputTypeMatch and IsMouseButtonPressed or IsUserInputTypeMatch1 and p1.numActiveTouchInputs == 1) and IsCurrentTimeAbove then
			p1.props.rotateByPixels(-ScaledVector.X)
		end
		if IsUserInputTypeMatch and IsMouseButtonPressed1 or IsUserInputTypeMatch1 and p1.numActiveTouchInputs == 2 then
			p1.props.panByPixels(ScaledVector / p1.numActiveInputs)
			p1.lastPanTime = CurrentTime
		end
		ActiveInput.lastPosition = Input.Position
		ActiveInput.lastTime = CurrentTime
		
		if IsUserInputTypeMatch1 then
			if ActiveInput.changedThisFrame then
				ActiveInput.lastDeltaPosition = PositionDelta + ActiveInput.lastDeltaPosition
				ActiveInput.lastDeltaTime = CurrentTimeDelta + ActiveInput.lastDeltaTime
				
				return
			end
			ActiveInput.lastDeltaPosition = PositionDelta
			ActiveInput.lastDeltaTime = CurrentTimeDelta
			ActiveInput.changedThisFrame = true
		end
	end
	
	function p1.onInputEnded(Input, _)
		-- upvalues: p1 (copy)
		local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseButton1
		local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.MouseButton2
		local IsUserInputTypeMatch2 = Input.UserInputType == Enum.UserInputType.Touch
		local IsUserInputTypeMatch3: boolean = IsUserInputTypeMatch or IsUserInputTypeMatch1
		
		if not IsUserInputTypeMatch2 and not IsUserInputTypeMatch3 then return end
		local ActiveInput = p1:getActiveInput(Input)
		
		if not ActiveInput then return end
		local CurrentTime = tick()
		local CurrentTimeDelta = CurrentTime - p1.lastPanTime
		local IsCurrentTimeDeltaAbove: boolean = p1.numActiveInputs == 1 and CurrentTimeDelta > 0.1
		
		if (IsUserInputTypeMatch2 and ActiveInput.changedThisFrame or IsUserInputTypeMatch) and IsCurrentTimeDeltaAbove then
			local PositionDelta = nil
			local CurrentTimeDelta1 = nil
			if IsUserInputTypeMatch then
				PositionDelta = Input.Position - ActiveInput.lastPosition
				CurrentTimeDelta1 = CurrentTime - ActiveInput.lastTime
			else
				PositionDelta = ActiveInput.lastDeltaPosition
				CurrentTimeDelta1 = ActiveInput.lastDeltaTime
			end
			p1.props.setAngularVelocityByPixels(PositionDelta.X / CurrentTimeDelta1)
		end
		p1:removeActivePointerInput(Input, IsUserInputTypeMatch3)
	end
	
	function p1.onInputBegan(p2, Input)
		-- upvalues: p1 (copy)
		p1.handleScroll(p2, Input)
		local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseButton1
		local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.MouseButton2
		local IsUserInputTypeMatch2 = Input.UserInputType == Enum.UserInputType.Touch
		local IsUserInputTypeMatch3: boolean = IsUserInputTypeMatch or IsUserInputTypeMatch1
		
		if not IsUserInputTypeMatch2 and not IsUserInputTypeMatch3 then return end
		local CurrentTime = tick()
		
		if IsUserInputTypeMatch2 or IsUserInputTypeMatch then
			p1:handleDoubleTap(Input, CurrentTime)
		end
		p1:addActivePointerInput(Input, IsUserInputTypeMatch3, CurrentTime)
	end
	
	function p1:onTouchPinch(Entry, _, _, UserInputState)
		-- upvalues: p1 (copy)
		if Entry[2] == nil then return end
		if UserInputState == Enum.UserInputState.Begin then
			p1.lastPinchDistance = (Entry[1] - Entry[2]).Magnitude
			
			return
		else
			local Distance = (Entry[1] - Entry[2]).Magnitude
			p1.lastPinchDistance = Distance
			p1.props.zoomToPoint((Distance - p1.lastPinchDistance) * -0.05, (Entry[1] + Entry[2]) / 2)
		end
	end
end

function SharedInteractionFrame.willUnmount(p2)
	if p2.inputChangedConnection then
		p2:disconnectEvents()
	end
end

function SharedInteractionFrame.shouldBeVisible(p2): boolean
	-- upvalues: AvatarScreenProperties (copy)
	local AvatarScreenProperty = AvatarScreenProperties[p2.props.avatarRoute.current.name]
	
	return not AvatarScreenProperty or not AvatarScreenProperty.coversSceneWhenExpanded or not p2.props.itemDetailsExpanded
end

function SharedInteractionFrame.render(p2)
	-- upvalues: AxScene (copy), RoactModule (copy)
	local ShouldBeVisible = p2:shouldBeVisible()
	AxScene:trace("SharedInteractionFrame visible: {}", ShouldBeVisible)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p2.props.Size or UDim2.new(1, 0, 1, 0),
		Position = p2.props.Position,
		ZIndex = p2.props.ZIndex,
		Visible = ShouldBeVisible,
		Active = true,
		[RoactModule.Event.InputBegan] = p2.onInputBegan,
		[RoactModule.Event.InputChanged] = p2.handleScroll,
		[RoactModule.Event.TouchPinch] = p2.onTouchPinch,
		[RoactModule.Ref] = p2.frameRef
	}, p2.props[RoactModule.Children])
end

local WithAppRouteModuleResult = WithAppRouteModule((RoactServices.connect({ analytics = AnalyticsModule })((RoactRoduxModule.connect(function(p2, p3)
	-- upvalues: SelectIsFullViewModule (copy)
	return {
		fullView = SelectIsFullViewModule(p2, p3.avatarRoute.opaque.name),
		itemDetailsExpanded = p2.AvatarExperience.Common.ItemDetailsExpanded
	}
end, function(Callback)
	-- upvalues: SetFullViewModule (copy)
	return {
		setFullView = function(p2, p3, p4)
			-- upvalues: Callback (copy), SetFullViewModule (upval)
			Callback(SetFullViewModule(p2, p3, p4))
		end
	}
end)(SharedInteractionFrame)))))

if FFlagAXPhotoboothReplacesFullview then
	WithAppRouteModuleResult = RoactNavigationModule.withNavigation(WithAppRouteModuleResult)
end
return WithAppRouteModuleResult