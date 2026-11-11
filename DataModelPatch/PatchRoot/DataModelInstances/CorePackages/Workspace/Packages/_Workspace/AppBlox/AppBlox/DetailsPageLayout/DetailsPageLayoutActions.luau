local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local DetailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ReactModule (copy), DetailsPageLayoutContextModule (copy), View (copy), StateLayerAffordance (copy)
	local UseContextResult = ReactModule.useContext(DetailsPageLayoutContextModule)
	local SetHasActionsFunction = UseContextResult.setHasActions
	local SetActionBarHeightFunction = UseContextResult.setActionBarHeight
	local TestId = UseContextResult.testId
	assert(SetHasActionsFunction and (SetActionBarHeightFunction and TestId), "DetailsPageLayout.Actions must be used within DetailsPageLayout.Root")
	ReactModule.useEffect(function()
		-- upvalues: SetHasActionsFunction (copy), SetActionBarHeightFunction (copy)
		SetHasActionsFunction(true)
		
		return function()
			-- upvalues: SetHasActionsFunction (upval), SetActionBarHeightFunction (upval)
			SetHasActionsFunction(false)
			SetActionBarHeightFunction(0)
		end
	end, {})
	
	return ReactModule.createElement(View, {
		tag = "row size-full-0 auto-y bg-surface-0 stroke-muted stroke-standard position-bottom-left anchor-bottom-left align-y-center gap-small align-x-center padding-top-large padding-bottom-medium padding-x-large",
		ZIndex = 2,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: SetActionBarHeightFunction (copy)
			SetActionBarHeightFunction(Frame.AbsoluteSize.Y)
		end,
		testId = if TestId then `{TestId}--actions` else nil,
		onActivated = function() end,
		selection = { Selectable = false },
		stateLayer = { affordance = StateLayerAffordance.None },
		ref = Ref
	}, p1.children)
end))