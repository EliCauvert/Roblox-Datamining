local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.React)
local _ = require(parent.Signals)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local _ = require(parent.MomentsTypes)
local _ = require(moments.Components.VerticalPager)
local _ = require(moments.Enums.SignalActionType)
local _ = require(moments.Enums.NavigationDestinationType)

return {}