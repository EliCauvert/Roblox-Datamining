local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local loading = foundationModule.Loading
local iconSize = foundationModule.Enums.IconSize
local constantsModule = require(parent.Common.Constants)

return reactModule.memo(function(p0) --[[ line: 17 | named "LoadingStateImpl" ]]
	-- upvalues: reactModule (ref), view (ref), constantsModule (ref), loading (ref), iconSize (ref)
	return reactModule.createElement(view, {
		tag = constantsModule.STATE_PANEL_TAG,
		LayoutOrder = p0.layoutOrder
	}, {
		Spinner = reactModule.createElement(loading, { size = iconSize.XLarge })
	})
end)