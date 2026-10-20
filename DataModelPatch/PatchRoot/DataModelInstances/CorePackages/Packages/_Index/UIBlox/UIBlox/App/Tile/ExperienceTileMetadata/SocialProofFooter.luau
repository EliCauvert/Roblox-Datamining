local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local ReactModule = require(Parent1.Parent.Parent.React)
local StatGroupModule = require(Parent1.Indicator.StatGroup)
local FooterFrameModule = require(Parent.FooterFrame)

return function(p1)
	-- upvalues: ReactModule (copy), FooterFrameModule (copy), StatGroupModule (copy)
	return ReactModule.createElement(FooterFrameModule, p1, {
		Stats = ReactModule.createElement(StatGroupModule, { ratingText = p1.ratingText, playingText = p1.playingText })
	})
end