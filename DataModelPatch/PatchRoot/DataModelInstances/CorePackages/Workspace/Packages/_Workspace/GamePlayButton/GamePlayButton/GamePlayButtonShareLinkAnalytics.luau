local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local TModule = require(Parent.t)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local StrictInterfaceResult = TModule.strictInterface({
	placeId = TModule.string,
	playButtonState = TModule.string,
	universeId = TModule.string
})

return function(p1, p2)
	-- upvalues: StrictInterfaceResult (copy), MutedErrorFunction (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p2)
	
	if not StrictInterfaceResultResult then
		MutedErrorFunction(StrictInterfaceResultResult2)
	end
	p1.EventStream:setRBXEventStream("GamePlayButton", "shareLinkGameJoin", p2)
	p1.Diag:reportCounter("shareLinkGameJoin", 1)
end