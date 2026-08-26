local parent = script:FindFirstAncestor("GamePlayButton").Parent
local tModule = require(parent.t)
local mutedError = require(parent.Loggers).mutedError
local var1 = tModule.strictInterface({
	placeId = tModule.string,
	playButtonState = tModule.string,
	universeId = tModule.string
})

return function(p1, p2)
	-- upvalues: var1 (ref), mutedError (ref)
	local var2, var3 = var1(p2)
	
	if not var2 then
		mutedError(var3)
	end
	p1.EventStream:setRBXEventStream("GamePlayButton", "shareLinkGameJoin", p2)
	p1.Diag:reportCounter("shareLinkGameJoin", 1)
end