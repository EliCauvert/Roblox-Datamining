local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local openCentralOverlayForGameDetailsSquadModule = require(gamePlayButton.OpenCentralOverlayForGameDetailsSquad)
local playButtonStatesModule = require(gamePlayButton.PlayButtonStates)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled

return function(p0, p1, p2, p3) --[[ line: 12 ]]
	-- upvalues: useDispatch (ref), reactModule (ref), getFFlagIsSquadEnabled (ref), playButtonStatesModule (ref), openCentralOverlayForGameDetailsSquadModule (ref)
	local var4 = useDispatch()
	
	return reactModule.useCallback(function(p4) --[[ line: 15 ]]
		-- upvalues: getFFlagIsSquadEnabled (copy), p1 (ref), playButtonStatesModule (copy), var4 (ref), openCentralOverlayForGameDetailsSquadModule (copy), p0 (ref), p2 (ref), p3 (ref)
		if getFFlagIsSquadEnabled() and p1 == playButtonStatesModule.PlayableWithParty then
			var4(openCentralOverlayForGameDetailsSquadModule(p0, p4.AbsolutePosition, p4.AbsoluteSize, p2, p3))
		end
	end, {
		var4,
		p0,
		p2,
		p1,
		p3
	})
end