local parent = script:FindFirstAncestor("ScrollTelemetry").Parent
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local mutedError = require(parent.Loggers).mutedError
local var3 = tModule.strictInterface({
	distance = tModule.number,
	screenSizeX = tModule.number,
	screenSizeY = tModule.number,
	scrollAreaSize = tModule.number,
	scrollDepth = tModule.optional(tModule.number),
	startDepth = tModule.optional(tModule.number),
	startPos = tModule.number,
	scrollDuration = tModule.number
})
local var4 = tModule.strictInterface({
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

return function(p0, p1, p2, p3) --[[ line: 33 ]]
	-- upvalues: argCheckModule (ref), var3 (ref), var4 (ref), mutedError (ref), cryoModule (ref)
	argCheckModule.isType(p1, "string", "eventContext")
	local var5 = "unknown"
	local var6 = nil
	
	if p2 == Enum.ScrollingDirection.Y then
		var5 = "vertical"
		var6 = var3
	elseif p2 == Enum.ScrollingDirection.X then
		var5 = "horizontal"
		var6 = var4
	elseif p2 == Enum.ScrollingDirection.XY then
		mutedError(`Direction {p2.Name} is an unsupported option for feedScroll event`)
	end
	if var6 then
		local var7, var8 = var6(p3)
		
		if not var7 then
			mutedError(var8)
		end
	else
		mutedError(`Missing interface for unknown direction {p2.Name} to type check feedScroll event parameters`)
	end
	p0:sendEventDeferred(p1, "feedScroll", cryoModule.Dictionary.join(p3, { direction = var5 }))
end