local Parent = script:FindFirstAncestor("ScrollTelemetry").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local StrictInterfaceResult = TModule.strictInterface({
	distance = TModule.number,
	screenSizeX = TModule.number,
	screenSizeY = TModule.number,
	scrollAreaSize = TModule.number,
	scrollDepth = TModule.optional(TModule.number),
	startDepth = TModule.optional(TModule.number),
	startPos = TModule.number,
	scrollDuration = TModule.number
})
local StrictInterfaceResult1 = TModule.strictInterface({
	distance = TModule.number,
	screenSizeX = TModule.number,
	screenSizeY = TModule.number,
	scrollAreaSize = TModule.number,
	scrollDepth = TModule.optional(TModule.number),
	startDepth = TModule.optional(TModule.number),
	startPos = TModule.number,
	scrollDuration = TModule.number,
	sortPos = TModule.number,
	gameSetTypeId = TModule.string,
	gameSetTargetId = TModule.optional(TModule.number)
})

return function(p1, p2, ScrollingDirection, p3) --[[ Line: 33 ]]
	-- upvalues: ArgCheckModule (copy), StrictInterfaceResult (copy), StrictInterfaceResult1 (copy), MutedErrorFunction (copy), CryoModule (copy)
	ArgCheckModule.isType(p2, "string", "eventContext")
	local Direction = "unknown"
	local Callback = nil
	
	if ScrollingDirection == Enum.ScrollingDirection.Y then
		Direction = "vertical"
		Callback = StrictInterfaceResult
	elseif ScrollingDirection == Enum.ScrollingDirection.X then
		Direction = "horizontal"
		Callback = StrictInterfaceResult1
	elseif ScrollingDirection == Enum.ScrollingDirection.XY then
		MutedErrorFunction(`Direction {ScrollingDirection.Name} is an unsupported option for feedScroll event`)
	end
	if Callback then
		local CallbackResult, CallbackResult2 = Callback(p3)
		
		if not CallbackResult then
			MutedErrorFunction(CallbackResult2)
		end
	else
		MutedErrorFunction(`Missing interface for unknown direction {ScrollingDirection.Name} to type check feedScroll event parameters`)
	end
	p1:sendEventDeferred(p2, "feedScroll", (CryoModule.Dictionary.join(p3, { direction = Direction })))
end