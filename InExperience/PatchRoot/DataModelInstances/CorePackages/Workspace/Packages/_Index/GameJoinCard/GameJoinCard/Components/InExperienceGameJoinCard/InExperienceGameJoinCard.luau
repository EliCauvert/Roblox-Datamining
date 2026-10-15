local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local reactModule = require(gameJoinCard.Parent.React)
local mobileGameJoinCardModule = require(gameJoinCard.Components.MobileGameJoinCard.MobileGameJoinCard)
local useInExperienceGameJoinCardViewModelModule = require(script.Parent.useInExperienceGameJoinCardViewModel)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: useInExperienceGameJoinCardViewModelModule (ref), reactModule (ref), mobileGameJoinCardModule (ref)
	return reactModule.createElement(mobileGameJoinCardModule, useInExperienceGameJoinCardViewModelModule(p1))
end