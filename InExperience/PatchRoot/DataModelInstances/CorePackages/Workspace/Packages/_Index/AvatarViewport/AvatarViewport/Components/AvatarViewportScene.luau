local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local constantsModule = require(avatarViewport.Constants)
local _ = require(avatarViewport.Types)

local function _(p1, p2)
	if p1 and p2 then
		p1.CurrentCamera = p2
	end
end

return function(p1)
	-- upvalues: constantsModule (ref), reactModule (ref)
	local refs = p1.refs
	local inputHandlers = p1.inputHandlers
	local lighting = p1.lighting or {
		ambient = constantsModule.DefaultAmbient,
		lightColor = constantsModule.DefaultLightColor,
		lightDirection = constantsModule.DefaultLightDirection
	}
	
	return reactModule.createElement("ViewportFrame", {
		Size = p1.size,
		BackgroundColor3 = p1.backgroundColor3,
		BackgroundTransparency = p1.backgroundTransparency or 0,
		BorderSizePixel = 0,
		Ambient = lighting.ambient,
		LightColor = lighting.lightColor,
		LightDirection = lighting.lightDirection,
		Active = inputHandlers ~= nil,
		Selectable = false,
		[reactModule.Event.InputBegan] = inputHandlers and inputHandlers.onInputBegan,
		[reactModule.Event.InputChanged] = inputHandlers and inputHandlers.onInputChanged,
		[reactModule.Event.InputEnded] = inputHandlers and inputHandlers.onInputEnded,
		[reactModule.Event.TouchPinch] = inputHandlers and inputHandlers.onTouchPinch,
		ref = reactModule.useCallback(function(p2)
			-- upvalues: refs (ref)
			refs.viewportFrame.current = p2
			local current = refs.camera.current
			
			if p2 and current then
				p2.CurrentCamera = current
			end
		end, { refs })
	}, {
		WorldModel = reactModule.createElement("WorldModel", { ref = refs.worldModel }),
		Camera = reactModule.createElement("Camera", {
			CameraType = Enum.CameraType.Scriptable,
			ref = reactModule.useCallback(function(p2)
				-- upvalues: refs (ref)
				refs.camera.current = p2
				local current = refs.viewportFrame.current
				
				if current and p2 then
					current.CurrentCamera = p2
				end
			end, { refs })
		})
	})
end