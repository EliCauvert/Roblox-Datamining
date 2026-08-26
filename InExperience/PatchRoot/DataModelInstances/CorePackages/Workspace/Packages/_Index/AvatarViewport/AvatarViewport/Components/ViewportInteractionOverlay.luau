local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local _ = require(avatarViewport.Types)

return function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		Name = p1.name or "InteractionOverlay",
		Size = p1.size,
		Position = p1.position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		Selectable = false,
		ZIndex = p1.zIndex,
		[reactModule.Event.InputBegan] = p1.inputHandlers.onInputBegan,
		[reactModule.Event.InputChanged] = p1.inputHandlers.onInputChanged,
		[reactModule.Event.InputEnded] = p1.inputHandlers.onInputEnded,
		[reactModule.Event.TouchPinch] = p1.inputHandlers.onTouchPinch
	})
end