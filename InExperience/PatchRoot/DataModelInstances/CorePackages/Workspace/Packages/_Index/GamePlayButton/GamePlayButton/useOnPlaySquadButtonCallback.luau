local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local openCentralOverlayForGameDetailsSquadModule = require(gamePlayButton.OpenCentralOverlayForGameDetailsSquad)
local playButtonStatesModule = require(gamePlayButton.PlayButtonStates)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled

return function(p1, p2, p3, p4)
	-- upvalues: useDispatch (ref), reactModule (ref), getFFlagIsSquadEnabled (ref), playButtonStatesModule (ref), openCentralOverlayForGameDetailsSquadModule (ref)
	local var1 = useDispatch()
	
	return reactModule.useCallback(function(p5)
		-- upvalues: getFFlagIsSquadEnabled (copy), p2 (ref), playButtonStatesModule (copy), var1 (ref), openCentralOverlayForGameDetailsSquadModule (copy), p1 (ref), p3 (ref), p4 (ref)
		if getFFlagIsSquadEnabled() and p2 == playButtonStatesModule.PlayableWithParty then
			var1(openCentralOverlayForGameDetailsSquadModule(p1, p5.AbsolutePosition, p5.AbsoluteSize, p3, p4))
		end
	end, {
		var1,
		p1,
		p3,
		p2,
		p4
	})
end