local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local _ = require(parent.Foundation)
local _ = require(parent.React)
local _ = require(parent.UserCtaCommon)
local _ = require(gameJoinCard.Analytics.AnalyticsConstants).viewProfileSourceValues

return {}