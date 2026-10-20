local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local ReactModule = require(GameJoinCard.Parent.React)
local MobileGameJoinCardModule = require(GameJoinCard.Components.MobileGameJoinCard.MobileGameJoinCard)
local UseInExperienceGameJoinCardViewModelModule = require(script.Parent.useInExperienceGameJoinCardViewModel)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: UseInExperienceGameJoinCardViewModelModule (copy), ReactModule (copy), MobileGameJoinCardModule (copy)
	return ReactModule.createElement(MobileGameJoinCardModule, (UseInExperienceGameJoinCardViewModelModule(p1)))
end