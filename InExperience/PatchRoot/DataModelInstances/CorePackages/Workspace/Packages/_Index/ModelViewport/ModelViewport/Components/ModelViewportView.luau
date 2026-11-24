local ModelViewport = script:FindFirstAncestor("ModelViewport")
local Parent = ModelViewport.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ConstantsModule = require(ModelViewport.Constants)
local _ = require(ModelViewport.Types)

local function _(p1, CurrentCamera)
	if p1 and CurrentCamera then
		p1.CurrentCamera = CurrentCamera
	end
end

local _ = function(p1)
	local Current: () -> () = p1.onSceneChanged and p1.onSceneChanged.current
	
	if Current then
		Current()
	end
end

return function(Frame)
	-- upvalues: ConstantsModule (copy), ReactModule (copy), FoundationModule (copy)
	local SceneRefs = Frame.sceneRefs
	local InputHandlers = Frame.inputHandlers
	local Lighting = Frame.lighting or ConstantsModule.DefaultLighting
	
	return ReactModule.createElement(FoundationModule.View, {
		Size = Frame.Size,
		tag = { ["size-full"] = Frame.Size == nil },
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		Viewport = ReactModule.createElement("ViewportFrame", {
			Size = UDim2.fromScale(1, 1),
			ZIndex = 1,
			BackgroundColor3 = Frame.backgroundColor3,
			BackgroundTransparency = Frame.backgroundTransparency or 1,
			BorderSizePixel = 0,
			Ambient = Lighting.ambient,
			LightColor = Lighting.lightColor,
			LightDirection = Lighting.lightDirection,
			Active = InputHandlers ~= nil,
			Selectable = false,
			[ReactModule.Event.InputBegan] = InputHandlers and InputHandlers.onInputBegan,
			[ReactModule.Event.InputChanged] = InputHandlers and InputHandlers.onInputChanged,
			[ReactModule.Event.InputEnded] = InputHandlers and InputHandlers.onInputEnded,
			[ReactModule.Event.TouchPinch] = InputHandlers and InputHandlers.onTouchPinch,
			ref = ReactModule.useCallback(function(Current)
				-- upvalues: SceneRefs (copy)
				SceneRefs.viewportFrame.current = Current
				local Current1 = SceneRefs.camera.current
				
				if Current and Current1 then
					Current.CurrentCamera = Current1
				end
				local Current2: () -> () = SceneRefs.onSceneChanged and SceneRefs.onSceneChanged.current
				
				if Current2 then
					Current2()
				end
			end, { SceneRefs })
		}, {
			WorldModel = ReactModule.createElement("WorldModel", { ref = SceneRefs.worldModel }),
			Camera = ReactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				ref = ReactModule.useCallback(function(Current)
					-- upvalues: SceneRefs (copy)
					SceneRefs.camera.current = Current
					local Current1 = SceneRefs.viewportFrame.current
					
					if Current1 and Current then
						Current1.CurrentCamera = Current
					end
					local Current2: () -> () = SceneRefs.onSceneChanged and SceneRefs.onSceneChanged.current
					
					if Current2 then
						Current2()
					end
				end, { SceneRefs })
			})
		}),
		Overlay = if Frame.children then ReactModule.createElement(FoundationModule.View, { tag = "size-full", ZIndex = 2 }, Frame.children) else nil
	})
end