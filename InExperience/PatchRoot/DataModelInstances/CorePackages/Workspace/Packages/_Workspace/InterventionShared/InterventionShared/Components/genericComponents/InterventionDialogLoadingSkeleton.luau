local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagUFRImprovementsModule = require(InterventionShared.Flags.FFlagUFRImprovements)

return ReactModule.memo(function() --[[ Line: 17 | Named "InterventionDialogLoadingSkeleton" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), FFlagUFRImprovementsModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y margin-top-small",
		testId = "intervention-dialog-loading-skeleton"
	}, {
		Heading = ReactModule.createElement(Skeleton, {
			LayoutOrder = 1,
			Size = UDim2.new(0.6, 0, 0, UseTokensResult.Size.Size_1100),
			radius = Radius.Medium
		}),
		Body = ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, if FFlagUFRImprovementsModule then UseTokensResult.Size.Size_3000 else UseTokensResult.Size.Size_2000),
			radius = Radius.Medium
		}),
		Actions = ReactModule.createElement(Skeleton, {
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_800),
			radius = Radius.Medium
		})
	})
end)