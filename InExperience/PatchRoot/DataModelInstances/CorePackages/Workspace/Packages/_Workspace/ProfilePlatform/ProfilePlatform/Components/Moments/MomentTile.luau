local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local toMediaItemModule = require(parent.Moments.ToMediaItem)
local useExperienceNameModule = require(profilePlatform.Hooks.useExperienceName)
local view = foundationModule.View
local text = foundationModule.Text
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useTokens = foundationModule.Hooks.useTokens
local momentMediaTile = momentsCommonModule.Media.MomentMediaTile

return function(p0) --[[ line: 34 | named "MomentTile" ]]
	-- upvalues: useTokens (ref), useExperienceNameModule (ref), reactModule (ref), toMediaItemModule (ref), view (ref), stateLayerAffordance (ref), momentMediaTile (ref), text (ref)
	local moment = p0.moment
	local var6 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "col gap-xsmall",
		LayoutOrder = p0.layoutOrder,
		Size = p0.itemSize,
		onActivated = p0.onActivated,
		stateLayer = { affordance = stateLayerAffordance.None }
	}, {
		MediaContainer = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, -48 - var6.Gap.XSmall)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var6.Radius.Large) }),
			Media = reactModule.createElement(momentMediaTile, {
				mediaItem = reactModule.useMemo(function() --[[ line: 44 ]]
					-- upvalues: toMediaItemModule (copy), moment (ref), var6 (ref)
					local var7 = toMediaItemModule({ kind = "moment", moment = moment })
					var7.cornerRadius = var6.Radius.Large
					
					return var7
				end, { moment.momentId }),
				isActive = p0.isActive
			})
		}),
		Footer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-top gap-xxsmall",
			Size = UDim2.new(1, 0, 0, 48)
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-align-x-left text-truncate-end",
				fontStyle = var6.Typography.TitleMedium,
				textStyle = var6.Color.Content.Emphasis,
				Text = moment.metadata.experienceName or (useExperienceNameModule(moment.metadata.universeId) or "")
			})
		})
	})
end