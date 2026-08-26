local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local detailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), detailsPageLayoutContextModule (ref), view (ref), stateLayerAffordance (ref)
	local var1 = reactModule.useContext(detailsPageLayoutContextModule)
	local setHasActions = var1.setHasActions
	local setActionBarHeight = var1.setActionBarHeight
	local testId = var1.testId
	assert(setHasActions and (setActionBarHeight and testId), "DetailsPageLayout.Actions must be used within DetailsPageLayout.Root")
	reactModule.useEffect(function()
		-- upvalues: setHasActions (ref), setActionBarHeight (ref)
		setHasActions(true)
		
		return function()
			-- upvalues: setHasActions (copy), setActionBarHeight (copy)
			setHasActions(false)
			setActionBarHeight(0)
		end
	end, {})
	
	return reactModule.createElement(view, {
		tag = "row size-full-0 auto-y bg-surface-0 stroke-muted stroke-standard position-bottom-left anchor-bottom-left align-y-center gap-small align-x-center padding-top-large padding-bottom-medium padding-x-large",
		ZIndex = 2,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: setActionBarHeight (ref)
			setActionBarHeight(value.AbsoluteSize.Y)
		end,
		testId = if testId then `{testId}--actions` else nil,
		onActivated = function() end,
		selection = { Selectable = false },
		stateLayer = { affordance = stateLayerAffordance.None },
		ref = p2
	}, p1.children)
end))