local _ = require("./types")

return function(p1, ScrollFrame, p2)
	if p2 ~= nil then
		local ReadResult = p1.read(p2)
		local AbsoluteCanvasSizeResult = p1.observe.AbsoluteCanvasSize(ScrollFrame)
		local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(ScrollFrame)
		
		local function cancel(Input)
			-- upvalues: p1 (copy), ReadResult (ref)
			local UserInputType = Input.UserInputType
			local TypesEnum = p1.types.Enum
			
			if UserInputType == TypesEnum.UserInputType.Touch or UserInputType == TypesEnum.UserInputType.MouseButton1 or UserInputType == TypesEnum.UserInputType.MouseWheel then
				ReadResult = nil
			end
		end
		
		p1.runtime.connect(ScrollFrame, "InputBegan", cancel)
		p1.runtime.connect(ScrollFrame, "InputChanged", cancel)
		p1.Compose.watch(function(Callback)
			-- upvalues: AbsoluteCanvasSizeResult (copy), AbsoluteWindowSizeResult (copy), ReadResult (ref), ScrollFrame (copy)
			local CallbackResult = Callback(AbsoluteCanvasSizeResult)
			local CallbackResult1 = Callback(AbsoluteWindowSizeResult)
			local CanvasPosition = ReadResult
			
			if CanvasPosition == nil or CallbackResult1.X <= 0 or CallbackResult1.Y <= 0 then return end
			if CanvasPosition.X ~= 0 and CallbackResult.X <= CallbackResult1.X or CanvasPosition.Y ~= 0 and CallbackResult.Y <= CallbackResult1.Y then return end
			ScrollFrame.CanvasPosition = CanvasPosition
			
			if ScrollFrame.CanvasPosition == CanvasPosition then
				ReadResult = nil
			end
		end)
		
		return
	end
end