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

return function(p1)
	-- upvalues: useTokens (ref), useExperienceNameModule (ref), reactModule (ref), toMediaItemModule (ref), view (ref), stateLayerAffordance (ref), momentMediaTile (ref), text (ref)
	local moment = p1.moment
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "col gap-xsmall",
		LayoutOrder = p1.layoutOrder,
		Size = p1.itemSize,
		onActivated = p1.onActivated,
		stateLayer = { affordance = stateLayerAffordance.None }
	}, {
		MediaContainer = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, -48 - var1.Gap.XSmall)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Large) }),
			Media = reactModule.createElement(momentMediaTile, {
				mediaItem = reactModule.useMemo(function()
					-- upvalues: toMediaItemModule (copy), moment (ref), var1 (ref)
					local var2 = toMediaItemModule({ kind = "moment", moment = moment })
					var2.cornerRadius = var1.Radius.Large
					
					return var2
				end, { moment.momentId }),
				isActive = p1.isActive
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
				fontStyle = var1.Typography.TitleMedium,
				textStyle = var1.Color.Content.Emphasis,
				Text = moment.metadata.experienceName or (useExperienceNameModule(moment.metadata.universeId) or "")
			})
		})
	})
end