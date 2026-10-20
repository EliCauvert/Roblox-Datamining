local AvatarViewport = script:FindFirstAncestor("AvatarViewport")
local ReactModule = require(AvatarViewport.Parent.React)
local _ = require(AvatarViewport.Types)

return function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		Name = p1.name or "InteractionOverlay",
		Size = p1.size,
		Position = p1.position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		Selectable = false,
		ZIndex = p1.zIndex,
		[ReactModule.Event.InputBegan] = p1.inputHandlers.onInputBegan,
		[ReactModule.Event.InputChanged] = p1.inputHandlers.onInputChanged,
		[ReactModule.Event.InputEnded] = p1.inputHandlers.onInputEnded,
		[ReactModule.Event.TouchPinch] = p1.inputHandlers.onTouchPinch
	})
end