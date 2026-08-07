local parent = script:FindFirstAncestor("GamePlayButton").Parent
local tModule = require(parent.t)
local mutedError = require(parent.Loggers).mutedError
local var1 = tModule.strictInterface({
	placeId = tModule.string,
	playButtonState = tModule.string,
	universeId = tModule.string
})

return function(p0, p1) --[[ line: 16 ]]
	-- upvalues: var1 (ref), mutedError (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		mutedError(var3)
	end
	p0.EventStream:setRBXEventStream("GamePlayButton", "shareLinkGameJoin", p1)
	p0.Diag:reportCounter("shareLinkGameJoin", 1)
end