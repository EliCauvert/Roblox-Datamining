local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local ScreenSizeSelector = require(ChallengeDialog.Common.Utils).screenSizeSelector
local GetMiddleContentWidthFunction = require(ChallengeDialog.Common.Utils).getMiddleContentWidth
local UseSelectorFunction = require(ChallengeDialog.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(Callback)
	-- upvalues: UseSelectorFunction (copy), ScreenSizeSelector (copy), GetMiddleContentWidthFunction (copy)
	local MiddleContentWidth = GetMiddleContentWidthFunction(UseSelectorFunction(ScreenSizeSelector).X)
	
	return function()
		-- upvalues: Callback (copy), MiddleContentWidth (copy)
		return Callback(MiddleContentWidth)
	end
end