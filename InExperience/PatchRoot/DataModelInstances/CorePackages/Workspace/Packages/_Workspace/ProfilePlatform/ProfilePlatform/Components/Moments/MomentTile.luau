local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local ToMediaItemModule = require(Parent.Moments.ToMediaItem)
local UseExperienceNameModule = require(ProfilePlatform.Hooks.useExperienceName)
local View = FoundationModule.View
local Text = FoundationModule.Text
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens
local MomentMediaTile = require(Parent.MomentsCommon).Media.MomentMediaTile

return function(p1) --[[ Line: 34 | Named "MomentTile" ]]
	-- upvalues: UseTokensFunction (copy), UseExperienceNameModule (copy), ReactModule (copy), ToMediaItemModule (copy), View (copy), StateLayerAffordance (copy), MomentMediaTile (copy), Text (copy)
	local Moment = p1.moment
	local UseTokensResult = UseTokensFunction()
	local UseExperienceNameModuleResult = UseExperienceNameModule(Moment.metadata.universeId)
	
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall",
		LayoutOrder = p1.layoutOrder,
		Size = p1.itemSize,
		onActivated = p1.onActivated,
		stateLayer = { affordance = StateLayerAffordance.None }
	}, {
		MediaContainer = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, -48 - UseTokensResult.Gap.XSmall)
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, UseTokensResult.Radius.Large) }),
			Media = ReactModule.createElement(MomentMediaTile, {
				mediaItem = ReactModule.useMemo(function() --[[ Line: 44 ]]
					-- upvalues: ToMediaItemModule (upval), Moment (copy), UseTokensResult (copy)
					local MediaItemModule = ToMediaItemModule({ kind = "moment", moment = Moment })
					MediaItemModule.cornerRadius = UseTokensResult.Radius.Large
					
					return MediaItemModule
				end, { Moment.momentId }),
				isActive = p1.isActive
			})
		}),
		Footer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-top gap-xxsmall",
			Size = UDim2.new(1, 0, 0, 48)
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-align-x-left text-truncate-end",
				fontStyle = UseTokensResult.Typography.TitleMedium,
				textStyle = UseTokensResult.Color.Content.Emphasis,
				Text = Moment.metadata.experienceName or (UseExperienceNameModuleResult or "")
			})
		})
	})
end