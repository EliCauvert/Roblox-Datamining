local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local detailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 24 | named "DetailsPageLayoutActions" ]]
	-- upvalues: reactModule (ref), detailsPageLayoutContextModule (ref), view (ref), stateLayerAffordance (ref)
	local var3 = reactModule.useContext(detailsPageLayoutContextModule)
	local setHasActions = var3.setHasActions
	local setActionBarHeight = var3.setActionBarHeight
	local testId = var3.testId
	assert(setHasActions and (setActionBarHeight and testId), "DetailsPageLayout.Actions must be used within DetailsPageLayout.Root")
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: setHasActions (ref), setActionBarHeight (ref)
		setHasActions(true)
		
		return function() --[[ line: 37 ]]
			-- upvalues: setHasActions (copy), setActionBarHeight (copy)
			setHasActions(false)
			setActionBarHeight(0)
		end
	end, {})
	
	return reactModule.createElement(view, {
		tag = "row size-full-0 auto-y bg-surface-0 stroke-muted stroke-standard position-bottom-left anchor-bottom-left align-y-center gap-small align-x-center padding-top-large padding-bottom-medium padding-x-large",
		ZIndex = 2,
		onAbsoluteSizeChanged = function(value) --[[ line: 45 ]]
			-- upvalues: setActionBarHeight (ref)
			setActionBarHeight(value.AbsoluteSize.Y)
		end,
		testId = if testId then `{testId}--actions` else nil,
		onActivated = function() --[[ line: 50 ]] end,
		selection = { Selectable = false },
		stateLayer = { affordance = stateLayerAffordance.None },
		ref = p1
	}, p0.children)
end))