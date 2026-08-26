local parent = script:FindFirstAncestor("ScrollTelemetry").Parent
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local mutedError = require(parent.Loggers).mutedError
local var1 = tModule.strictInterface({
	distance = tModule.number,
	screenSizeX = tModule.number,
	screenSizeY = tModule.number,
	scrollAreaSize = tModule.number,
	scrollDepth = tModule.optional(tModule.number),
	startDepth = tModule.optional(tModule.number),
	startPos = tModule.number,
	scrollDuration = tModule.number
})
local var2 = tModule.strictInterface({
	distance = tModule.number,
	screenSizeX = tModule.number,
	screenSizeY = tModule.number,
	scrollAreaSize = tModule.number,
	scrollDepth = tModule.optional(tModule.number),
	startDepth = tModule.optional(tModule.number),
	startPos = tModule.number,
	scrollDuration = tModule.number,
	sortPos = tModule.number,
	gameSetTypeId = tModule.string,
	gameSetTargetId = tModule.optional(tModule.number)
})

return function(p1, p2, p3, p4)
	-- upvalues: argCheckModule (ref), var1 (ref), var2 (ref), mutedError (ref), cryoModule (ref)
	argCheckModule.isType(p2, "string", "eventContext")
	local var3 = "unknown"
	local var4 = nil
	
	if p3 == Enum.ScrollingDirection.Y then
		var3 = "vertical"
		var4 = var1
	elseif p3 == Enum.ScrollingDirection.X then
		var3 = "horizontal"
		var4 = var2
	elseif p3 == Enum.ScrollingDirection.XY then
		mutedError(`Direction {p3.Name} is an unsupported option for feedScroll event`)
	end
	if var4 then
		local var5, var6 = var4(p4)
		
		if not var5 then
			mutedError(var6)
		end
	else
		mutedError(`Missing interface for unknown direction {p3.Name} to type check feedScroll event parameters`)
	end
	p1:sendEventDeferred(p2, "feedScroll", cryoModule.Dictionary.join(p4, { direction = var3 }))
end