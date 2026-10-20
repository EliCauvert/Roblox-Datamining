local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local OpenCentralOverlayForGameDetailsSquadModule = require(GamePlayButton.OpenCentralOverlayForGameDetailsSquad)
local PlayButtonStatesModule = require(GamePlayButton.PlayButtonStates)
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled

return function(p1, PlayableWithParty, p2, p3)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), GetFFlagIsSquadEnabledFunction (copy), PlayButtonStatesModule (copy), OpenCentralOverlayForGameDetailsSquadModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: GetFFlagIsSquadEnabledFunction (upval), PlayableWithParty (copy), PlayButtonStatesModule (upval), UseDispatchResult (copy), OpenCentralOverlayForGameDetailsSquadModule (upval), p1 (copy), p2 (copy), p3 (copy)
		if GetFFlagIsSquadEnabledFunction() and PlayableWithParty == PlayButtonStatesModule.PlayableWithParty then
			UseDispatchResult(OpenCentralOverlayForGameDetailsSquadModule(p1, Frame.AbsolutePosition, Frame.AbsoluteSize, p2, p3))
		end
	end, {
		UseDispatchResult,
		p1,
		p2,
		PlayableWithParty,
		p3
	})
end