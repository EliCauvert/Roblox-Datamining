local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local getFormatTime = momentsCommonModule.Utils.getFormatTime
local dragHandleModule = require(momentsCreationFlow.Enums.DragHandle)

return function(p0) --[[ line: 27 ]]
	-- upvalues: useTokens (ref), dragHandleModule (ref), reactModule (ref), view (ref), text (ref), getFormatTime (ref)
	local var5 = useTokens()
	
	if (p0.activeHandle == dragHandleModule.LeftHandle or p0.activeHandle == dragHandleModule.RightHandle) and p0.timeLength then
		local var6 = if p0.activeHandle == dragHandleModule.LeftHandle then p0.leftHandlePosition elseif p0.activeHandle == dragHandleModule.RightHandle then p0.rightHandlePosition else nil
		
		return reactModule.createElement(view, {
			tag = "align-x-center align-y-bottom anchor-bottom-center col gap-xsmall",
			Position = var6:map(function(p1) --[[ line: 44 ]]
				-- upvalues: var5 (ref)
				return UDim2.new(p1, 0, 0, -var5.Padding.Small)
			end)
		}, {
			TextContainer = reactModule.createElement(view, {
				tag = "anchor-center-center bg-system-contrast size-1600-800 radius-small",
				LayoutOrder = 1
			}, {
				TimeText = reactModule.createElement(text, {
					tag = "anchor-center-center auto-xy content-inverse-default position-center-center text-caption-medium",
					Text = var6:map(function(p2) --[[ line: 54 ]]
						-- upvalues: getFormatTime (copy), p0 (ref)
						return getFormatTime(p2 * p0.timeLength)
					end)
				})
			}),
			VerticalBar = reactModule.createElement(view, {
				tag = "anchor-center-center bg-system-contrast size-50-300",
				LayoutOrder = 2
			})
		})
	end
	return nil
end