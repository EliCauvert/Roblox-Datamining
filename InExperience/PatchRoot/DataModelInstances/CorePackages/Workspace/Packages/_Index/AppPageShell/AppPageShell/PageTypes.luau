local parent = script:FindFirstAncestor("AppPageShell").Parent
local appCompositionModule = require(parent.AppComposition)
local _ = require(parent.Foundation)
local _ = require(parent.React)
local _ = appCompositionModule.CompositionTags.Layout

return {}