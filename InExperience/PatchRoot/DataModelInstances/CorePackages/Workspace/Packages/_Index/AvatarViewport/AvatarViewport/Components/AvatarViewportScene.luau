local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local constantsModule = require(avatarViewport.Constants)
local _ = require(avatarViewport.Types)

local function _(p0, p1) --[[ line: 24 | named "bindCurrentCamera" ]]
	if p0 and p1 then
		p0.CurrentCamera = p1
	end
end

return function(p2) --[[ line: 30 | named "AvatarViewportScene" ]]
	-- upvalues: constantsModule (ref), reactModule (ref)
	local refs = p2.refs
	local inputHandlers = p2.inputHandlers
	local lighting = p2.lighting or {
		ambient = constantsModule.DefaultAmbient,
		lightColor = constantsModule.DefaultLightColor,
		lightDirection = constantsModule.DefaultLightDirection
	}
	
	return reactModule.createElement("ViewportFrame", {
		Size = p2.size,
		BackgroundColor3 = p2.backgroundColor3,
		BackgroundTransparency = p2.backgroundTransparency or 0,
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
		ref = reactModule.useCallback(function(p3) --[[ line: 40 ]]
			-- upvalues: refs (ref)
			refs.viewportFrame.current = p3
			local current = refs.camera.current
			
			if p3 and current then
				p3.CurrentCamera = current
			end
		end, { refs })
	}, {
		WorldModel = reactModule.createElement("WorldModel", { ref = refs.worldModel }),
		Camera = reactModule.createElement("Camera", {
			CameraType = Enum.CameraType.Scriptable,
			ref = reactModule.useCallback(function(p4) --[[ line: 45 ]]
				-- upvalues: refs (ref)
				refs.camera.current = p4
				local current = refs.viewportFrame.current
				
				if current and p4 then
					current.CurrentCamera = p4
				end
			end, { refs })
		})
	})
end