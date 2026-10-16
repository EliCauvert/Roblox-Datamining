local FFlagAppIaHomeSubTabModule = require(script.Parent.FFlagAppIaHomeSubTab)
local ChartsInFlyoutAddSubTabDependency = game:DefineFastFlag("ChartsInFlyoutAddSubTabDependency", false)

return game:DefineFastFlag("EnableChartsInFlyout", false) and (not ChartsInFlyoutAddSubTabDependency or FFlagAppIaHomeSubTabModule)