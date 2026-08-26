local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fFlagUFRImprovementsModule = require(interventionShared.Flags.FFlagUFRImprovements)

return reactModule.memo(function()
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), fFlagUFRImprovementsModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y margin-top-small",
		testId = "intervention-dialog-loading-skeleton"
	}, {
		Heading = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.new(0.6, 0, 0, var1.Size.Size_1100),
			radius = radius.Medium
		}),
		Body = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, if fFlagUFRImprovementsModule then var1.Size.Size_3000 else var1.Size.Size_2000),
			radius = radius.Medium
		}),
		Actions = reactModule.createElement(skeleton, {
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, var1.Size.Size_800),
			radius = radius.Medium
		})
	})
end)