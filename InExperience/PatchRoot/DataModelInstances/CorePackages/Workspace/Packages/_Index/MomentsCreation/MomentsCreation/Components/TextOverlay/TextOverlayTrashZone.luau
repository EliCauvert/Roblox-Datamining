local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagMomentsTextOverlayDragToDeleteRefinementModule = require(MomentsCreation.Flags.FFlagMomentsTextOverlayDragToDeleteRefinement)
local _Color3 = Color3.fromHex("121215")
local Style = { Transparency = 0.2, Color3 = Color3.new(1, 1, 1) }

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: FFlagMomentsTextOverlayDragToDeleteRefinementModule (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy), FoundationModule (copy), Icon (copy), BuilderIconsModule (copy), _Color3 (copy), Style (copy)
	if FFlagMomentsTextOverlayDragToDeleteRefinementModule then
		local UseTokensResult = UseTokensFunction()
		
		return ReactModule.createElement(View, {
			Active = false,
			tag = "position-bottom-center anchor-bottom-center auto-xy padding-large",
			testId = "moments-text-overlay-trash-zone",
			ref = Ref,
			Visible = p1.visible == nil or p1.visible,
			ZIndex = p1.ZIndex or 20
		}, {
			ButtonScale = ReactModule.createElement(View, {
				Active = false,
				tag = "col align-x-center gap-small auto-xy",
				scale = p1.highlightScale or 1
			}, {
				Label = if p1.label then ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-small",
					Text = p1.label,
					textStyle = UseTokensResult.Color.ActionEmphasis.Foreground
				}) else nil,
				Circle = ReactModule.createElement(View, {
					Active = false,
					LayoutOrder = 2,
					tag = "row align-x-center align-y-center radius-circle bg-over-media-0",
					testId = "moments-text-overlay-trash",
					ref = p1.circleRef,
					Size = UDim2.fromOffset(40, 40),
					stateLayer = {
						affordance = FoundationModule.Enums.StateLayerAffordance.None
					}
				}, {
					Icon = ReactModule.createElement(Icon, {
						name = BuilderIconsModule.Icon.TrashCan,
						size = FoundationModule.Enums.IconSize.Small,
						style = UseTokensResult.Color.ActionEmphasis.Foreground
					})
				})
			})
		})
	else
		return ReactModule.createElement(View, {
			Active = false,
			tag = "position-bottom-center anchor-bottom-center auto-xy padding-large",
			testId = "moments-text-overlay-trash-zone",
			ref = Ref,
			Visible = p1.visible == nil or p1.visible,
			ZIndex = p1.ZIndex or 20
		}, {
			ButtonScale = ReactModule.createElement(View, {
				Active = false,
				tag = "row align-x-center align-y-center radius-circle",
				testId = "moments-text-overlay-trash",
				backgroundStyle = { Transparency = 0.35, Color3 = _Color3 },
				scale = p1.highlightScale or 1,
				Size = UDim2.fromOffset(40, 40),
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				}
			}, {
				Icon = ReactModule.createElement(Icon, {
					name = BuilderIconsModule.Icon.TrashCan,
					size = FoundationModule.Enums.IconSize.Small,
					style = Style
				})
			})
		})
	end
end)