local GlobalNavModule = require(script.GlobalNav)
local GlobalNavAppHeaderBarModule = require(script.GlobalNavAppHeaderBar)

return if require(script:FindFirstAncestor("TenFootUiGlobalNav").Parent.SharedFlags).isAppNavEnabled() then GlobalNavAppHeaderBarModule else GlobalNavModule