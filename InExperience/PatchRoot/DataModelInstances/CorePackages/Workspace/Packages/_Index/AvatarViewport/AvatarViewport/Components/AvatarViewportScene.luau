local AvatarViewport = script:FindFirstAncestor("AvatarViewport")
local ReactModule = require(AvatarViewport.Parent.React)
local ConstantsModule = require(AvatarViewport.Constants)
local _ = require(AvatarViewport.Types)

local function _(p1, CurrentCamera) --[[ Line: 24 | Named "bindCurrentCamera" ]]
	if p1 and CurrentCamera then
		p1.CurrentCamera = CurrentCamera
	end
end

return function(p1) --[[ Line: 30 | Named "AvatarViewportScene" ]]
	-- upvalues: ConstantsModule (copy), ReactModule (copy)
	local Refs = p1.refs
	local InputHandlers = p1.inputHandlers
	local Lighting = p1.lighting or {
		ambient = ConstantsModule.DefaultAmbient,
		lightColor = ConstantsModule.DefaultLightColor,
		lightDirection = ConstantsModule.DefaultLightDirection
	}
	
	return ReactModule.createElement("ViewportFrame", {
		Size = p1.size,
		BackgroundColor3 = p1.backgroundColor3,
		BackgroundTransparency = p1.backgroundTransparency or 0,
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
		ref = ReactModule.useCallback(function(Current) --[[ Line: 40 ]]
			-- upvalues: Refs (copy)
			Refs.viewportFrame.current = Current
			local Current1 = Refs.camera.current
			
			if Current and Current1 then
				Current.CurrentCamera = Current1
			end
		end, { Refs })
	}, {
		WorldModel = ReactModule.createElement("WorldModel", { ref = Refs.worldModel }),
		Camera = ReactModule.createElement("Camera", {
			CameraType = Enum.CameraType.Scriptable,
			ref = ReactModule.useCallback(function(Current) --[[ Line: 45 ]]
				-- upvalues: Refs (copy)
				Refs.camera.current = Current
				local Current1 = Refs.viewportFrame.current
				
				if Current1 and Current then
					Current1.CurrentCamera = Current
				end
			end, { Refs })
		})
	})
end