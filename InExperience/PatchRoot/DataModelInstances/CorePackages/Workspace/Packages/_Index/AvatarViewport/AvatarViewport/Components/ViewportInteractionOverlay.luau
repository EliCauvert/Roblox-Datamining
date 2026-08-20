local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local _ = require(avatarViewport.Types)

return function(p0) --[[ line: 18 | named "ViewportInteractionOverlay" ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		Name = p0.name or "InteractionOverlay",
		Size = p0.size,
		Position = p0.position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		Selectable = false,
		ZIndex = p0.zIndex,
		[reactModule.Event.InputBegan] = p0.inputHandlers.onInputBegan,
		[reactModule.Event.InputChanged] = p0.inputHandlers.onInputChanged,
		[reactModule.Event.InputEnded] = p0.inputHandlers.onInputEnded,
		[reactModule.Event.TouchPinch] = p0.inputHandlers.onTouchPinch
	})
end